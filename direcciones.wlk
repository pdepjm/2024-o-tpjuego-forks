import wollok.game.*
import personajes.*
import enemigos.*
import equipamientos.*

object abajo {
  var position = 0
  method image() = "flechaFrente.png"
  method direc(obj) = obj.position().down(1)

} 

object derecha {
  var position = 0
  method image() = "flechaderecha.png"
  method direc(obj) = obj.position().right(1)
} 

object izquierda {
  var position = 0
  method image() = "flechaizquierda.png"
  method direc(obj) = obj.position().left(1)
} 

object arriba {
  var position = 0
  method image() = "flechaEspalda.png"
  method direc(obj) = obj.position().up(1)
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




