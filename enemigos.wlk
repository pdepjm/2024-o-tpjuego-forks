import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*

object esqueleto {
  var property position = game.at(25,25) 
  var property image = "esqueletoFrente.png"
  var property nombre = "esqueleto"
  var property vida = 5
  var property danio = 2 

  method position(pos) {
    // position = game.at(0.randomUpTo(8),0.randomUpTo(8) ) 
    // const x = 0.randomUpTo(game.width()).truncate(1)
    // const y = 0.randomUpTo(game.height()).truncate(1)
    // position = game.at(x,y)
    position = pos
    // self.position().left(1)
    // self.position().up(1)
    // self.position().right(1)
  }

    method volverAlOrigen(algo) {
    algo.volverAlOrigen()
    return position
  }

  method cambiaImagen(nuevaImagen) {
    self.image(nuevaImagen)
  }

  method cambiaVida(cantidad) {
    vida += cantidad
    if (vida == 0) {
      self.muerto()
    }
  }
  method muerto() {
    self.cambiaImagen("esqueletoMuerto.png")
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

