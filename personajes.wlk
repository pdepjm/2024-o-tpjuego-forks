import wollok.game.*

object caballero {
  var property position = game.origin()
  var property image = "Frente.png"

  method moverse(nuevaPosicion) {
    self.position(nuevaPosicion)
  }

  method cambiaImagen(nuevaImagen) {
    self.image(nuevaImagen)
  }
}

/*
object esqueleto {

  method moverseSolo() {
    position = game.at(0.randomUpTo(8),0.randomUpTo(8) )
  }
}

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