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


//: Genéricos

func swap(inout a:Int, inout b:Int){
    let aux = a
    a = b
    b = aux
}

var n = 2
var m = 3

(n,m)
swap(&n, b: &m)
(n,m)
// Función genérica o de plantilla
func swap<T>(inout a:T, inout b:T){
    let aux = a
    a = b
    b = aux
}

var x = 2.0
var y = 3.0

(x,y)
swap(&x, b: &y)
(x,y)

var p = NSURL(string: "http://www.google.es")
var q = NSURL(string: "http://www.apple.es")

(p,q)
swap(&p, b: &q)
(p,q)


// Clase genérica

struct Pair <T,U>{
    let a : T
    let b : U
}

let r = Pair(a: 3, b: 6)
Pair(a: "hola", b: NSDate())

// Clase genérica
class Trio<T, U, V>{
    let first : T
    let middle : U
    let last : V
    
    init(first: T,middle: U, last: V){
        self.first = first
        self.middle = middle
        self.last = last
    }
}

let g = Trio(first: 5, middle: NSDate(), last: NSURL(string: "http://www.apple.es"))
print(g.first)
print(g.middle)
print(g.last)

// Parejas tiquismiquis
// restricciones a los tipos genéricos

struct ComparablePair<T:Comparable, U:Comparable> {
    let w : T
    let x : U
}

ComparablePair(w: 3, x: "holi")


let list : Array<Int> = [1,2,3]