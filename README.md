# VentMacs

![vent-macs](/.doom.d/title.png)

Es solo una micro-distribución (por no decir `dotfiles`) para Doom Emacs.

Este proyecto tiene un enfoque personal así que estará siendo manteniendo de
acuerdo a mis necesidades, nada especial, de igual forma si deseas instalar mis
archivos de configuración te dejo las instrucciones.

## Cómo instalar

Si ya posees Doom Emacs solo realiza un respaldo de tu carpeta `~/.doom.d/` y
arrastra los archivos de la carpeta `.doom.d/` que se encuentra en este
repositorio. Simple, sencillo, fácil y rápido.

> Te recomiendo borrar los archivos de title.png y el archivo .svg del logo si
> tienes pensado cambiar el nombre o la imágen del editor

### Comando copy-pastable para los flojos

``` sh
# Clonar el repositorio de git
$ git clone https://github.com/VentGrey/VentMacs
# Respaldar las configuraciones anteriores (si existen)
$ mv ~/.doom.d .doom.d.old
# Instalar VentMacs
$ cd VentMacs && mv .doom.d/ ~/
```


Mi configuración de emacs (si reunes los programas instalados) posee las
siguientes características:

# Herramientas instaladas

* ivy -> (Autocompletado ligero y que si jala a la primera)
* emoji + unicode -> (Por si te gusta hablar como idiota de vez en cuando)
* fill-column -> (Un indicador para cuando te pases de la línea 80. Sirve
para detectar malos programadores).
* hl-todo -> (Marcar en colores todos preciosos las palabras qleras de TODO, 
FIXME y esas mamadas que ponemos en el código que no jala).
* indent-guides -> (puntitos pa que no te pierdas programando)
* ligatures -> (al chile no jala en linux, pero pos ahí está)
* modeline -> (una barrita perrona pa que se vea chido el emacs)
* treemacs -> (como NerdTree pero bien hecho)

# Otras cosas interesantes
* templates de código
* snippets
* integración con `git` y GitHub
* Terminal eshell pa que corras todo desde emacs y no andes abriendo terminales a lo wey
* revisión de ortografía para que tu texto no esté mal escroto
* make para compilar todo acá chido
* rgb para hacer strings de colores y que emacs tenga más fps


# Lenguajes de programación soportados

* C - Lenguaje que asusta programadores de JS por que tiene unas madres llamadas "apuntadores"
* C++ - C que tarda un chingo en compilar
* Lenguajes de configuración o datos comunes (CSV, TOML, etc)
* Elisp - (((al chile no entiendo (este (lenguaje (extraño))))))
* ess - Estadística con emacs, no se que haga pero pos tiene R
* json - { description: "está mejor que xml, eso es cierto" }
* JavaScript - No tengo bromas para esto, pero apuesto a que ya hay un framework que lo hace.
* Julia - Python morado y rápido
* LaTeX - Word, Excel y PowerPoint pero para hipsters
* MarkDown - Escribe READMES que nadie va a leer :D
* org - Markdown para los camaradas que usan Emacs
* php - No está tan feo...bueno si, pero no hay de otra.
* python - Se tiene que usar...aunque esté horrible
* Rust - JAJAJAJAJAJAJAJAJAJA no planeas usar esto...¿o si?
* sh - Bash que le tiene miedo a la palabra `function`
* web - Eso que todo mundo hace hoy en día pero que les sale bien culero
* yaml - Perl pero de marcado

# DEPENDENCIAS

Para utilizar VentMacs sin pedos (o al menos para no notarlos) necesitarás las siguientes
dependencias:

* `clang-11`
* `clangd-11`
* `shellcheck`
* `rust` (`stable` o `nightly`) 1.40 >=
* `php-7.2` >=
* `python3` 3.8 >=
* `pip3`
* `latex`
* `pyls`
* `rls (Rust Language Server)`
* `julia`
* `irony-server`

# Cositas Extra
Se incluyen algunos temas favoritos como:
* Srcery (Tema de colores oscuros-pastel y mi personal favorito)
* Tema Spacemacs (Uno de los mejores en cuanto a resaltados)
* rainbow-delimiters (Paréntesis con arcoíris para no cagarla en lisp, python ni
  nada donde se ocupen chingos de precedencia de operadores)

---

* ghub (Integración con GitHub para que veas cuando tus compas madrean tu repo)

## Bajo config.el

* Similar a los archivos de Vim Bootstrap, la tecla líder es ","
* Modifica los campos `user-full-name` & `user-mail-address` para que algunos
  plugins funcionen mejor (no te llegarán notificaciones de mis configuraciones,
  pues dichos plugins requieren pasos extras como generación de tokens, etc.)
* La tecla para abrir Treemacs es similar a NERDTree en Vim (`F3`).
* Si deseas modificar el banner ve a la sección "Change Banner" y coloca tu
  archivo transparente en tu directorio `.doom.d/`.
  

# Cosas por arreglar (Dame una mano si te gusta la config :D)

* Nada por el momento
