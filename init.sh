isok=0
while [ $isok != 1 ]; do
echo -n  "please input park_code ->"
read park_code

echo -n  "please input park name ->"
read park_name

echo -n  "please input frpc port ->"
read port

echo "--------------"
echo "park_code: $park_code"
echo "park name: $park_name"
echo "frpc port: $port"
echo -n  "is your input right[y/n] ->"
read isright
if [ $isright == 'y' ];then
 isok=1
else
echo -n  "\nplease input park info ->"
fi
done

mysql -hlocalhost -P3306 -u park -ppark123 -e "
drop database if exists flyos;  
CREATE DATABASE IF NOT EXISTS flyos default charset utf8 COLLATE utf8_general_ci;
quit" 

mysql -hlocalhost -P3306 -u park -ppark123 flyos</root/flyos/flyos_init.sql

sshport=0
let "sshport=$port"
let "sshport-=8000"

sed "s/#PARK/$park_name/g" -i /fly/frp/frpc.ini
sed "s/#WEBPORT/$port/g" -i /fly/frp/frpc.ini
sed "s/#SSHPORT/$sshport/g" -i /fly/frp/frpc.ini

sed "s/#PARKCODE/$park_code/g" -i /fly/flyos/parking/application.yml
sed "s/#PARKCODE/$park_code/g" -i /fly/flyos/device/application.yml

su - fly -c "/fly/flyos/parking/stop.sh"
su - fly -c "/fly/flyos/parking/start.sh"
sleep 60

curl http://127.0.0.1:8090/sync/syncParkInfo
curl http://127.0.0.1:8090/sync/syncParkGateInfo
curl http://127.0.0.1:8090/sync/syncParkPublicLedInfo
            
curl http://127.0.0.1:8090/sync/syncParkZoneInfo
curl http://127.0.0.1:8090/sync/syncParkFeeIndex
curl http://127.0.0.1:8090/sync/syncParkBilling

curl http://127.0.0.1:8090/sync/syncParkOperaterInfo
