<?php

class Cdao
{
    private function getPDO()
    {
        $strConnection = 'mysql:host=localhost;dbname=gsb1'; // DSN
        $arrExtraParam= array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"); // demande format utf-8
        $pdo = new PDO($strConnection, 'root', '', $arrExtraParam); // Instancie la connexion
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);// Demande la gestion d'exception car par défaut PDO ne la propose pas 
        return $pdo;
    }
    
    public function gettabDataFromSql($squery)
    {
        $pdo = $this->getPDO();        
        $lesVisiteurs = $pdo->query($squery);
        return $lesVisiteurs;
    }

    public function insert($squery){
        $pdo = $this->getPDO();
        $pdo->query($squery);
    }
}
?>