#!/bin/bash

echo -n "Masukkan nama project: "
read project_name

echo -n "Masukkan file path (default \"/srv/www/project_name\"): "
read file_path

echo -n "Masukkan directory index (default \"index.php\"): "
read dir_index

# Mengambil teks dari template-conf-vhost.text
template=$(cat ./template/template-conf-vhost.text)

if [ -z "$file_path" ]; then
    file_path="/srv/www/$project_name"
fi

if [ -z "$dir_index" ]; then
    dir_index="index.php"
fi

project_name=$(echo "$template" | sed "s/{project_name}/$project_name/g")
dir_index=$(echo "$project_name" | sed "s|{dir_index}|$dir_index|g")
project_conf=$(echo "$dir_index" | sed "s|{file_path}|$file_path|g")

# Menambahkan teks ke result.txt dengan sudo
# echo -e "\n\n$project_conf" | sudo tee -a ./result.txt >/dev/null
echo "$project_conf" | sudo tee /etc/apache2/sites-enabled/$project_name.conf >/dev/null

echo "teks conf berhasil ditambahkan ke ./result.txt"
