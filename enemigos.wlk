import wollok.game.*
import personajes.*
import equipamientos.*

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
