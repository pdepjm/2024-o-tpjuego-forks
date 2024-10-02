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


object esqueleto {
  var property position = game.at(25,25) 
  var property image = "skeleton.png"

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
}

/*
Lo saqué literal de un código q hicieron en clase, se los dejo acá por si les sirve
Creo que estaría copado que se mueva random en lugar de fijo
*/ 



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