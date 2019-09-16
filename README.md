# VentMacs

![vent-macs](/.doom.d/title.png)

Es solo una micro-distribución (por no decir dotfiles) para doom emacs.

Es personal así que la estaré manteniendo de acuerdo a mis necesidades, nada
especial, de igual forma si deseas instalar mis archivos de configuración
te dejo las instrucciones

# DEPENDENCIAS

Para utilizar VentMacs sin pedos (o al menos para no notarlos) necesitarás las siguientes
dependencias:

* `clang-8`
* `rust` (`stable` o `nightly`) 1.30 >=
* `php-7` >=
* `docker` -> (Versión estable de los repos de docker)
* `python3` 3.5 >=
* `pip3`
* `latex`
* `Ruby` 2.5 >=

## Cómo instalar

Si ya posees doom emacs solo realiza un respaldo de tu carpeta `.doom.d` y
arrastra los archivos de la carpeta `.doom.d` que se encuentra en este
repositorio. Simple, sencillo, fácil y rápido.

> Te recomiendo borrar los archivos de title.png y el archivo .svg del logo si
> tienes pensado cambiar el nombre o la imágen del editor

Mi configuración de emacs (si reunes los programas instalados) posee las
siguientes características:

* Autocompletado con `company` + `ivy`.
* Límite y wrapping en la columna `80` para los programadores de verdad que aún
  respetan el límite de las terminales ANSI.
* Árbol de directorios `neotree`, podría usar `treemacs` pero que asco.
* gutter para mostrar las líneas cambiadas en archivos con seguimiento de git.
* Plantillas de archivos comunes de programación como `c`, `c++`, `java`,
  `rust`, etc.
* Dobleces de código para que tus ojos no vean esas 300 líneas de una sola
  función escrita bajo las influencias del café y probablemente 2 latas de
  bebidas energéticas.
* Snippets para no escribir mucho y solo picarle al `TAB`.
* Soporte para control de versiones como `git` o `mercurial`
* Soporte de directorios, indents y dos terminales como eshell y vterm.
* Soporte para editorconfig.
* flycheck y flyspell para el chequeo de sintáxis y escritura.
* lsp por si alguien utiliza language servers
* Resaltado de fuente para las palabras ultra-necesarias en el desarrollo como:
  "TODO", "FIXME", "NOTE", "DEPRECATED", "HACK" y "REVIEW"
* Emulación de "pestañas" gracias a centaur emacs.
* Integración con docker para no estar con los contenedores castrosos en la
  terminal.
* Soporte para makefiles (Si, para huevones que no queremos usar `gcc -O2
  -Wall -queteimporta`)
* Integración con `Pipenv`, no más `venv + pip` en vergos de comandos.
* Soporte para Rust mejorado, ahora Cargo + Racer + RLS funcionan al 100%



# Lenguajes de programación soportados

* Assembly
* C/C++/Objective-C
* Formatos comunes de configuración / datos
* Emacs-lisp (¿cómo planeas editar la config sin eso?)
* JavaScript (Wacala, pero es necesario)
* LaTeX el mejor sistema de composición de textos existente
* Markdown, no puedes no amarlo.
* ORG MODE
* PHP (Si, sigue vivo)
* Python (Wacala x2, pero es necesario x2)
* Rust, si, ni tú lo vas a usar, lo se.
* Ruby el python sobrevalorado...espera ¿ya existe eso?
* sh (cosas de shell)
* web (ya el nombre explica todo)

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
* La tecla para abrir Neotree es similar a NERDTree en Vim (`F3`).
* Si deseas modificar el banner ve a la sección "Change Banner" y coloca tu
  archivo transparente en tu directorio `.doom.d/`.
  

# Cosas por arreglar (Dame una mano si te gusta la config :D)
* Los íconos de Neotree no cargan si no se usa cualquier tema que no sea `doom-*`.
* El servidor `irony` no funciona por alguna razón
* Añadir soporte para ligaduras sin instalar versiones parcheadas
* Incluir shortcuts sencillos de recordar
