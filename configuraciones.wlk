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
	  game.boardGround("Piso1.jpg")
  }

  method visuales() {
    game.addVisualCharacter(caballero)
	  game.addVisual(esqueleto)
	  game.addVisual(arco)
	  game.addVisual(barraDeVida)
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

class ZonaProhibida {
  var xMin
  var xMax
  var yMin
  var yMax

 method esZonaProhibida (x,y) {
    x <= xMin && x >= xMax && y >= yMin && y <= yMax
  }
}

const hueco1 = new ZonaProhibida(xMin=5,xMax=12,yMin=5,yMax=8)
const pared1 = new ZonaProhibida(xMin=12,xMax=12,yMin=9,yMax=33)
const pared2 = new ZonaProhibida(xMin=41,xMax=41,yMin=1,yMax=10)
const pared3 = new ZonaProhibida(xMin=41,xMax=41,yMin=13,yMax=27)
const pared4 = new ZonaProhibida(xMin=41,xMax=41,yMin=30,yMax=33)
const pared5 = new ZonaProhibida(xMin=42,xMax=60,yMin=23,yMax=23)
const pared6 = new ZonaProhibida(xMin=64,xMax=68,yMin=23,yMax=23)