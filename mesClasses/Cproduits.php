
<?php
/* ************ Classe métier Cproduit et Classe de contrôle Cproduits **************** */
require_once 'mesClasses/Cdao.php';


class Cproduit
{

  public $id_med;
  public $image;
  public $titre;
  public $prix;
  public $designation_med;

  function __construct($sid_med, $simage, $stitre, $sprix, $sdesignation_med)
  {
    $this->id_med = $sid_med;
    $this->image = $simage;
    $this->titre = $stitre;
    $this->prix = $sprix;
    $this->designation_med = $sdesignation_med;
  }
}
class Cproduits
{

  public $ocollproduit; //collection de notre obejt
  //$oemploye = unserialize($_SESSION['visitauth']);
  public function __construct()
  {
    try {
      $query = "SELECT * FROM medicament ORDER BY id_med DESC";
      $odao = new Cdao();
      $lesProduits = $odao->gettabDataFromSql($query);

      foreach ($lesProduits as $unProduit) {
        $oproduits = new Cproduit($unProduit['id_med'], $unProduit['image'], $unProduit['titre'], $unProduit['prix'], $unProduit['designation_med']);
        $this->ocollproduit[] = $oproduits;
      }
    } catch (PDOException $e) {
      $msg = 'ERREUR PDO dans ' . $e->getFile() . ' L.' . $e->getLine() . ' : ' . $e->getMessage();
      die($msg);
    }
  }


  function ajouter($image, $titre, $prix, $designation_med)
  {
    $odao = new Cdao();
    $req = "INSERT INTO medicament (image, titre, prix, designation_med) VALUES ('$image', '$titre', $prix, '$designation_med')";

    $odao->insert($req);
    
    
  }

  function supprimer($id_med)
  {
    $odao = new Cdao();
    $query = "DELETE FROM medicament WHERE id_med=".$id_med;

    $odao->insert($query);
   
  }
}
