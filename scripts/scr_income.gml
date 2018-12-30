
// Determines income


income_base=32;income_tribute=0;income_controlled_planets=0;
if (obj_ini.fleet_type!=1) then income_base=40;

income_home=0;
if (obj_ini.fleet_type=1) then income_home=8;// Homeworld-based income

income_fleet=0;
with(obj_p_fleet){
    obj_controller.income_fleet-=capital_number;
    obj_controller.income_fleet-=frigate_number/2;
    obj_controller.income_fleet-=escort_number/10;
}
if (obj_ini.fleet_type!=1) then obj_controller.income_fleet=round(obj_controller.income_fleet/2);

income_forge=0;
income_agri=0;
income_recruiting=0;
income_training=0;

var pid;pid=0;pid=scr_role_count(obj_ini.role[100,16],"");
if (pid>=((disposition[3]/2)+5)) then training_techmarine=0;

if (training_apothecary=1) then income_training-=1;
if (training_apothecary=2) then income_training-=2;
if (training_apothecary=3) then income_training-=3;
if (training_apothecary=4) then income_training-=4;
if (training_apothecary=5) then income_training-=6;
if (training_apothecary=6) then income_training-=12;

if (training_chaplain=1) then income_training-=1;
if (training_chaplain=2) then income_training-=2;
if (training_chaplain=3) then income_training-=3;
if (training_chaplain=4) then income_training-=4;
if (training_chaplain=5) then income_training-=6;
if (training_chaplain=6) then income_training-=12;

if (training_psyker=1) then income_training-=1;
if (training_psyker=2) then income_training-=2;
if (training_psyker=3) then income_training-=3;
if (training_psyker=4) then income_training-=4;
if (training_psyker=5) then income_training-=6;
if (training_psyker=6) then income_training-=12;

if (training_techmarine=1) then income_training-=1;
if (training_techmarine=2) then income_training-=2;
if (training_techmarine=3) then income_training-=3;
if (training_techmarine=4) then income_training-=4;
if (training_techmarine=5) then income_training-=6;
if (training_techmarine=6) then income_training-=12;



income_recruiting=(recruiting*-2)*string_count("|",obj_controller.recruiting_worlds);

tau_stars=0;if (instance_exists(obj_turn_end)) then tau_messenger+=1;

if (obj_ini.fleet_type=1){
    with(obj_star){
        if (string_count(string(obj_img.hq_ground),p_feature[1])=1){obj_controller.income+=10;instance_create(x,y,obj_temp1);}
        if (string_count(string(obj_img.hq_ground),p_feature[2])=1){obj_controller.income+=10;instance_create(x,y,obj_temp1);}
        if (owner=8) then obj_controller.tau_stars+=1;
        alarm[2]=1;
    }
}


if (obj_ini.fleet_type!=1){
    with(obj_p_fleet){
        if (action="") and (capital_number>0){
            var mine;mine=instance_nearest(x,y,obj_star);
            var i;i=0;
            repeat(4){i+=1;
                if (mine.p_owner[i]=2) or (mine.p_owner[i]=3){
                    if (mine.p_type[i]="Desert") or (mine.p_type[i]="Temperate") then obj_controller.income_home+=2*capital_number;
                    if (mine.p_type[i]="Forge") or (mine.p_type[i]="Hive") then obj_controller.income_home+=4*capital_number;
                }
            }
        }
    }
}


with(obj_star){
    var o;o=0;
    repeat(4){o+=1;
        if (dispo[o]>=100){
            if (string_count("Monas",p_feature)=0){
                obj_controller.income_controlled_planets+=1;obj_controller.income_tribute+=1;
                if (p_type[o]="Feudal") then obj_controller.income_tribute+=1;
                if (p_type[o]="Desert") or (p_type[o]="Temperate") then obj_controller.income_tribute+=2;
                if (p_type[o]="Forge") or (p_type[o]="Hive") then obj_controller.income_tribute+=3;
            }
        }
    }
}




obj_controller.alarm[4]=10;
// This tells the controller to give moolah if it is the end of the turn