import wollok.game.*
import personajes.*
import enemigos.*
import equipamientos.*

object abajo {
  var position = 0
  method image() = "flechaFrente.png"
  //method image(obj) = obj + "Frente.png"
  method direc(obj) = obj.position().down(1)

} 

object derecha {
  var position = 0
  method image() = "flechaDerecha.png"
  //method image(obj) = obj + "Derecha.png"
  method direc(obj) = obj.position().right(1)
} 

object izquierda {
  var position = 0
  method image() = "flechaIzquierda.png"
  //method image(obj) = obj + "Izquierda.png"
  method direc(obj) = obj.position().left(1)
} 

object arriba {
  var position = 0
  method image() = "flechaEspalda.png"
  //method image(obj) = obj + "Espalda.png"
  method direc(obj) = obj.position().up(1)
} 

