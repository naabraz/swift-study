// Colecoes

var notas: [Double] = [8.5, 9.0, 7.2, 6.0]
notas[0]

var arrayVazio: [String] = []
var arrayVazio2 = Array<String>()

notas.isEmpty
arrayVazio.isEmpty

notas.count
notas.min()
notas.max()
notas.contains(4.0)
notas.firstIndex(of: 10.0)

notas.append(10)
notas.insert(5.0, at: 2)
notas += [8.2]

print(notas)

var elementoRemovido = notas.removeLast()
print(elementoRemovido)

var primeiroElementoRemovido = notas.removeFirst()
print(primeiroElementoRemovido)

print(notas)

notas.remove(at: 3)

print(notas)

// Lacos

for nota in notas {
    print(nota)
}


/*
 erro
 
 for i in 0...notas.count {
    print(notas[i])
}
*/

for i in 0..<notas.count {
    print(notas[i])
}

for (index, elemento) in notas.enumerated() {
    print(index, elemento)
}

// Sets

// Set dado desordenado nao eh possivel acessar o elemento por index
// Set nao permite elementos duplicados Joao sera exibido soh 1x

var nomes: Set<String> = ["Nat", "Pam", "Ana", "Joao", "Caio", "Joao"]
nomes.contains("Joao")
nomes.insert("Carla")
nomes.remove("Nat")

// Tuplas

/* var coordenadas = (x: 8, y: 3.5)
coordenadas.x
coordenadas.y */

typealias Coordenadas = (x: Int, y: Double)

var coordenadas: Coordenadas = (x: 8, y: 3.5)
coordenadas.x
coordenadas.y

var pessoa = (nome: "Amy", idade: 40)
pessoa.nome
pessoa.idade

var (nome, idade) = pessoa
// var (_, idade) = pessoa -> para obter soh idade
print(nome)
print(idade)

// Dicionario (Objeto)

var pontuacao = [
    "amylee": 20,
    "tarja": 30,
    "simone": 40
]

var pessoas: [String: Int] = [:] // empty
pessoas.reserveCapacity(10) // melhora performance alocando 10 espacos na memoria

print(pontuacao["simone"])
pontuacao.isEmpty
pontuacao.count
pontuacao["floor"] = 25
pontuacao["simone"] = 90
print(pontuacao)
pontuacao.updateValue(60, forKey: "amylee")
print(pontuacao)
pontuacao.updateValue(10, forKey: "whatever") // cria o valor se nao existir
print(pontuacao)
pontuacao["whatever"] = nil // remove
print(pontuacao)
pontuacao.removeValue(forKey: "amylee") // remove e retorna valor removido
print(pontuacao)

for (nome, pontuacao) in pontuacao {
    print("A usuária \(nome) fez \(pontuacao) pontos.")
}

for nome in pontuacao.keys {
    print(nome)
}

for pontos in pontuacao.values {
    print(pontos)
}

// Desafios

func mediaNotas(notas: [Double]) -> Double {
    var total = 0.0
    
    for nota in notas {
        total += nota
    }
    
    var media = total / Double(notas.count)
    
    return Double(media)
}

var mediaTotal = mediaNotas(notas: [10.0, 5, 9.5])
print(mediaTotal)

var estados = ["SP": "São Paulo", "CE": "Ceará", "RJ": "Rio de Janeiro"]

func estadosComMaisDeOitoLetras(estados: [String:String]) {
    for estado in estados.values {
        if estado.count >= 8 {
            print(estado)
        }
    }
}

estadosComMaisDeOitoLetras(estados: estados)
