#/bin/sh
WOW_DIRECTORY="/mnt/c/Program Files (x86)/World of Warcraft/_retail_"
mkdir -p Interface/AddOns/

# To decrypt - openssl aes-256-cbc -d -a -in data.csv.enc -out data.csv
tar -cz "$WOW_DIRECTORY/WTF" | openssl aes-256-cbc -a -pass="pass:$ADDON_BACKUP_KEY" > WTF.tar.gz.enc &
cp -r "$WOW_DIRECTORY/Interface/AddOns" ./Interface/AddOns/ &

for j in `jobs -p`
do
	wait $j
done

git commit --all --allow-empty --message="$(date)"
git push origin master

