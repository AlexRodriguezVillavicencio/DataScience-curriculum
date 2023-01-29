use actix_web::{web, App, HttpServer};

use actixweb::modules::endpoints::{config, config2}; // actixweb es el nombre de nuestro paquete en cargo.toml
use actixweb::modules::config::read_config; // traemos nuestras variables de entorno

#[actix_web::main]
async fn main() -> std::io::Result<()> {

    let varconfig = read_config();

    HttpServer::new(|| {
        App::new()
            .service(web::scope("/api")
            .configure(config)
        )
        .configure(config2)
    })
    .bind((varconfig.host, 8080))?
    .run()
    .await
}