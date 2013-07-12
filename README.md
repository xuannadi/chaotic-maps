chaotic maps
============
A ruby library to encrypt image or text inputs based on chaotic maps.

Maps : Baker's Map, Horseshoe Map, Henon Map, Lorenz Atrractor, Arnold's Cat Map, Standard Map

<h3>Requires : </h3>

'image.rb' uses 'chunky_png' gem for processing images and hence it should be installed. <br/>
'text.rb' is self-contained.
<pre> gem install chunky_png </pre>

<h3>Usage : </h3>

Text Inputs -
<pre>
require 'text.rb'

txt = Text.new('./filepath/sometextfile')

bakerMatrix = txt.bakerMap(10) 
horseShoeMatrix = txt.horseShoeMap(10)  
# 10 is number of iterations for which the mapping is repeated, default value is 1
</pre>

Image inputs -
<pre>
require 'image.rb'

img = Image.new('./filepath/somePNG')

img.bakerMap(10) 
img.horseShoeMap(10)  
# check output/ directory for the scrambled images
</pre>
