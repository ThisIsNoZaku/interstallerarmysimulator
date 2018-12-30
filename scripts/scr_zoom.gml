
// Zooms the view in or out when executed

var onceh;onceh=0;
if (zoomed=1) and (onceh=0){was_zoomed=1;zoomed=0;onceh=1;view_visible[0]=true;view_visible[1]=false;if (instance_exists(obj_cursor)){obj_cursor.image_xscale=1;obj_cursor.image_yscale=1;}}
if (was_zoomed=1) and (onceh=0){was_zoomed=0;zoomed=1;onceh=1;view_visible[0]=false;view_visible[1]=true;if (instance_exists(obj_cursor)){obj_cursor.image_xscale=2;obj_cursor.image_yscale=2;}}