# VentMacs - Un poco más que Emacs 🚀

Ventmacs es una capa de configuración personal de Emacs diseñada para mis necesidades con una fuerte inspiración en Vim y algunas características de otros editores de texto modernos. Además de tomar características de otros editores o configuraciones que he usado a lo largo de los años.

Esta configuración está hecha de acuerdo a mis necesidades. Podría haber cosas aquí que te gustaría cambiar, te sugiero hagas un fork o, si así lo deseas, puedes tomar *snippets* de código para tu propia configuración, el diseño no debería ser muy complejo para impedirte hacer eso.

> Varios snippets incluidos en esta configuración fueron seleccionados a mano de [doom-snippets](https://github.com/doomemacs/snippets)

## 📘 Documentación

> **Warning**
> **El manual aún no está terminado. Por el momento el código es la documentación.**

Para una comprensión profunda, se recomienda revisar los archivos de configuración. Están bien comentados y estructurados para facilitar la lectura y el entendimiento.

Para leer la documentación completa de mi configuración, luego de instalarla puedes presionar <kbd>SPC</kbd> + <kbd>dm</kbd> para abrir el archivo de manual.

También podrás encontrar el manual en este repositorio en el directorio `docs/`.

## 🌟 Características destacadas
- (Idealmente) funciona sin problemas out-of-the-box
- Rápido y fácil de configurar
- Minimalista pero funcional
- Autocompletado
- Integración de Eglot y Tree-Sitter (Emacs 29.1)
- Integración con Git
- Comandos fáciles de aprender gracias a `which-key`
- Tema de [Spacemacs Dark](https://github.com/nashamri/spacemacs-theme) y paleta de colores [Catppucchin Mocha](https://github.com/catppuccin/emacs), el tema mejor logrado de Emacs + La mejor paleta de colores para programar.

Viene con integraciones para flujos de trabajo que usen:

- Go
- Python
- Docker
- Makefiles
- Pruebas de REST API
- Escritura, notas o publicaciones con Org
- Escritura de blogs con Hugo

## 🐛 Bugs conocidos

Hasta el momento hay un pequeño puñado de bugs conocidos, si no te molestan, eres bienvenid@ de probar la configuración:

1. `treemacs-nerd-icons` no muestra un icono correcto en algunos archivos como lo son las imágenes `.png`

## 🔍 Instalación

Antes de continuar, deberás cumplir con los siguientes requisitos:

- Emacs 29.1 o superior
- Tener un directorio de configuración limpio en `~/.config/emacs/`
- Compilar Emacs con soporte para tree-sitter

Podrás encontrar un pequeño script de instalación + configuración de la última versión de Emacs en este repositorio en el archivo `build-emacs.sh`

La instalación de **VENTMACS** es sencilla, no es más que otra configuración de Emacs:

1. Haz un backup de tu configuración actual.
2. Clona este repositorio en `.emacs.d`.
3. Asegúrate de tener `elpaca` instalado.
4. Inicia Emacs y observa cómo se transforma en una máquina de edición deprimente.
5. Como paso de post-instalación, deberás ejecutar un par de comandos usando `M-x`:
   - `M-x` `nerd-icons-install-fonts`
   - `M-x` `codeium-install`

## Anuncio de Copyright con respecto a los títulos mostrados en la parte inferior del dashboard.

Para que quede claro, no reclamo la propiedad de ninguna de las ideas, nombres o carátulas de álbumes asociados con las canciones a las que se hace referencia aquí. No pretendo dañar o violar ninguna ley de derechos de autor ni utilizar ningún material de los artistas de forma perjudicial.

No pretendo infringir las leyes de derechos de autor copiando o reclamando ilegalmente contenidos que no son míos. Esto se hace únicamente como un homenaje a la banda (s) que amo y escucho. Respeto la idea original, el concepto artístico y las marcas registradas, que son propiedad de las bandas mencionadas en los comentarios del código y de sus titulares de marcas registradas.

## 👐 Contribuciones

Dudo mucho que nadie tenga ganas de contribuir a esto. Más porque es una configuración personal y si no se mantiene de acuerdo a mis expectativas, no me sirve. 

Aun así, si tienes una idea medianamente razonable para esta configuración estaré encantado de recibirla e integrarla.

---

Hecho con ❤️ y 🐧 por [VentGrey](https://github.com/VentGrey)
