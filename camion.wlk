import cosas.*
object camion {
    var cargas = []

    method cargar(cosa) {
        cargas.add(cosa)
        cosa.consecuenciaDeLaCarga() 
    }
    method descargar(cosa) {
        cargas.remove(cosa)
    }
    method pesoTotal() {
        return 1000 + cargas.sum({cosa => cosa.peso()})
    }
    method sonPares() {
        return cargas.all({ cosa => cosa.peso() % 2 == 0})
    }
    method pesaDeterminadoPeso(peso) {
        return cargas.any({ cosa => cosa.peso() == peso})
    }
    method primeraConPeligrosidad(nivelPeligrosidad) {
        return cargas.find({ cosa => cosa.peligrosidad() == nivelPeligrosidad })
    }
    method cosasQueSuperanPeligrosidad(nivelPeligrosidad) {
        return cargas.filter({ cosa => cosa.peligrosidad() > nivelPeligrosidad })
    }
    method cosasMasPeligrosasQue(cosaDada) {
        return cargas.filter({cosa => cosa.peligrosidad() > cosaDada.peligrosidad() })
    }
    method estaExcedido() {
        return self.pesoTotal() > 2500
    }
    method puedeCircular(nivelMaximo) {
        return not self.estaExcedido() and cargas.all({cosa => cosa.peligrosidad() < nivelMaximo})
    }
    method cargaMasPesada(){
        return cargas.max({ c => c.peso() })
    }
    method cantidadTotalDeBultos(){
    return cargas.sum({c=>c.bultos()})
    }
}
