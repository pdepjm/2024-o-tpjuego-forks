import configuraciones.*
import wollok.game.*
import enemigos.*
import equipamientos.*
import direcciones.*
import pisos.*

object caballero {
  var property position = game.at(24,2)
  var property image = "caballeroEspalda.png"
  var property direccion = izquierda
  var property nombre = "caballero"
  var property vida = 10
  var property danio = 2
  var property piso = 1
  const property verde = "00FF00FF"
  var property estaVivo = true

  const equipamiento = #{}

/*
    // Nuevo método atacar, que depende solo del personaje y no del arma (no terminado)
    method atacar(enemigo) {
        if (enemigo.estaEnRango(self)) { 
            enemigo.cambiaVida(-danio)
        }
    }
*/


  method moverse(nuevaDireccion) {
    self.direccion(nuevaDireccion)
    nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
  }

  method rebote(direc){
    if (direc == derecha){
      self.moverse(izquierda)
    }
    else if (direc == izquierda){
      self.moverse(derecha)
    }
    else if (direc == arriba){
      self.moverse(abajo)
    }
    else if (direc == abajo){
      self.moverse(arriba)
    }
    if (self.vida() > 0){
    game.schedule(0, {self.image("rojo" + self.image())})
    }
  }

  method agregarEquipo(e) { equipamiento.add(e) }

  method puedeAgarrar(objeto) = objeto.estaEnRango(self)
  
  method agarrar(equipo) {
    if (self.puedeAgarrar(equipo)){
    game.removeVisual(equipo)
    game.removeVisual(agarrarConLaE)
    self.agregarEquipo(equipo)
    }
  }

  method tieneElElemento(elem) = equipamiento.contains(elem)

  method tocaBorde() {}

  method cambiaVida(cantidad) {
    vida += cantidad
    barraDeVida.cambiaVida(cantidad)
    if (self.vida() == 0) {
      self.perder()
    }
  }

  method atacar(enemigo){
    if (enemigo.estaEnRango(self)){
    enemigo.cambiaVida(-danio)
    }
  }

  method muerto(flecha){
    if(!(flecha.tirador() == self)){
      self.estaVivo(false) 
      self.image(self.nombre() + "Muerto.png")
      game.removeVisual(flecha1)
      game.schedule(500, {game.removeVisual(self)})
    }
  }

  method perder() {
    self.estaVivo(false) 
    game.schedule(0, {self.image("caballeroMuerto.png")})
    game.schedule(2000, {game.removeVisual(self)})
    // Sale una nota que moriste
    // Se detiene el juego
  }

}




object barraDeVida {
  var image = "Vidas10.png"
  var property position = game.at(65,32)
  method vidaActual() = caballero.vida()
  method image() = image

  method cambiaVida(cantidad) {
    if (self.vidaActual() != -1) {
      image = "Vidas" + self.vidaActual().toString() + ".png"
      }
  } 
}




