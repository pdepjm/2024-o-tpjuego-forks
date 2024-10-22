import wollok.game.*
import enemigos.*
import equipamientos.*
import direcciones.*


object caballero {
  var property position = game.at(24,2)
  var property image = "caballeroEspalda.png"
  var property direccion = izquierda
  var property nombre = "caballero"
  var property vida = 10
  var property danio = 2
  var property piso = 1

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

  method puedeAgarrar(objeto) =
    objeto.estaEnRango(self)
  
  method agarrar(equipo) {
    if (self.puedeAgarrar(equipo)){
    game.removeVisual(equipo)
    equipamiento.add(equipo)
    }
  }

  method tieneElElemento(elem) = equipamiento.contains(elem)

  method tocaBorde() {}

  method cambiaVida(cantidad) {
    vida += cantidad
    barraDeVida.cambiaVida(cantidad)
    if (vida == 0) {
      self.perder()
    }
  }

  method atacar(enemigo){
    if (enemigo.estaEnRango(self)){
    enemigo.cambiaVida(-danio)
    }
  }

  method perder() {
    self.image("caballeroTiradito.png")
    game.schedule(1000, {game.removeVisual(self)})
    // El personaje se cae al piso (se gira)
    // Sale una nota que moriste
    // Se detiene el juego
  }

  method muerto(){}
}




object barraDeVida {
  var image = "Vidas10.png"
  var property position = game.at(42,47)
  method vidaActual() = caballero.vida()
  method image() = image

  method cambiaVida(cantidad) {
    if (self.vidaActual() != 0) {
      image = "Vidas" + self.vidaActual().toString() + ".png"
      }
  } 
}

