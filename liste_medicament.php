<html>
<?php
require_once 'includes/head.php';
require_once './mesClasses/Cmedicaments.php';
require_once './mesClasses/Cvisiteurs.php';

include_once 'includes/nav.php';


?>

<body>
    <link rel="stylesheet" href="test.css">
    <?php



    $omedicaments = new Cmedicaments();
    $ocoll = $omedicaments->getMedicamentsTrie();
    
    ?>

    <div class="container">

        <header title="listevisiteur"></header>
        <br>
        <h1>
            <p title="tabvisiteur">Liste des Médicaments que vous devriez présenter pour
                 <?php 
                 setlocale(LC_TIME, "fr_FR", "French"); // sert a mettre le mois en francais
                 echo strftime("%B");echo (" "); //%B pour le mois strftime fonction PHP
                 echo date('Y'); // pour affficher l'annee?>.</p> 
        </h1>
        <table class="table table-condensed">

            <tbody>

        

            <?php

        foreach ($ocoll as $omedicament) {

            if(date('Ym') == $omedicament->anneeMois){

               
                
                    ?>
                        <tr class="ligneTabVisitColor">
                        
                            <td><img style="width:200px;height:200px" src="img/<?= $omedicament->image ?>"></td>
                            <td><?php echo $omedicament->designation_med ?></td>
                            <td><br><button type="button" onclick="affiche_desc('<?php echo $omedicament->desc_detaille ?>')">Description détaillée</button><br><br>
                            <a href="<?php echo $omedicament->note_perso ?>" target="_blank"><h4 id="note">Note Perso</h4></a></td>
                        </tr>
    
                    <?php
                    
    
                   
     

            } 
           
        }?>
   
            </tbody>
        </table>
    </div>

    <script src="includes/script.js"></script>
</body>

</html>