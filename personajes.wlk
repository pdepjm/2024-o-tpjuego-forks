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

  const equipamiento = #{}

/*
    // Nuevo método atacar, que depende solo del personaje y no del arma (no terminado)
    method atacar(enemigo) {
        if (enemigo.estaEnRango(self)) { 
            enemigo.cambiaVida(-danio)
        }
    }
*/

  // method text() = "TOCA E PARA AGARRAR"


  // method textColor() = self.verde()

  method moverse(nuevaDireccion) {
    self.direccion(nuevaDireccion)
    nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
  }

  method rebote(d){
    if (d == derecha){
      self.moverse(izquierda)
    }
    else if (d == izquierda){
      self.moverse(derecha)
    }
    else if (d == arriba){
      self.moverse(abajo)
    }
    else if (d == abajo){
      self.moverse(arriba)
    }
    if (self.vida() > 0){
    game.schedule(0000, {self.recibeDanio(self.image())})
    }
  }

  method recibeDanio(im){
    if (self.image() == "caballeroFrente.png"){
      self.image("caballeroFrenteRojo.png")
    }
    else if (self.image() == "caballeroEspalda.png"){
      self.image("caballeroEspaldaRojo.png")
    }
    else if (self.image() == "caballeroDerecha.png"){
      self.image("caballeroDerechaRojo.png")
    }
    else if (self.image() == "caballeroIzquierda.png"){
      self.image("caballeroIzquierdaRojo.png")
    }
  }
  
  method agregarEquipo(e) { equipamiento.add(e) }

  method puedeAgarrar(objeto) =
    objeto.estaEnRango(self)
  
  method agarrar(equipo) {
    if (self.puedeAgarrar(equipo)){
    game.removeVisual(equipo)
    equipamiento.agregarEquipo(equipo)
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

  method perder() {
    game.schedule(0000, {self.image("caballeroTiraditoRojo.png")})
    game.schedule(2000, {game.removeVisual(self)})
    // El personaje se cae al piso (se gira)
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

object habitacion {
	var property image = "habitacion1-Photoroom.png"
  var property position = game.origin() 
  }


