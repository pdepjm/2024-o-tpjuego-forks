import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*
import pisos.*

class Esqueleto {
  var property position  
  var property image = "esqueletoFrente.png"
  //const nombre = "esqueleto"
  var property vida = 5
  //const danio = 1 

  method movimiento(x,y) {
    position = game.at(x.randomUpTo(x-2), y.randomUpTo(y+2)) 
  }

  method movimientoV2(direccion) {
    if (direccion==1) {
      abajo.image(self)
      arriba.direc(self)
    }
    else if (direccion==2) {
      abajo.image(self)
      abajo.direc(self)
    }
    else if (direccion==3) {
      izquierda.image(self)
      izquierda.direc(self)
    }
    else if (direccion==4) {
      derecha.image(self)
      derecha.direc(self)
    }
  }

  method cambiaVida(cantidad) {
    vida += cantidad
    if (vida == 0) {
      self.muerto()
    }
  }
  method muerto() {
    self.image("esqueletoMuerto.png")
    game.schedule(1000, {game.removeVisual(self)} )
  }

  method atacado(arma){
    if (self.estaEnRango(arma)){
      self.muerto()
    }
  }

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 1 and diferenciaY <= 1
  }
}

const esqueleto1 = new Esqueleto (position= game.at(17,16))
const esqueleto2 = new Esqueleto (position= game.at(30,25))
const esqueleto3 = new Esqueleto (position= game.at(34,8))
const esqueleto4 = new Esqueleto (position= game.at(7,20))
const esqueleto5 = new Esqueleto (position= game.at(45,23))
const esqueleto6 = new Esqueleto (position= game.at(50,8))
const esqueleto7 = new Esqueleto (position= game.at(60,12))