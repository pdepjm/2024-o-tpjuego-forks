import wollok.game.*
import personajes.*
import enemigos.*
import direcciones.*
import pisos.*


class Elemento {
    var property position
    var property image
    var property nombre

    method estaEnRango(objeto) {
        const diferenciaX = (self.position().x() - objeto.position().x()).abs()
        const diferenciaY = (self.position().y() - objeto.position().y()).abs()

        return diferenciaX <= 2 and diferenciaY <= 2
    }
    method serAgarrado() {
        game.removeVisual(self)
    }
}

object pocion inherits Elemento (position = game.at(54,10), image = "pocion.png", nombre = "pocion") {
    override method serAgarrado() {
        caballero.cambiaVida(+3)
        game.removeVisual(self)
    }
}

object llave inherits Elemento (position = game.at(49,23), image = "llave.png", nombre = "llave") {
    override method serAgarrado() {
        mapa.verificaLlave()
        game.removeVisual(self)
    }
}

object tesoro inherits Elemento (position = game.at(59, 25), image = "", nombre = "tesoro") {
    override method serAgarrado() {
        game.removeVisual(self)
        game.addVisual(fondoSiGanas)
        game.stop()
    }
}

const arco = new Elemento (position = game.at(5, 30), image = "arco.png", nombre = "arco")

const elementos = [arco,llave,pocion,tesoro]

class Flecha {
    var property position
    var property direccion
    var property image = ""
    var property nombre = "flecha" 
    var property tirador = null 
    var property habitacionDeLaFlecha 

method disparar(personaje) {
    self.tirador(personaje.nombre())
    if (self.habitacionDeLaFlecha() == caballero.habitacionDelCaballero() || self.tirador() == "caballero"){
    direccion = personaje.direccion()
    position = personaje.position().right(1)
    direccion.image(self)
    game.addVisual(self)

    game.removeTickEvent("vuela" + personaje.nombre())
    game.onTick(50, "vuela" + personaje.nombre(), {
        direccion.direc(self)
        if (self.position().x() < 0 || self.position().x() >= game.width() ||
            self.position().y() < 0 || self.position().y() >= game.height()) {
            self.tocaBorde()
        }
    })
    }
}

    method tocaBorde() {
        game.removeTickEvent("vuela" + self.tirador())
        game.removeVisual(self)
    }

    method estaVivo() {}
}

const flecha1 = new Flecha(position = caballero.position(), direccion = caballero.direccion(), tirador = caballero.nombre(), habitacionDeLaFlecha = caballero.habitacionDelCaballero())
const flecha2 = new Flecha(position = arquero1.position(), direccion = arquero1.direccion(), tirador = arquero1.nombre(), habitacionDeLaFlecha = 1)
const flecha3 = new Flecha(position = arquero2.position(), direccion = arquero2.direccion(), tirador = arquero2.nombre(), habitacionDeLaFlecha = 2)

const flechas = [flecha1, flecha2, flecha3]

 class AgarrarConLaE {
  var property position
  var property elemento  
  method image() = "tecla.jpg"
  
  method letraGrande(_elemento){
  if (caballero.puedeAgarrar(_elemento)){
    if (!game.hasVisual(self)) game.addVisual(self)
  } else {
      game.removeVisual(self)
    }
  }
}

object faltaLlaveMensaje {
    var property image = "tecla.png"
    var property position = game.at(0, 0)  // Posición por defecto, se actualizará al mostrar el mensaje

    method mostrarMensaje() {
        // Actualiza la posición al momento de colisión
        self.position(mapa.puerta4a6.position()) 
        game.addVisual(self)

        // Remueve el mensaje después de 2 segundos
        game.onTick(2000, "ocultarMensaje", {
            game.removeVisual(self)
            game.removeTickEvent("ocultarMensaje")
        })
    }
}

const arcoE = new AgarrarConLaE (position = arco.position(),elemento = arco)
const llaveE = new AgarrarConLaE (position = llave.position(),elemento = llave)
const pocionE = new AgarrarConLaE (position = pocion.position(),elemento = pocion)
const tesoroE = new AgarrarConLaE (position = tesoro.position(),elemento = tesoro)

const botonesE = [arcoE,llaveE,pocionE,tesoroE]
