import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*

object arco {
  method position() = game.at(15,15)
  var property image = "arco.png"
  
}

object flecha {
var property position = caballero.position()
var property direccion = caballero.direccion()
method image() = direccion.image()

method disparar(personaje) {
  if (personaje.tieneElElemento(arco)){
  direccion = personaje.direccion()
  position = personaje.position()
  game.addVisual(self)
  game.onTick(50, "vuela", { self.moverse(direccion.direc(self))}) 
  self.image()
  }
} 

method image(nuevaImagen) {
  self.image(nuevaImagen)
}

method moverse(nuevaPosicion) {
    self.position(nuevaPosicion)
  }
}

