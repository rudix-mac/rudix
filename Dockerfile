FROM fedora:latest

RUN dnf install -y git make gcc patch file unzip bzip2 xz texinfo diffutils net-tools
RUN dnf install -y readline-devel ncurses-devel zlib-devel bzip2-devel openssl-devel python-devel
RUN dnf groupinstall -y "C Development Tools and Libraries"
RUN dnf clean all -y
RUN git clone https://github.com/rudix-mac/rudix.git $HOME/rudix
