**shell**

#!/usr/bin/env bash
TIMESTAMP=$(date +%Y%b%d-%H-%M-%S)
BACKUP_DIR="/backup/dailymysqldb/$TIMESTAMP"
MYSQL_USER=xxxxxxx
MYSQL_PASSWORD=xxxxxx
mkdir -p $BACKUP_DIR
databases=$(mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|mysql|sys|performance_schema)")
for db in $databases; do
mysqldump --user=$MYSQL_USER -p$MYSQL_PASSWORD --skip-lock-tables --quick --single-transaction --databases $db | gzip >"$BACKUP_DIR/$db.gz"
done

**ymal**

name: source timestamp
shell: "{{ timeStamp }}"
register: timeStamp

name: pull backup db from api server to san server
synchronize:
src: "/backup/dailymysqldb/{{ timeStamp.stdout }}-23-50-01"
dest: "{{ sanMountLocation }}/dailymysqlbackup/API/"
mode: pull
when: inventory_hostname == 'api-server-chn'
