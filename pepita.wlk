import extras.*
import wollok.game.*
import comidas.*

object pepita {

	var property energia = 1000
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido())
		{ 
		"pepita-grande.png"
		} 
		else if (self.esAtrapada() or self.estaCansada())
		{
		"pepita-gris.png"
		}
		else "pepita.png"
	}

	method esAtrapada() = self.position() == silvestre.position()

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {

		if(not self.estaCansada() and nuevaPosicion.x().between(0, game.width()-1) and nuevaPosicion.y().between(0, game.height()-1))
		{
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		}


	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() != 0 
	}

	method caete() { 
		if(self.estaEnElSuelo()) {position = self.position().down(1)}
	}



	method ganar(){ return "Gane!"}
	method perder(){ return "Me atraparon!"}

	method accion(){
		if(position == manzana.position() or position == alpiste.position()){
		self.come(game.uniqueCollider(self))}
	}


}





