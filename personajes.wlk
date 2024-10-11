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
    nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
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

  method tocaBorde() {}
}


object vida {
  method image()="Vidas10.png"
  var property position = game.at(40,45)
}
