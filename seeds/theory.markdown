
Si yo tuviera una base de datos donde guardo cosas por hacer (como [thingler](http://thingler.com/), 
donde existen listas y cada lista contiene tareas, que pueden editarse y borrarse, además de crearse.
y quisiera diseñar URLs para manipular esos _recursos_. (donde manipular puede ser: ver una lista, 
crear una lista, agregar cosas a una lista, borrar una cosa de una lista y editar una cosa de una lista)

Siguiendo el modelo de arquitectura REST ¿qué URLS diseñaría?

---

En una aplicación antigua hecha en ruby on rails algunos desarrolladores están teniendo problemas:
resulta que tienen un modelo con las siguientes propiedades: `código_de_barras, nombre, precio`
y un formulario donde uno puede editar el nombre y el precio de instancias de ese modelo.

Pero descubrieron que algunos usuarios maliciosos, de alguna manera mágica, están modificando
los _¡códigos de barras!_ (que no salen en el formulario). ¿Cómo lo están haciendo y cómo solucionaría
este problema?

---


En una aplicación de colaboración (como [writeboard](http://writeboard.com/) ) los participantes 
entran a una sala de escritura mediante un link especial que se comparten por correo, así
que no hay necesidad de registrarse (y menos de hacer un login completo). Sin embargo, la primera
vez que uno escribe algo, una cajita de texto le pide a uno un "nombre de pantalla", y, de ahí en adelante
siempre que uno escribe, sale el susodicho nombre. ¿Cómo funciona eso? (describa cómo lo haría) ¿Qué propiedad del protocolo HTTP hace
algo como esto difícil y qué mecanismos se han inventado para resolverlo?



