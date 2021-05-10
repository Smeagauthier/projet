create or replace view vue_produits_cat as select
bp_produit.id_produit,bp_produit.nom_produit,bp_produit.photo,bp_produit.prix, bp_produit.stock,bp_produit.description,
bp_type.id_type,bp_type.nom_type,bp_categorie.id_cat,bp_categorie.nom_cat 
from bp_type, bp_produit,bp_categorie
where bp_type.id_type = bp_produit.id_type
and bp_produit.id_cat = bp_categorie.id_cat;




