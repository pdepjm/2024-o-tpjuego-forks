import wollok.game.*
import personajes.*
import enemigos.*
import equipamientos.*


object abajo {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Frente.png")
  method direc(obj) {
    const nuevaPosicion = obj.position().down(1)  
    const yNueva = nuevaPosicion.y()
    if (yNueva >= 0 and yNueva < game.height()) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 

object derecha {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Derecha.png")
   method direc(obj) {
    const nuevaPosicion = obj.position().right(1)  
    const xNueva = nuevaPosicion.x()
    if (xNueva >= 0 and xNueva < game.width()) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 

object izquierda {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Izquierda.png")
   method direc(obj) {
    const nuevaPosicion = obj.position().left(1)  
    const xNueva = nuevaPosicion.x()
    if (xNueva >= 0 and xNueva < game.width()) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 

object arriba {
  method image(obj) = obj.cambiaImagen(obj.nombre() + "Espalda.png")
   method direc(obj) {
    const nuevaPosicion = obj.position().up(1)  
    const yNueva = nuevaPosicion.y()
    if (yNueva >= 0 and yNueva < game.height()) {
      obj.position(nuevaPosicion)
    }
    else {
     obj.tocaBorde()
    }
  } 
} 


