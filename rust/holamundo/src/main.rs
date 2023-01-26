fn main() {
    
    // variable mutable
    let mut x = 3;
    println!("el valor de x es {}",x);

    x = 7;
    println!("ahora vale {}",x);

    // variables constantes (escribirlos en mayuscula)
    const PI: f32 = 3.14;
    println!("el valor de la constante es {}",PI);


    // redifiniendo variables inmutables
    let y = 8;
    println!("valor0 {}",y);
    let y = "cambiando ...";
    println!("valor1 {}",y);

    // tipos escalares
    // tipo booleano
    let _falso = false;
    // tipo caracter
    // tipo tupla
    let tupla = (30,1.3,-2);
    let primero = tupla.0;
    println!("salida de tupla {}",primero);
    // tipo array
    let _matriz:[i32;3] = [2,3,1];
    let _matriz2 = [3;2]; // que sería [3,3]

    snake_case(10);

    println!("otra funcion {}",expresion());
    println!("otra funcion {}",expresion2());


    // referencia
    let referencia = String::from("esta es una referencia");
    println!("{}",referencia);
    funcion_referencia(&referencia);

    // prestamos
    let mut prestamo = String::from("esta es una cadena prestada");
    funcion_prestada(&mut prestamo);
    println!("{}",prestamo);
}
// funcion de referencia
fn funcion_referencia(cadena:&String){
    println!("{}", cadena);
}
// funcion de modificación de variable prestada
fn funcion_prestada(cadena:&mut String){
    cadena.push_str(" y la estoy modificando");
}

fn snake_case(i:i32) {

    // condicionales
    if i > 10 {
        println!("{} es mayor que 10",i);
    } else if i == 10 {
        println!("{} es igual a 10",i);
    }
    else {
        println!("{} es menor que 10",i)
    }
}

// primera forma de funciones con retorno
fn expresion() ->  i8 {
    let m = 23;
    m+2
}
// segunda forma de funciones con retorno
fn expresion2() ->  i8 {
    let m = 23;
    return m+2;
}