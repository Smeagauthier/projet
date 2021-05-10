create or replace function ajout_produit(text) returns integer
as
'
	declare f_nom_theme alias for $1;
	declare id integer;
	declare retour integer;
begin
	select into id id_theme from bp_theme where nom_theme = f_nom_theme;
	if not found
	then
		insert into bp_theme(nom_theme) values (f_nom_theme);
		retour = 1;
	else
		retour = 0;
	end if;
	return retour;
end
'
language 'plpgsql';