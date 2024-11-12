import wollok.game.*
import configuraciones.*
import personajes.*
import enemigos.*
import equipamientos.*
import pisos.*

object arriba {
  method image(obj) = obj.image(obj.nombre() + "Espalda.png")
  method direccionOpuesta(obj) { obj.moverse(abajo)  }
  method direc(obj) {
    const nuevaPosicion = obj.position().up(1)  
    
    if (mapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
     obj.tocaBorde()
    }
  } 
} 

object abajo {
  method image(obj) = obj.image(obj.nombre() + "Frente.png")
  method direccionOpuesta(obj) { obj.moverse(arriba)  }
  method direc(obj) {
    const nuevaPosicion = obj.position().down(1)  
    
    if (mapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 


object izquierda {
  method image(obj) = obj.image(obj.nombre() + "Izquierda.png")
  method direccionOpuesta(obj) { obj.moverse(derecha)  }
   method direc(obj) {
    const nuevaPosicion = obj.position().left(1)  

    if (mapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 


object derecha {
  method image(obj) = obj.image(obj.nombre() + "Derecha.png")

  method direccionOpuesta(obj) { obj.moverse(izquierda)  }
    
   method direc(obj) {
    const nuevaPosicion = obj.position().right(1)  
  
    if (mapa.puedePasar(nuevaPosicion.x(),nuevaPosicion.y())) {
      obj.position(nuevaPosicion)
    }
    else {
      obj.tocaBorde()
    }
  } 
} 





