$(document).ready(function () { // Script JS pour avoir de l'ajax dans supprimer.php 

    function affichage_Messages() {
        setTimeout(function () {
            $.ajax({
                type: 'POST',
                url: 'affichageProduits.php',
                success: function (data) {
                    $('#affichageProduits').html(data); //id crée pour l'inséré dans une div sur supprimer.php
                }
            });
        }, 1000);
    }
    affichage_Messages();
})