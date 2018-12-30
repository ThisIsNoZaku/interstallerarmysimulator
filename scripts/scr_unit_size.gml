
// argument0: armor
// argument1: role
// argument2: +?

var sz;sz=1;

if (argument1!=""){
    if (argument0="Tartaros") then sz+=1;
    if (string_count(obj_img.battlesuit,argument0)>0) then sz+=1;
    if (string_count(obj_img.unit[1,6],argument0)>0) then sz+=7;
    if (argument1=obj_img.faction_title[1]) then sz+=1;
    if (argument1="Harlequin Troupe") then sz+=4;
    
    if (argument1=string(obj_img.unit[1,18])) then sz+=9;
    if (argument1=string(obj_img.unit[1,19])) then sz+=9;
    if (argument1=string(obj_img.unit[1,21])) then sz+=19;
    if (argument1=string(obj_img.unit[1,22])) then sz+=5;
    if (argument1=string(obj_img.unit[1,20])) then sz+=9;
    
    if (argument2=false) then sz=sz*-1;
    return(sz);
}
