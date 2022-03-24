<?php
require_once './mesClasses/Cdao.php';
require_once './mesClasses/Cvisiteurs.php';
session_start();
$ovisiteur = unserialize($_SESSION['visitauth']); ?>
<header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 offset-md-1 py-4">
          <?php
          $odao = new Cdao();
          $sql = 'SELECT id_admin FROM visiteur where id="' . $ovisiteur->id . '"';
          $result = $odao->gettabDataFromSql($sql);
          foreach ($result as $UnResultat) {
            if ($UnResultat[0] == 1) {
          ?>
    
              <ul class="list-unstyled">
                <li><a href="ajoutermed.php" class="text-white">Ajouter</a></li>
              </ul>
              <ul class="list-unstyled">
                <li><a href="supprimer.php" class="text-white">Supprimer</a></li>
              </ul>
              <ul class="list-unstyled">
                <li><a href="catalogue.php" class="text-white">Catalogue</a></li>
              </ul>
              <ul class="list-unstyled">
                <li><a href="deconnexion.php" class="text-white">Deconnexion</a></li>
              </ul>
            <?php } else { ?>
              <ul class="list-unstyled">
                <li><a href="deconnexion.php" class="text-white">Deconnexion</a></li>
              </ul>
              <ul class="list-unstyled">
                <li><a href="liste_medicament.php" class="text-white">Médicament à présenter</a></li>
              </ul>
              <ul class="list-unstyled">
                <li><a href="catalogue.php" class="text-white">Catalogue</a></li>
              </ul>
          <?php }
          } ?>
        </div>
      </div>
    </div>
  </div>

  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="catalogue.php" class="navbar-brand d-flex align-items-center">

        <strong>GSB CATALOGUE</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>