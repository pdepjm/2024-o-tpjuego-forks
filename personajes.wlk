import wollok.game.*
import enemigos.*
import equipamientos.*
import direcciones.*


object caballero {
  var property position = game.at(41,2)
  var property image = "caballeroEspalda.png"
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
    enemigo.cambiaVida(-1)
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

