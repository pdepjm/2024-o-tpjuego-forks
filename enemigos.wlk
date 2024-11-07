import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*
import pisos.*

class Esqueleto {
  var property position  
  var property image = "esqueletoFrente.png"
  var property nombre = "esqueleto"
  var property vida = 5
  var property direccion = abajo
  var property estaVivo = true

  method ataca(personaje){
    if(self.estaVivo()){
    personaje.cambiaVida(-1)
    }
  }

  method moverse(nuevaDireccion) {
    self.direccion(nuevaDireccion)
    nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
  }

  method movimiento(x, y){
    if(self.estaVivo()){
    if(self.position() == game.at(x, y)){
    self.moverse(derecha)
    }
    else if (self.position() == game.at(x+2, y)) {
      self.moverse(abajo)
    }
    else if (self.position() == game.at(x+2, y-2)){
      self.moverse(izquierda)
    }
    else if (self.position() == game.at(x, y-2)){
      self.moverse(arriba)
    }
    else {
      self.moverse(direccion)
    }
    }
  }

  method cambiaVida(cantidad) {
    vida += cantidad
    if (vida == 0) {
      self.muerto()
    }
  }
  method muerto() {
    self.estaVivo(false)
    self.image("esqueletoMuerto.png")
    game.schedule(500, {game.removeVisual(self)} ) 
  }

  method muerto(flecha){
    if(!(flecha.tirador() == self)){
      self.estaVivo(false)
      self.image("esqueletoMuertoFlecha.png")
      game.removeVisual(flecha)
      game.schedule(500, {game.removeVisual(self)})
    }
  }

  method atacado(arma){
    if (self.estaEnRango(arma)){
      self.muerto()
      self.estaVivo(false) 
    }
  }

method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 3 and diferenciaY <= 3
}

  method tocaBorde() {}
}

class Arquero {
  var property position  
  var property image = "arqueroFrente.png"
  var property vida = 5
  var property nombre
  var property direccion

  method muerto(flecha) {
    if(!(flecha.tirador() == self)){  
    self.image("arqueroMuerto.png")
    game.removeVisual(flecha)
    game.removeTickEvent("disparar"+self.nombre())
    game.schedule(500, {game.removeVisual(self)})
    }
  }

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 3 and diferenciaY <= 3
  }

}

const arquero1 = new Arquero (position = game.at(35, 28), direccion = abajo,nombre = "arquero1")
const arquero2 = new Arquero (position = game.at(2, 29), direccion = abajo,nombre = "arquero2")

const esqueleto1 = new Esqueleto (position= game.at(17,16))
const esqueleto2 = new Esqueleto (position= game.at(30,25))
const esqueleto3 = new Esqueleto (position= game.at(34,8))
const esqueleto4 = new Esqueleto (position= game.at(6,22))
const esqueleto5 = new Esqueleto (position= game.at(50,8))
const esqueleto6 = new Esqueleto (position= game.at(60,12))
const esqueleto7 = new Esqueleto (position= game.at(4,16))
const esqueleto8 = new Esqueleto (position= game.at(45,13))

const esqueletos = [esqueleto1,esqueleto2,esqueleto3,esqueleto4,esqueleto5,esqueleto6,esqueleto7,esqueleto8]
const arqueros = [arquero1, arquero2]