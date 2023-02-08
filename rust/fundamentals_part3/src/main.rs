#[derive(Debug)]
enum IpAddr {
    V4,
    V6
}

#[derive(Debug)]
struct IpAd {
    kind:IpAddr,
    address:String
}

enum Billete {
    Benito,
    Morelos,
    Neza,
    SorJuana
}

fn main() {
    // ENUMS
    {   
        let ipv4 = IpAddr::V4;
        let ipv6 = IpAddr::V6;
        println!("{:?}",ipv4);
        println!("{:?}",ipv6);
        
        // enumns y structs
        let ip_home = IpAd {
            kind: IpAddr::V4,
            address: String::from("192.167.0.1")
        };
        println!("{:?} , {}", ip_home.kind,ip_home.address)
    }
    // MATCH
    {
        let mi_billete  = Billete::Benito;
        println!("valor: {}",valor_billete(mi_billete));
    }
}

fn valor_billete(mi_billete: Billete) -> u16 {
    match mi_billete {
        Billete::Benito => {
            println!("Este billete tiene un valor de 20");
            20
        },
        Billete::Morelos => 50,
        Billete::Neza => 100,
        Billete::SorJuana => 200,
    }
}
