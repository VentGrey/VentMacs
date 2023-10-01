#!/bin/sh

# Copyright (c) 2023, Omar Jair Purata Funes <VentGrey>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Descripción del script
#
# Script para descargar y configurar Emacs como VentMacs
# Basado en las configuraciones provistas por Debian.

# Variables y funciones
print_help() {
    echo "Uso: $0 [OPCIONES]"
    echo "Descargar y configurar Emacs con banderas personalizadas."
    echo ""
    echo "Opciones:"
    echo "    -h, --help    Mostrar este mensaje de ayuda"
    exit 0
}

exit_clean() {
    [ -n "$temp_dir" ] && rm -rf "$temp_dir"
    exit
}


check_dependencies() {
    for dep in curl tar make gcc; do
        if ! command -v "$dep" > /dev/null; then
            echo "Error: El paquete $dep no está instalado."
            exit 1
        fi
    done
}

download_emacs() {
    echo "Obteniendo la última versión de Emacs..."
    version=$(curl -s https://gnu.mirror.constant.com/emacs/ | grep -oE 'emacs-[0-9.]+\.tar\.xz' | sort -V | tail -n 1)

    if [ -z "$version" ]; then
        echo "Error al obtener la última versión de Emacs."
        exit 1
    fi

    url="https://gnu.mirror.constant.com/emacs/$version"

    if [ ! -f "$version" ]; then
        echo "Descargando Emacs..."
        curl -O "$url" || { echo "Error al descargar Emacs."; exit 1; }
    else
        echo "El archivo $version ya ha sido descargado previamente."
    fi
}

extract_emacs() {
    archivo=$(basename "$url")
    if [ ! -d "${archivo%.tar.xz}" ]; then
        echo "Extrayendo el archivo..."
        tar -xvf "$archivo" || { echo "Error al extraer el archivo."; exit 1; }
    else
        echo "El archivo $archivo ya ha sido extraído previamente."
    fi
}

configure_and_install_emacs() {
    cd "${archivo%.tar.xz}" || { echo "Error al entrar en el directorio de Emacs."; exit 1; }

    echo "Configurando Emacs..."
    ./autogen.sh || { echo "Error en autogen.sh."; exit 1; }
    ./configure --prefix=/usr \
            --sharedstatedir=/var/lib \
            --libexecdir=/usr/libexec \
            --localstatedir=/var/lib \
            --infodir=/usr/share/info \
            --mandir=/usr/share/man \
            --with-gnutls \
            --with-libsystemd \
            --without-pop \
            --with-mailutils \
            --with-sound=alsa \
            --without-gconf \
            --with-native-compilation \
            --with-cairo \
            --with-x=yes \
            --with-x-toolkit=gtk3 \
            --with-toolkit-scroll-bars \
            --with-json \
            --with-tree-sitter \
            --without-imagemagick \
            --with-xft \
            --with-x \
            --with-xwidgets \
            --with-jpeg \
            --with-png \
            --with-rsvg \
            --without-selinux \
            CFLAGS="-O2 -march=native -mtune=native -pipe -fstack-protector-strong -Wformat -Werror=format-security -Wall"
    
    if [ $? -ne 0 ]; then
        echo "Error al configurar Emacs."
        exit 1
    fi

    echo "Compilando e instalando Emacs..."
    make -j"$(nproc)" || { echo "Error al compilar Emacs."; exit 1; }
    sudo make install || { echo "Error al instalar Emacs."; exit 1; }

    echo "¡Emacs ha sido instalado y configurado exitosamente!"
}

# Lógica principal

# Atrapar señales de interrupción para limpiar antes de salir
trap exit_clean INT TERM EXIT

# Realizar las operaciones en un directorio temporal
temp_dir=$(mktemp -d)

cd "$temp_dir" || { echo "Error al ingresar al directorio temporal "; exit 1;}

# Comprobar argumentos de línea de comandos
while [ "$1" ]; do
    case "$1" in
        -h|--help)
            print_help
            ;;
        *)
            echo "Opción no reconocida: $1"
            echo "Ejecuta $0 --help para ver las opciones disponibles."
            exit 1
            ;;
    esac
done

check_dependencies
download_emacs
extract_emacs
configure_and_install_emacs

# Limpiar antes de salir del script
exit_clean
