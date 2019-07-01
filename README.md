# MSSQL 2008-2016 Multi instance with WSFC (autodiscovery)
Zabbix discovery template for MSSQL server with implementation WSFC (Windows Server Failover Cluster).

Please use this https://share.zabbix.com/databases/microsoft-sql-server/mssql-2008-2016-multiinstance template if you don't have WSFC. (Google link in comments from Alexander Alexandrov)

Requirements:
1) **Zabbix 3+**

Install:
1) **Create regular expression to filter DBs**

Go to: Administration → General
Select Regular expressions from the dropdown
Click on New regular expression

**Name: Databases for discovery**

**Expression: ^(master|model|msdb|ReportServer|ReportServerTempDB|tempdb)$**

**Type: Result is FALSE**

2) **Copy files**

Copy **scripts** directory to C:\Program Files\Zabbix Agent\

Copy **userparameter_mssql.conf** C:\Program Files\Zabbix Agent\conf.d

You need change location in userparameter_mssql.conf if you have different path.

Change timeout in zabbix_agent.conf (Timeout=30)
Restart zabbix agent.

3) **Import template**

4) **Assign template to host**

**Latest data**
![alt Apache2 latest data](https://github.com/hermanekt/MSSQL-2008-2016-Multi-instance-with-WSFC/raw/master/IMG/MSSQL_LATEST_DATA.jpg)

**Discovery rules**
![alt Apache2 latest data](https://github.com/hermanekt/MSSQL-2008-2016-Multi-instance-with-WSFC/raw/master/IMG/MSSQL_DISCOVERY_RULES.jpg)

**DB Discovery**
![alt Apache2 latest data](https://github.com/hermanekt/MSSQL-2008-2016-Multi-instance-with-WSFC/raw/master/IMG/MSSQL_DB_DISCOVERY.jpg)

**Static items**
![alt Apache2 latest data](https://github.com/hermanekt/MSSQL-2008-2016-Multi-instance-with-WSFC/raw/master/IMG/MSSQL_STATIC_ITEM.jpg)

**Based on work:
Nate Jones, Jon Pangburn and Alexander Alexandrov
https://share.zabbix.com/databases/microsoft-sql-server/mssql-2008-2016-multiinstance**

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=GEH7YJEBWTFWE&currency_code=USD&source=url)
