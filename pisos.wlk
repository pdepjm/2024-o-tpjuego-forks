import wollok.game.*
import personajes.*
import enemigos.*
import equipamientos.*
import direcciones.*

class ZonaProhibida {
  const xMin
  const xMax
  const yMin
  const yMax

 method esZonaProhibida (x,y) {
    return x >= xMin && x <= xMax && y >= yMin && y <= yMax
  }
}

class Puerta {
  const puerta
  var property position
  const direccion
  const destino
  method pasaElCaballero() {
	if(direccion == caballero.direccion()) { 
		paredes.cambiaHabitacion(destino)
	4.times({numero => caballero.moverse(direccion)})
	}	
  }
}

object paredes {
	var property position = game.at(0,0) 
	var property image = "habitacion1.jpg"  

	method cambiaHabitacion(habitacion) {
		self.image("habitacion" + habitacion + ".jpg")
	}
}

object mapa {
	const limiteInferior = new ZonaProhibida(xMin=0,xMax=69,yMin=1,yMax=1)
	const limiteSuperior = new ZonaProhibida(xMin=0,xMax=69,yMin=30,yMax=33)
	const limiteDerecho = new ZonaProhibida(xMin=66,xMax=66,yMin=0,yMax=33)
	const limiteIzquierdo = new ZonaProhibida(xMin=0,xMax=0,yMin=0,yMax=33)

	const hueco1 = new ZonaProhibida(xMin=2,xMax=11,yMin=3,yMax=8)
	const pared1 = new ZonaProhibida(xMin=10,xMax=11,yMin=6,yMax=33)
	const pared2 = new ZonaProhibida(xMin=37,xMax=39,yMin=1,yMax=10)
	const pared3 = new ZonaProhibida(xMin=37,xMax=39,yMin=13,yMax=24)
	const pared4 = new ZonaProhibida(xMin=37,xMax=39,yMin=26,yMax=33)
	const pared5 = new ZonaProhibida(xMin=40,xMax=58,yMin=18,yMax=21)
	const pared6 = new ZonaProhibida(xMin=60,xMax=69,yMin=18,yMax=21)
	const pared7 = new ZonaProhibida(xMin=49,xMax=51,yMin=21,yMax=33)
	const puertaCerrada = new ZonaProhibida(xMin=59,xMax=59,yMin=18,yMax=21) 
	var property zonasProhibidas = [limiteInferior,limiteSuperior,limiteDerecho,limiteIzquierdo,hueco1,pared1,pared2,pared3,pared4,pared5,pared6,pared7,puertaCerrada]

	method verificaLlave() {
		if(caballero.tieneElElemento(llave)) {
			zonasProhibidas.remove(puertaCerrada)
		}
	}

	method puedePasar (x,y) {
		return !(self.zonasProhibidas().any { zona => zona.esZonaProhibida(x,y)}) 
	}

	const puerta1a3 = new Puerta (puerta = 1, position = game.at(13,2), destino = 3, direccion = izquierda)
	const puerta3a1 = new Puerta (puerta = 1, position = game.at(9,2), destino = 1, direccion = derecha)
	const puerta3a2 = new Puerta (puerta = 2, position = game.at(1,5), destino = 2, direccion = arriba)
	const puerta2a3 = new Puerta (puerta = 2, position = game.at(1,8), destino = 3, direccion = abajo)
	const puerta1a4 = new Puerta (puerta = 3, position = game.at(37,11), destino = 4, direccion = derecha)
	const puerta4a1 = new Puerta (puerta = 3, position = game.at(39,11), destino = 1,direccion = izquierda )
	const puerta1a5 = new Puerta (puerta = 4, position = game.at(37,25), destino = 5, direccion = derecha)
	const puerta5a1 = new Puerta (puerta = 4, position = game.at(39,25), destino = 1, direccion = izquierda)
	const puerta4a6 = new Puerta (puerta = 4, position = game.at(59,19), destino = 6, direccion = arriba)
	const puerta6a4 = new Puerta (puerta = 4, position = game.at(59,21), destino = 4, direccion = abajo)
	var property puertas = [puerta1a3,puerta3a1,puerta3a2,puerta2a3,puerta1a4,puerta4a1,puerta1a5,puerta5a1,puerta4a6,puerta6a4]

	method visuales() {
		game.addVisualCharacter(caballero)
		esqueletosPiso1.forEach{esqueleto => game.addVisual(esqueleto)}
		self.puertas().forEach{puerta => game.addVisual(puerta)}
		game.addVisual(arco)
		game.addVisual(barraDeVida)
		arquerosPiso1.forEach{arquero => game.addVisual(arquero)}
		game.addVisual(llave)
		game.addVisual(pocion)
  }
}

