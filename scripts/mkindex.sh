#!/bin/sh

ROOT=${1:-"$PWD"}

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
for filepath in $ROOT; do
  find "$filepath" -maxdepth 1 -mindepth 1 -type d | sort | while read i; do
    file=`basename "$i"`
    echo "    <li><a href=\"$file/\">$file/</a></li>"
  done
  find "$filepath" -maxdepth 1 -mindepth 1 -type f | grep -v 'index.html$' | sort | while read i; do
    file=`basename "$i"`
    echo "    <li><a href=\"$file\">$file</a></li>"
  done
done
echo "</ul>"

cat <<EOF
</body>
</html>
EOF
