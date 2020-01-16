#!/bin/bash -eux
distro="${distro-ubuntu-18-04}"
URL="https://gitlab.com/ligolang/ligo/-/jobs/artifacts/dev/download?job=build-and-package-$distro"
rm -rf 'download?*'
wget $URL
unzip "download?job=build-and-package-$distro"
ar xv dist/package/*/*.deb
tar xvf data.tar.xz
rm -rf *.tar.xz dist debian-binary 'download?job=build-and-package-*'
mkdir -p ~/.local/bin
mv bin/ligo ~/.local/bin
ln -sfn ~/.local/bin/ligo bin/ligo
touch ~/.bash_profile
if ! grep local/bin ~/.bash_profile; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' > ~/.bash_profile
fi
if [[ -n "${USER-}" && "$USER" = "root" ]]; then
    ln -sfn ~/.local/bin/ligo /bin/ligo
fi
