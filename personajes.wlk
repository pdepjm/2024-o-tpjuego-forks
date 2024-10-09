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


object vida {
  method image()="Vidas10.png"
  var property position = game.at(40,45)
}
