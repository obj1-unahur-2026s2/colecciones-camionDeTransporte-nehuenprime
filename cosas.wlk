
object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumbeblee {
    var estaComoRobot = false

    method peso() = 800
    method peligrosidad() {
        if (estaComoRobot) {
            return 30
        } else {
            return 15
        }
    }
    method transformarEnRobot() {
        estaComoRobot = true
    }
}

object paqueteDeLadrillos {
    var cantLadrillos = 0

    method peso() = cantLadrillos * 2 
    method peligrosidad() = 2
    method cantidad(valor) {
        cantLadrillos = valor
    } 
    
}

object arenaAGranel{
    var peso= 0
    method peso() = peso
    method peligrosidad() = 1
    method nuevoPeso(nuevo){
        peso = nuevo
    }
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso = (peso-10).max(0)}
}



object bateriaAntiaerea{
    var estaConMisiles = false

    method peso(){
        if(estaConMisiles){
            return 300
        }else{
            return 200
        }
    }
    method peligrosidad(){
        if(estaConMisiles){
            return 100
        }else{
            return 0
        }
    }
    method bultos() = if(estaConMisiles) 2 else 1
    method cargarYDescargarMisiles() { estaConMisiles = !estaConMisiles }
    method consecuenciaDeLaCarga() {estaConMisiles = true}
}

object contenedor {
    const cosasContenidas = []
    method bultos() = 1 + self.bultosDeCosasContenidas()
    method bultosDeCosasContenidas() = cosasContenidas.sum({c=>c.bultos()})
    method peso() = 100 + self.pesoDeCosasContenidas()
    method pesoDeCosasContenidas() = cosasContenidas.sum({ c => c.peso() })
    method nivelDePeligrosidad() = if (not cosasContenidas.isEmpty()) self.cosaContenidaMasPeligrosa().nivelDePeligrosidad() else 0
    method cosaContenidaMasPeligrosa() = cosasContenidas.max({ c => c.nivelDePeligrosidad() })

    method meterElementos(listaDeElementos) { cosasContenidas.addAll(listaDeElementos) }
    method consecuenciaDeLaCarga() {
        cosasContenidas.forEach({c => c.consecuenciaDeLaCarga()})
    }
}

object residuoRadiactivo{
    var pesoActual = 0

    method peso() = pesoActual
    method peligrosidad() = 200
    method cambiarPeso(nuevoPeso){
        pesoActual = nuevoPeso
    }
    method consecuenciaDeLaCarga() {pesoActual += 15}
}

object embalajeDeSeguridad{
    var cobertura = knightRider

    method peso(){
        return cobertura.peso()
    }
    method peligrosidad(){
        return cobertura.peligrosidad() % 2 
    }
    method bultos() = 2
    method cambiarLoQueEnvuelve(nuevaCosa) { cobertura = nuevaCosa }
    method consecuenciaDeLaCarga() {}
}