sudo docker run -d\
  --name=sonarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=america/new_york \
  -p 8989:8989 \
  -v /media/zero/T7/Media/tv:/tv \
  -v /media/zero/T7/Media/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/sonarr
  
sudo docker run -d \
 --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=america/new_york \
  -p 7878:7878 \
  -v /media/zero/T7/Media/movies:/movies \
  -v /media/zero/T7/Media/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/radarr

sudo docker run -d \
  --name=jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=america/new_york \
  -p 8096:8096 \
  -v /media/zero/T7/Media/tv:/data/tvshows \
  -v /media/zero/T7/Media/movies:/data/movies \
  -v /media/zero/T7/Media/anime:/data/anime \
  --restart unless-stopped \
  ghcr.io/linuxserver/jellyfin

sudo docker run -d \
  --name=portainer \
  -p 8000:8000 \
  -p 9000:9000 \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce

sudo docker run -d \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e WEBUI_PORT=8080 \
  -p 8080:8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -v /media/zero/T7/Media/config:/config \
  -v /media/zero/T7/Media/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/qbittorrent:latest
  
sudo docker run -d \
  --name=prowlarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 9696:9696 \
  -v /media/zero/T7/Media/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/prowlarr:latest
