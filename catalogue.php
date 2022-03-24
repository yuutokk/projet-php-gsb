<?php
require_once 'includes/head.php';
require ("./mesClasses/Cproduits.php");
  $oproduits= new Cproduits();
  $ocollProduits = $oproduits->ocollproduit;

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GSB E-commerce</title>
    <link rel="stylesheet" href="includes/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  </head>

  <body>
    
<?php require_once 'includes/nav.php' ?>

<main>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

      <?php foreach($ocollProduits as $produit): ?> 
        <div class="col">
          <div class="card shadow-sm">
            <title><?= $produit->titre ?></title>
            <img src="img/<?= $produit->image ?>">

            <div class="card-body">
            <h3><?= ($produit->titre); ?></h3>
              <p class="card-text"><?= substr($produit->designation_med, 0, 200); ?></p>
              
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">Acheter</button>
                </div>
                <small class="text-muted"><?= $produit->prix ?> €</small>
              </div>
            </div>
          </div>
        </div>
  <?php endforeach; ?>


      </div>
    </div>
  </div>

</main>

  </body>
</html>
