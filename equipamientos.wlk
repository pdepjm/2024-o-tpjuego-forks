import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*
import pisos.*


class Elemento {
  var property position
  var property image
  var property nombre

method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 2 and diferenciaY <= 2
}

}

const arco = new Elemento (position = game.at(5, 30), image = "arco.png", nombre = "arco")
const llave = new Elemento (position = game.at(49,23), image = "llave.png", nombre = "llave")
const pocion = new Elemento (position = game.at(54,10), image = "pocion.png", nombre = "pocion")
const tesoro = new Elemento (position = game.at(59, 25), image = "", nombre = "tesoro")

const elementos = [arco,llave,pocion,tesoro]

class Flecha {
    var property position
    var property direccion
    var property image = ""
    var property nombre = "flecha" 
    var property tirador = null 

method disparar(personaje) {
    self.tirador(personaje)
    direccion = personaje.direccion()
    position = personaje.position().right(1)
    direccion.image(self)
    game.addVisual(self)

    game.removeTickEvent("vuela" + personaje.nombre())
    game.onTick(50, "vuela" + personaje.nombre(), {
        direccion.direc(self)
        if (self.position().x() < 0 || self.position().x() >= game.width() ||
            self.position().y() < 0 || self.position().y() >= game.height()) {
            self.tocaBorde()
        }
    })
}

    method tocaBorde() {
        game.removeTickEvent("vuela" + self.tirador())
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
const tesoroE = new AgarrarConLaE (position = tesoro.position(),elemento = tesoro)

const botonesE = [arcoE,llaveE,pocionE,tesoroE]
