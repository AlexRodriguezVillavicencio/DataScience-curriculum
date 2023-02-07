fn main() {
    // TIPOS DE DATOS PRIMITIVOS
    // Integer:
        // positivos
        let _variableu8: u8=129;
        let _variableu16: u16=65530;
        let _variableu32: u32=65530000;
        let _variableu64: u64=567798342432654;
        let _variableusize: usize=1222; // se adapta
        // positivos y negativos (ahora la mitad de memoria)
        // está destinada para los positivos y la otra mitad para negativos)
        let _variablei8: i8=127;
        let _variablei16: i16=-1530;
        let _variablei32: i32=-330000;
        let _variablei64: i64=-8342432654;
        let _variableisize: isize=1222; // se adapta  
    // Float:
        let _flotantef32: f32=3.1416;
        let _flotantef64: f64=3.14159265;
    // Boolean:
        let _vartrue: bool= true;
    // Char:
        let _c1: char= 'a';
        let _c2: char= '2';
        let _c3: char= '*';
        let _c4: char= '🙂';

    // TIPOS DE DATOS COMPUESTOS
    // Tuplas:
        let _tupla: (i32,f64,char,bool)= (24, 3.1232, 'p', false);
        let (_a, b, _c, _d) = _tupla;
        println!("el segundo valor es: {}",b);
    // Arreglos:
        let _arreglo: [i32;6]=[2,3,4,1,4,3]; // el tamaño es estático (no se puede añadir más elementos)
        println!("arreglo en posición 3: {}",_arreglo[2]);
    // vectores:
        // let _vector; // el tamaño es variable (si se puede añadir más elementos)
        
    // LOOP
        let mut i :i8=3;
        loop {
            println!("estamos en el número: {}",i);
            if i==1{
                break;
            }
            i -=1;
        }
        // con retorno
        let mut p:i8 =0;
        let suma = loop{
            if p==10{
                break p;
            }
            p+=1;
        };
        println!("suma: {}",suma);

    // WHILE
        let mut m:i8 =0;
        while m<2 { 
            println!("cambio while: {}",m);
            m+=1;
        }
    
    // FOR
        let a = ['a','b','2'];
        for i in a.iter(){
            println!("arreglo: {}",i)
        }

    // STRING
    {
        let mut cadena = String::from("este es una cadena");
        cadena.push_str(" y aquí le añadimos más texto");
        println!("{}",cadena);
        // let y = cadena;  aquí solo copiamos la dirección de memoria donde se aloja cadena
        // copiar datos del stack
        let y = cadena.clone();
        println!("{} y también lo hemos clonado",y)
        // los string necesitan usar el metodo clone(), pero los datos primitivos no
    }
    // OWNERSHIP
    {
        // entonces vemos que para los datos primitivos está implicita la función clone()
        let x = 24;
        println!("{}",x); // aquí se crea un copia 
        numero(x); // de igual manera numero() recibe una copia de x en otra dirección de memoria
        // a diferencia de los datos compuestos (como los string) donde se estaría trabajando sobre
        // la misma dirección de memoria
        println!("{}",x);
    }

}

fn numero(numero:i32){
    println!("dentro de la función: {}",numero);
}