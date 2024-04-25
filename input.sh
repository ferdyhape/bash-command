#!/bin/bash

echo "Masukkan nama Anda:"
read nama

echo "Masukkan asal Anda:"
read asal

# Mengambil teks dari template.txt
template=$(cat ./template/template.txt)

# Mengganti {nama} dalam template dengan nilai nama
teks=$(echo "$template" | sed "s/{nama}/$nama/g")

# Mengganti {asal} dalam template dengan nilai asal
teks=$(echo "$teks" | sed "s/{asal}/$asal/g")

# Menambahkan teks ke result.txt dengan sudo
echo -e "\n\n$teks" | sudo tee -a ./result.txt >/dev/null

echo "Teks berhasil ditambahkan ke ./result.txt"
