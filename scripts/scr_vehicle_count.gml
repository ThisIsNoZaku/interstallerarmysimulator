
// argument0 : role
// argument1: "" or "home" or "field" or star name+|+num|

// yarhar

var com, i, count, coom;

count=0;
i=0;
com=0;
coom=-999;


if (argument1="0") then coom=0;
if (argument1="1") then coom=1;
if (argument1="2") then coom=2;
if (argument1="3") then coom=3;
if (argument1="4") then coom=4;
if (argument1="5") then coom=5;
if (argument1="6") then coom=6;
if (argument1="7") then coom=7;
if (argument1="8") then coom=8;
if (argument1="9") then coom=9;
if (argument1="10") then coom=10;





if (coom<0) then repeat(11){i=0;
    repeat(100){
        i+=1;
        if (obj_ini.veh_role[com,i]=argument0) and (argument1="") then count+=1;
        if (obj_ini.veh_role[com,i]=argument0) and (obj_ini.veh_loc[com,i]=obj_ini.home_name) and (argument1="home") then count+=1;
        if (obj_ini.veh_role[com,i]=argument0) and (argument1="field") and ((obj_ini.loc[com,i]!=obj_ini.home_name) or (obj_ini.veh_lid[com,i]>0)) then count+=1;
        
        if (argument1!="home") and (argument1!="field"){
            if (obj_ini.veh_role[com,i]=argument0){
                var t1;t1=string(obj_ini.veh_loc[com,i])+"|"+string(obj_ini.veh_wid[com,i])+"|";
                if (argument1=t1) then count+=1;
            }
        }
        
    }
    com+=1;
}


if (coom>=0){
    i=0;com=coom;
    repeat(100){
        i+=1;if (obj_ini.veh_role[com,i]=argument0) then count+=1;
    }    
    com+=1;
}





return(count);




// temp[36]=scr_role_count("Chaplain","field");
// temp[37]=scr_role_count("Chaplain","home");
// temp[37]=scr_role_count("Chaplain","");