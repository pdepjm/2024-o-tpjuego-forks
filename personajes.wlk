import wollok.game.*

object caballero {
  var property position = game.origin()
  var property image = "Frente.png"

  method position() = position

  method moverse(nuevaPosicion) {
    self.position(nuevaPosicion)
  }

  method cambiaImagen(nuevaImagen) {
    self.image(nuevaImagen)
  }

  method volverAlOrigen() {
    position = game.origin()
    return position
  }
}


/* 
Lo dejé nomás por si nos sirve de base para algo (estaba en el código)
object pepita {
  var energy = 100
  const position = new MutablePosition(x=0, y=0)

  method image() = "golondrina.png"
  method position() = position

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
    position.goRight(minutes)
    position.goUp(minutes)
  }
}
*/