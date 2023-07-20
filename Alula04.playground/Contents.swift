func soma(numero1: Int, numero2: Int) {
    var resultado = numero1 + numero2
    print(resultado)
}

soma(numero1: 2, numero2: 3)

func soma2(_ numero1: Int, _ numero2: Int) {
    var resultado = numero1 + numero2
    print(resultado)
}

soma2(2, 3)

// argument label
func soma3(_ numero1: Int, com numero2: Int) {
    var resultado = numero1 + numero2
    print(resultado)
}

soma3(2, com: 3)

// definir o retorno da funcao
func soma4(_ numero1: Int, _ numero2: Int) -> Int {
    var resultado = numero1 + numero2
    return resultado
}

var soma = soma4(8, 2)
print(soma)

func verificaAdulto(_ idade: Int) -> Bool {
    return idade >= 18
}

verificaAdulto(15)
/*
 permitir alteracao do valor enviado para a func
 passagem de parametro por referencia
*/
func somaNumero(_ numero: inout Int) {
    numero += 1
    print(numero)
}

// altera o valor fora do escopo da funcao
var valor = 10
somaNumero(&valor)
print(valor) // será exibido 11

// Opcionais

var telefone: String?
telefone = "9999999"
// print(telefone!) // desembrulho não recomendado
var celular: String?
celular = "8888888"

if telefone != nil {
    print(telefone!)
}

// optional binding
if let telefone = telefone,
    let celular = celular {
    // telefone -> só disponivel dentro deste escopo
    print(telefone)
    print(celular)
}

func autenticar(usuario: String?, senha: String?) {
    guard let usuario = usuario, let senha = senha
    else {
        return
    }
    print(usuario)
    print(senha)
}

autenticar(usuario: "Nat", senha: nil)

// optional chaining
if let primeiroCaractere = telefone?.first {
    print(primeiroCaractere)
}

print(telefone ?? "Não há valor para telefone")

// Desafios

// true se dividido apenas por um e por ele mesmo
func numeroPrimo(numero: Int) -> Bool {
    let start = 2
    for i in start..<numero {
        if numero % i == 0 {
            return false
        }
    }
    return true
}

print(numeroPrimo(numero: 7))

func nomePessoa(nome: String?) {
    if let nome = nome {
        print(nome)
    } else {
        print("Nome não especificado")
    }
}

nomePessoa(nome: nil)

func divisaoConta(valorTotal: Double, quantidadePessoas: Int) -> Double {
    let valorTotalConta = valorTotal * 1.1
    return valorTotalConta / Double(quantidadePessoas)
}

print(divisaoConta(valorTotal: 120, quantidadePessoas: 4))
