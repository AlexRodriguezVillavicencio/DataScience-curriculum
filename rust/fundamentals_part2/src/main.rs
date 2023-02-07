// similar a los objetos de javascript o diccionarios de python
#[derive(Debug)]
struct Usuario {
    id: i64,
    nombre: String,
    _pais: String,
    _vivo: bool
}

struct Rectangulo {
    alto:u32,
    ancho:u32
}

impl Rectangulo {
    // función asociada
    fn cuadrado(lado:u32) -> Rectangulo {
        Rectangulo {
            alto:lado,
            ancho:lado
        }
    }

    // método
    fn can_hold(&self, otro: &Rectangulo) -> bool {
        self.alto < otro.alto && self.ancho < otro.ancho
    }
}
// se pueden tener multiples implementaciones
impl Rectangulo {
    // método
    fn area(&self) -> u32 {
        self.alto*self.ancho
    } // este método pudo estar dentro de la implementación de arriba 
}

fn main() {
    // STRING SLICES
    {
        let s = String::from("todo bien");
        let todo = &s[..4];
        let bien = &s[5..];
        let todo_bien = &s[..];
        println!("1: {} || 2: {} || 3: {}",todo,bien,todo_bien);
    }
    // STRUCTS
    {   
        let mut usuario1 = Usuario {
            id:1,
            nombre:String::from("Alex"),
            _pais: String::from("nunca jamás"),
            _vivo: true
        };
        println!("id: {} || nombre: {}",usuario1.id, usuario1.nombre,);
        usuario1.id = 2;
        usuario1.nombre = String::from("Anderson");
        println!("{:?}", usuario1);

        // llamando una structura dentro de una función
        println!("{:?}", crear_estructura(3,String::from("Pedro"), String::from("Mexico"),true));

        // si queremos heredar del usuario1
        let usuario2 = Usuario {
            id:4,
            nombre: String::from("Susana"),
            .. usuario1
        };
        println!("{:?}", usuario2);

        // structura en tuplas
        struct Color(i32,i32,i32);
        let negro = Color(0,0,0);
        println!("Negro: {}, {}, {}", negro.0,negro.1,negro.2);
    }
    // METODOS
    {
        // definiendo metodos de estructura
        let area_rectangulo = Rectangulo{
            alto: 24,
            ancho: 10
        };
        println!("Area: {}", area_rectangulo.area());

        // con multiples parámetros
        let r1 = Rectangulo{
            alto: 4,
            ancho: 5
        };
        let r2 = Rectangulo{
            alto: 6,
            ancho: 15
        };
        println!("r1 cabe en r2 : {}", r1.can_hold(&r2))
    }
    // FUNCIONES ASOCIADAS
    {
        // funciones asociadas a estructuras
        let c1 = Rectangulo::cuadrado(4);
        println!("Area cuadrado: {}",c1.area());
    }
}

fn crear_estructura(id_local:i64, nombre_local:String, pais_local:String, vivo_local:bool) -> Usuario {
    Usuario {
        id: id_local,
        nombre: nombre_local,
        _pais: pais_local,
        _vivo: vivo_local
    }
}