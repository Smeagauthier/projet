//FICHIER UTILISE AU COURS
$(document).ready(function () {

    //traitement de la mise dans le panier à partir de la fenêtre modale info_projet.php
    $('#clic_panier').click(function () {
        //un effet blink sur le panier lorsque cliqué
        $(this).fadeOut(200).fadeIn(200);
        //on relève la quantité sélectionnée dans la liste déroulante
        //on récupère l'id du produit
        var id = $(".info_projet").data('id');
        //ajax : on place dans un panier (au moins temporaire)
        //...

    });

    $(".info_projet").click(function () {
        var id = $(this).data('id');//get the id of the selected button
        var parametre = "id_projet=" + id;
        var retour = $.ajax({
            type: 'GET',
            data: parametre,
            dataType: 'json',
            url: "./admin/lib/php/ajax/ajaxInfoProduit.php",
            success: function (data) {
                console.log(data);
                $('.modal-title').html("<b style=\"color: #99ccff;\">" + data[0].nom_projet + "</b>");
                $('.modal-body').html("<br>" + data[0].description + "</b></br></br> <i class=\"fas fa-bullseye\"></i><b> Objectif : </b>" + data[0].objectif + "</br><i class=\"fas fa-hourglass-start\"></i><b> Temps restant : </b>" + data[0].temps);
            },
            fail: function () {
                console.log("fail");
            }
        });
    });

    //blur : perte de focus
    $('#reference').blur(function () {
        var ref = $(this).val();
        if (ref != '') {
            var parametre = "ref=" + ref;
            $.ajax({
                type: 'GET',
                data: parametre,
                dataType: 'json',
                url: './lib/php/ajax/ajaxRechercheProjet.php',
                success: function (data) {

                    console.log(data);
                    $('#nom_projet').val(data[0].nom_projet);

                    if ($('#nom_projet').val() != '') {

                        $('#inserer').hide();
                        $('#editer').show();
                    } else {

                        $('#editer').hide();
                        $('#inserer').show();
                    }

                    $('#description').val(data[0].description);
                    $('#proprietaire').val(data[0].proprietaire);
                    $('#id_projet').val(data[0].id_projet);
                    $('#objectif').val(data[0].objectif);
                    $('#temps').val(data[0].temps);
                    $('#image').val(data[0].image);

                }
            });
            $('#id_projet').click(function () {
                $('#id_projet').val('');
                $('#nom_projet').val('');
                $('#proprietaire').val('');
                $('#description').val('');
                $('#temps').val('');
                $('#objectif').val('');
                $('#image').val('');
            });
        }
    });


    //comment récupérer la valeur dans un input
    $('#recup').blur(function () {
        var recup = $(this).val(); //récupération des valeurs dans un formulaire
        //alert(recup);
    });

    //utilisé dans admin/gestion_projets.php
    $('span[id]').click(function () {
        //text() : récupérer le contenu quand ce n'est pas un champ de formulaire
        //val() : contenu d'un champ de formulaire
        //récupération du contenu d'origine
        var valeur1 = $.trim($(this).text());
        //récupération des attributs name et id de la zone cliquée
        var ident = $(this).attr("id"); //valeur de l'id
        var name = $(this).attr("name"); //champ à modifier
        //alert("ident  = "+ident+" et name = "+name);
        $(this).blur(function () {
            var valeur2 = $.trim($(this).text());
            //alert("valeur 1 : "+valeur1+ " valeur2 : "+valeur2);
            if (valeur1 != valeur2) {
                //écriture des paramètres de l'URL
                var parametre = 'champ=' + name + '&id=' + ident + '&nouveau=' + valeur2;
                //alert(parametre);
                $.ajax({
                    type: 'GET',
                    data: parametre,
                    dataType: 'text',
                    url: './lib/php/ajax/ajaxUpdateProjet.php',
                    success: function (data) {
                        console.log(data);
                    }
                });
            }
        });

    });


    $('#submit_id').remove();
    // traitement ajax zone <input> dans jquery.php
    $('#id').blur(function () {
        //on relève la valeur entrée dans l'input
        var id = $(this).val(); //val(): uniquement pour les inputs
        // alert("id : "+id);
        var parametre = "id_projet=" + id;
        $.ajax({
            type: 'GET',
            data: parametre, // ce qui est envoyé à ajaxProduitDetail
            dataType: 'json',
            url: './admin/lib/php/ajax/ajaxDetailProduit.php',
            success: function (data) { // data ce qui est reçu de ajaxProduitDetail
                //console.log(data);
                $('#id_projet').html(data[0].description);
            }
        });
    });


    $('#choix_projet').change(function () {
        var attribut = $(this).attr('name');
        var id = $(this).val();
        var parametre = "id_projet=" + id;
        // alert("id : "+id);
        $.ajax({
            type: 'GET',
            data: parametre, // ce qui est envoyé à ajaxProduitDetail
            dataType: 'json',
            url: './admin/lib/php/ajax/ajaxDetailProduit.php',
            success: function (data) { // data ce qui est reçu de ajaxProduitDetail
                //console.log(data);
                $('#id_projet').html(data[0].description);
            }
        });
    });


});