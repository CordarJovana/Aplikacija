<?php

include "broker.php";

$broker=Broker::getBroker();

//Ovo moze da ne radi zbog kategorija doktora pa to proveriti i koristiti kao primer knjige php
if(isset($_GET["metoda"])){
    if($_GET["metoda"]=="vrati sve"){
        $broker->vratiSveDoktore();
        posalji($broker);
    }
    if($_GET["metoda"]=="vrati kategorije"){
        $broker->vratiSpecijaliste();
        posalji($broker);
    }
}

if(isset($_POST["metoda"])){
    if($_POST["metoda"]=="dodaj"){

        $ime=$_POST["ime"];
        $prezime=$_POST["prezime"];
        $jmbg=$_POST["jmbg"];
        $idkategorije=$_POST["idkategorije"];
        
        $broker->kreirajDoktora($ime,$prezime,$jmbg,$idkategorije);
        
            if(!$broker->getRezultat()){
                echo "Nastala je greška u bazi";
            }else{
                echo "Uspešno je dodat novi profil doktora";
            }
        
    }
    if($_POST["metoda"]=="izmeni"){

        $id=$_POST["id"];
        $ime=$_POST["ime"];
        $prezime=$_POST["prezime"];
        $jmbg=$_POST["jmbg"];
        $idkategorije=$_POST["idkategorije"];

        $broker->izmeniDoktora($id,$ime,$prezime,$jmbg, $idkategorije);
        if(!$broker->getRezultat()){
        echo "Nastala je greška u bazi";
        }else{
        echo "Uspešno je dodat novi profil doktora";
            }
        
    }
    if($_POST["metoda"]=="obrisi"){
        $broker->obrisiDoktora($_POST["id"]);
        if(!$broker->getRezultat()){
            echo "Nastala je greška u bazi";
        }else{
            echo "Uspešno je dodat novi profil doktora";
        }
    }
}



function posalji($broker){
    $rezultat=$broker->getRezultat();
    $response=array();
    if(!$rezultat){
        $response["status"]="Nastala je greška u bazi";
        
    }else{
        $response["status"]="ok";
        $response["data"]=array();
        while($red=$rezultat->fetch_object()){
            $response["data"][]=$red;
        }
    }
    echo json_encode($response);
}

/*function validirajKnjigu($naziv,$kategorija,$brojStrana){
    $naziv=trim($naziv);
    $kategorija=trim($kategorija);
    $brojStrana=trim($brojStrana);
    return strlen($naziv)>3 && strlen($naziv)<40 && intval($kategorija) && intval($brojStrana);
}*/


?>