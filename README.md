# Mi Configuracion Arcolinux

<image src="./screen.png" alt="Captura de configuracion de ArcolinuxB">

## Instalacion 

### Arcolinux

[ArcolinuxB](https://sourceforge.net/projects/arcolinux-community-editions/files/qtile/)

Al iniciar el booteo, seleccionamos la opcion de instalacion avanzada. Para ellos nos conectamos a internet via wifi:

```
nmcli device wifi list
```

```
nmcli device wifi connec "name" password "password"
```

### Qtile

Dependecias qtile

Descargamos nerd-fonts-ubuntu-mono

[UbuntuMono Nerd Font](https://www.nerdfonts.com/font-downloads)

Movemos el .zip a la carpte `usr/share/fonts`

```
sudo mv UbuntuMono.zip /usr/share/fonts/
```

Clonar el repo y copiar la carpeta `.config/qtile`

Si el icono de red no funciona, vamos a `.config/qtile/settings/widgets.py` y modificamos esta linea con nuestros datos

```
# Cambia el argumento "interface", usa ip address para saber cuál poner
 widget.Net(**base(bg='color3'), interface='wlp2s0'),
```

El tema establecido esta en `.config.json`

```
 "theme": "material-ocean"
```

### Ranger

Instalamos ranger

```
sudo pacman -Syu ranger
```

Ahora instalamos el plugin de iconos


```
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins
```
Ahora agregagos el archivo de configuracion `rc.conf`

```
set preview_images_method ueberzug
default_linemode devicons
set show_hidden true
```

### Rofi

Instalamos rofi y sus dependencias

```
sudo pacman -S rofi papirus-icon-theme
yay -S nerd-fonts-ubuntu-mono
git clone https://github.com/davatorium/rofi-themes.git
sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes
```

Borra esta linea en `/usr/share/rofi/themes/onedark.rasi`

```
font: "Knack Nerd Font 14";
```

Cambia la variable `@purple` de onedark por `@mangenta` deberia quedar asi:

```
element active, element selected active {
  text-color: @mangenta;
}
```

Copia mis configuraciones en `.config/rofi` 


### Neovim

Instala neovim

```
sudo pacman -Syu neovim
```

Ejecutamos el siguiente comando para que funcione packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Copia mis configuraciones en `./config/nvim/`

Ingresamos desde nvim a `.config/nvim/lua/theprimeagen` y ejecutamos `:so` y luego `:PackerSync` 


### Gtk Theming

Utiliza: [Material-Black-Blueberry](https://github.com/rtlewis1/GTK/tree/Material-Black-Colors-Desktop) y [Material-Black-Blueberry-Suru](https://github.com/rtlewis88/rtl88-Themes/tree/material-black-COLORS)

```
# Asumiendo que has descargado Material-Black-Blueberry
cd Downloads/
sudo pacman -S unzip
unzip Material-Black-Blueberry.zip
unzip Material-Black-Blueberry-Suru.zip
rm Material-Black*.zip

# Haz tu tema visible a GTK
sudo mv Material-Black-Blueberry /usr/share/themes
sudo mv Material-Black-Blueberry-Suru /usr/share/icons
```

Edita `~/.config/gtk-3.0/settings.ini` añdiendo estas líneas

```
# ~/.gtkrc-2.0
gtk-theme-name = "Material-Black-Blueberry"
gtk-icon-theme-name = "Material-Black-Blueberry-Suru"

# ~/.config/gtk-3.0/settings.ini
gtk-theme-name = Material-Black-Blueberry
gtk-icon-theme-name = Material-Black-Blueberry-Suru
```

La próxima vez que inicies sesión verás los cambios aplicados. Puedes instalar también un tema de cursor distinto, para ello necesitas `xcb-util-cursor`. El tema que yo uso es `Breeze`, descárgalo, y después


```
sudo pacman -S xcb-util-cursor
cd Downloads/
tar -xf Breeze.tar.gz
sudo mv Breeze /usr/share/icons
```

Edita `/usr/share/icons/default/index.theme` añadiendo esto:

```
[Icon Theme]
Inherits = Breeze
```

Ahora vuelve a editar `~/.gtkrc-2.0` y `~/.config/gtk-3.0/settings.ini`:


```
# ~/.gtkrc-2.0
gtk-cursor-theme-name = "Breeze"

# ~/.config/gtk-3.0/settings.ini
gtk-cursor-theme-name = Breeze
```

Asegurate de escribir bien los nombres de los temas e iconos, deben ser exactamente los nombres de los directorios donde se encuentran, los que ofrece esta salida:

```
ls /usr/share/themes
ls /usr/share/icons
```

## Monitores

Si tienes múltiples monitores, seguramente quieras usarlos todos. Así es como funciona xrandr:

```
# Lista todas las salidas y resoluciones disponibles
xrandr
# Formato común para un portátil con monitor extra
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --output HDMI-1-0 --mode 1920x1080 --pos 0x0
```

Es necesario especificar la posición de cada salida, si no se utilizará 0x0, y todas las salidas estarán solapadas. Ahora bien, si no quieres calcular píxeles y demás necesitas una interfaz gráfica como arandr:

```
sudo pacman -S arandr
```

## Prueba de microfono

Ingresa a la parte superior, al incono de sonido haz click derecho y abre el mixer. Verifica si el microfono de tus auriculares esta funcionando de lo contrario ejecuta el siguiente comando

```
cat /proc/asound/card*/codec* | grep Codec

```
Toma nota de los codecs que aparecen y Busque el modelo de HD-audio para su códec en [Modelos específicos de codificación de audio de alta definición](https://www.kernel.org/doc/html/latest/sound/hd-audio/models.html)

Luego ingresa con un editor de texto, yo usare nvim

```
sudo nvim /etc/modprobe.d/alsa-base.conf
```
Inserte esta línea en la parte inferior del archivo options `snd-hda-intel model={HD-audio model for you codec}` . Por ejemplo, para mí fue
```
options snd-hda-intel model=alc255-acer,dell-headset-multi
```



## Atajos de teclado basicos

### Nvim Teclas

Ctrl+Space+p+t -> Arbol de directorios

Ctrl+Space+p+f -> Previsualizacion de archivos

Ctrl+Space+p+v -> Visualizador directorios vim

Ctrl+Space+p+u -> Arbol de cambios realizados

Ctrl+Space+te  -> Terminal en el direcciorio actual

### Nvim

Mode: Visualizacion

Shift+v -> Selecciona toda la linea

Ctrl+v -> Seleccion por bloque

Shift+K -> Desplaza seleccion hacia arriba

Shift+J -> Desplaca seleccion hacia abajo

Y -> Copia toda la seleccion

## Mode: Normal

[n] : Son las cantidad de lineas a hacer:

[n]+y -> Copiar

[n]+p -> Pegar

[n]+d -> Elimiar

## NeoTree

a -> Crear documentos o directorios

x -> Cortar

c -> Copiar

r -> Renombrar

m -> Mover

s -> Abrir documento verticalmente

R -> Refresh

# Rofi

shitf+m -> lanza rofi
