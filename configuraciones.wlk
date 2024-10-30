import wollok.game.*
import main.*
import personajes.*
import enemigos.*
import equipamientos.*
import direcciones.*
import pisos.*

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
	game.addVisual(habitacion)
	game.addVisual(puerta1a4)
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

	game.whenCollideDo(puerta1a4, {personaje => personaje.pasaPorPuerta(puerta1a4)})

  }
}