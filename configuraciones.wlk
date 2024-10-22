import wollok.game.*
import main.*
import personajes.*
import enemigos.*
import equipamientos.*
import direcciones.*


object configuracionesIniciales {

  method pantalla() {
    game.title("Dungeon & Objects")
	game.height(34)
	game.width(70)
	game.cellSize(100)
	game.boardGround("fondoPiso1.jpg")
  }

  method visuales() {
	game.addVisualCharacter(caballero)
	game.addVisual(esqueleto)
	game.addVisual(arco)
	game.addVisual(barraDeVida)
	//game.addVisual(paredesPrimerPiso)
  }

  method teclas() {
    // Movimiento
	  keyboard.w().onPressDo {caballero.moverse(arriba)}
	  keyboard.a().onPressDo {caballero.moverse(izquierda)} 
	  keyboard.s().onPressDo {caballero.moverse(abajo)} 
	  keyboard.d().onPressDo {caballero.moverse(derecha)}	

	// Acciones
	  keyboard.space().onPressDo {flecha.disparar(caballero)}
	  keyboard.e().onPressDo {caballero.agarrar(arco)}
	  keyboard.r().onPressDo {caballero.atacar(esqueleto)}
	  //game.onCollideDo(caballero, {arco => caballero.agarrar(arco)})
  }

  method movimiento() {
	game.onTick(2000, "movimiento random", { esqueleto.movimiento() })
  }
  method colisiones() {
	//game.whenCollideDo(caballero, {cosa => cosa.volverAlOrigen(caballero)})
	game.onCollideDo(flecha, {esq => esq.muerto()
	game.removeVisual(flecha)})
	game.whenCollideDo(esqueleto, {personaje => personaje.cambiaVida(-1)
	personaje.moverse(abajo)})
  }
}


object paredesPrimerPiso {
	var property position = game.at(0,0) 
	var property image = "" 
}


class ZonaPermitida {
  const xMin
  const xMax
  const yMin
  const yMax

 method esZonaPermitida (x,y) {
    return x <= xMin && x >= xMax && y <= yMin && y >= yMax
  }
}

const zonaPermitida = new ZonaPermitida(xMin=1,xMax=69,yMin=1,yMax=33)

class ZonaProhibida {
  const xMin
  const xMax
  const yMin
  const yMax

 method esZonaProhibida (x,y) {
    return x >= xMin && x <= xMax && y >= yMin && y <= yMax
  }
}

const hueco1 = new ZonaProhibida(xMin=2,xMax=11,yMin=3,yMax=8)
const pared1 = new ZonaProhibida(xMin=10,xMax=11,yMin=6,yMax=33)
const pared2 = new ZonaProhibida(xMin=37,xMax=39,yMin=1,yMax=10)
const pared3 = new ZonaProhibida(xMin=37,xMax=39,yMin=13,yMax=24)
const pared4 = new ZonaProhibida(xMin=37,xMax=39,yMin=27,yMax=33)
const pared5 = new ZonaProhibida(xMin=40,xMax=58,yMin=18,yMax=21)
const pared6 = new ZonaProhibida(xMin=60,xMax=69,yMin=18,yMax=21)
const pared7 = new ZonaProhibida(xMin=49,xMax=51,yMin=21,yMax=33)

const zonasPiso1 = [hueco1,pared1,pared2,pared3,pared4,pared5,pared6,pared7]

object limitesDelMapa {
	var property piso = caballero.piso()
	var property zonasProhibidas = zonasPiso1
	var property zonasHabilitadas = zonaPermitida

	method puedePasar (x,y) {
		return (zonaPermitida.esZonaPermitida(x,y))
		|| !(zonasProhibidas.any { zona => zona.esZonaProhibida(x,y)}) 
	}
}
