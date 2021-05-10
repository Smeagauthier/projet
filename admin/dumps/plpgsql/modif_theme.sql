create or replace function modif_substituant(integer, text) returns integer    
as 
'
	declare 
	  f_id_theme alias for $1;
	  f_nom_theme alias for $2;
	  id integer;
	  
	begin
	  select into id id_theme from bp_theme where id_theme=f_id_theme;
	  if not found
	  then
		return 0;
	  else
		update bp_theme set nom_theme=f_nom_theme where id_theme=id;
		return 1;
	  end if;
	end;
'
language plpgsql;