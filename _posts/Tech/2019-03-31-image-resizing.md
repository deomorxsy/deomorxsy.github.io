---
layout: default
title:  "Image Resizing"
date:   2018-12-11 15:40:50
categories: technology
tags:
- shellscript
---

# Redimensionando Imagens

Imagens podem ficar desproporcionais dependendo da resolução e proporção do lugar onde ela aparecerá na internet. Usaremos bash para escrever um código que redimensiona a imagem baseado na resolução desejada.

Requisitos:

 - Comandos básicos de linha de comando / Bash
 - Formatos de Imagem
 - Estrutura básica de diretórios
 - Edição básica de imagem, crop

Vamos tomar como exemplo o **Stories do Instagram**, onde a resolução é sempre **1080 x 1920** e sua proporção **9:16**.

_PS: é prudente que antes de seguir os passos à seguir você **edite** a imagem que você quer o mais próximo da proporção 9:16, já que o script apenas redimensiona, e não [cropa](https://en.wikipedia.org/wiki/Cropping_(image))._

Podemos então construir um pequeno script pela linha de comando que vai redimensionar as resoluções da imagem que você quer upar.

Primeiramente, vá até o diretório onde as imagens que você quer redimensionar estão, crie a pasta de destino após o processo (que no caso é **final**), e o arquivo do script **arquivo.sh** com os comandos abaixo

![]( https://i.imgur.com/iJBSyjm.jpg )

Abra o arquivo .sh no seu editor de código, e crie uma variável l1. O resultado do ls(list) será uma String guardada na variável l1 (dentro dos apóstrofos, entre parênteses). O formato no nome de todas as imagens devem ser o mesmo (.jpg ou .png); edite retirando todos aqueles nomes de arquivo que não são imagens ou que você não quer.

{% highlight bash %}
#!/bin/bash

l1=('cole aqui o código')

for l1 in *.jpg; do convert $l1 -resize 1080x1920! final/$l1; done

{% endhighlight %}

Acima usamos o **For Loop** para indicar que todas as imagens .jpg devem ser convertidas. O comando convert chama o programa Magick para redimensionar todas as imagens que estão na variável l1, jogando a conversão na pasta final, com todas as imagens com seus respectivos nomes (como estavam em l1).
<p>Por fim, rode o programa com</p>

{%highlight bash%}

sh ./script.sh 

{% endhighlight%}

Confira o arquivo do código no [repositório github](http://github.com/deomorxsy)