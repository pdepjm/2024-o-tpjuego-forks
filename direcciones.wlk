import wollok.game.*
import personajes.*
import enemigos.*
import equipamientos.*

object abajo {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Frente.png")
  method direc(obj) = obj.position().down(1)
} 

object derecha {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Derecha.png")
  method direc(obj) = obj.position().right(1)
} 

object izquierda {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Izquierda.png")
  method direc(obj) = obj.position().left(1)
} 

object arriba {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Espalda.png")
  method direc(obj) = obj.position().up(1)
} 

