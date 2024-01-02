import UIKit

// MARK: NÃO SE ESQUEÇA DO SIGNIFICADO DE CADA UM:

// Decodable
// Decodable é um protocolo em Swift que permite que você converta dados no formato JSON em um objeto Swift. Este processo é conhecido como decodificação.

// Encodable
// Encodable é outro protocolo em Swift. Ele permite que você faça o oposto do que o Decodable faz: você pode converter um objeto Swift em dados no formato JSON. Isso é chamado de codificação

// Codable
// Codable é, na verdade, apenas uma combinação dos protocolos Decodable e Encodable. Isso significa que, se um tipo é Codable, ele pode ser usado para decodificar dados do jormato JSOn, bem como codificar objetos em dados JSON

struct Person: Codable {
    var name: String
    var age: Int
    var lastName: String

    enum condingKeys: String, CodingKey {
        case name = "name_App"
        case age = "age_App"
        case lastName = "last_Name"
    }
}

// Decodificando JSON em um Objeto

let jsonString = """
{
    "name_App": "Caio",
    "age_App": 50,
    "last_Name": "Fabrini"
}
"""

let jsonDecoder = JSONDecoder()

if let jsonData = jsonString.data(using: .utf8) {
    do {
        let person: Person = try jsonDecoder.decode(Person.self, from: jsonData)
        print("Decodificado:")
        print("Nome: \(person.name ?? ""), idade: \(person.age ?? 0), Sobrenome: \(person.lastName ?? "")")
    } catch {
        print("Erro ao decodificar JSON: \(error)")
    }
}

// Codificando um Objeto em JSON

let person: Person = Person(name: "Caio", age: 30, lastName: "Fabrini")

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

do {
    let jsonData = try jsonEncoder.encode(person)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("JSON codificado:")
        print(jsonString)
    }
} catch {
    print("Erro ao codificar em JSON: \(error)")
}

