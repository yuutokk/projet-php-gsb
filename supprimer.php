<?php

require("mesClasses/Cproduits.php");
$oproduit = new Cproduits();
$ocollproduits = $oproduit->ocollproduit;

?>

<!DOCTYPE html>
<html>

<head>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  <title></title>
</head>

<body>
  <?php require_once 'includes/nav.php' ?>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

        <form method="post">
          <div class="mb-3">

            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Identifiant du produit</label>

              <input type="number" class="form-control" name="idproduit" required>
            </div>

            <button type="submit" name="valider" class="btn btn-primary">Supprimer le produit</button>
        </form>

      </div>

      <div id="affichageProduits"></div>

    </div>

  </div>
  </div>


</body>

</html>

<?php

if (isset($_POST['valider'])) {
  if (isset($_POST['idproduit'])) {
    if (!empty($_POST['idproduit']) && is_numeric($_POST['idproduit'])) {
      $idproduit = htmlspecialchars(strip_tags($_POST['idproduit'])); //strip_tags =  retourner la chaîne string après avoir supprimé tous les octets nuls

      try {
        $oproduit->supprimer($idproduit);
      } catch (Exception $e) {
        $e->getMessage();
      }
    }
  }
}

?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="script.js"></script>