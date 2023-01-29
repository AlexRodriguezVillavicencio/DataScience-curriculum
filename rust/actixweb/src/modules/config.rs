use std::env;
use dotenv::dotenv;


pub struct Config {
  pub port: u16, // de forma publica para poder utilizarlo en el main.rs
  pub host: String
}

pub fn read_config() -> Config {
  dotenv().ok();

  Config { 
    port: env::var("PORT").expect("No port").parse().expect("bad port"), 
    host: env::var("HOST").expect("No host")
  }
}
