#!/bin/sh

# Script para descargar y configurar Emacs como VentMacs
# Basado en las configuraciones provistas por Debian.

print_help() {
    echo "Uso: $0 [OPCIONES]"
    echo "Descargar y configurar Emacs con banderas personalizadas."
    echo ""
    echo "Opciones:"
    echo "    -h, --help    Mostrar este mensaje de ayuda"
    exit 0
}

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

# Obtener la URL de la última versión de Emacs
echo "Obteniendo la última versión de Emacs..."
version=$(curl -s https://gnu.mirror.constant.com/emacs/ | grep -oE 'emacs-[0-9.]+\.tar\.xz' | sort -V | tail -n 1)
url="https://gnu.mirror.constant.com/emacs/$version"

# Descargar la última versión de Emacs
echo "Descargando Emacs..."
curl -O "$url"

# Extraer el archivo
archivo=$(basename "$url")
tar -xvf "$archivo"

# Entrar en el directorio de Emacs
cd "${archivo%.tar.xz}" || exit

# Configurar Emacs
echo "Configurando Emacs..."
./configure --prefix=/usr \
            --sharedstatedir=/var/lib \
            --libexecdir=/usr/libexec \
            --localstatedir=/var/lib \
            --infodir=/usr/share/info \
            --mandir=/usr/share/man \
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
            CFLAGS="-O2 -march=native -mtune=native -pipe"

# Compilar e instalar Emacs
echo "Compilando e instalando Emacs..."
make
# sudo make install

echo "¡Emacs ha sido instalado y configurado exitosamente!"
