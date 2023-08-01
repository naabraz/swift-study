// Extensions, Enumerations, Protocol

enum FormaDePagamento {
    case pix
    case boleto
    case saldoEmConta
}

enum ResultadoSaque {
    case sucesso(novoValor: Double)
    case falha(erro: String)
}

class Conta {
    var saldo = 0.0
    var nome: String
    
    func sacar(_ valor: Double) -> ResultadoSaque {
        if (valor > saldo) {
            return .falha(erro: "O valor é maior do que seu saldo")
        } else {
            saldo -= valor
            return .sucesso(novoValor: saldo)
        }
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    // Enumeracoes
    func pagamentoCartao(_ tipoPagamento: FormaDePagamento) {
        switch tipoPagamento {
            case FormaDePagamento.pix: print("O pagamento será efetuado por pix")
            case .boleto: print("O pagamento será efetuado por boleto")
            case .saldoEmConta: print("O pagamento será efetuado por saldo em conta")
        }
    }
    
    init(nome: String) {
        self.nome = nome
    }
}

extension Conta {
    func transferir(_ contaDestino: Conta, _ valor: Double) {
        sacar(valor)
        contaDestino.depositar(valor)
    }
}

var contaNatalia = Conta(nome: "Natalia")
contaNatalia.depositar(200)
contaNatalia.pagamentoCartao(.pix)
let resultado = contaNatalia.sacar(100)

switch resultado {
    
case .sucesso(let novoValor):
    print("O saque foi um sucesso, e o saldo é de \(novoValor)")
case .falha(let erro):
    print(erro)
}

var contaAna = Conta(nome: "Ana")
contaNatalia.transferir(contaAna, 50)

print("Conta Natalia saldo \(contaNatalia.saldo)")
print(contaAna.saldo)

func contaCaracteresString(_ texto: String) -> Int {
    return texto.count
}

let texto = "Natalia"
contaCaracteresString(texto)

extension String {
    // var texto = "" - Não pode conter propriedades armazenadas
    func contaCaracteresString() -> Int {
        return self.count
    }
}

print(texto.contaCaracteresString())

extension Int {
    func somaNumeroCom(_ numero: Self) -> Self /* Self == Int */ {
        return numero + self
    }
}

extension Int {
    func somaNumero(_ numero: Int) -> Int {
        return numero + self /* Instancia */
    }
}

let numeroDez = 10
let resultadoSoma = numeroDez.somaNumeroCom(20)
print(resultadoSoma)

let numero = 10
let resultadoSoma2 = numero.somaNumero(20)
print(resultadoSoma2)

// Protocolos

protocol ContaProtocolo {
    var saldo: Double { get set } // Pode ser lida ou alterada
    
    func sacar(_ valor: Double)
    func depositar(_ valor: Double)
}

class ContaCorrente: ContaProtocolo {
    var saldo: Double
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    init() {
        saldo = 0.0
    }
}

enum Mes: String {
    case janeiro = "jan", fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro
}

var agosto = Mes.agosto
var janeiro = Mes.janeiro

print(janeiro.rawValue)
print(agosto.rawValue)

var fevereiro: Mes = .fevereiro

enum Moeda: Double {
    case umCentavo = 0.01
    case cincoCentavos = 0.05
    case dezCentavos = 0.1
    case vinteCincoCentavos = 0.25
    case cinquentaCentavos = 0.5
}

var moedaCincoCentavos = Moeda.cincoCentavos
print(moedaCincoCentavos.rawValue)

/* 
 ============
 Desafios
*/

protocol Area {
    var area: Double { get }
}

struct Quadrado: Area {
    var lado: Double
    var area: Double {
        return lado * lado
    }
}

struct Triangulo: Area {
    var base: Double
    var altura: Double
    var area: Double {
        return (base * altura) / 2
    }
}

var quadrado = Quadrado(lado: 7)
var triangulo = Triangulo(base: 4, altura: 3)
print(quadrado.area)
print(triangulo.area)

enum Moeda2: Int {
  case UmCentavo = 1
  case CincoCentavos = 5
  case DezCentavos = 10
  case VinteCincoCentavos = 25
  case CinquentaCentavos = 50
    
    static func somaMoedas(_ moedas: [Moeda2]) -> Int {
        var total: Int = 0
        for moeda in moedas {
            total += moeda.rawValue
        }
        
        return total
    }
}

let moedas: [Moeda2] = [.CincoCentavos, .UmCentavo, .CincoCentavos, .VinteCincoCentavos, .CincoCentavos, .DezCentavos]

print(Moeda2.somaMoedas(moedas))


// Generic
func soma<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

print(soma(a: 2.5, b: 3.0))
print(soma(a: 5, b: 4))
