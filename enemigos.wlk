import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*
import pisos.*
class Enemigo {
  var property image
  var property position  
  var property vida = 5
  var property nombre
  var property direccion
  var property estaVivo = true

  method muerto(flecha) {
    if(!(flecha.tirador() == self.toString())){  
    self.estaVivo(false)
    self.image(self.nombre() + "Muerto.png")
    game.removeVisual(flecha)
    game.removeTickEvent("disparar"+ self.nombre())
    game.schedule(500, {game.removeVisual(self)})
    }
  }
}
class Esqueleto inherits Enemigo {

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

  method tocaBorde() {}
}

class Arquero inherits Enemigo{var property disparoLaFlecha = false}

const arquero1 = new Arquero (position = game.at(35, 28), direccion = abajo,nombre = "arquero1",image = "arqueroFrente.png")
const arquero2 = new Arquero (position = game.at(2, 29), direccion = abajo,nombre = "arquero2",image = "arqueroFrente.png")

const esqueleto1 = new Esqueleto (position= game.at(17,16),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto2 = new Esqueleto (position= game.at(30,25),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto3 = new Esqueleto (position= game.at(29,8),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto4 = new Esqueleto (position= game.at(6,22),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto5 = new Esqueleto (position= game.at(50,8),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto6 = new Esqueleto (position= game.at(60,12),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto7 = new Esqueleto (position= game.at(4,16),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")
const esqueleto8 = new Esqueleto (position= game.at(45,13),direccion = abajo,image = "esqueletoFrente.png", nombre = "esqueleto")

const esqueletos = [esqueleto1,esqueleto2,esqueleto3,esqueleto4,esqueleto5,esqueleto6,esqueleto7,esqueleto8]
const arqueros = [arquero1, arquero2]