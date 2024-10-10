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
var property image = "flechaAbajo.png"
var property nombre = "flecha"

method disparar(personaje) {
  if (personaje.tieneElElemento(arco)){
  direccion = personaje.direccion()
  position = personaje.position()
  direccion.image(self)
  game.addVisual(self)
  game.onTick(50, "vuela", {self.moverse(direccion.direc(self))}) 
  }
} 

method cambiaImagen(nuevaImagen) {
  self.image(nuevaImagen)
}

method moverse(nuevaPosicion) {
    self.position(nuevaPosicion)
  }
}

