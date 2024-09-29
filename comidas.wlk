import wollok.game.*
import pepita.*
import niveles.*

object manzana {
	method image() = "manzana.png"

	method position() = game.at(1, 5)

	method energiaQueOtorga() = 400


}

object alpiste {

	method image() = "alpiste.png"

	method position() = game.at(2, 2)

	method energiaQueOtorga() = 70

	
}

