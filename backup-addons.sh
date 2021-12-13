#/bin/sh
WOW_DIRECTORY="/mnt/c/Program Files (x86)/World of Warcraft/_retail_/"
mkdir -p WTF Interface/AddOns/
cp -r "$WOW_DIRECTORY/WTF" ./WTF &
cp -r "$WOW_DIRECTORY/Interface/AddOns" ./Interface/AddOns &

for j in `jobs -p`
do
	wait $j
done


