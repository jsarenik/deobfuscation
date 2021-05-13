#transmission-create -o snapshot210311.torrent -t http://a.bublina.eu.org:8000/announce -t udp://a.bublina.eu.org:8000 -t wss://tracker.bublina.eu.org -t udp://tracker.openbittorrent.com:80 -t udp://tracker.leechers-paradise.org:6969 -t udp://tracker.coppersurfer.tk:6969 -t udp://tracker.opentrackr.org:1337 -t udp://explodie.org:6969 -t udp://tracker.empire-js.us:1337 -t wss://tracker.btorrent.xyz --verbose snapshot210311.zip
webtorrent create \
  -o snapshot210311.torrent \
  -a http://a.bublina.eu.org:8000/announce \
  -a udp://a.bublina.eu.org:8000 \
  -a wss://tracker.bublina.eu.org \
  -a udp://tracker.openbittorrent.com:80 \
  -a udp://tracker.leechers-paradise.org:6969 \
  -a udp://tracker.coppersurfer.tk:6969 \
  -a udp://tracker.opentrackr.org:1337 \
  -a udp://explodie.org:6969 \
  -a udp://tracker.empire-js.us:1337 \
  -a wss://tracker.btorrent.xyz \
  --verbose snapshot210311.zip
