./scriptchemin.sh > chemin.txt
grep ^'/' chemin.txt > chemins.txt
max=$( wc -l < chemins.txt )
i=1
while [ $i -le $max ]
do 
chemin=$(head -n $i chemins.txt | tail -n 1 )
sudo cp $chemin /home/iliasse/Desktop/HOTBACKUP/backup
let i=i+1
done
sqlplus "sys/0000" as sysdba << EOF
alter system end backup
EOF
