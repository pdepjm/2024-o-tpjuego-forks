import wollok.game.*
import enemigos.*
import equipamientos.*
import direcciones.*

object caballero {
  var property position = game.origin()
  var property image = "caballeroFrente.png"
  var property direccion = izquierda
  var property nombre = "caballero"

  const equipamiento = #{}

  method moverse(nuevaDireccion) {
    self.direccion(nuevaDireccion)
    const nuevaPosicion = nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
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
