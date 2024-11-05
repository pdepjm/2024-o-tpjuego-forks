import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*
import pisos.*


object arco {
  method position() = game.at(13,15)
  method image() = "arco.png"

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 1 and diferenciaY <= 1
  }
}



class Flecha {
var property position
var property direccion
var property image = ""
var property nombre = "flecha"
var property tirador = null 

method disparar(personaje) {
  if(personaje.tieneElElemento(arco)){
  self.tirador(personaje)
  direccion = personaje.direccion()
  position = personaje.position()
  direccion.image(self)
  game.addVisual(self)
  game.removeTickEvent("vuela" + personaje)
  game.onTick(50, "vuela" + personaje , {direccion.direc(self)})
  }
} 

method tocaBorde() {
  game.removeTickEvent("vuela")
  game.removeVisual(self)
} 
}

const flecha1 = new Flecha(position = caballero.position(), direccion = caballero.direccion(), tirador = caballero)
const flecha2 = new Flecha(position = arquero1.position(), direccion = arquero1.direccion(), tirador = arquero1)

const flechas = [flecha1,flecha2]

// object mensaje {
//   method image() = "TECLAE.png"
//   method position() = game.center()
//   method text() = "TOCA E PARA AGARRAR" 
// }

// object invisible {
//   method position() = game.at(15, 15)
// }

