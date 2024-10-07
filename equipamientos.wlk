import wollok.game.*
import personajes.*
import enemigos.*


object arco {
  method position() = game.at(15,15)
  var property image = "arco.png"
  
}

object abajo {
  var position = 0
  method imagen() = "flechaAbajo.png"
  method position() { position.down(1)
  return position }
} 

object derecha {
  var position = 0
  method imagen() = "flechaderecha.png"
  method position() { position.right(1) 
  return position}
} 

object flecha {
var property position = caballero.position()
var direccion = derecha
method direccion(direc) { direccion = direc
return direccion } 
method image() = "flecha" + self.direccion(derecha) + ".png" //flacheabajo


method disparar(personaje) {
  if (personaje.tieneElElemento(arco)){
  position = personaje.position()
  game.onTick(50, "vuela", { self.moverse(self.position().right(1))}) 
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



