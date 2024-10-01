object caballero {
 
  const position = game.at (50,50)

  method position() = position

  method position(nuevaPosicion) {
    self.position(nuevaPosicion)
  }

   method image(nuevaImagen) {
    self.image(nuevaImagen)
   }
  

}


/* object esqueleto {
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