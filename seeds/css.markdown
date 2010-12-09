Considere el siguiente markup:

    <html>
        <head>
        <style type="text/css">
          body {
            color: #000;
            background-color: #fff;
          }
          #wrap {
            font-size: 2em;
            color: #333;
          }
          div {
            font-size: 1em;
          }
          em {
            color: #666;
          }
          p.item {
            color: #fff;
            background-color: #ccc;
            border-style: dashed;
          }
          p {
            border: 1px solid black;
            padding: 0.5em;
          }
        </style>
      </head>
      <body>
        <div id="wrap">
          <p class="item">
            Esto es<em>algo</em>
            <a href="#">interesante</a>
          </p>
        </div>
      </body>
    </html> 

¿Qué conceptos de css están presentes en el resultado final? Dé observaciones concretas ("el concepto X se ve en la regla Y poque el elemento Z tiene tal resultado final").

---

Considere el siguiente markup:

    <html>
        <head>
        </head>
        <body>
            <ul><li>x</li></ul>
            <div id="main">
                <div>
                    <article>
                        <span class="notice">hola, mundo</span>
                        <ul>
                            <li>a</li>
                            <li>b</li>
                            <li>c</li>
                        </ul>
                    </article>
                </div>
            <div>
            <p class="notice"></p>
            <ul><li>y</li></ul>
        </body>
    </html>

¿Qué [selector](http://www.w3.org/TR/css3-selectors/) usaría para llegar
a la lista más profundamente anidada (sin usar `id` o `class` en la lista) ? ¿Y para seleccionar las listas que están _contiguas_ a un elemento con clase "notice"? (no es válido agregarle `id` o `class` a la lista)

---

Considere el siguiente markup:

    <html>
        <head></head>
        <body>
            <div id="col1">Dolor sit</div>
            <div id="col2">Amet blah blah</div>
            <div id="footer">Lorem ipsum</div>
        </body>
    </html>


¿Qué modificaciones haría y qué css agregaría para que los divs `col1` y `col2` salieran como columnas contiguas y el div `  footer`, abajo de éstos?

---

Considere el siguiente markup:

    <html>
        <head>
        </head>
        <body>
            <ul><li>x</li></ul>
            <div id="main">
                <div>
                    <article>
                        <span class="notice">hola, mundo</span>
                        <ul>
                            <li>a</li>
                            <li>b</li>
                            <li>c</li>
                        </ul>
                    </article>
                </div>
            <div>
            <p class="notice"></p>
            <ul><li>y</li></ul>
        </body>
    </html>

¿Cómo haría para que los __elementos impares__ de las listas que estén _contiguas a elementos con clase "notice"_
tengan un color de fondo azul claro? (sugerencia, lea sobre el pseudo-selector [nth-child](http://www.w3.org/TR/css3-selectors/#nth-child-pseudo)).

