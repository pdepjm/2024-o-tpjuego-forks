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

const esqueleto1 = new Esqueleto (position= game.at(20,20))
const esqueleto2 = new Esqueleto (position= game.at(30,25))
const esqueleto3 = new Esqueleto (position= game.at(10,20))