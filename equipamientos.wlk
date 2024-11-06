import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*
import pisos.*


class Elemento {
  var property position
  var property image

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 1 and diferenciaY <= 1
  }
}

const arco = new Elemento (position = game.at(5, 30), image = "arco.png")
const llave = new Elemento (position = game.at(49,23), image = "llave.png")
const pocion = new Elemento (position = game.at(49,7), image = "pocion.png")

const elementos = [arco,llave,pocion]

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
  game.removeTickEvent("vuela"+personaje)
  game.onTick(50, "vuela"+personaje, {direccion.direc(self)})
  }
} 

method tocaBorde() {
  game.removeTickEvent("vuela")
  game.removeVisual(self)
} 
}

const flecha1 = new Flecha(position = caballero.position(), direccion = caballero.direccion(), tirador = caballero)
const flecha2 = new Flecha(position = arquero1.position(), direccion = arquero1.direccion(), tirador = arquero1)
const flecha3 = new Flecha(position = arquero2.position(), direccion = arquero2.direccion(), tirador = arquero2)

const flechas = [flecha1, flecha2, flecha3]

 class AgarrarConLaE {
  method image() = "tecla.jpg"
  var property position
  var property elemento
  method letraGrande(_elemento){
  if (caballero.puedeAgarrar(_elemento)){
      game.addVisual(self)
  }
    else{
      game.removeVisual(self)
    }
  }
}

const arcoE = new AgarrarConLaE (position = arco.position(),elemento = arco)
const llaveE = new AgarrarConLaE (position = llave.position(),elemento = llave)
const pocionE = new AgarrarConLaE (position = pocion.position(),elemento = pocion)

const botonesE = [arcoE,llaveE,pocionE]