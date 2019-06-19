# MSSQL 2008-2016 Multi instance with WSFC
Zabbix template for apache 2 web server without external script. This template have macros for setting URL status page. 
This template uses only one http item as a master item and other items depend it.

Requirements:
1) **Zabbix 3+**


Name: Databases for discovery
Expression: ^(master|model|msdb|ReportServer|ReportServerTempDB|tempdb)$
Type: Result is FALSE


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
