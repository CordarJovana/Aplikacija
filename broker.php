<?php
class Broker{

    private $hostname="localhost";
    private $username="root";
    private $password="";
    private $dbname="domzdravlja";
    private $dblink;
    private $rezultat;
    private static $broker;

    //Konstruktror
    private function __construct(){
        $this->dblink = new mysqli($this->hostname, $this->username, $this->password, $this->dbname);
        if($this->dblink->connect_errno)
        exit();
        $this->dblink->set_charset("utf8");
    }


    public function getRezultat(){
        return $this->rezultat;
    }
    public function getMysqli(){
        return $this->dblink;
    }
    public static function getBroker(){
        if(!isset($broker)){
            $broker=new Broker();
        }
        return $broker;
    }
    
    private function izvrsiUpit($upit){
        $this->rezultat=$this->dblink->query($upit);
    }


//Funkcije za prikaz
    public function vratiSveDoktore(){
        $this->izvrsiUpit("select * from doktori");
    }
    public function vratiSvePacijente(){
        $this->izvrsiUpit("select * from pacijenti");
    }
    public function vratiPregledPacijent($idpacijenta){
        $this->izvrsiUpit("select * from pregledi where idpacijenta=$idpacijenta order by datum DESC");
      }

    public function vratiPregledDoktor($iddoktora){
        $this->izvrsiUpit("select * from pregledi where iddoktora=$iddoktora order by datum DESC");
    }

    public function vratiDZaPregled(){
        $this->izvrsiUpit("select * from doktori");
    }

    public function vratiPZaPregled(){
        $this->izvrsiUpit("select * from pacijenti");
    }


    public function vratiSpecijaliste(){
        $this->izvrsiUpit("select * from kategorijedoktora");
    }
   
    
    public function vratiDoktoreZaPregled($iddoktora){
        $this->izvrsiUpit("select * from doktori where id=$iddoktora");
    }
    public function vratiPacijenteZaPregled($idpacijenta){
        $this->izvrsiUpit("select * from pacijenti where id=$idpacijenta");
    }

//Funkcije za kreiranje
    public function kreirajDoktora($ime,$prezime,$jmbg, $idkategorije){
        $this->izvrsiUpit("insert into doktori (ime, prezime, jmbg, idkategorije) values ('$ime','$prezime', '$jmbg', $idkategorije)");
    }
    public function kreirajPacijenta($ime,$prezime,$jmbg){
        $this->izvrsiUpit("insert into pacijenti (ime, prezime, jmbg) values ('$ime','$prezime', '$jmbg')");
    }
    public function kreirajPregled($datum,$iddoktora, $idpacijenta,$simptomi){
        $this->izvrsiUpit("insert into pregledi (datum, idpacijenta, iddoktora, simptomi) values ('$datum',$idpacijenta, $iddoktora, '$simptomi')");
    }

//Funkcije za izmenu
    public function izmeniDoktora($id,$ime,$prezime,$jmbg, $idkategorije){
        $this->izvrsiUpit("update doktori set ime='$ime', prezime='$prezime', jmbg='$jmbg', idkategorije=$idkategorije where id=$id");
    }
    public function izmeniPacijenta($id,$ime,$prezime,$jmbg){
        $this->izvrsiUpit("update pacijenti set ime='$ime', prezime='$prezime', jmbg='$jmbg' where id=$id");
    }
//Funkcije za brisanje
    public function obrisiDoktora($id){
        $this->izvrsiUpit("delete from doktori where id=$id");
    }
    public function obrisiPacijenta($id){
        $this->izvrsiUpit("delete from pacijenti where id=$id");
    }
}
?>