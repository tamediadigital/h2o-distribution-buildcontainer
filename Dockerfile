
FROM base/devel:latest

RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman-key --init && pacman-key --populate archlinux && pacman-key --refresh-keys

RUN pacman --noconfirm -Syy
RUN pacman -Sy --needed --needed  --noconfirm openssl openssl-1.0
RUN pacman -Syu --noconfirm --needed cmake git packer

RUN useradd builduser ; echo "builduser ALL = (root) NOPASSWD:ALL" >> /etc/sudoers.d/builduser
RUN mkdir /tmp/install
WORKDIR /tmp/install


ADD build_h2o.sh /tmp/install
RUN chown builduser -R /tmp/install
RUN su -c "bash ./build_h2o.sh" -s /bin/bash builduser


#git@github.com:yannick/h2o-kafka-pkgbuild.git
