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
  var property estaVivo = true
  var property disparoLaFlecha = false
  var property habitacionDelCaballero = 1

  const equipamiento = #{}

  method moverse(nuevaDireccion) {
    self.direccion(nuevaDireccion)
    nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
  }

  method rebote(direc){
    direc.direccionOpuesta(self)
    if (self.vida() > 0){
    game.schedule(0, {self.image("rojo" + self.image())})
    }
  }

  method agregarEquipo(e) { equipamiento.add(e) }

  method puedeAgarrar(objeto) = objeto.estaEnRango(self) and !self.tieneElElemento(objeto)
  
  method agarrar(equipo) {
    if (self.puedeAgarrar(equipo)){
    botonesE.forEach {boton => game.removeVisual(boton)}
    self.agregarEquipo(equipo)
    equipo.serAgarrado()
    }  
  }

  method tieneElElemento(elem) = equipamiento.contains(elem)

  method tocaBorde() {}

  method cambiaVida(cantidad) {
    vida += cantidad
    vida = (self.vida()).min(10)
    barraDeVida.cambiaVida(self.vida())
    if (self.vida() == 0) {
      self.perder()
    }
  }

  method muerto(flecha){
    if(!(flecha.tirador() == self.toString())){
      self.estaVivo(false) 
      self.image(self.nombre() + "Muerto.png")
      game.removeVisual(flecha)
      game.schedule(2000, {game.addVisual(fondoSiPerdes)})
      game.schedule(2001, {game.stop()})
    }
  }

  method perder() {
    self.estaVivo(false) 
    game.schedule(0, {self.image(self.nombre()+"Muerto.png")})
    game.schedule(1000, {game.removeVisual(self)})
    game.schedule(2000, {game.addVisual(fondoSiPerdes)})
    game.schedule(2001, {game.stop()})
  }

}


object barraDeVida {
  var image = "Vidas10.png"
  var property position = game.at(65,32)
  var property vidaActual = caballero.vida()
  method image() = image

  method cambiaVida(vida) {
    if (vida != -1) {
      image = "Vidas" + vida.toString() + ".png"
      }
      self.vidaActual(vida)
  } 
}




