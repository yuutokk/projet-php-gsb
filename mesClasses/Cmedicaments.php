<?php

/* ************ Classe métier Cmedicament et Classe de contrôle Cmedicaments **************** */
require_once 'mesClasses/Ctri.php';
require_once 'mesClasses/Cdao.php';

class Cmedicament
{
    public $id_med;
    public $designation_med;
    public $image;
    public $desc_detaille;
    public $anneMois;
    public $note_perso;
    
    function __construct($sid_med, $sdesignation_med, $simage, $sdesc_detaille, $sanneeMois, $snote_perso) //s pour send param envoyé
    {
        $this->id_med = $sid_med;
        $this->designation_med = $sdesignation_med;
        $this->image = $simage;
        $this->desc_detaille = $sdesc_detaille;
        $this->anneeMois = $sanneeMois;
        $this->note_perso =$snote_perso;
    }


}

class Cmedicaments
{
    
    private $ocollmedicament; //collection de mon objet

    public function __construct()
    {
        $oemploye = unserialize($_SESSION['visitauth']);
        try{
            $query = "SELECT * from presenter inner join medicament on medicament.id_med = presenter.id_med WHERE id_visit ='".$oemploye->id."'";
            $odao = new Cdao();
            $lesMedicaments = $odao->gettabDataFromSql($query);
                            
                foreach ($lesMedicaments as $unMedicament) 
                {
                    $omedicaments = new Cmedicament($unMedicament['id_med'],$unMedicament['designation_med'],$unMedicament['image'],$unMedicament['desc_detaille'],$unMedicament['anneeMois'],$unMedicament['note_perso']);
                    $this->ocollmedicament[] = $omedicaments;
                   
                }

        }
                  catch(PDOException $e) {
                         $msg = 'ERREUR PDO dans ' . $e->getFile() . ' L.' . $e->getLine() . ' : ' . $e->getMessage();
                         die($msg);
                        }
    }

    function getMedicamentsTrie()
    {
        $otrie = new Ctri();
        $ocollMedicamentsTrie = $otrie->TriTableau($this->ocollmedicament,'id_med');
        return $ocollMedicamentsTrie;
    }


}