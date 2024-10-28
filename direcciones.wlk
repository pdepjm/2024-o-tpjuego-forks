import wollok.game.*
import configuraciones.*
import personajes.*
import enemigos.*
import equipamientos.*
import pisos.*

object abajo {
  method image(obj) = obj.image(obj.nombre() + "Frente.png")
  method direc(obj) {
    const nuevaPosicion = obj.position().down(1)  
    
    if (limitesDelMapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 

object derecha {
  method image(obj) = obj.image(obj.nombre() + "Derecha.png")
    
   method direc(obj) {
    const nuevaPosicion = obj.position().right(1)  
  
    if (limitesDelMapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 

object izquierda {
  method image(obj) = obj.image(obj.nombre() + "Izquierda.png")
   method direc(obj) {
    const nuevaPosicion = obj.position().left(1)  

    if (limitesDelMapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 

object arriba {
  method image(obj) = obj.image(obj.nombre() + "Espalda.png")
  method direc(obj) {
    const nuevaPosicion = obj.position().up(1)  
    
    if (limitesDelMapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
     obj.tocaBorde()
    }
  } 
} 

