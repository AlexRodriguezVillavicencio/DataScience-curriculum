use actix_web::{get, Responder, HttpResponse, web};
// use crate::modules::playlist::PlayList; // importacion relativa
use super::playlist::PlayList;  //importacion relativa

#[get("/playlist")]
async fn playlist() -> impl Responder {
    
    let mut playlist: Vec<PlayList>  = vec![];
    let p1: PlayList = PlayList{
        name: "sonata artica".to_string(),
        songs: vec![]
    };

    playlist.push(p1);
    web::Json(playlist)
}


#[get("/version")]
async fn version() -> impl Responder {
    HttpResponse::Ok().body("1.0.0")
}


// exportamos nuestros metodos
pub fn config(cfg: &mut web::ServiceConfig) {
    cfg.service(version);
}

pub fn config2(cfg: &mut web::ServiceConfig) {
    cfg.service(playlist);
}