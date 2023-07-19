var intervaloFechado = 10...20 // ate 20
var intervaloSemiAberto = 10..<20 // ate 19

var numero = 25

switch numero {
    case 0...10: print("Número está entre 0 e 10")
    case 10...20: print("Número está entre 10 e 20")
    default: print("Número é maior do que 20")
}

var animal = "Cachorro"

switch animal {
    case "Cachorro", "Gato": print("Animal doméstico")
    default: print("Animal Selvagem")
}

switch numero {
    //case let x where x % 2 == 0: print("Número \(x) é par")
    //case let x where x % 2 != 0: print("Número \(x) é ímpar")

    case _ where numero % 2 == 0: print("Número \(numero) é par")
    case _ where numero % 2 != 0: print("Número \(numero) é ímpar")
    
    default: break
}

let pergunta = "Qual o valor de 8 x 2?"
let respostaCorreta = 16
let respostaUsuario = 10
var pontuacao = 10

if (respostaCorreta == respostaUsuario) {
    pontuacao += 1
} else if pontuacao > 0 {
    pontuacao -= 1
}

print("Pontuação: \(pontuacao)")

let idade = 0

switch idade {
    case 0..<13: print("Criança")
    case 13..<18: print("Adolescente")
    default: print("Adulto")
}

let idadeConvidado = 20
let temRG = true

if (idadeConvidado >= 18 && temRG) {
    print("Pode entrar")
} else {
    print("Não pode entrar")
}
