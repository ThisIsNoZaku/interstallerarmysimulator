
// argument0: star name
// argument1: planet number
// argument2: amount

if (instance_exists(obj_star)) and (instance_exists(obj_controller)){
    obj_controller.temp[2000]=argument0;
    with(obj_temp3){instance_destroy();}
    with(obj_star){if (name=obj_controller.temp[2000]) then instance_create(x,y,obj_temp3);}
    if (instance_exists(obj_temp3)){
        var it;it=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
        if (instance_exists(it)){
            if (it.name=obj_controller.temp[2000]) and (it.dispo[argument1]<101) and (it.dispo[argument1]>=0){
                var onceh;onceh=0;
                if (it.dispo[argument1]+argument2>100) and (onceh=0){it.dispo[argument1]=100;onceh=1;}
                if (it.dispo[argument1]+argument2<0) and (onceh=0){it.dispo[argument1]=0;onceh=1;}
                if (it.dispo[argument1]+argument2>=0) and (onceh=0) and (it.dispo[argument1]+argument2<=100){it.dispo[argument1]+=argument2;onceh=1;}
            }
        }
    }
}
with(obj_temp3){instance_destroy();}

// 95-100: allied
// 101 is reserved for chapter serf governor