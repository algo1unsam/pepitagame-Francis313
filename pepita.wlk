import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
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
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(self.puedeVolar()){
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method puedeVolar(){return energia>0}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() != 0 
	}

	method caete() { 
		if(self.estaEnElSuelo()) {position = self.position().down(1)}
	}



}





