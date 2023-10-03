# VentMacs - Los ecos Prog-Rock de (e)-lisposting

VentMacs no es solo otro clon de *Macs. Nacido de mi experiencia y viaje personal con los editores de texto, VentMacs es una capa de configuración única para Emacs. Se nutre de la potencia de Vim, incorpora características de editores contemporáneos y se amalgama con las configuraciones que he encontrado y perfeccionado a lo largo de los años.

Más allá de su adaptación meticulosa a mis propias necesidades, VentMacs está diseñado para inspirar y ser un recurso para otros. Si alguna vez has buscado un equilibrio entre lo familiar y lo innovador, entre la eficiencia y la personalización, este puede ser tu próximo puerto de escala en el vasto océano de los editores de texto.

<img height="500" align="left" src="https://github.com/VentGrey/VentMacs/assets/24773698/facb856a-5774-4a79-955f-e67de0d8ea5d">

Aunque está adaptado meticulosamente a mis propias necesidades, VentMacs se ofrece como una inspiración y recurso para otros. Si ves algo que te gustaría adaptar, no dudes en hacer un fork o extraer snippets de código para tu propio uso. Todo está diseñado con la intención de ser accesible y fácil de personalizar.

> Un agradecimiento especial a [doom-snippets](https://github.com/doomemacs/snippets) , de donde he seleccionado cuidadosamente varios snippets para esta configuración.

## 📘 Documentación

> El manual está en desarrollo. Mientras tanto, el código sirve como referencia y guía.

Para una comprensión profunda, se recomienda revisar los archivos de configuración. Están bien comentados y estructurados para facilitar la lectura y el entendimiento.

Para leer la documentación completa de mi configuración, luego de instalarla puedes presionar <kbd>SPC</kbd> + <kbd>dm</kbd> para abrir el archivo de manual.

También podrás encontrar el manual en este repositorio en el directorio `docs/`.

## 🌟 Características destacadas
- Funcionalidad óptima al instalar.
- Configuración rápida y sencilla.
- Diseño minimalista, pero plenamente funcional.
- Autocompletado.
- Integración con Eglot y Tree-Sitter (Emacs 29.1).
- Sincronización con Git.
- Atajos intuitivos a través de `which-key`.
- Tema de [Spacemacs Dark](https://github.com/nashamri/spacemacs-theme) y paleta de colores [Catppucchin Mocha](https://github.com/catppuccin/emacs), el tema mejor logrado de Emacs + La mejor paleta de colores para programar.

Viene con integraciones para flujos de trabajo que usen:

- Go
- Python
- Docker
- Makefiles
- Pruebas de REST API
- Escritura, notas o publicaciones con Org
- Escritura de blogs con Hugo

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
