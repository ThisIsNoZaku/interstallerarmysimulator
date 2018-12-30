
// These are the new variables that are being read, for the new creation
// They will also have to be loaded and saved
// Worry about that later

/*
chapter="Unnamed";
chapter_string="Unnamed";
icon=1;icon_name="da";custom=0;
founding=1;
fleet_type=1;
strength=5;cooperation=5;
purity=5;stability=5;
var i;i=-1;repeat(6){i+=1;adv[i]="";adv_num[i]=0;dis[i]="";dis_num[i]=0;}
homeworld="Temperate";homeworld_name=scr_star_name();
recruiting="Death";recruiting_name=scr_star_name();
flagship_name=scr_ship_name("imperial");
recruiting_exists=1;
homeworld_exists=1;
homeworld_rule=1;
aspirant_trial="Blood Duel";
discipline="default";

battle_cry="For the "+string(obj_img.king_title);

main_color=1;secondary_color=1;trim_color=1;
pauldron2_color=1;pauldron_color=1;// Left/Right pauldron
lens_color=1;weapon_color=1;col_special=0;trim=1;

hapothecary=scr_marine_name();
hchaplain=scr_marine_name();
clibrarian=scr_marine_name();
fmaster=scr_marine_name();
recruiter=scr_marine_name();
admiral=scr_marine_name();

equal_specialists=0;
load_to_ships=2;

successors=0;

mutations=0;mutations_selected=0;
preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;

disposition[0]=0;
disposition[1]=0;// Prog
disposition[2]=0;// Imp
disposition[3]=0;// Mech
disposition[4]=0;// Inq
disposition[5]=0;// Ecclesiarchy
disposition[6]=0;// Astartes
disposition[7]=0;// Reserved

chapter_master_name=scr_marine_name();
chapter_master_melee=1;
chapter_master_ranged=1;
chapter_master_specialty=2;
*/










progenitor=obj_creation.founding;
successors=obj_creation.successors;
homeworld_rule=obj_creation.homeworld_rule;


// Initializes all of the marine/vehicle/ship variables for the chapter.

techs=20;epistolary=5;apothecary=6;codiciery=6;lexicanum=10;terminator=30;veteran=70;
second=100;third=100;fourth=100;fifth=100;sixth=100;seventh=100;eighth=100;ninth=100;tenth=100;
assault=20;siege=0;devastator=20;

recruit_trial=obj_creation.aspirant_trial;

// show_message(instance_number(obj_controller));

global.chapter_name=obj_creation.chapter;
global.founding=obj_creation.founding;
global.founding_secret="";
global.game_seed=floor(random(99999999))+string_to_integer(global.chapter_name)+string_to_integer(obj_creation.chapter_master_name);

use_custom_icon=0;
if (string_count("custom",obj_creation.icon_name)>0){
    use_custom_icon=global.game_seed;
    
    var ta,na;
    ta=string(obj_creation.custom_icon)+".png";
    na=string(global.game_seed)+".png";
    
    /* if (file_exists(working_directory + "\icons_save\"+string(ta))){
        file_copy(working_directory + "\icons\"+string(ta),working_directory + "\icons_save\"+string(na));
    }*/
}




if (progenitor=10){// Pretty sure that's random?
    var heh;heh=floor(random(17))+1;
    
    if (heh=1) then global.founding_secret="Dark Angels";
    if (heh=2) then global.founding_secret="Emperor's Children";
    if (heh=3) then global.founding_secret="Iron Warriors";
    if (heh=4) then global.founding_secret="White Scars";
    if (heh=5) then global.founding_secret="Space Wolves";
    if (heh=6) then global.founding_secret="Imperial Fists";
    if (heh=7) then global.founding_secret="Night Lords";
    if (heh=8) then global.founding_secret="Blood Angels";
    if (heh=9) then global.founding_secret="Iron Hands";
    if (heh=10) then global.founding_secret="World Eaters";
    if (heh=11) then global.founding_secret="Ultramarines";
    if (heh=12) then global.founding_secret="Death Guard";
    if (heh=13) then global.founding_secret="Thousand Sons";
    if (heh=14) then global.founding_secret="Black Legion";
    if (heh=15) then global.founding_secret="Word Bearers";
    if (heh=16) then global.founding_secret="Salamanders";
    if (heh=17) then global.founding_secret="Raven Guard";
}




company_title[0]="";
var i;i=0;repeat(40){i+=1;company_title[i]=obj_creation.company_title[i];}





home_name=obj_creation.homeworld_name;obj_creation.restart_home_name=home_name;
chapter_name=obj_creation.chapter;
// fortress_name="";
flagship_name=obj_creation.flagship_name;obj_creation.restart_flagship_name=flagship_name;
sector_name=scr_sector_name();
icon=obj_creation.icon;
icon_name=obj_creation.icon_name;
man_size=0;
psy_powers=obj_creation.discipline;

strin=string(obj_creation.adv[1])+string(obj_creation.adv[2])+string(obj_creation.adv[3])+string(obj_creation.adv[4]);
strin2=string(obj_creation.dis[1])+string(obj_creation.dis[2])+string(obj_creation.dis[3])+string(obj_creation.dis[4]);

progenitor_disposition=obj_creation.disposition[1];
astartes_disposition=obj_creation.disposition[6];
imperium_disposition=obj_creation.disposition[2];
guard_disposition=obj_creation.disposition[2];
inquisition_disposition=obj_creation.disposition[4];
ecclesiarchy_disposition=obj_creation.disposition[5];
mechanicus_disposition=obj_creation.disposition[3];
other1_disposition=0;
other1="";

tolerant=0;var o;o=0;repeat(4){o+=1;if (obj_creation.dis[o]="Tolerant") then tolerant=1;adv[o]=obj_creation.adv[o];dis[o]=obj_creation.dis[o];}

battle_barges=0;
strike_cruisers=0;
gladius=0;hunters=0;

recruiting_type=obj_creation.recruiting;
aspirant_trial=obj_creation.aspirant_trial;
recruiting_name=obj_creation.recruiting_name;
home_type=obj_creation.homeworld;
home_name=obj_creation.homeworld_name;
fleet_type=obj_creation.fleet_type;



// if not custom


if (obj_creation.fleet_type!=1){
    battle_barges=1;
    strike_cruisers=6;
    gladius=7;
    hunters=3;
    // obj_controller.fleet_type="Fleet";
}
if (obj_creation.fleet_type=1){
    strike_cruisers=8;
    gladius=7;
    hunters=3;
    // obj_controller.fleet_type="Homeworld";
}
    
if (obj_creation.custom=0){
    if (obj_creation.fleet_type!=1){
        flagship_name=obj_creation.flagship_name;
        battle_barges=1;
        strike_cruisers=6;
        gladius=7;
        hunters=3;
    }
    if (obj_creation.fleet_type=1){
        strike_cruisers=8;
        gladius=7;
        hunters=3;
        
        if (global.chapter_name="Dark Angels") then battle_barges+=1;
    }
    if (obj_creation.fleet_type=3){
        if (global.chapter_name="Lamenters"){
            strike_cruisers=1;
            gladius=3;
            hunters=1;
        }
        if (global.chapter_name="Blood Ravens"){
            battle_barges=1;
        }
    }
    if (global.chapter_name!="Lamenters") and (global.chapter_name!="Doom Benefactors") and (global.chapter_name!="Blood Ravens") then battle_barges+=2;
}


var i, v;i=-1;v=0;
/*repeat(110){i+=1;
    ship[i]="";ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;
    ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;ship_location[i]="";ship_shields[i]=0;
    ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
    ship_front_armor[i]=0;ship_other_armor[i]=0;ship_weapons[i]=0;ship_shields[i]=0;
    ship_wep[i,0]="";ship_wep_facing[i,0]="";ship_wep_condition[i,0]="";
    ship_wep[i,1]="";ship_wep_facing[i,1]="";ship_wep_condition[i,1]="";
    ship_wep[i,2]="";ship_wep_facing[i,2]="";ship_wep_condition[i,2]="";
    ship_wep[i,3]="";ship_wep_facing[i,3]="";ship_wep_condition[i,3]="";
    ship_wep[i,4]="";ship_wep_facing[i,4]="";ship_wep_condition[i,4]="";
    ship_wep[i,5]="";ship_wep_facing[i,5]="";ship_wep_condition[i,5]="";
    ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
}*/

var ship_names;ship_names="";

if (battle_barges>=1) then repeat(battle_barges){v+=1;
    if (flagship_name!="") and (v=1) then ship[v]=flagship_name;
    if (flagship_name="") or (v>1) then ship[v]=scr_ship_name("imperial");
    ship_uid[v]=floor(random(99999999))+1;
    ship_owner[v]=1;ship_class[v]=string(obj_img.ship[1,1]);ship_size[v]=3;ship_location[v]="home";
    ship_leadership[v]=100;ship_hp[v]=1200;ship_maxhp[v]=1200;
    ship_conditions[v]="";ship_speed[v]=20;ship_turning[v]=45;
    ship_front_armor[v]=6;ship_other_armor[v]=6;ship_weapons[v]=5;ship_shields[v]=12;
    ship_wep[v,1]="Weapons Battery";ship_wep_facing[v,1]="left";ship_wep_condition[v,1]="";
    ship_wep[v,2]="Weapons Battery";ship_wep_facing[v,2]="right";ship_wep_condition[v,2]="";
    ship_wep[v,3]="Thunderhawk Launch Bays";ship_wep_facing[v,3]="special";ship_wep_condition[v,3]="";
    ship_wep[v,4]="Torpedo Tubes";ship_wep_facing[v,4]="front";ship_wep_condition[v,4]="";
    ship_wep[v,5]="Bombardment Cannons";ship_wep_facing[v,5]="most";ship_wep_condition[v,5]="";
    ship_capacity[v]=600;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=3;
    ship_names+=string(ship[v])+"|";
}

repeat(strike_cruisers){v+=1;
    ship[v]=scr_ship_name("imperial");ship_owner[v]=1;ship_class[v]=string(obj_img.ship[1,2]);ship_size[v]=2;
    ship_uid[v]=floor(random(99999999))+1;
    ship_leadership[v]=100;ship_hp[v]=600;ship_maxhp[v]=600;ship_location[v]="home";
    ship_conditions[v]="";ship_speed[v]=25;ship_turning[v]=90;
    ship_front_armor[v]=6;ship_other_armor[v]=6;ship_weapons[v]=4;ship_shields[v]=6;
    ship_wep[v,1]="Weapons Battery";ship_wep_facing[v,1]="left";ship_wep_condition[v,1]="";
    ship_wep[v,2]="Weapons Battery";ship_wep_facing[v,2]="right";ship_wep_condition[v,2]="";
    ship_wep[v,3]="Thunderhawk Launch Bays";ship_wep_facing[v,3]="special";ship_wep_condition[v,3]="";
    ship_wep[v,4]="Bombardment Cannons";ship_wep_facing[v,4]="most";ship_wep_condition[v,4]="";
    ship_capacity[v]=250;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v,5]=1;
    repeat(5){if (string_count(ship[v],ship_names)!=0) then ship[v]=scr_ship_name("imperial");}
    ship_names+=string(ship[v])+"|";
}

repeat(gladius){v+=1;// Single weapon battery has 25% more damage than the hunter class destroyer
    ship[v]=scr_ship_name("imperial");ship_owner[v]=1;ship_class[v]=string(obj_img.ship[1,3]);ship_size[v]=1;
    ship_uid[v]=floor(random(99999999))+1;
    ship_leadership[v]=100;ship_hp[v]=200;ship_maxhp[v]=200;ship_location[v]="home";
    ship_conditions[v]="";ship_speed[v]=30;ship_turning[v]=90;
    ship_front_armor[v]=5;ship_other_armor[v]=5;ship_weapons[v]=1;ship_shields[v]=1;
    ship_wep[v,1]="Weapons Battery";ship_wep_facing[v,1]="most";ship_wep_condition[v,1]="";
    ship_capacity[v]=30;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=1;
    repeat(5){if (string_count(ship[v],ship_names)!=0) then ship[v]=scr_ship_name("imperial");}
    ship_names+=string(ship[v])+"|";
}

repeat(hunters){v+=1;
    ship[v]=scr_ship_name("imperial");ship_owner[v]=1;ship_class[v]=string(obj_img.ship[1,4]);ship_size[v]=1;
    ship_uid[v]=floor(random(99999999))+1;
    ship_leadership[v]=100;ship_hp[v]=200;ship_maxhp[v]=200;ship_location[v]="home";
    ship_conditions[v]="";ship_speed[v]=35;ship_turning[v]=90;
    ship_front_armor[v]=5;ship_other_armor[v]=5;ship_weapons[v]=2;ship_shields[v]=1;
    ship_wep[v,1]="Torpedoes";ship_wep_facing[v,1]="front";ship_wep_condition[v,1]="";
    ship_wep[v,2]="Weapons Battery";ship_wep_facing[v,2]="most";ship_wep_condition[v,2]="";
    ship_capacity[v]=25;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=1;
    repeat(5){if (string_count(ship[v],ship_names)!=0) then ship[v]=scr_ship_name("imperial");}
    ship_names+=string(ship[v])+"|";
}

var j,f;j=0;f=0;
repeat(battle_barges+strike_cruisers+gladius+hunters){f+=1;j=0;    
    repeat(30){j+=1;if (ship_uid[f]=ship_uid[j]) and (f!=j) then ship_uid[j]=floor(random(99999999))+1;}
}







// :D :D :D
master_tau=0;master_battlesuits=0;master_kroot=0;master_tau_vehicles=0;
master_ork_boyz=0;master_ork_nobz=0;master_ork_warboss=0;master_ork_vehicles=0;
master_heretics=0;master_chaos_marines=0;master_lesser_demons=0;master_greater_demons=0;master_chaos_vehicles=0;
master_gaunts=0;master_warriors=0;master_carnifex=0;master_synapse=0;master_tyrant=0;master_gene=0;
master_avatar=0;master_farseer=0;master_autarch=0;master_eldar=0;master_aspect=0;master_eldar_vehicles=0;
master_necron_overlord=0;master_destroyer=0;master_necron=0;master_wraith=0;master_necron_vehicles=0;master_monolith=0;
master_special_killed="";

check_number=5;
year_fraction=0;// 84 per turn
if (obj_creation.chapter_year=0) then year=735;
if (obj_creation.chapter_year!=0) then year=obj_creation.chapter_year;
millenium=41;

var company;company=0;
var techs, epistolary, apothecary, chaap, codiciery, lexicanum, terminator, veteran, whirlwind;
var second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth;
var assult,siege;temp1=0;temp2=0;
var size_relative, k, temp1, temp2, i, v, t;k=0;i=0;v=0;
techs=20;epistolary=4;apothecary=6;codiciery=6;lexicanum=10;terminator=10;veteran=89;
second=100;third=100;fourth=100;fifth=100;sixth=100;seventh=100;eighth=100;ninth=100;tenth=100;
assault=20;siege=0;devastator=20;chaap=1;

whirlwind=4;

specials=0;firsts=0;seconds=0;thirds=0;fourths=0;fifths=0;
sixths=0;sevenths=0;eighths=0;ninths=0;tenths=0;

strin=obj_creation.adv[1]+obj_creation.adv[2]+obj_creation.adv[3]+obj_creation.adv[4];
strin2=obj_creation.dis[1]+obj_creation.dis[2]+obj_creation.dis[3]+obj_creation.dis[4];

preomnor=obj_creation.preomnor;voice=obj_creation.voice;doomed=obj_creation.doomed;lyman=obj_creation.lyman;omophagea=obj_creation.omophagea;
ossmodula=obj_creation.ossmodula;membrane=obj_creation.membrane;zygote=obj_creation.zygote;betchers=obj_creation.betchers;
catalepsean=obj_creation.catalepsean;secretions=obj_creation.secretions;occulobe=obj_creation.occulobe;mucranoid=obj_creation.mucranoid;

/*techs=20;epistolary=5;apothecary=6;codiciery=6;lexicanum=10;terminator=30;veteran=30;
second=9;third=9;fourth=9;fifth=9;sixth=9;seventh=9;eighth=9;ninth=9;tenth=10;
assault=2;siege=0;devastator=2;*/

var yep,o,psyky;psyky=0;

o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Tech-Brothers") then yep=1;}if (yep=1){techs+=10;tenth-=10;}
o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Melee Enthusiasts") then yep=1;}if (yep=1){assault=30;}
o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Siege Masters") then yep=1;}if (yep=1) then siege=1;
o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Crafters") then yep=1;}if (yep=1){techs+=5;terminator+=5;tenth-=10;}
o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Psyker Abundance") then yep=1;}if (yep=1){tenth-=10;epistolary+=2;codiciery+=3;lexicanum+=5;psyky=1;}
var intolerant;intolerant=0;
o=0;yep=0;repeat(4){o+=1;if (obj_creation.dis[o]="Psyker Intolerant") then yep=1;}if (yep=1){epistolary=0;codiciery=0;lexicanum=0;veteran+=10;tenth+=10;intolerant=1;}
o=0;yep=0;repeat(4){o+=1;if (obj_creation.dis[o]="Sieged") then yep=1;}
if (yep=1){
    techs-=10;epistolary-=3;apothecary-=4;codiciery-=3;lexicanum-=5;terminator-=10;veteran-=50;
    second-=30;third-=30;fourth-=30;fifth-=60;sixth-=60;seventh-=60;eighth-=70;ninth-=70;tenth-=70;// 370
    assault=10;siege=0;devastator=10;
}
o=0;yep=0;repeat(4){o+=1;if (obj_creation.dis[o]="Tech-Heresy") then yep=1;}if (yep=1){techs-=10;tenth+=1;}
o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Reverent Guardians") then yep=1;}if (yep=1){chaap+=10;tenth-=10;}

// if (obj_creation.custom>0) or ((global.chapter_name="Doom Benefactors") and (obj_creation.custom=0)){
if ((progenitor>=1) and (progenitor<=10)) or ((global.chapter_name="Doom Benefactors") and (obj_creation.custom=0)){
    if (obj_creation.strength<=4) then ninth=0;
    if (obj_creation.strength<=3) then eighth=0;
    if (obj_creation.strength<=2) then seventh=0;
    if (obj_creation.strength<=1) then sixth=0;
    
    var bonus_marines,o;bonus_marines=0;o=0;
    if (obj_creation.strength>5) then bonus_marines=(obj_creation.strength-5)*50;
    
    /*repeat(20){
        if (bonus_marines>=5) and (veteran>0){bonus_marines-=5;veteran+=5;}
        if (bonus_marines>=5) and (second>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (third>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (fourth>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (fifth>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (sixth>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (seventh>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (eighth>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (ninth>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (tenth>0){bonus_marines-=5;second+=5;}
    }*/
}

if (obj_creation.custom!=0){
    var bonus_marines,o;bonus_marines=0;o=0;
    if (obj_creation.strength>5) then bonus_marines=(obj_creation.strength-5)*50;
    
    repeat(20){
        if (bonus_marines>=5) and (veteran>0){bonus_marines-=5;veteran+=5;}
        if (bonus_marines>=5) and (second>0){bonus_marines-=5;second+=5;}
        if (bonus_marines>=5) and (third>0){bonus_marines-=5;third+=5;}
        if (bonus_marines>=5) and (fourth>0){bonus_marines-=5;fourth+=5;}
        if (bonus_marines>=5) and (fifth>0){bonus_marines-=5;fifth+=5;}
        if (bonus_marines>=5) and (sixth>0){bonus_marines-=5;sixth+=5;}
        if (bonus_marines>=5) and (seventh>0){bonus_marines-=5;seventh+=5;}
        if (bonus_marines>=5) and (eighth>0){bonus_marines-=5;eighth+=5;}
        if (bonus_marines>=5) and (ninth>0){bonus_marines-=5;ninth+=5;}
        if (bonus_marines>=5) and (tenth>0){bonus_marines-=5;tenth+=5;}
    }
}




if (global.chapter_name="Salamanders"){veteran+=20;second+=20;third+=20;fourth+=20;fifth+=20;sixth+=20;seventh=0;eighth=0;ninth=0;tenth-=40;}
// if (global.chapter_name="Salamanders"){veteran+=12;second+=2;third+=2;fourth+=2;fifth+=4;sixth+=4;seventh+=4;eighth=0;ninth=0;}
if (global.chapter_name="Blood Angels"){chaap=3;apothecary=10;epistolary=6;codiciery=6;lexicanum=8;}
if (global.chapter_name="Dark Angels"){veteran=0;terminator+=80;}
if (global.chapter_name="Lamenters"){
    tenth=0;ninth=0;eighth=0;seventh=0;sixth=0;fifth=0;
    techs=10;epistolary=2;apothecary=3;codiciery=3;lexicanum=5;terminator=0;veteran+=10;
}
if (global.chapter_name="Space Wolves"){
    veteran+=40;second+=40;third+=40;fourth+=40;fifth+=40;sixth+=40;seventh+=40;eighth+=40;ninth+=40;tenth+=60;
}
if (global.chapter_name="Iron Hands"){
    terminator=0;veteran+=10;
}
if (obj_creation.custom=0) and (global.chapter_name!="Iron Hands") and (global.chapter_name!="Doom Benefactors"){
    if (veteran>=20) and (global.founding=0){veteran-=20;terminator+=20;}
    if (veteran>=10) and (global.founding!=0) and (global.chapter_name!="Lamenters"){veteran-=10;terminator+=10;}
    // if (global.chapter_name="Lamenters") then terminator=0;
    // tenth-=1;
}




icon=obj_creation.icon;
icon_name=obj_creation.icon_name;
battle_cry=obj_creation.battle_cry;
home_name=obj_creation.homeworld_name;

// This needs to be updated
main_color=obj_creation.main_color;
secondary_color=obj_creation.secondary_color;
trim_color=obj_creation.trim_color;
pauldron2_color=obj_creation.pauldron2_color;
pauldron_color=obj_creation.pauldron_color;
lens_color=obj_creation.lens_color;
weapon_color=obj_creation.weapon_color;
col_special=obj_creation.col_special;
trim=obj_creation.trim;
skin_color=obj_creation.skin_color;

/*main_color=obj_creation.main_color;
secondary_color=obj_creation.secondary_color;
lens_color=obj_creation.lens_color;
weapon_color=obj_creation.weapon_color;*/

master_name=obj_creation.chapter_master_name;
chief_librarian_name=obj_creation.clibrarian;
high_chaplain_name=obj_creation.hchaplain;
high_apothecary_name=obj_creation.hapothecary;
forge_master_name=obj_creation.fmaster;
lord_admiral_name=obj_creation.admiral;
recruiter_name=obj_creation.recruiter;

master_melee=obj_creation.chapter_master_melee;
master_ranged=obj_creation.chapter_master_ranged;

company=0;
// Initialize default marines for loadouts
i=-1;repeat(101){i+=1;
    race[100,i]=1;loc[100,i]="";name[100,i]="";role[100,i]="";wep1[100,i]="";bio[100,i]=0;lid[100,i]=0;wid[100,i]=2;spe[100,i]="";
    wep2[100,i]="";armor[100,i]="";gear[100,i]="";mobi[100,i]="";hp[100,i]=100;chaos[100,i]=0;experience[100,i]=0;
    age[100,i]=((millenium*1000)+year)-10;god[100,i]=0;if (global.chapter_name="Iron Hands") then bio[100,i]=choose(3,4,5);
}initialized=500;
// Initialize special marines
i=-1;repeat(501){i+=1;
    race[0,i]=1;loc[0,i]="";name[0,i]="";role[0,i]="";wep1[0,i]="";bio[0,i]=0;lid[0,i]=0;wid[0,i]=2;spe[0,i]="";
    wep2[0,i]="";armor[0,i]="";gear[0,i]="";mobi[0,i]="";hp[0,i]=100;chaos[0,i]=0;experience[0,i]=0;
    age[0,i]=((millenium*1000)+year)-10;god[0,i]=0;if (global.chapter_name="Iron Hands") then bio[0,i]=choose(3,4,5);
}
i=-1;repeat(101){i+=1;
    role[100,i]="";wep1[100,i]="";wep2[100,i]="";armor[100,i]="";gear[100,i]="";mobi[100,i]="";
    role[102,i]="";wep1[102,i]="";wep2[102,i]="";armor[102,i]="";gear[102,i]="";mobi[102,i]="";
}
i=99;repeat(3){i+=1;
    role[i,2]="Honor Guard";wep1[i,2]="Power Sword";wep2[i,2]=string(obj_img.gyro);armor[i,2]="Power Armor";mobi[i,2]="";gear[i,2]="";
    role[i,3]="Veteran";wep1[i,3]=string(obj_img.blade)+"sword";wep2[i,3]=string(obj_img.gyro);armor[i,3]="Power Armor";mobi[i,3]="";gear[i,3]="";
    role[i,4]="Terminator";wep1[i,4]="Power Fist";wep2[i,4]="Storm "+string(obj_img.gyro);armor[i,4]=string(obj_img.battlesuit);mobi[i,4]="";gear[i,4]="";
    role[i,5]="Captain";wep1[i,5]="Power Fist";wep2[i,5]=string(obj_img.gyro_adj)+" Pistol";armor[i,5]="Power Armor";mobi[i,5]="";gear[i,5]="";
    role[i,6]=obj_img.unit[1,6];wep1[i,6]="Close Combat Weapon";wep2[i,6]=string(obj_img.laser)+"cannon";armor[i,6]=obj_img.unit[1,6];mobi[i,6]="";gear[i,6]="";
    role[i,7]="Company Champion";wep1[i,7]="Power Sword";wep2[i,7]="Storm Shield";armor[i,7]="Power Armor";mobi[i,7]="";gear[i,7]="";
    role[i,8]="Tactical Marine";wep1[i,8]=string(obj_img.gyro);wep2[i,8]=string(obj_img.blade)+"sword";armor[i,8]="Power Armor";mobi[i,8]="";gear[i,8]="";
    role[i,9]="Devastator";wep1[i,9]="Heavy Ranged";wep2[i,9]=string(obj_img.gyro_adj)+" Pistol";armor[i,9]="Power Armor";mobi[i,9]="";gear[i,9]="";
    role[i,10]="Assault Marine";wep1[i,10]=string(obj_img.blade)+"sword";wep2[i,10]=string(obj_img.gyro_adj)+" Pistol";armor[i,10]="Power Armor";mobi[i,10]="Jump Pack";gear[i,10]="";
    role[i,12]="Scout";wep1[i,12]="Sniper Rifle";wep2[i,12]=string(obj_img.blade)+"sword";armor[i,12]="Scout Armor";mobi[i,12]="";gear[i,12]="";
    role[i,14]="Chaplain";wep1[i,14]="Power Sword";wep2[i,14]="Storm "+string(obj_img.gyro);armor[i,14]="Power Armor";gear[i,14]="Rosarius";mobi[i,14]="";
    role[i,15]="Apothecary";wep1[i,15]="Power Sword";wep2[i,15]="Storm "+string(obj_img.gyro);armor[i,15]="Power Armor";gear[i,15]="Narthecium";mobi[i,15]="";
    role[i,16]="Techmarine";wep1[i,16]="Power Axe";wep2[i,16]="Storm "+string(obj_img.gyro);armor[i,16]="Power Armor";gear[i,16]="Servo Arms";mobi[i,16]="";
    role[i,17]="Librarian";wep1[i,17]="Force Weapon";wep2[i,17]="Storm "+string(obj_img.gyro);armor[i,17]="Power Armor";gear[i,17]="Psychic Hood";mobi[i,17]="";
}// 100 is defaults, 101 is the allowable starting equipment


i=-1;repeat(21){i+=1;
    race[100,i]=obj_creation.race[100,i];
    role[100,i]=obj_creation.role[100,i];
    wep1[100,i]=obj_creation.wep1[100,i];
    wep2[100,i]=obj_creation.wep2[100,i];
    armor[100,i]=obj_creation.armor[100,i];
    gear[100,i]=obj_creation.gear[100,i];
    mobi[100,i]=obj_creation.mobi[100,i];
}



i=-1;
repeat(18){i+=1;
    if (role[100,i]!="") then scr_start_allow(i,"wep1",wep1[100,i]);
    if (role[100,i]!="") then scr_start_allow(i,"wep2",wep2[100,i]);
    if (role[100,i]!="") then scr_start_allow(i,"mobi",mobi[100,i]);
    if (role[100,i]!="") then scr_start_allow(i,"gear",gear[100,i]);
    // check for allowable starting equipment here
}


initialized=500;// How many array variables have been prepared
v=0;company=0;




// "+string(obj_img.player_army)+" Master
// This needs work
race[company,1]=1;loc[company,1]=home_name;name[company,1]=obj_creation.chapter_master_name;role[company,1]=obj_img.faction_title[1];
if (master_melee=1) then wep1[0,1]="Power Fist&DUB|";
if (master_melee=2) then wep1[0,1]="Relic Blade&MNR|";
if (master_melee=3) then wep1[0,1]="Master Crafted "+string(obj_img.hammer)
if (master_melee=4) then wep1[0,1]="Master Crafted Power Sword";
if (master_melee=5) then wep1[0,1]="Master Crafted Power Axe";
if (master_melee=6) then wep1[0,1]="Master Crafted Eviscerator";
if (master_melee=7) then wep1[0,1]="Master Crafted Force Weapon";

if (master_ranged=1) then wep2[0,1]="Integrated "+string(obj_img.gyro)+"s";
if (master_ranged=2) then wep2[0,1]="Infernus Pistol";
if (master_ranged=3) then wep2[0,1]="Master Crafted Plasma Pistol";
if (master_ranged=4) then wep2[0,1]="Master Crafted Plasma Gun";
if (master_ranged=5) then wep2[0,1]="Master Crafted Heavy "+string(obj_img.gyro);
if (master_ranged=6) then wep2[0,1]="Master Crafted Meltagun";
if (master_ranged=7) then wep2[0,1]="Storm Shield";

if (global.chapter_name="Dark Angels") then wep2[0,1]="Plasma Gun&UBL|";
if (global.chapter_name="Blood Angels") then wep1[0,1]="Master Crafted Power Axe";
if (global.chapter_name="Iron Hands"){wep1[0,1]="Power Axe&ADA|";wep2[0,1]="Storm Shield";bio[0,1]=10;}
if (global.chapter_name="Doom Benefactors") then bio[0,1]=4;

armor[company,1]="Artificer Armor";spe[company,1]="";
if (obj_creation.chapter_master_specialty=1){experience[company,1]=550;spe[company,1]+="$";}
if (obj_creation.chapter_master_specialty=2){experience[company,1]=650;spe[company,1]+="@";}
if (obj_creation.chapter_master_specialty=3){experience[company,1]=550;gear[company,1]="Psychic Hood";
    var let,letmax;let="";letmax=0;
    if (obj_creation.discipline="default"){let="D";letmax=7;}
    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
    if (obj_creation.discipline="telekinesis"){let="T";letmax=5;}
    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
    spe[company,1]+=string(let)+"0|";scr_powers_new(company,1);
}
mobi[company,1]=mobi[100,2];
if (string_count("Paragon",strin)>0) then hp[company,1]=130;

// Forge Master
race[company,2]=1;loc[company,2]=home_name;role[company,2]="Forge Master";wep1[company,2]="Conversion Beam Projector";name[company,2]=obj_creation.fmaster;
wep2[company,2]="Power Weapon";armor[company,2]="Artificer Armor";gear[company,2]="Master Servo Arms";hp[company,2]=100;chaos[company,2]=0;experience[company,2]=475;
if (global.chapter_name="Lamenters") then armor[company,2]="MK6 Corvus";bio[company,2]=8;if (global.chapter_name="Iron Hands") then bio[company,k]=10;
// Master of Sanctity (Chaplain)
race[company,3]=1;loc[company,3]=home_name;role[company,3]="Master of Sanctity";wep1[company,3]=wep1[101,14];name[company,3]=obj_creation.hchaplain;
wep2[company,3]=wep2[101,14];armor[company,3]="Artificer Armor";gear[company,3]=gear[101,14];hp[3]=100;chaos[company,3]=-100;experience[company,3]=525;
if (global.chapter_name="Lamenters") then armor[company,3]="MK6 Corvus";
// Maser of the Apothecarion (Apothecary)
race[company,4]=1;loc[company,4]=home_name;role[company,4]="Master of the Apothecarion";wep1[company,4]=wep1[101,15];name[company,4]=obj_creation.hapothecary;
wep2[company,4]=wep2[100,15];armor[company,4]="Artificer Armor";gear[company,4]=gear[101,15];hp[4]=100;chaos[company,4]=0;experience[company,4]=500;
if (global.chapter_name="Lamenters") then armor[company,4]="MK6 Corvus";
// Chief Librarian
race[company,5]=1;loc[company,5]=home_name;role[company,5]="Chief "+string(role[100,17]);wep1[company,5]=wep1[101,17];name[company,5]=obj_creation.clibrarian;
wep2[company,5]=wep2[101,17];armor[company,5]="Artificer Armor";gear[company,5]=gear[101,17];hp[5]=100;chaos[company,5]=0;experience[company,5]=550;
if (global.chapter_name="Lamenters") then armor[company,5]="MK6 Corvus";
if (obj_creation.discipline="default"){let="D";letmax=7;}
if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
if (obj_creation.discipline="telekinesis"){let="T";letmax=5;}
if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
spe[company,5]=string(let)+"0|";scr_powers_new(company,5);
k=0;commands+=6;k+=6;

if (intolerant=1){
    race[company,5]=0;loc[company,5]="";role[company,5]="";wep1[company,5]="";name[company,5]="";
    wep2[company,5]="";armor[company,5]="";gear[company,5]="";hp[5]=0;chaos[company,5]=0;experience[company,5]=0;
    man_size-=1;commands-=1;
}
man_size+=6;

// Tech Marines
repeat(techs){k+=1;commands+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,16];wep1[company,k]=wep1[101,16];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,16];armor[company,k]="Power Armor";gear[company,k]=gear[101,16];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
    bio[company,k]=4+choose(0,1,2);if (global.chapter_name="Iron Hands") then bio[company,k]=choose(7,8);
}
// Librarians
repeat(epistolary){k+=1;commands+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,17];wep1[company,k]=wep1[101,17];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,17];armor[company,k]="MK7 Aquila";gear[company,k]=gear[101,17];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=125;
    if (psyky=1) then experience[company,k]+=10;
    
    var let,letmax;let="";letmax=0;
    if (obj_creation.discipline="default"){let="D";letmax=7;}
    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
    if (obj_creation.discipline="telekinesis"){let="T";letmax=5;}
    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
    spe[company,k]+=string(let)+"0|";scr_powers_new(company,k);
}
// Codiciery
repeat(codiciery){k+=1;commands+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]="Codiciery";wep1[company,k]="Power Sword";name[company,k]=scr_marine_name();
    wep2[company,k]=string(obj_img.gyro_adj)+" Pistol";armor[company,k]="MK7 Aquila";gear[company,k]="Psychic Hood";hp[company,k]=100;chaos[company,k]=0;experience[company,k]=80;
    if (psyky=1) then experience[company,k]+=10;
    
    var let,letmax;let="";letmax=0;
    if (obj_creation.discipline="default"){let="D";letmax=7;}
    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
    if (obj_creation.discipline="telekinesis"){let="T";letmax=4;}
    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
    spe[company,k]+=string(let)+"0|";scr_powers_new(company,k);
}
// Lexicanum
repeat(lexicanum){k+=1;commands+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]="Lexicanum";wep1[company,k]=string(obj_img.gyro);name[company,k]=scr_marine_name();
    wep2[company,k]=string(obj_img.blade)+"sword";armor[company,k]="MK7 Aquila";hp[company,k]=100;chaos[company,k]=0;experience[company,k]=40;
    if (psyky=1) then experience[company,k]+=10;
    
    var let,letmax;let="";letmax=0;
    if (obj_creation.discipline="default"){let="D";letmax=7;}
    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
    if (obj_creation.discipline="telekinesis"){let="T";letmax=4;}
    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
    spe[company,k]+=string(let)+"0|";
}
// Apothecary
repeat(apothecary){k+=1;commands+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,15];armor[company,k]="MK7 Aquila";gear[company,k]=gear[101,15];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
}


// Honor Guard

var hong,yep,o;hong=0;
o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Brothers, All") then yep=1;}if (yep=1) then hong+=20;
if (progenitor=0) and (obj_creation.custom=0) then hong+=10;
if (hong>0) then repeat(10){k+=1;commands+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,2];wep1[company,k]=wep1[101,2];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,2];armor[company,k]="MK7 Aquila";gear[company,k]=gear[100,2];mobi[company,k]=mobi[100,2];hp[company,k]=100;
    chaos[company,k]=0;experience[company,k]=100;
}




specials=k;


// First Company
i=-1;company=1;
repeat(501){i+=1;
    race[company,i]=1;loc[company,i]="";name[company,i]="";role[company,i]="";wep1[company,i]="";lid[company,i]=0;wid[company,i]=2;spe[company,i]="";
    wep2[company,i]="";armor[company,i]="";hp[company,i]=100;chaos[company,i]=0;experience[company,i]=0;gear[company,i]="";mobi[company,i]="";
    age[company,i]=((millenium*1000)+year)-10;god[company,i]=0;bio[company,i]=0;if (global.chapter_name="Iron Hands") then bio[company,i]=choose(3,4,5);
}initialized=200;// How many array variables have been prepared

k=0;

if (veteran+terminator>0){
    k+=1;commands+=1;// Captain
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,5];wep1[company,k]=wep1[101,5];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,5];armor[company,k]=string(obj_img.battlesuit);hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;gear[company,k]=gear[101,5];
    if (string_count("Crafter",strin)>0) then armor[company,k]="Tartaros";
    if (terminator<=0) then armor[company,k]="MK6 Corvus";
    if (global.chapter_name="Iron Hands") then armor[company,k]=string(obj_img.battlesuit);
    if (mobi[101,5]!="") then mobi[company,k]=mobi[101,5];
    if (armor[company,k]=string(obj_img.battlesuit)) or (armor[company,k]="Tartaros"){
        man_size+=1;
        if (wep1[company,k]=string(obj_img.gyro_adj)+" Pistol") then wep1[company,k]="Storm "+string(obj_img.gyro);
        if (wep1[company,k]=string(obj_img.gyro)) then wep1[company,k]="Storm "+string(obj_img.gyro);
        if (wep2[company,k]=string(obj_img.gyro_adj)+" Pistol") then wep2[company,k]="Storm "+string(obj_img.gyro);
        if (wep2[company,k]=string(obj_img.gyro)) then wep2[company,k]="Storm "+string(obj_img.gyro);
    }
    
    if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
        var skl;skl=1;if (chaap>0){skl=2;chaap-=1;}
        repeat(skl){
            k+=1;commands+=1;// Chaplain
            race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,14];wep1[company,k]=wep1[101,14];name[company,k]=scr_marine_name();
            wep2[company,k]=wep2[101,14];armor[company,k]=string(obj_img.battlesuit);gear[company,k]=gear[101,14];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=110;
            if (string_count("Crafter",strin)>0) then armor[company,k]="Tartaros";
            if (terminator<=0) then armor[company,k]="MK6 Corvus";
            if (mobi[101,14]!="") then mobi[company,k]=mobi[101,14];
            if (armor[company,k]="Terminator") or (armor[company,k]="Tartaros") then man_size+=1;
        }
    }
    
    k+=1;commands+=1;// Apothecary
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,15];armor[company,k]=string(obj_img.battlesuit);gear[company,k]=gear[101,15];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=110;
    if (string_count("Crafter",strin)>0) then armor[company,k]="Tartaros";
    if (terminator<=0) then armor[company,k]="MK6 Corvus";
    if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
    if (armor[company,k]="Terminator") or (armor[company,k]="Tartaros") then man_size+=1;
    
    if (global.chapter_name="Space Wolves"){
        k+=1;commands+=1;// Apothecary
        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
        wep2[company,k]=wep2[101,15];armor[company,k]=string(obj_img.battlesuit);gear[company,k]=gear[101,15];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=110;
        if (string_count("Crafter",strin)>0) then armor[company,k]="Tartaros";
        if (terminator<=0) then armor[company,k]="MK6 Corvus";
        if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
        if (armor[company,k]="Terminator") or (armor[company,k]="Tartaros") then man_size+=1;
    }
    if (global.chapter_name="Iron Hands"){
        k+=1;commands+=1;
        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,16];wep1[company,k]=wep1[101,16];name[company,k]=scr_marine_name();
        wep2[company,k]=wep2[101,16];armor[company,k]="Power Armor";gear[company,k]=gear[101,16];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
        bio[company,k]=4+choose(0,1,2);if (global.chapter_name="Iron Hands") then bio[company,k]=choose(7,8);
        if (mobi[101,16]!="") then mobi[company,k]=mobi[101,16];
        if (armor[company,k]="Terminator") or (armor[company,k]="Tartaros") then man_size+=1;
    }
    
    k+=1;// Standard bearer
    race[company,k]=1;loc[company,k]=home_name;role[company,k]="Standard Bearer";wep1[company,k]="Company Standard";name[company,k]=scr_marine_name();
    wep2[company,k]="Power Fist";armor[company,k]=string(obj_img.battlesuit);hp[company,k]=100;chaos[company,k]=0;experience[company,k]=95;
    if (string_count("Crafter",strin)>0) then armor[company,k]="Tartaros";
    if (terminator<=0) then armor[company,k]="MK6 Corvus";
    if (armor[company,k]="Terminator") or (armor[company,k]="Tartaros") then man_size+=1;
    
    k+=1;man_size+=1;// Company Champion
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,7];wep1[company,k]=wep1[100,7];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[100,7];armor[company,k]=string(obj_img.battlesuit);hp[company,k]=100;chaos[company,k]=0;experience[company,k]=120;
    if (string_count("Crafter",strin)>0) then armor[company,k]="Tartaros";
    if (terminator<=0) then armor[company,k]="MK6 Corvus";
    if (armor[company,k]="Terminator") or (armor[company,k]="Tartaros") then man_size+=1;
}



if (terminator-1>0) then repeat(terminator-1){k+=1;man_size+=2;
// repeat(max(terminator-4,0)){k+=1;man_size+=2;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,4];wep1[company,k]=wep1[101,4];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,4];armor[company,k]=string(obj_img.battlesuit);hp[company,k]=100;chaos[company,k]=0;experience[company,k]=90;
    if (string_count("Crafter",strin)>0) and (k<=20) then armor[company,k]="Tartaros";
}
repeat(veteran){k+=1;man_size+=1;
    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,3];wep1[company,k]=wep1[101,3];name[company,k]=scr_marine_name();
    wep2[company,k]=wep2[101,3];armor[company,k]="MK6 Corvus";hp[company,k]=100;chaos[company,k]=0;
    experience[company,k]=80;mobi[company,k]=mobi[101,3];
}

k+=1;commands+=1;
race[company,k]=1;loc[company,k]=home_name;role[company,k]="Venerable "+string(role[100,6]);wep1[company,k]=wep1[101,6];man_size+=8;
wep2[company,k]=wep2[101,6];armor[company,k]=obj_img.unit[1,6];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=400;name[company,k]=scr_marine_name();
k+=1;commands+=1;
race[company,k]=1;loc[company,k]=home_name;role[company,k]="Venerable "+string(role[100,6]);wep1[company,k]=wep1[101,6];man_size+=8;
wep2[company,k]=wep2[101,6];armor[company,k]=obj_img.unit[1,6];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=400;name[company,k]=scr_marine_name();
// :D :D :D


repeat(4){v+=1;man_size+=10;
    veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]=string(obj_img.unit[1,18]);veh_wep1[company,v]="Storm "+string(obj_img.gyro);veh_wep2[company,v]="Storm "+string(obj_img.gyro);
    veh_upgrade[company,v]="Dozer Blades";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
}
if (global.chapter_name!="Lamenters") then repeat(6){v+=1;man_size+=20;
    veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]=string(obj_img.unit[1,21]);veh_wep1[company,v]="Twin Linked Heavy "+string(obj_img.gyro);veh_wep2[company,v]="Twin Linked Lascannon";
    veh_upgrade[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
}v=0;

firsts=k;




repeat(9){
    company+=1;
    
    // Initialize marines
    i=-1;repeat(501){i+=1;
        race[company,i]=1;loc[company,i]="";name[company,i]="";role[company,i]="";wep1[company,i]="";lid[company,i]=0;wid[company,i]=2;spe[company,i]="";
        wep2[company,i]="";armor[company,i]="";gear[company,i]="";mobi[company,i]="";hp[company,i]=100;chaos[company,i]=0;experience[company,i]=0;
        age[company,i]=((millenium*1000)+year)-10;god[company,i]=0;bio[company,i]=0;if (global.chapter_name="Iron Hands") then bio[company,i]=choose(3,4,5);
    }
    
    var company_experience, company_unit2, company_unit3, dready, rhinoy, whirly, speedy,stahp;
    company_experience=0;company_unit2="";company_unit3="";stahp=0;
    
    v=0;i=-1;k=0;v=0;dready=0;rhinoy=0;whirly=0;speedy=0;
    
    
    if (obj_creation.equal_specialists=1){
        if (company=2) then temp1=max(0,(second-(assault+devastator))-1);
        if (company=3) then temp1=max(0,(third-(assault+devastator))-1);
        if (company=4) then temp1=max(0,(fourth-(assault+devastator))-1);
        if (company=5) then temp1=max(0,(fifth-(assault+devastator))-1);
        if (company=6) then temp1=max(0,(sixth-(assault+devastator))-1);
        if (company=7) then temp1=max(0,(seventh-(assault+devastator))-1);
        if (company=8) then temp1=max(0,(eighth-(assault+devastator))-1);
        if (company=9) then temp1=max(0,(ninth-(assault+devastator))-1);
        if (company=10) then temp1=max(0,tenth-10);
        
        company_experience=(16-company)*5;
    
        // temp1=(100-(assault*devastator))*10;company_experience=(16-company)*5;
        // temp1-=1;
        
        // if (company=2){dready=1;if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=1;}
        rhinoy=8;whirly=whirlwind;speedy=2;
    }
    
    
    if (obj_creation.equal_specialists=0){
        if (company=2){
            temp1=(second-(assault+devastator));company_experience=70;company_unit2="assault";company_unit3="devastator";
            temp1-=2;
            
            dready=1;if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=1;
            rhinoy=8;whirly=whirlwind;speedy=2;
            if (second=0) then stahp=1;
        }
        if (company=3){
            temp1=(third-(assault+devastator));company_experience=60;company_unit2="assault";company_unit3="devastator";
            temp1-=2;
            // dready=2;
            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
            rhinoy=8;whirly=whirlwind;speedy=2;
            if (third=0) then stahp=1;
        }
        if (company=4){
            temp1=(fourth-(assault+devastator));company_experience=50;company_unit2="assault";company_unit3="devastator";
            temp1-=2;
            // dready=2;
            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
            rhinoy=8;whirly=whirlwind;speedy=2;
            if (fourth=0) then stahp=1;
        }
        if (company=5){
            temp1=(fifth-(assault+devastator));company_experience=40;company_unit2="assault";company_unit3="devastator";
            temp1-=2;
            // dready=2;
            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
            rhinoy=8;whirly=whirlwind;speedy=2;
            if (fifth=0) then stahp=1;
        }
        if (company=6){
            temp1=sixth;company_experience=35;company_unit2="";company_unit3="";
            temp1-=2;
            // dready=2;
            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
            rhinoy=8;whirly=whirlwind;speedy=0;
            if (sixth=0) then stahp=1;
        }
        if (company=7){
            temp1=seventh;company_experience=30;company_unit2="";company_unit3="";
            temp1-=2;
            if (obj_creation.custom=0) then dready=2;
            rhinoy=8;whirly=0;speedy=8;
            if (seventh=0) then stahp=1;
        }
        if (company=8){
            temp1=eighth;company_experience=25;company_unit2="";company_unit3="";
            temp1-=2;
            if (obj_creation.custom=0) then dready=2;
            rhinoy=2;whirly=0;speedy=2;
            if (eighth=0) then stahp=1;
        }
        if (company=9){
            temp1=ninth;company_experience=20;company_unit2="";company_unit3="";
            temp1-=2;
            if (obj_creation.custom=0) then dready=2;
            rhinoy=2;whirly=0;speedy=0;
            if (ninth=0) then stahp=1;
        }
        if (company=10){
            temp1=tenth;company_experience=5;company_unit2="";company_unit3="";
            temp1-=2;
            dready=0;rhinoy=8;whirly=0;speedy=0;
            
            // if (obj_creation.custom=0) then temp1-=5;
            
            if (tenth=0) then stahp=1;
        }
    }
    
    
    if (stahp=0){
        
        k+=1;commands+=1;// Captain
        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,5];wep1[company,k]=wep1[101,5];
        name[company,k]=scr_marine_name();
        
        if (company=4) then name[company,k]=lord_admiral_name;
        if (company=10) then name[company,k]=recruiter_name;        
        
        wep2[company,k]=wep2[101,5];
        armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]=choose("MK8 Errant","MK6 Corvus");
        hp[company,k]=100;chaos[company,k]=0;experience[company,k]=max(40,company_experience+10);
        
        if (company=8) then mobi[company,k]="Jump Pack";
        if (mobi[101,5]!="") then mobi[company,k]=mobi[101,5];
        gear[company,k]=gear[101,5];
        
        if (global.chapter_name="Iron Hands") then armor[company,k]=string(obj_img.battlesuit);
        
        if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
            var skl;skl=1;if (chaap>0){skl=2;chaap-=1;}
            repeat(skl){
                k+=1;commands+=1;// Chaplain
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,14];wep1[company,k]=wep1[101,14];name[company,k]=scr_marine_name();
                wep2[company,k]=wep2[101,14];
                armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]=choose("MK8 Errant","MK6 Corvus");
                gear[company,k]=gear[101,14];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
                if (company=8) then mobi[company,k]="Jump Pack";
                if (mobi[101,14]!="") then mobi[company,k]=mobi[101,14];
            }
        }
        
        k+=1;commands+=1;// Apothecary
        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
        wep2[company,k]=wep2[101,15];
        armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]=choose("MK8 Errant","MK6 Corvus");
        gear[company,k]=gear[101,15];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
        if (company=8) then mobi[company,k]="Jump Pack";
        if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
        
        if (global.chapter_name="Space Wolves"){
            k+=1;commands+=1;// Apothecary
            race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
            wep2[company,k]=wep2[101,15];
            armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]=choose("MK8 Errant","MK6 Corvus");
            gear[company,k]=gear[101,15];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
            if (company=8) then mobi[company,k]="Jump Pack";
            if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
        }
        if (global.chapter_name="Iron Hands"){
            k+=1;commands+=1;
            race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,16];wep1[company,k]=wep1[101,16];name[company,k]=scr_marine_name();
            wep2[company,k]=wep2[101,16];armor[company,k]="Power Armor";gear[company,k]=gear[101,16];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
            bio[company,k]=4+choose(0,1,2);if (global.chapter_name="Iron Hands") then bio[company,k]=choose(7,8);
            if (mobi[101,16]!="") then mobi[company,k]=mobi[101,16];
        }
        
        k+=1;// Standard Bearer
        race[company,k]=1;loc[company,k]=home_name;role[company,k]="Standard Bearer";wep1[company,k]=string(obj_img.blade)+"sword";name[company,k]=scr_marine_name();
        wep2[company,k]="Company Standard";
        armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
        hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience+5;if (company=8) then mobi[company,k]="Jump Pack";
        
        k+=1;man_size+=1;// Company Champion
        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,7];wep1[company,k]=wep1[100,7];name[company,k]=scr_marine_name();
        wep2[company,k]=wep2[100,7];armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
        hp[company,k]=100;chaos[company,k]=0;experience[company,k]=120;
        
        if (obj_creation.equal_specialists=1){
            company_experience=(16-company)*5;
            if (company<10){
                repeat(temp1){k+=1;man_size+=1;
                    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,8];wep1[company,k]=wep1[101,8];name[company,k]=scr_marine_name();
                    wep2[company,k]=wep2[101,8];
                    armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                    hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
                }
                repeat(assault){k+=1;man_size+=1;
                    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,10];wep1[company,k]=wep1[101,10];name[company,k]=scr_marine_name();
                    wep2[company,k]=wep2[101,10];
                    armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                    mobi[company,k]="Jump Pack";hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
                }
                repeat(devastator){k+=1;man_size+=1;
                    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,9];
                    
                    if (wep1[101,9]="Heavy Ranged") then wep1[company,k]=choose(string(obj_img.laser)+"cannon","Missile Launcher","Heavy "+string(obj_img.gyro));
                    if (wep1[101,9]!="Heavy Ranged") then wep1[company,k]=wep1[101,9];
                    name[company,k]=scr_marine_name();
                    wep2[company,k]=wep2[101,9];
                    armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                    hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
                }
            }
            if (company=10){
                repeat(temp1){k+=1;man_size+=1;
                    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,12];
                    wep1[company,k]=wep1[101,12];name[company,k]=scr_marine_name();
                    wep2[company,k]=wep2[101,12];armor[company,k]="Scout Armor";
                    hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
                }
            }
        }
        
        
        if (obj_creation.equal_specialists=0){
            if (company<8) then repeat(temp1){k+=1;man_size+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,8];wep1[company,k]=wep1[101,8];name[company,k]=scr_marine_name();
                wep2[company,k]=wep2[101,8];
                armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
            }
            if (company=8) then repeat(temp1){k+=1;man_size+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,10];wep1[company,k]=wep1[101,10];name[company,k]=scr_marine_name();
                wep2[company,k]=wep2[101,10];
                armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;mobi[company,k]="Jump Pack";
            }
            if (company=9) then repeat(temp1){k+=1;man_size+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,9];
                
                if (wep1[101,9]="Heavy Ranged") then wep1[company,k]=choose(string(obj_img.laser)+"cannon","Missile Launcher","Heavy "+string(obj_img.gyro));
                if (wep1[101,9]!="Heavy Ranged") then wep1[company,k]=wep1[101,9];
                
                name[company,k]=scr_marine_name();
                
                wep2[company,k]=wep2[101,9];
                armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
            }
            if (company=10) then repeat(temp1){k+=1;man_size+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,12];wep1[company,k]=wep1[101,12];name[company,k]=scr_marine_name();
                wep2[company,k]=wep2[101,12];armor[company,k]="Scout Armor";
                hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
            }
            if (company_unit2="assault") then repeat(assault){k+=1;man_size+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,10];wep1[company,k]=wep1[101,10];name[company,k]=scr_marine_name();
                wep2[company,k]=wep2[101,10];
                armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                mobi[company,k]=mobi[101,10];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
            }
            if (company_unit3="devastator") then repeat(devastator){k+=1;man_size+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,9];
                
                if (wep1[101,9]="Heavy Ranged") then wep1[company,k]=choose(string(obj_img.laser)+"cannon","Missile Launcher","Heavy "+string(obj_img.gyro));
                if (wep1[101,9]!="Heavy Ranged") then wep1[company,k]=wep1[101,9];
                
                name[company,k]=scr_marine_name();
                
                wep2[company,k]=wep2[101,9];
                armor[company,k]="MK7 Aquila";if (company<=2) then armor[company,k]="MK6 Corvus";
                hp[company,k]=100;chaos[company,k]=0;experience[company,k]=company_experience;
            }
        }
        
        if (dready>0){
            repeat(dready){
                k+=1;man_size+=10;commands+=1;
                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,6];wep1[company,k]="Close Combat Weapon";name[company,k]=scr_marine_name();
                wep2[company,k]=wep2[101,6];armor[company,k]=obj_img.unit[1,6];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=300;
                if (company=9) then wep1[company,k]="Missile Launcher";
            }
        }
        
        
        if (rhinoy>0) then repeat(rhinoy){v+=1;man_size+=10;
            veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]=string(obj_img.unit[1,18]);veh_wep1[company,v]="Storm "+string(obj_img.gyro);veh_wep2[company,v]="Storm "+string(obj_img.gyro);
            veh_upgrade[company,v]="Dozer Blades";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
        }
        if (whirly>0) then repeat(whirly){v+=1;man_size+=10;
            veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]=string(obj_img.unit[1,20]);veh_wep1[company,v]="Whirlwind Missiles";veh_wep2[company,v]="Storm "+string(obj_img.gyro);
            veh_upgrade[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0veh_wid[company,v]=2;;
        }
        if (speedy>0) then repeat(speedy){v+=1;man_size+=6;
            veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]=string(obj_img.unit[1,22]);veh_wep1[company,v]="Heavy "+string(obj_img.gyro);veh_wep2[company,v]="";
            veh_upgrade[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0veh_wid[company,v]=2;;
        }
        if (company=9) or (global.chapter_name="Iron Hands"){
            var predy;predy=5;
            if (global.chapter_name="Iron Hands") then predy=2;
            
            repeat(predy){v+=1;man_size+=10;
                veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]=string(obj_img.unit[1,19]);
                if (!floor(v mod 2) == 1){veh_wep1[company,v]=string(obj_img.laser)+"cannon";veh_wep2[company,v]="Lascannons";}
                if (floor(v mod 2) == 1){veh_wep1[company,v]="Autocannon";veh_wep2[company,v]="Heavy "+string(obj_img.gyro)+"s";}veh_wid[company,v]=2;
                veh_upgrade[company,v]="Dozer Blades";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;
            }
        }
        man_size+=k;
    }
    
    if (company=2) then seconds=k;
    if (company=3) then thirds=k
    if (company=4) then fourths=k;
    if (company=5) then fifths=k;
    if (company=6) then sixths=k;
    if (company=7) then sevenths=k;
    if (company=8) then eighths=k;
    if (company=9) then ninths=k;
    if (company=10) then tenths=k;

}


var c;c=0;k=0;company=0;
repeat(200){c+=1;
    if (k=0){
        if (role[0,c]!="") and (role[0,c+1]="") then k=c;
    }
}
if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
    if (chaap>0) then repeat(chaap){
        k+=1;commands+=1;// Chaplain
        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,14];wep1[company,k]=wep1[101,14];name[company,k]=scr_marine_name();
        wep2[company,k]=wep2[101,14];
        armor[company,k]="MK7 Aquila";// if (company<=2) then armor[company,k]=choose("MK8 Errant","MK6 Corvus");
        gear[company,k]=gear[101,14];hp[company,k]=100;chaos[company,k]=0;experience[company,k]=100;
        bio[company,k]=0;
        // if (company=8) then mobi[company,k]="Jump Pack";
        if (mobi[101,14]!="") then mobi[company,k]=mobi[101,14];
    }
}


// obj_controller.marines-=commands;


instance_create(0,0,obj_restart_vars);
scr_restart_variables(1);


var eqi;eqi=0;
eqi+=1;equipment[eqi]="MK7 Aquila";equipment_number[eqi]=10;equipment_type[eqi]="armor";
eqi+=1;equipment[eqi]="MK8 Errant";equipment_number[eqi]=1;equipment_type[eqi]="armor";
eqi+=1;equipment[eqi]="Scout Armor";equipment_number[eqi]=20;equipment_type[eqi]="armor";
eqi+=1;equipment[eqi]=string(obj_img.gyro);equipment_number[eqi]=20;equipment_type[eqi]="weapon";
eqi+=1;equipment[eqi]=string(obj_img.blade)+"sword";equipment_number[eqi]=20;equipment_type[eqi]="weapon";
eqi+=1;equipment[eqi]=string(obj_img.laser)+"cannon";equipment_number[eqi]=5;equipment_type[eqi]="weapon";
eqi+=1;equipment[eqi]="Heavy "+string(obj_img.gyro);equipment_number[eqi]=5;equipment_type[eqi]="weapon";
eqi+=1;equipment[eqi]="Jump Pack";equipment_number[eqi]=10;equipment_type[eqi]="gear";
eqi+=1;equipment[eqi]="Bike";equipment_number[eqi]=40;equipment_type[eqi]="vehicle";
scr_add_item(string(obj_img.gyro_adj)+" Pistol",5);
scr_add_item(wep1[101,12],20);
scr_add_item(wep2[101,12],20);
if (global.chapter_name="Iron Hands") then scr_add_item("Bionics",200);


if (string_count("Sieged",strin2)>0){
    scr_add_item("Narthecium",4);
    scr_add_item(wep1[101,15],4);
    scr_add_item(wep2[101,15],4);
    scr_add_item("Psychic Hood",4);
    scr_add_item("Force Weapon",4);
    scr_add_item("Plasma Pistol",4);
    
    o=0;yep=0;repeat(4){o+=1;if (obj_creation.adv[o]="Crafters") then yep=1;}
    if (yep=1) then scr_add_item("Tartaros",10);
    else{scr_add_item(string(obj_img.battlesuit),10);}
    
    scr_add_item("MK7 Aquila",200);
    scr_add_item(string(obj_img.gyro),200);
    scr_add_item(string(obj_img.blade)+"sword",200);
    scr_add_item("Jump Pack",80);
    scr_add_item(string(obj_img.gyro_adj)+" Pistol",80);
    scr_add_item("Heavy "+string(obj_img.gyro),40);
    scr_add_item(string(obj_img.laser)+"cannon",40);
    scr_add_item("Power Weapon",12);
    scr_add_item("Rosarius",4);
}
if (string_count("Sieged",strin2)=0){scr_add_item(obj_img.unit[1,6],6);scr_add_item("Close Combat Weapon",6);}

// man_size+=80;// bikes

// if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)>0) then equipment_number[1]=20;
// if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)=0) then equipment_number[2]=20;

if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)>0){eqi+=1;equipment[eqi]="MK3 Iron Armor";equipment_number[eqi]=round(random_range(2,12));equipment_type[eqi]="armor";}
if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)=0){eqi+=1;equipment[eqi]="MK4 Maximus";equipment_number[eqi]=round(random_range(3,18));equipment_type[eqi]="armor";}


var i;i=-1;
repeat(121){i+=1;
    slave_batch_num[i]=0;
    slave_batch_eta[i]=0;
}




var o,bloo;bloo=0;o=0;repeat(4){o+=1;if (obj_creation.dis[o]="Blood Debt") then bloo=1;}
if (bloo=1) and (instance_exists(obj_controller)){obj_controller.blood_debt=1;}
if (bloo=1){
    penitent=1;penitent_max=(obj_creation.strength*1000)+300;
    penitent_current=300;penitent_end=obj_creation.strength*48;
}
if (bloo=0) and (fleet_type=3){
    penitent=1;penitent_max=(obj_creation.strength*60);
    penitent_current=1;
    penitent_end=obj_creation.strength*5;
    
    if (obj_creation.chapter="Lamenters"){
        penitent_max=1200;penitent_end=1200;
        // obj_controller.loyalty=50;obj_controller.loyalty_hidden=50;
    }
}


// if (obj_creation.chapter="Lamenters"){
    // penitent_max=100300;penitent_end=1200;
    // obj_controller.loyalty=50;obj_controller.loyalty_hidden=50;
// }
