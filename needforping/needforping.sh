#server1.catscarlet.com
date >> /home/pi/nginx_sites/www/needforping/pingresult/server1.txt
ping -c 10 server1.catscarlet.com |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt &

#Chicago
date >> /home/pi/nginx_sites/www/needforping/pingresult/Chicago.txt
ping -c 10 199.231.208.6 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_Chicago.txt &

#Dallas
date >> /home/pi/nginx_sites/www/needforping/pingresult/Dallas.txt
ping -c 100 192.80.186.135 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_Dallas.txt &

#LosAngeles
date >> /home/pi/nginx_sites/www/needforping/pingresult/LosAngeles.txt
ping -c 100 192.157.214.6 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_LosAngeles.txt &

#Miami
date >> /home/pi/nginx_sites/www/needforping/pingresult/Miami.txt
ping -c 100 172.246.125.7 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_Miami.txt &

#凤凰城
date >> /home/pi/nginx_sites/www/needforping/pingresult/凤凰城.txt
ping -c 100 198.35.46.10 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_凤凰城.txt &

#洛杉矶
date >> /home/pi/nginx_sites/www/needforping/pingresult/洛杉矶.txt
ping -c 100 104.194.76.20 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_洛杉矶.txt &

#佛罗里达
date >> /home/pi/nginx_sites/www/needforping/pingresult/佛罗里达.txt
ping -c 100 23.252.104.22 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_佛罗里达.txt &

#荷兰
date >> /home/pi/nginx_sites/www/needforping/pingresult/荷兰.txt
ping -c 100 192.243.124.74 |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_荷兰.txt &

sleep 110


readline ping_
