
// argument0: x1
// argument1: y1
// argument2: centered?
// argument3: string

var x9,y9,wid,hei,result;
x9=0;y9=0;result=false;

wid=string_width(argument3);
hei=string_height(argument3);

if (argument2=false){
    if (mouse_x>=argument0) and (mouse_y>=argument1) and (mouse_x<argument0+wid) and (mouse_y<argument1+hei) then result=true;
}
if (argument2=true){
    x9=argument0-(wid/2);
    
    if (mouse_x>=x9) and (mouse_y>=argument1) and (mouse_x<x9+wid) and (mouse_y<argument1+hei) then result=true;
}

return(result);