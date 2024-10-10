import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*

object esqueleto {
  var property position = game.at(25,25) 
  var property image = "esqueletoFrente.png"
  var property nombre = "esqueleto"
  
  method movimiento() {
    // position = game.at(0.randomUpTo(8),0.randomUpTo(8) ) 
    const x = 0.randomUpTo(game.width()).truncate(1)
    const y = 0.randomUpTo(game.height()).truncate(1)
    position = game.at(x,y)
  }

    method volverAlOrigen(algo) {
    algo.volverAlOrigen()
    return position
  }

  method cambiaImagen(nuevaImagen) {
    self.image(nuevaImagen)
  }

  method muerto() {
    self.cambiaImagen("esqueletoMuerto.png")
    game.schedule(1000, {game.removeVisual(self)} )
  }

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 1 and diferenciaY <= 1
  }
}
