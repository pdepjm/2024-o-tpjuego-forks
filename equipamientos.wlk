import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*

object arco {
  method position() = game.at(15,15)
  var property image = "arco.png"

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 1 and diferenciaY <= 1
  }
}

object flecha {
var property position = caballero.position()
var property direccion = caballero.direccion()
var property image = "flechaAbajo.png"
var property nombre = "flecha"

method disparar(personaje) {
  if (personaje.tieneElElemento(arco)){
  game.removeTickEvent("vuela")
  direccion = personaje.direccion()
  position = personaje.position()
  direccion.image(self)
  game.addVisual(self)
  game.onTick(50, "vuela", {direccion.direc(self)}) 
  }
} 

method cambiaImagen(nuevaImagen) {
  self.image(nuevaImagen)
}

method tocaBorde() {
  game.removeTickEvent("vuela")
  game.removeVisual(self)
} 
}

