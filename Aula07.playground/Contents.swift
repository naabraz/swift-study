class Conta {
    var saldo = 0.0
    var nome: String
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar (_ valor: Double) {
        saldo += valor
    }
    
    init(nome: String) {
        self.nome = nome
    }
}

class ContaPoupanca: Conta {
    var possuiCartaoDebito: Bool
    
    func solicitarDebito() {
        possuiCartaoDebito = true
        print("O cliente está solicitando cartão de débito")
    }
    
    override func sacar(_ valor: Double) {
        saldo -= valor + 10
    }
    
    init(nome: String, possuiCartaoDebito: Bool) {
        self.possuiCartaoDebito = possuiCartaoDebito
        
        // chama inicializador da classe pai
        super.init(nome: nome)
    }
}

var contaPoupanca = ContaPoupanca(nome: "Natalia", possuiCartaoDebito: false)
contaPoupanca.depositar(50)
contaPoupanca.sacar(20)
//print(contaPoupanca.saldo)
contaPoupanca.solicitarDebito()

class ContaCorrente: Conta {
    func solicitarEmprestimo(_ valor: Double) {
        print("O cliente está solicitando empréstimo no valor de \(valor)")
        
        // super chama o metodo da classe pai
        super.depositar(valor)
    }
    
    override func sacar(_ valor: Double) {
        saldo -= valor + 5
    }
}

var contaCorrente = ContaCorrente(nome: "Ana")
contaCorrente.depositar(100)
contaCorrente.sacar(20)
//print(contaCorrente.saldo)
contaCorrente.solicitarEmprestimo(20000)
//print(contaCorrente.saldo)

final class Pessoa {} // ninguem podera herdar a classe pessoa

/*
 Polimorfismo
 contaCorrente e contaPoupanca são filhas de Conta, mesmo tipo.
*/

func exibeSaldoDaConta(_ conta: Conta) {
    if conta is ContaCorrente {
        print("Conta é do tipo conta corrente")
        // conta.solicitarEmprestimo() -> não funciona
    }
    
    // Typecasting
    if let contaCorrente = conta as? ContaCorrente {
        contaCorrente.solicitarEmprestimo(200)
    }
    
    guard let contaPoupanca = conta as? ContaPoupanca else {
        return
    }
    
    print(contaPoupanca.possuiCartaoDebito)
}

/*exibeSaldoDaConta(contaCorrente)
exibeSaldoDaConta(contaPoupanca)*/

/*
 ===============================
 Desafios
*/

class Empregado {
    var nome: String
    var salario: Double
    
    init(nome: String, salario: Double) {
        self.nome = nome
        self.salario = salario
    }
}

class Gerente: Empregado {
    var departamento: String
    
    init(nome: String, salario: Double, departamento: String) {
        self.departamento = departamento
        super.init(nome: nome, salario: salario)
    }
}

class Vendedor: Empregado {
    func percentualComissao(_ quantidadeVendas: Int) -> Double {
        return (0.1 * 50.0 * Double(quantidadeVendas)) + self.salario
    }
}

var gerente = Gerente(nome: "Natalia", salario: 100, departamento: "Vendas")
/*print(gerente.departamento)
print(gerente.salario)
print(gerente.nome)*/

var vendedor = Vendedor(nome: "Fernanda", salario: 100)
// print(vendedor.percentualComissao(10))

func verificaTipo(_ empregado: Empregado) {
    if let gerente = empregado as? Gerente {
        print("O(a) empregado(a) \(gerente.nome) é um(a) gerente e está no departamento \(gerente.departamento).")
    } else if let vendedor = empregado as? Vendedor {
        print("O(a) empregado(a) \(vendedor.nome) é um(a) vendedor.")
    } else {
        print("O(a) empregado(a) \(empregado.nome) é de um outro tipo.")
    }
}

var empregadoGerente = Gerente(nome: "Juliana", salario: 200, departamento: "Roupas")
var empregadoVendedor = Vendedor(nome: "Poliana", salario: 100)
var empregadoComum = Empregado(nome: "Tatiane", salario: 50)
verificaTipo(empregadoGerente)
verificaTipo(empregadoVendedor)
verificaTipo(empregadoComum)
