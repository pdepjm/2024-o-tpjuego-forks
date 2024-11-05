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
	game.boardGround("fondo3.jpg")
  }

  method visuales() {
	game.addVisualCharacter(caballero)
	esqueletosPiso1.forEach{esqueleto => game.addVisual(esqueleto)}
	puertasPiso1.forEach{puerta => game.addVisual(puerta)}
	game.addVisual(arco)
	game.addVisual(barraDeVida)
	game.addVisual(arquero1)
	//game.addVisual(paredesPiso1)
  }

  method teclas() {
    // Movimiento
	  keyboard.w().onPressDo {if(caballero.estaVivo()){caballero.moverse(arriba)}}
	  keyboard.a().onPressDo {if(caballero.estaVivo()){caballero.moverse(izquierda)}}
	  keyboard.s().onPressDo {if(caballero.estaVivo()){caballero.moverse(abajo)}}
	  keyboard.d().onPressDo {if(caballero.estaVivo()){caballero.moverse(derecha)}}
      
	// Acciones
	  keyboard.space().onPressDo {flecha1.disparar(caballero)}
	  objetos.forEach {objeto => keyboard.e().onPressDo {caballero.agarrar(objeto)}}
	  keyboard.r().onPressDo {caballero.atacar(esqueleto1)}
}

  method enemigos() {
	game.onTick(4000, "disparar", {flecha2.disparar(arquero1)})
	game.onTick(2000, "movimiento" + esqueleto1, {esqueleto1.movimiento(17, 16)})
	game.onTick(2000, "movimiento" + esqueleto2, {esqueleto2.movimiento(30, 25)})
	game.onTick(2000, "movimiento" + esqueleto3, {esqueleto3.movimiento(34, 8)})
  }

  method colisiones() {
	//Colisión de las flechas
	flechas.forEach {flecha => game.onCollideDo(flecha, {personaje => personaje.muerto(flecha)})}
	
	//Colisión con cualquier esqueleto
	esqueletosPiso1.forEach {esqueleto => game.whenCollideDo(esqueleto, {personaje => personaje.cambiaVida(-1)
	personaje.rebote(personaje.direccion())})}

	//Cambio de habitación
	puertasPiso1.forEach {puerta => game.whenCollideDo(puerta,{personaje => puerta.pasaElCaballero()})}

	game.whenCollideDo(agarrarConLaE, {caballero => agarrarConLaE.letraGrande(arco)})
  }
}