FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    gnupg2 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4773BD5E130D1D45 \
    && echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    alsa-utils \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libpulse0 \
    xdg-utils \
    libx11-xcb-dev \
    spotify-client \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /home/spotify
RUN useradd --create-home --home-dir $HOME spotify \
	&& gpasswd -a spotify audio \
	&& chown -R spotify:spotify $HOME

WORKDIR $HOME
USER spotify

ENTRYPOINT ["spotify"]