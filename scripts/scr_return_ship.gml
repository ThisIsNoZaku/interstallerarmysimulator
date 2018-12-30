
// argument0: name of ship
// argument1: object with man_selecting
// argument2: planet number

// If an object has specially saved variables, representing marines, this code returns them to their ship after an event.
// Marines that raid never really leave their ships in-engine.  This is for random events and planetary features.


var man_size,ship_id,comp,plan,i;
i=0;ship_id=0;man_size=0;comp=0;plan=0;

/*repeat(30){
    i+=1;if (obj_ini.ship[i]=argument0) then ship_id=i;
}*/
i=0;

// Increase ship storage        ship_carrying[i]

comp=obj_controller.managing;
if (obj_controller.managing>10) then comp=0;
obj_controller.return_size=0;






repeat(140){
    i+=1;man_size=0;
    
    // if (i<100) then show_message("Man "+string(i)+" selected?: "+string(argument1.man_sel[i])+"#"+string(obj_ini.role[comp,argument1.ide[i]])+", "+string(obj_ini.armor[comp,argument1.ide[i]]));
    // if (i<100) then show_message("Man "+string(i)+" selected?: "+string(argument1.man_sel[i])+"#"+string(argument1.ide[i]));
    
    
    if (argument1.man_sel[i]>0){
        if (argument1.man[i]="man"){
            obj_ini.lid[comp,argument1.ide[i]]=argument1.man_sel[i];obj_ini.wid[comp,argument1.ide[i]]=0;
        }
        
        if (argument1.man[i]="vehicle"){
            obj_ini.veh_lid[comp,argument1.ide[i]]=argument1.man_sel[i];obj_ini.veh_wid[comp,argument1.ide[i]]=0;
        }
       
        
        if (argument1.man[i]!="vehicle") then man_size+=scr_unit_size(obj_ini.armor[comp,argument1.ide[i]],obj_ini.role[comp,argument1.ide[i]],true);
        
        if (argument1.man[i]="vehicle"){
            man_size+=scr_unit_size("",obj_ini.veh_role[comp,argument1.ide[i]],true);
            
        }
        obj_ini.ship_carrying[argument1.man_sel[i]]+=man_size;
        obj_controller.return_size+=man_size;
    }
}


// plan=instance_nearest(x,y,obj_star);
plan=obj_controller.return_object;
// Probably need to change this
plan.p_player[argument2]-=obj_controller.return_size;