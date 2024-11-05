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
const llave = new Elemento (position = game.at(24,2), image = "llave.png")
const pocion = new Elemento (position = game.at(0,0), image = "pocion.png")

const objetos = [arco,llave,pocion]

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

 object agarrarConLaE {
   method image() = "TECLAE.png"
   method position() = arco.position()
   method text() = "TOCA E PARA AGARRAR"
  method letraGrande(arco){
  if (caballero.puedeAgarrar(arco)){
      game.addVisual(self)
    }
    else{
      game.removeVisual(self)
    }
  }
}

