#!/bin/bash -eux
URL='https://gitlab.com/ligolang/ligo/-/jobs/artifacts/dev/download?job=build-and-package-ubuntu-18-04'
rm -rf 'download?job=build-and-package-ubuntu-18-04'
wget $URL
unzip 'download?job=build-and-package-ubuntu-18-04'
ar xv dist/package/ubuntu-18.04/*.deb
tar xvf data.tar.xz
rm -rf *.tar.xz dist debian-binary 'download?job=build-and-package-ubuntu-18-04*'
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
