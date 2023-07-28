// Propriedades Computadas

class Conta {
    var saldo = 0.0 {
        /* Observador de propriedade
         que será disparado quando saldo for modificado */
        willSet(novoValor) {
            print("O saldo está sendo alterado! O seu novo valor será de \(novoValor)")
        }
        
        didSet {
            print("O saldo está sendo alterado! O seu valor antigo era de \(oldValue)")
        }
    }
    
    var nome: String
    
    // Propriedade estática
    static var taxaTransferencia = 0.1
    
    /*  Deve sempre ser var pois altera valor
        Propriedade computada
     */
    var negativado: Bool {
        return saldo < 0
    }
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    init(nome: String) {
        self.nome = nome
    }
}

/*
var contaNatalia = Conta(nome: "Natalia")
contaNatalia.sacar(20)
print(contaNatalia.negativado)
contaNatalia.depositar(100)
print(contaNatalia.negativado)
*/

/*
 A taxaTransferencia por ser estática, pertence a classe
 e não a instância
*/
// print(Conta.taxaTransferencia)

/*
 ==================
 Desafios
*/

struct Pessoa {
    var nome: String
    var idade: Int
    var altura: Double
    var peso: Double
    
    var imc: Double {
        return peso / (altura * altura)
    }
    
    var adulto: Bool {
        return idade >= 18
    }
}

var pessoa = Pessoa(nome: "Natalia", idade: 32, altura: 1.60, peso: 63.0)
print(pessoa.adulto)
print(pessoa.imc)

class Empregado {
    var nome: String
    var salario: Double {
        willSet(novoValor) {
            if novoValor > salario {
                print("Parabéns, você recebeu uma promoção!")
            } else if novoValor == salario {
                print("Parece que não houve uma promoção dessa vez.")
            }
        }
        
        didSet(valorAntigo) {
            if salario < valorAntigo {
                print("O novo salário não pode ser menor do que era anteriormente.")
                salario = valorAntigo
            }
        }
    }
    
    init(nome: String, salario: Double) {
        self.nome = nome
        self.salario = salario
    }
}

var empregado = Empregado(nome: "Natalia", salario: 100)
empregado.salario = 200
empregado.salario = 200
empregado.salario = 100
print(empregado.salario)
