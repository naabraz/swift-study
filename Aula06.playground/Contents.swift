// Structs

struct ContaCorrente {
    var saldo = 0.0
    var nome: String
    
    // mutating pq altera o valor de saldo
    mutating func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    mutating func depositar(_ valor: Double) {
        saldo += valor
    }
}

/*
var contaCorrenteNat = ContaCorrente(nome: "Nat")
print(contaCorrenteNat.saldo)
contaCorrenteNat.depositar(1500)
print(contaCorrenteNat.saldo)

var contaCorrenteCaio = ContaCorrente(nome: "Caio")
contaCorrenteCaio.depositar(200)
contaCorrenteCaio.sacar(100)
print(contaCorrenteCaio.saldo)
 */

// Classes

class ContaCorrente2 {
    var saldo: Double
    var nome: String
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    init(nome: String) {
        saldo = 0.0
        self.nome = nome
    }
}

/*
var contaCorrenteNat2 = ContaCorrente2(nome: "Nat")
print(contaCorrenteNat2.saldo)
contaCorrenteNat2.depositar(1500)
print(contaCorrenteNat2.saldo)
 */

// Classes x Structs

struct ContaCorrenteStruct {
    var saldo = 0.0
    var nome: String
    
    mutating func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    mutating func depositar(_ valor: Double) {
        saldo += valor
    }
}

// nao pode ser let pq struct = valor
var contaCorrenteStruct01 = ContaCorrenteStruct(nome: "Nat")
var contaCorrenteStruct02 = contaCorrenteStruct01

contaCorrenteStruct01.depositar(100)
contaCorrenteStruct02.depositar(50) // o valor sera 50 pois eh uma copia

print("Saldo da conta corrente struct 01 = \(contaCorrenteStruct01.saldo)")
print("Saldo da conta corrente struct 02 = \(contaCorrenteStruct02.saldo)")

class ContaCorrenteClass {
    var saldo = 0.0
    var nome: String
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    // obrigatorio constructor se nao inicializar
    init(nome: String) {
        self.nome = nome
    }
}

// pode ser let pq class = referencia
let contaCorrenteClasse01 = ContaCorrenteClass(nome: "Ana")
let contaCorrenteClasse02 = contaCorrenteClasse01

contaCorrenteClasse01.depositar(60)
contaCorrenteClasse02.depositar(100)

// o valor das 2 sera 160 pois eh referencia
print("Saldo da conta corrente classe 01 = \(contaCorrenteClasse01.saldo)")
print("Saldo da conta corrente classe 02 = \(contaCorrenteClasse02.saldo)")

/*
 ============================================================================
 Desafios
*/

struct Calculadora {
    var numero1: Double
    var numero2: Double
    
    func soma() -> Double {
        return numero1 + numero2
    }
    
    func subtracao() -> Double {
        return numero1 - numero2
    }
    
    func divisao() -> Double {
        return numero1 / numero2
    }
    
    func multiplicacao() -> Double {
        return numero1 * numero2
    }
}

var calculadora = Calculadora(numero1: 6, numero2: 4)

/*
print ("Soma: \(calculadora.soma())")
print ("Subtracao: \(calculadora.subtracao())")
print ("Divisão: \(calculadora.divisao())")
print ("Multiplicação: \(calculadora.multiplicacao())")
*/

class Restaurante {
    var nome: String
    var tipoDeComida: String
    var numeroDePedidos: Int
    var valorTotalPedido = 35.00
    
    init(nome: String, tipoDeComida: String) {
        self.nome = nome
        self.tipoDeComida = tipoDeComida
        self.numeroDePedidos = 0
    }
    
    func recebePedido() {
        numeroDePedidos += 1
    }
    
    func calculaTotalPedidos() -> Double {
        return Double(numeroDePedidos) * valorTotalPedido
    }
}

/*
var restaurante = Restaurante(nome: "Macarronada", tipoDeComida: "Massa")
restaurante.recebePedido()
restaurante.recebePedido()
restaurante.recebePedido()
restaurante.recebePedido()
print("Valor total do pedido: \(restaurante.calculaTotalPedidos())")
*/

struct Retangulo {
    var base: Int
    var altura: Int
    
    func calcularArea() -> Int {
        return base * altura
    }
    
    func calcularPerimetro() -> Int {
        return base * 2 + altura * 2
    }
}

/*
 var retangulo = Retangulo(base: 10, altura: 20)
 print("Area \(retangulo.calcularArea())")
 print("Perimetro \(retangulo.calcularPerimetro())")
*/
