import wollok.game.*
import enemigos.*
import equipamientos.*
import direcciones.*

object caballero {
  var property position = game.origin()
  var property image = "CaballeroFrente.png"
  var property direccion = izquierda

  const equipamiento = #{}

  method moverse(nuevaPosicion) {
    // no se si esta bien pq usa bastantes ifs, pero si se les ocurre algo mejor saquenlo jajaja
    const xNueva = nuevaPosicion.x()
    const yNueva = nuevaPosicion.y()
    
    if (xNueva >= 0 and xNueva < game.width() and yNueva >= 0 and yNueva < game.height()) {
      self.position(nuevaPosicion)
    } else {
      // no hace nada si esta fuera de los limites, pero no se si hay una forma de decir no hagas nada :)
    }
  }

  method cambiaImagen(nuevaImagen) {
    self.image(nuevaImagen)
  }

  method volverAlOrigen() {
    position = game.origin()
    return position
  }
  
  method agarrar(equipo) {
    game.removeVisual(equipo)
    equipamiento.add(equipo)
  }

  method tieneElElemento(elem) = equipamiento.contains(elem)

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
