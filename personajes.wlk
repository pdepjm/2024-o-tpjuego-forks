import wollok.game.*
import enemigos.*
import equipamientos.*
import direcciones.*

object caballero {
  var property position = game.origin()
  var property image = "caballeroFrente.png"
  var property direccion = izquierda
  var property nombre = "caballero"
  var property vida = 10
  var property danio = 2

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

  method cambiaVida(cantidad) {
    vida += cantidad
    barraDeVida.cambiaVida(cantidad)
    if (vida == 0) {
      self.muerto()
    }
  }
  method muerto () {
    // El personaje se cae al piso (se gira)
    // Sale una nota que moriste
    // Se detiene el juego
  }
}


object barraDeVida {
  var property image = "Vidas10.png"
  var property position = game.at(42,47)
  var property vidaActual = 10 

  method cambiaVida(cantidad) {
    vidaActual += cantidad
    if (vidaActual != 0) {
      self.image("Vidas" + (vidaActual+cantidad).toString() + ".png")
      }
  } 
}
