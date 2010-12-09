##Quizzly como generador de quizzes

Comenzó como una aplicación en sinatra y luego decidí sencillamente generar los quizzes. Usa [thor](http://rdoc.info/github/wycats/thor/master/file/README.md) para las tareas, [datamapper](http://datamapper.org/) para abstraer los métodos de persistencia (pude *no* haber usado un ORM, pero iba a ser una webapp, así que no podía estar leyendo de archivos) y [rspec](http://rspec.info/) para pruebas. Lo que hace es leer las preguntas en la carpeta `seeds`, meterlas a una base de datos y luego, en las tareas, crear participantes asignándoles n preguntas al azar, una por cada categoría posible. Luego usa [mustache](http://mustache.github.com/) para llenar una plantilla, la cual escribe en un archivo en un directorio con el número de cuenta del alumno, agrega esto a git y hace un push al repositorio donde el alumno pondrá sus soluciones. 

Está más crudo que la vida, pero, hey, lo hice en un día :P


