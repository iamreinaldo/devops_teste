#!/bin/bash

#Pega versão go instalada
GO_VER=$(go version | grep -oE [0-9]\.[0-9]{2})

#Compara versão instalada com versão mínima necessária(1.18)
if [ "$(echo "${GO_VER} < 1.12" | bc)" -eq 1 ]; then
  echo "necessário versão 1.18+ do GO"
  exit 1
fi

#Instala módulos do GO
go mod tidy


#Build para Linux
linux() {
  echo "Building for linux"
  CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build .
  echo -e "\nBuild completa!"
}

#Build para MacOS(Darwin)
macos() {
  echo "Building for macos"
  CGO_ENABLED=0 GOARCH=arm64 GOOS=darwin go build .
  echo -e "\nBuild completa!"
}

#Explicação de como usar script
usage() {
  echo "Digite './gera_build.sh linux' para linux"
  echo "Digite './gera_build.sh macos' para macos"
}

#Verifica escolha do usuário

case $1 in
  linux)
    linux
    ;;
  macos)
    macos
    ;;
  *)
    usage
    ;;
esac