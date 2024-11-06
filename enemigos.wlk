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
  //const danio = 1 
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

  method cambiaVida(cantidad) {
    vida += cantidad
    if (vida == 0) {
      self.muerto()
    }
  }
  method muerto() {
    self.image(self.nombre() + "Muerto.png")
    game.schedule(500, {game.removeVisual(self)} )
    self.estaVivo(false) 
  }

  method muerto(flecha){
    if(!(flecha.tirador() == self)){
      self.image(self.nombre()+"Muerto.png")
      game.removeVisual(flecha)
      game.schedule(500, {game.removeVisual(self)})
      game.removeTickEvent("movimiento" + self)
      self.estaVivo(false) 
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

    return diferenciaX <= 1 and diferenciaY <= 1
  }

  method tocaBorde() {}
}

class Arquero {
  var property position  
  var property image = "arqueroFrente.png"
  var property nombre = "arquero"
  var property vida = 5
  //const danio = 1 
  var property direccion = abajo

  const equipamiento = #{arco}

  method muerto(flecha) {
    if(!(flecha.tirador() == self)){
    self.image(self.nombre() + "Muerto.png")
    game.removeVisual(flecha)
    game.schedule(500, {game.removeVisual(self)})
    game.removeTickEvent("disparar")
    }
  }

  method tieneElElemento(elem) = equipamiento.contains(elem) 

}

const arquero1 = new Arquero (position = game.at(15, 23), equipamiento = #{arco})

const esqueleto1 = new Esqueleto (position= game.at(17,16))
const esqueleto2 = new Esqueleto (position= game.at(30,25))
const esqueleto3 = new Esqueleto (position= game.at(34,8))
const esqueleto4 = new Esqueleto (position= game.at(6,22))
const esqueleto5 = new Esqueleto (position= game.at(50,8))
const esqueleto6 = new Esqueleto (position= game.at(60,12))
const esqueleto7 = new Esqueleto (position= game.at(4,16))
const esqueleto8 = new Esqueleto (position= game.at(45,13))

const esqueletosPiso1 = [esqueleto1,esqueleto2,esqueleto3,esqueleto4,esqueleto5,esqueleto6,esqueleto7,esqueleto8]
const arquerosPiso1 = [arquero1]