function get-instance-log-path([string]$instanceName)
{
    $ipaddr = (Get-Cluster | Get-ClusterResource | ?{$_.Resourcetype -like "IP Address"} | ?{$_.State -like "Online"} | ?{$_.Name -notlike "Cluster IP Address"} | %{$_ | select @{Name="Address"; Expression={$_ | Get-ClusterParameter -Name Address | select -ExpandProperty Value}}} | ft -hide | Out-String).Trim()
    $arr = $ipaddr.Replace("`r","").split()
    
    foreach ($ip in $arr) {
        $fullInstanceName = if ($instanceName -eq 'MSSQLSERVER') { "$ip" } else { "$ip\$instanceName" }
        $connectionString = "Server = $fullInstanceName; Connection Timeout = 4; Integrated Security = True;"

        $fullInstanceName = if ($instanceName -eq 'MSSQLSERVER') { $env:computername } else { "$env:computername\$instanceName" }
        $connectionString = "Server = $fullInstanceName; Integrated Security = True;"

        # Create a new connection object with that connection string
        $connection = New-Object System.Data.SqlClient.SqlConnection
        $connection.ConnectionString = $connectionString
        # Try to open our connection, if it fails we won't try to run any queries
        try
        {
            $connection.Open()
        }
        catch
        {
        #Write-Host "Error connecting to $fullInstance!"
        $DataSet = $null
        $connection = $null
        }
        try
        {
        # Only run our queries if connection isn't null
        if ($connection -ne $null)
        {
            # Create a MSSQL request
            $SqlCmd = New-Object System.Data.SqlClient.SqlCommand
            # Select all the database names within this instance  
            $SqlCmd.CommandText = "SELECT SERVERPROPERTY('ErrorLogFileName') AS 'fileLoc'"
            $SqlCmd.Connection = $Connection
            $SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
            $SqlAdapter.SelectCommand = $SqlCmd
            $DataTable = New-Object System.Data.DataTable
            $SqlAdapter.Fill($DataTable) > $null
            $Connection.Close()
            }
        }
        catch
        {
            $DataTable = $null
        }

        if ($DataTable)
        {
            [PSCustomObject] @{
                '{#INST}'     = $instanceName
                '{#ERRORLOG}' = $DataTable.Rows[0].fileLoc
            }
        }
    }
}


$obj = [PSCustomObject] @{
    data = @((get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | % {
            get-instance-log-path($_)
        }) 
}

Write-Host $($obj | ConvertTo-Json)