use std::env::{args, Args};

fn main() {
    let mut args:Args = args();
    let primero:String = args.nth(1).unwrap();
    let operador:char= args.nth(0).unwrap().chars().next().unwrap();
    let segundo:String = args.nth(0).unwrap();

    let primer_numero = primero.parse::<f32>().unwrap();
    let segundo_numero = segundo.parse::<f32>().unwrap();
  
    let resultado = operate(operador, primer_numero, segundo_numero);
    println!("{} {} {} = {}",primer_numero,operador,segundo_numero,resultado);
}

fn operate(operador: char, primer_numero: f32, segundo_numero: f32) -> f32 {
    match operador {
      '+' => primer_numero + segundo_numero,
      '-' => primer_numero - segundo_numero,
      '/' => primer_numero / segundo_numero,
      '*' | 'X' | 'x' => primer_numero * segundo_numero,
      _ => panic!("Operador utilizado no válido."),
    }
}