import wollok.game.*
import personajes.*
import equipamientos.*
import direcciones.*
import pisos.*

class Esqueleto {
  var property position  
  var property image = "esqueletoFrente.png"
  var property nombre = "esqueleto"
  var property vida = 5
  //const danio = 1 
  var property direccion = abajo

  method movimiento(x,y) {
    position = game.at(x.randomUpTo(x-2), y.randomUpTo(y+2)) 
  }

  method movimientoV2(direccionn) {
    if (direccionn==1) {
      arriba.image(self)
      arriba.direc(self)
    }
    else if (direccionn==2) {
      abajo.image(self)
      abajo.direc(self)
    }
    else if (direccionn==3) {
      izquierda.image(self)
      izquierda.direc(self)
    }
    else if (direccionn==4) {
      derecha.image(self)
      derecha.direc(self)
    }
  }

  method moverse(nuevaDireccion) {
    self.direccion(nuevaDireccion)
    nuevaDireccion.direc(self)
    nuevaDireccion.image(self)
  }

  method movimientoV3(x, y){
    if(self.position() == game.at(x, y)){
    self.moverse(derecha)
    }
    else if (self.position() == game.at(x+2, y)) {
      self.moverse(abajo)
    }
    else if (self.position() == game.at(x+2, y-2)){
      self.moverse(izquierda)
    }
    else if (self.position() == game.at(x, y-2)){
      self.moverse(arriba)
    }
    else {
      self.moverse(direccion)
    }
  }

  method cambiaVida(cantidad) {
    vida += cantidad
    if (vida == 0) {
      self.muerto()
    }
  }
  method muerto() {
    self.image(self.nombre() + "Muerto.png")
    game.schedule(500, {game.removeVisual(self)} )
  }

  method muerto(flecha){
    if(!(flecha.tirador() == self)){
      self.image(self.nombre()+"Muerto.png")
      game.schedule(500, {game.removeVisual(self)})
    }
  }

  method atacado(arma){
    if (self.estaEnRango(arma)){
      self.muerto()
    }
  }

  method estaEnRango(objeto) {
    const diferenciaX = (self.position().x() - objeto.position().x()).abs()
    const diferenciaY = (self.position().y() - objeto.position().y()).abs()

    return diferenciaX <= 1 and diferenciaY <= 1
  }
}

class Arquero {
  var property position  
  var property image = "arqueroFrente.png"
  var property nombre = "arquero"
  var property vida = 5
  //const danio = 1 
  var property direccion = abajo

  const equipamientoArquero = #{arco}

  method muerto(flecha) {
    if(!(flecha.tirador() == self)){
    self.image(self.nombre() + "Muerto.png")
    game.schedule(500, {game.removeVisual(self)})
    }
  }

  method tieneElElemento(elem) = equipamientoArquero.contains(elem)

}

const arquero1 = new Arquero (position = game.at(15, 23))

const esqueleto1 = new Esqueleto (position= game.at(17,16))
const esqueleto2 = new Esqueleto (position= game.at(30,25))
const esqueleto3 = new Esqueleto (position= game.at(34,8))
const esqueleto4 = new Esqueleto (position= game.at(7,20))
const esqueleto5 = new Esqueleto (position= game.at(45,23))
const esqueleto6 = new Esqueleto (position= game.at(50,8))
const esqueleto7 = new Esqueleto (position= game.at(60,12))

const esqueletosPiso1 = [esqueleto1,esqueleto2,esqueleto3,esqueleto4,esqueleto5,esqueleto6,esqueleto7]
const arquerosPiso1 = [arquero1]