import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*
import pisos.*


object arco {
  method position() = game.at(15,15)
  method image() = "arco.png"

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
  //game.removeTickEvent("vuela")
  direccion = personaje.direccion()
  position = personaje.position()
  direccion.image(self)
  game.addVisual(self)
  game.removeTickEvent("vuela")
  game.onTick(50, "vuela", {direccion.direc(self)})
  }
} 

method atacar(enemigo){
  if (enemigo.estaEnRango(self)){
    enemigo.muerto()
    }
}

method tocaBorde() {
  game.removeTickEvent("vuela")
  game.removeVisual(self)
} 
}


