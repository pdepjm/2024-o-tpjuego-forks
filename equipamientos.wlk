import wollok.game.*
import personajes.*
import enemigos.*


object arco {
  method position() = game.center()
  var property image = "arco.png"
  method agarrar() {
    game.removeVisual(self)}
}

object abajo {
  method imagen() = "abajo"
  method pocision () = position.down()
} 

object flecha {
var property position = caballero.position()
var direccion = abajo
method image() = "flecha" + direccion.imagen() //flacheabajo

method disparar() = game.onTick(50, "vuela", { direccion.posicionAMoverse()} ) 
method image(nuevaImagen) {
  self.image(nuevaImagen)
}



method moverse(nuevaPosicion) {
    self.position(nuevaPosicion)
  }

method disparar(personaje) {
position = personaje.position()
game.onTick(50, "vuela", { self.moverse(self.position().down(1)) }) 

 if (personaje.image()=="frente.png") {
        self.image("flechaAbajo.png")
        game.onTick(50, "vuela", { self.moverse(self.position().down(1)) } ) 
    }
  else if (personaje.image()=="trasero.png") {
        self.image("flechaArriba.png") 
        game.onTick(50, "vuela", { self.moverse(self.position().up(1)) } ) 
    }
  else if (personaje.image()=="izquierda.png") {
        self.image("flechaIzquierda.png")
        game.onTick(50, "vuela", { self.moverse(self.position().left(1)) } )  
    }
  else {
        self.image("flechaDerecha.png")
        game.onTick(50, "vuela", { self.moverse(self.position().right(1)) } ) 
    }
  } 
}



