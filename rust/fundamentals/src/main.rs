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
}
