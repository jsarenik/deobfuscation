#!/bin/sh

#magnet:?xt=urn:btih:9f660a59fbc2254e344ff06807e61a0048b40d31&dn=blocks&tr=http%3A%2F%2Fa.bublina.eu.org%3A8000%2Fannounce&tr=udp%3A%2F%2Fa.bublina.eu.org%3A8000&tr=ws%3A%2F%2Fa.bublina.eu.org%3A8000&tr=wss%3A%2F%2Ftracker.btorrent.xyz&tr=wss%3A%2F%2Ftracker.openwebtorrent.com

#magnet:?xt=urn:btih:6abf85edf3dc96cc48dddcb10f312a35ec94ab1f&dn=blocks&tr=http%3A%2F%2Fa.bublina.eu.org%3A8000%2Fannounce&tr=udp%3A%2F%2Fa.bublina.eu.org%3A8000

bettermagnet() {
  line=$(transmission-show -m $1)
  printf '<a href="'$line
  echo "&tr=wss%3A%2F%2Ftracker.btorrent.xyz&tr=wss%3A%2F%2Ftracker.openwebtorrent.com\">$1</a>"
}

cat <<EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listing</title>
</head>
<body>
EOF

i=0
echo "<ul>"
for file in bitcoin-torrent-*.torrent; do
  echo "    <li>$(bettermagnet $file)</li>"
done
echo "</ul>"

cat <<EOF
</body>
</html>
EOF
