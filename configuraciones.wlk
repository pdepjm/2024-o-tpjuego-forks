import wollok.game.*
import main.*
import personajes.*
import enemigos.*
import equipamientos.*
import direcciones.*
import pisos.*

object configuracionesIniciales {

	var property juegoIniciado = false

  method pantalla() {
    game.title("Dungeon & Objects")
	game.height(34)
	game.width(70)
	game.cellSize(100)
	game.boardGround("mazmorra.jpg")
  }

  method teclas() {
    // Movimiento
	  keyboard.w().onPressDo {if(caballero.estaVivo()){caballero.moverse(arriba)}}
	  keyboard.a().onPressDo {if(caballero.estaVivo()){caballero.moverse(izquierda)}}
	  keyboard.s().onPressDo {if(caballero.estaVivo()){caballero.moverse(abajo)}}
	  keyboard.d().onPressDo {if(caballero.estaVivo()){caballero.moverse(derecha)}}
      
	// Acciones
	  keyboard.space().onPressDo {if(caballero.estaVivo() && caballero.tieneElElemento(arco)){
	  flecha1.disparar(caballero)
	  game.sound("bowSound.mp3").play()}}
	  elementos.forEach {objeto => keyboard.e().onPressDo {caballero.agarrar(objeto)}}
	  
	//Inicio	
	  keyboard.enter().onPressDo {self.enemigos(); mapa.visuales()}
}	
  
  method enemigos() {
	game.onTick(4000, "disparar"+arquero1, {if(arquero1.estaVivo()){ flecha2.disparar(arquero1)}})
	game.onTick(4000, "disparar"+arquero2, {if(arquero2.estaVivo()){ flecha3.disparar(arquero2)}})
	game.onTick(2000, "movimiento"+esqueleto1, {esqueleto1.movimiento(17, 16)})
	game.onTick(2000, "movimiento"+esqueleto2, {esqueleto2.movimiento(30, 25)})
	game.onTick(2000, "movimiento"+esqueleto3, {esqueleto3.movimiento(29, 8)})
	game.onTick(2000, "movimiento"+esqueleto4, {esqueleto4.movimiento(6,22)})
	game.onTick(2000, "movimiento"+esqueleto5, {esqueleto5.movimiento(50,8)})
	game.onTick(2000, "movimiento"+esqueleto6, {esqueleto6.movimiento(60,12)})
	game.onTick(2000, "movimiento"+esqueleto7, {esqueleto7.movimiento(4,16)})
	game.onTick(2000, "movimiento"+esqueleto8, {esqueleto8.movimiento(45,13)})
  }

  method colisiones() {
	//Colisión de las flechas
	flechas.forEach {flecha => game.onCollideDo(flecha, {personaje => personaje.muerto(flecha)})}
	
	//Colisión con cualquier esqueleto
	esqueletos.forEach {esqueleto => game.whenCollideDo(esqueleto, {personaje => 
	if(esqueleto.estaVivo() && personaje.estaVivo()){game.sound("hitSound.mp3").play()
		personaje.rebote(personaje.direccion())
		esqueleto.ataca(personaje)}})}

	//Cambio de habitación
	mapa.puertas().forEach {puerta => game.whenCollideDo(puerta,{personaje => puerta.pasaElCaballero()})}

	//Colisión con los elementos
	botonesE.forEach {boton => game.whenCollideDo(boton, {caballero => boton.letraGrande(boton.elemento())})}

	//Carteles de aviso
	carteles.forEach {cartel => game.whenCollideDo(cartel, {caballero => cartel.agregarCartel(cartel.elemento())})}
  }
}