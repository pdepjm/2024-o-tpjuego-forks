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
var property position = caballero.position()
var property direccion = caballero.direccion()
var property image = "flechaAbajo.png"
var property nombre = "flecha"
var property tirador = null 

method disparar(personaje) {
  if(personaje.tieneElElemento(arco)){
  self.tirador(personaje)
  direccion = personaje.direccion()
  position = personaje.position()
  direccion.image(self)
  game.addVisual(self)
  game.removeTickEvent("vuela")
  game.onTick(50, "vuela", {direccion.direc(self)})
  }
} 

// method arqueroDispara(personaje){
//   self.fueDisparada(personaje)
//   direccion = personaje.direccion()
//   position = personaje.position()
//   direccion.image(self)
//   game.addVisual(self)
//   game.removeTickEvent("vuelaa")
//   game.onTick(50, "vuelaa", {direccion.direc(self)})
// }

// method atacar(enemigo){
//   if (enemigo.estaEnRango(self)){
//     enemigo.muerto()
//     }
// }

method tocaBorde() {
  game.removeTickEvent("vuela")
  game.removeVisual(self)
} 
}

const flecha1 = new Flecha(position = caballero.position(), tirador = caballero)
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

