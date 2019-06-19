$obj = [PSCustomObject] @{
    data = @((get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances | % {
        [PSCustomObject] @{
            '{#INST}' = $_
            '{#PERFCOUNTERNAME}' = if($_ -eq 'MSSQLSERVER') { "SQLServer" } else { "MSSQL`$$_" }
        }
    }) 
}
Write-Host $($obj | ConvertTo-Json)