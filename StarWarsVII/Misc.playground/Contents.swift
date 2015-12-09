//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//: Opcionales: una caja ande guardar un nil

//Creo una caja para guardar cadenas
var cajaDeTexto : String?

//Meto cosas en la caja
cajaDeTexto = "Hola"
cajaDeTexto = nil

// Cómo saber si la caja está vacía
if (cajaDeTexto == nil){
    print("No metas la mano!")
}else{
    print("Puedes meter la mano")
}

// Abrir la caja de forma segura
if let text = cajaDeTexto{
    print("lo que habia dentro era \(text)")
}

//Abrir la caja de forma segura en plan finolis
// optional chaining
cajaDeTexto = "No metas la mano!"
cajaDeTexto?.hasPrefix("No")

if ((cajaDeTexto?.hasPrefix("No")) != nil && cajaDeTexto?.hasPrefix("No") == true){
    print("Eureka")
}

// Abrir la caja por cojones.
print(cajaDeTexto!)

// If desempaquetando varias cosas

let url : String? = "http://www.keepcoding.iorl"

if let urlString = url,
    realUrl = NSURL(string: urlString){
    //Sé por narices, que urlString y realUrl tienen valores no nulos
}


//: Subcripts - Funciones con sintaxis de indexado
class Numbers{
    let evens = [2,4,6,8]
    let odds = [1,3,5,7,9]
    
    // Subscripts para acceder a números mediante índice
    // Usamos un nombre externo para distinguir los tipos de números.
    
    subscript(evenAtIndex idx: Int) -> Int{
        get{
            return evens[idx]
        }
    }
    
    subscript(oddAtIndex idx: Int) -> Int{
        get{
            return odds[idx]
        }
    }
}
