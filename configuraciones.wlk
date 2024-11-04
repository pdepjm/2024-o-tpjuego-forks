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
	game.addVisual(esqueleto1)
	game.addVisual(esqueleto2)
	game.addVisual(esqueleto3)
	game.addVisual(esqueleto4)
	game.addVisual(esqueleto5)
	game.addVisual(esqueleto6)
	game.addVisual(esqueleto7)
	game.addVisual(arco)
	game.addVisual(barraDeVida)
	game.addVisual(habitacion)
	//game.addVisual(puerta1a4)
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
	  keyboard.r().onPressDo {caballero.atacar(esqueleto1)}
	  //game.onCollideDo(caballero, {arco => caballero.agarrar(arco)})
  }

  method movimiento() {
	game.onTick(2000, "movimiento random", {esqueleto1.movimientoV3(17, 16)})
	game.onTick(2000, "movimiento random", {esqueleto2.movimientoV3(30, 25)})
	game.onTick(2000, "movimiento random", {esqueleto3.movimientoV3(34, 8)})
	//game.onTick(2000, "movimiento random", {esqueleto3.movimientoV2(Number.randomUpTo(4))})
  }

  method colisiones() {
	//game.whenCollideDo(caballero, {cosa => cosa.volverAlOrigen(caballero)})
	game.onCollideDo(flecha, {esq => esq.muerto()
	game.removeVisual(flecha)})
	game.whenCollideDo(esqueleto1, {personaje => personaje.cambiaVida(-1)
	personaje.rebote(personaje.direccion())})
	game.whenCollideDo(esqueleto2, {personaje => personaje.cambiaVida(-1)
	personaje.rebote(personaje.direccion())})
	game.whenCollideDo(esqueleto3, {personaje => personaje.cambiaVida(-1)
	personaje.rebote(personaje.direccion())})

	puertasPiso1.forEach {puerta => game.whenCollideDo(puerta,{personaje => puerta.pasaElCaballero()})}
  }
}