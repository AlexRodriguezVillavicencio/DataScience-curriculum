use serde::Serialize;

#[derive(Serialize)]
pub struct Song {
    pub name: String,
    pub author: String,
    pub duration_ms: u16
}

#[derive(Serialize)]
pub struct PlayList {
    pub name: String, 
    pub songs: Vec<Song>
}