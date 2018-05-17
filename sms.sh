#!/bin/bash

js=( changelang.js checklogin.js country.js deviceinformation.js dhcp.js dmzsettings.js 
firewallswitch.js home.js lanipfilter.js main.js messagesetting.js mobileconnection.js 
mobilenetworksettings.js modifypassword.js nat.js pincodemanagement.js ping.js 
profilesmgr.js quicksetup.js redirect.js sipalgsettings.js sms.js specialapplication.js 
statistic.js systemsettings.js table.js update.js upnp.js validation.js virtualserver.js 
wlanadvanced.js wlanbasicsettings.js wlanmacfilter.js )

url="http://192.168.1.1/js/"
folder="./js/"

for file in "${js[@]}"
do
        wget "$url$file" -O $folder$file.gz; gunzip $folder$file.gz
done

##
egrep -oh "(api/.\S*?)" *.js | egrep -o '^api/[a-z/_-]*' | sort | uniq

egrep -oh "(config/.\S*?)" *.js | egrep -o '^config/[a-zA-Z/_-.]*' | sort | uniq

curl "http://192.168.1.1/api/user/login"\
 --data "<?xml version=""1.0"" encoding=""UTF-8""?><request>\
<Username>admin</Username>\
<Password>$(echo -n 'admin password' | base64)</Password>\
</request>" --compressed

curl "http://192.168.1.1/api/user/logout"\
 --data "<?xml version=""1.0"" encoding=""UTF-8""?><request>\
<Logout>1</Logout>\
</request>" --compressed

curl "http://192.168.1.1/api/monitoring/month_statistics"

curl "http://192.168.1.1/api/monitoring/start_date"
