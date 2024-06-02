#!/bin/bash

TARGET_ARCH="$(uname -m)"

if [ "$TARGET_ARCH" == "aarch64" ]; then
    wget https://download.visualstudio.microsoft.com/download/pr/54e5bb2e-bdd6-496d-8aba-4ed14658ee91/34fd7327eadad7611bded51dcda44c35/dotnet-sdk-8.0.300-linux-arm64.tar.gz
elif [ "$TARGET_ARCH" == "armv7l" ]; then
    wget https://download.visualstudio.microsoft.com/download/pr/d915a052-b50b-4305-978c-fbf644e71eed/de3ac6fbebd4db705413aac807aa11fe/dotnet-sdk-8.0.300-linux-arm.tar.gz
else
    echo "$TARGET_ARCH not supported yet!"
    exit 1
fi

rm -rf sdk
mkdir -p sdk
tar -xvzf dotnet-sdk*.tar.gz -C sdk

ln -sf /opt/cybertools/dotnet/sdk/dotnet /opt/cybertools/bin/dotnet
chmod +x /opt/cybertools/bin/dotnet

rm -f dotnet-sdk*.tar.gz
