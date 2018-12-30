

var accept_chance,o,result,jroll,shittah;
accept_chance=0;o=0;result="";jroll=floor(random(100))+1;shittah=false;

accept_chance+=(obj_controller.marines*0.00375);
accept_chance+=(obj_controller.command*0.00375);
repeat(4){o+=1;
    if (obj_ini.adv[o]="Daemon Binders") then accept_chance+=2;
    if (obj_ini.dis[o]="Suspicious") then accept_chance+=1;
    if (obj_ini.adv[o]="Psyker Abundance") then accept_chance+=1;
    
    if (obj_ini.adv[o]="Reverent Guardians") then accept_chance-=2;
    if (obj_ini.dis[o]="Never Forgive") then accept_chance-=2;
    if (obj_ini.adv[o]="Enemy: Fallen"){accept_chance-=999;result="fail_fallen";}
    if (obj_ini.dis[o]="Shitty Luck") then shittah=true;
}
if (string_count("|CPF|",obj_controller.useful_info)>0) then result="fail_angry";
if (string_count("CHTRP2|",obj_controller.useful_info)>0) then result="fail";

if (accept_chance<3) and (result="") then result="fail";
if (accept_chance>=3) and (result=""){
    accept_chance=round(accept_chance*15);
    if (shittah=true) then accept_chance-=20;
    
    if (jroll<=accept_chance) then result="success";
    if (jroll>accept_chance) then result="success_trap";
}


if (result="success") or (result="success_trap"){
    // Determine star, planet, and p_problem number here
    var that_star,that_planet,that_title;
    that_star=0;that_planet=0;that_title="";
    
    with(obj_temp8){instance_destroy();}
    with(obj_star){
        var yeah,ii;yeah=0;ii=0;
        repeat(4){ii+=1;
            if (p_feature[ii]!=""){
                if (string_count("WL10",p_feature[ii])>0) then yeah=ii;
            }
        }
        if (yeah>0) then repeat(yeah){instance_create(x,y,obj_temp8);}
    }
    if (instance_exists(obj_temp8)){
        that_star=instance_nearest(obj_temp8.x,obj_temp8.y,obj_star);
        that_planet=instance_number(obj_temp8);
        that_title=string(that_star.name)+" "+scr_roman(that_planet);
        with(obj_temp8){instance_destroy();}
    }
    with(obj_temp8){instance_destroy();}
    
    if (!instance_exists(that_star)) then diplo_text="[Error: No WL10 planet feature found.]";
    if (instance_exists(that_star)){
        var ii,fprob;ii=0;fprob=0;
        repeat(4){
            if (fprob=0){ii+=1;
                if (that_star.p_problem[that_planet,ii]=""){
                    that_star.p_problem[that_planet,ii]="meeting";
                    if (result="success_trap") then that_star.p_problem[that_planet,ii]="meeting_trap";
                    that_star.p_timer[that_planet,ii]=36;
                    fprob=ii;
                }
            }
        }
        
        var rando,new;rando=choose(1,2);
        if (rando=1) then diplo_text+="A proposal that needs further consideration and some negotiation.  Meet me at "+string(that_title)+" and we shall resolve this.";
        if (rando=2) then diplo_text+="Interesting. I shall be at "+string(that_title)+" and, if you are sincere, you will come to me and we can take this proposal to its logical conclusion.";
        scr_event_log("","Chaos Lord "+string(obj_controller.faction_leader[10])+" agrees to meet with you on "+string(that_title)+" to discuss an alliance.");
        new=instance_create(that_star.x+16,that_star.y-24,obj_star_event);
    }
    
}
if (result="fail"){
    var rando;rando=choose(1,2);
    if (rando=1) then diplo_text+="I would not assist you in slitting your own throat, it would hardly be worth my effort. Knowing this, why would you expect me to aid you?";
    if (rando=2) then diplo_text+="A mouse does not invite himself to the table of a dragon. You should learn from it and, if you work hard, perhaps one day you will be almost as insignificant.";
}
if (result="fail_fallen"){
    var rando;rando=choose(1,2);
    if (rando=1) then diplo_text+="You must think that the servants of Chaos have no memory and no eyes. I assure we have both and know that you would be useless as an ally.";
    if (rando=2) then diplo_text+="You may be unclear on how warfare works; You are my foe, however pathetic you might be, and foes do not enter into alliances.";
}
if (result="fail_angry"){
    var rando;rando=choose(1,2);
    if (rando=1) then diplo_text+="You have slain my servants, blunted the tools with which I carve my will into the universe and now you believe I will embrace you as an ally? I think not.";
    if (rando=2){diplo_text+="Never forget, never forgive. Whatever else you have done, you have acted against me in the past and I do not forgive such transgressions. Away with you.";force_goodbye=1;}
}