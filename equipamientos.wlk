import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*

object arco {
  method position() = game.at(15,15)
  var property image = "arco.png"
  
}

object flecha {
var property position = caballero.position()
var property direccion = caballero.direccion()
// method direccion(direc) { direccion = direc
// return direccion } 
method image() = direccion.image()  //"flecha" + self.direccion(derecha) + ".png" //flacheabajo


method disparar(personaje) {
  if (personaje.tieneElElemento(arco)){
  direccion = personaje.direccion()
  position = personaje.position()
  game.onTick(50, "vuela", { self.moverse(direccion.direc(self))}) 
  self.image()
  }
} 

method image(nuevaImagen) {
  self.image(nuevaImagen)
}

method moverse(nuevaPosicion) {
    self.position(nuevaPosicion)
  }

// method disparar(personaje) {
// position = personaje.position()
// game.onTick(50, "vuela", { self.moverse(self.position().down(1)) }) 

//  if (personaje.image()=="frente.png") {
//         self.image("flechaAbajo.png")
//         game.onTick(50, "vuela", { self.moverse(self.position().down(1)) } ) 
//     }
//   else if (personaje.image()=="trasero.png") {
//         self.image("flechaArriba.png") 
//         game.onTick(50, "vuela", { self.moverse(self.position().up(1)) } ) 
//     }
//   else if (personaje.image()=="izquierda.png") {
//         self.image("flechaIzquierda.png")
//         game.onTick(50, "vuela", { self.moverse(self.position().left(1)) } )  
//     }
//   else {
//         self.image("flechaDerecha.png")
//         game.onTick(50, "vuela", { self.moverse(self.position().right(1)) } ) 
//     }
//   } 
}



