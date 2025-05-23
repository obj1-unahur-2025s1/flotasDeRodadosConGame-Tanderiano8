import rodados.*

class Dependencia {
    const flota = []
    var property empleados
    method agregarAFlota(rodado) {flota.add(rodado)}
    method quitarDeFlota(rodado) {flota.remove(rodado)}
    method pesoTotalFlota() = flota.sum({r => r.peso()})
    method estaBienEquipada() = self.tieneAlMenosRodados(3) && self.todosVanAlMenosAKm(100)
    method tieneAlMenosRodados(unaCantidad) = flota.size() >= unaCantidad
    method todosVanAlMenosAKm(unKm) = flota.all({r=> r.velocidadMaxima() >= unKm})
    method capacidadTotalEnColor(color) = self.rodadosDelColor(color).sum({r=>r.capacidad()})
    method rodadosDelColor(color) = flota.filter({r=> r.color() == color})
    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
    method rodadoMasRapido() = flota.max({r=>r.velocidadMaxima()})
    method capacidadFaltante() = 0.max(empleados - self.capacidadSumada())
    method capacidadSumada() = flota.sum({r=>r.capacidad()})
    method esGrande() = empleados >= 40 && self.tieneAlMenosRodados(5)
}