import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*
import pisos.*

object esqueleto {
  var property position = game.at(25,25) 
  var property image = "esqueletoFrente.png"
  //const nombre = "esqueleto"
  var property vida = 5
  //const danio = 1 

  method movimiento() {
    position = game.at(25.randomUpTo(23), 25.randomUpTo(27) ) 
    // const x = 0.randomUpTo(game.width()).truncate(1)
    // const y = 0.randomUpTo(game.height()).truncate(1)
    // position = game.at(x,y)
    // position = pos
    // self.position().left(1)
    // self.position().up(1)
    // self.position().right(1)
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

