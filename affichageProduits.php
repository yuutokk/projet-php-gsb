<?php
//CETTE PAGE SERT A AFFICHER LES PRODUITS QUI PEUVENT ETRE SUPPRIMER
require("mesClasses/Cproduits.php");
  $oproduit = new Cproduits();
  $ocollproduits = $oproduit->ocollproduit;

?>

<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
  
        <?php foreach($ocollproduits as $produit): ?> 
        <div class="col">
          <div class="card shadow-sm">
          
            <img src="img/<?= $produit->image ?>">
            
            <h3><?= $produit->id_med ?></h3>

            <div class="card-body">
            
            </div>
          </div>
        </div>
  <?php endforeach; ?>