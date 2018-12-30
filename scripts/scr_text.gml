
// argument0: section
// argument1: key

var output,section;output="";section="";
ini_open(working_directory + "\text\Settings.ini");

if (argument0="Noun"){
    if (argument1="game_title") then obj_img.game_title=ini_read_string(argument0,argument1,"");
    if (argument1="travel") then obj_img.travel=ini_read_string(argument0,argument1,"");
    if (argument1="travel_formal") then obj_img.travel_formal=ini_read_string(argument0,argument1,"");
    if (argument1="kingdom_title") then obj_img.kingdom_title=ini_read_string(argument0,argument1,"");
    if (argument1="kingdom_title_short") then obj_img.kingdom_title_short=ini_read_string(argument0,argument1,"");
    if (argument1="kingdom_title_shortest") then obj_img.kingdom_title_shortest=ini_read_string(argument0,argument1,"");
    if (argument1="king_title") then obj_img.king_title=ini_read_string(argument0,argument1,"");
    if (argument1="king_title_formal") then obj_img.king_title_formal=ini_read_string(argument0,argument1,"");
    if (argument1="evil_prefix") then obj_img.evil_prefix=ini_read_string(argument0,argument1,"");
    if (argument1="magic_men") then obj_img.magic_men=ini_read_string(argument0,argument1,"");
    if (argument1="magic_men_plural") then obj_img.magic_men_plural=ini_read_string(argument0,argument1,"");
    
    if (argument1="real_world") then obj_img.real_world=ini_read_string(argument0,argument1,"");
    if (argument1="magic_world") then obj_img.magic_world=ini_read_string(argument0,argument1,"");
    if (argument1="church") then obj_img.church=ini_read_string(argument0,argument1,"");
    if (argument1="demon_formal") then obj_img.demon_formal=ini_read_string(argument0,argument1,"");
    if (argument1="demons_formal") then obj_img.demons_formal=ini_read_string(argument0,argument1,"");
    if (argument1="war_god") then obj_img.war_god=ini_read_string(argument0,argument1,"");
    if (argument1="pestilence_god") then obj_img.pestilence_god=ini_read_string(argument0,argument1,"");
    if (argument1="sin_god") then obj_img.sin_god=ini_read_string(argument0,argument1,"");
    if (argument1="magic_god") then obj_img.magic_god=ini_read_string(argument0,argument1,"");
    
    if (argument1="machine_god_formal") then obj_img.machine_god_formal=ini_read_string(argument0,argument1,"");
    if (argument1="machine_god") then obj_img.machine_god=ini_read_string(argument0,argument1,"");
    if (argument1="faction6_god") then obj_img.faction6_god=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_god1") then obj_img.faction7_god1=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_god2") then obj_img.faction7_god2=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_adjective") then obj_img.faction7_adjective=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_clan1") then obj_img.faction7_clan1=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_clan2") then obj_img.faction7_clan2=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_clan3") then obj_img.faction7_clan3=ini_read_string(argument0,argument1,"");
    if (argument1="faction7_clan4") then obj_img.faction7_clan4=ini_read_string(argument0,argument1,"");
    if (argument1="faction6_insult") then obj_img.faction6_insult=ini_read_string(argument0,argument1,"");
    if (argument1="faction8_philosophy") then obj_img.faction8_philosophy=ini_read_string(argument0,argument1,"");
    if (argument1="faction8_human") then obj_img.faction8_human=ini_read_string(argument0,argument1,"");
    if (argument1="faction8_leader") then obj_img.faction8_leader=ini_read_string(argument0,argument1,"");
    
    if (argument1="player_army") then obj_img.player_army=ini_read_string(argument0,argument1,"");
    if (argument1="recruit") then obj_img.recruit=ini_read_string(argument0,argument1,"");
    if (argument1="hq_ground") then obj_img.hq_ground=ini_read_string(argument0,argument1,"");
    if (argument1="hq_jail") then obj_img.hq_jail=ini_read_string(argument0,argument1,"");
    if (argument1="hq_library") then obj_img.hq_library=ini_read_string(argument0,argument1,"");
    if (argument1="hq_forge") then obj_img.hq_forge=ini_read_string(argument0,argument1,"");
    if (argument1="hq_medical") then obj_img.hq_medical=ini_read_string(argument0,argument1,"");
    if (argument1="hq_beastary") then obj_img.hq_beastary=ini_read_string(argument0,argument1,"");
    if (argument1="hq_command") then obj_img.hq_command=ini_read_string(argument0,argument1,"");
    if (argument1="head_doctor") then obj_img.head_doctor=ini_read_string(argument0,argument1,"");
    if (argument1="head_chaplain") then obj_img.head_chaplain=ini_read_string(argument0,argument1,"");
    if (argument1="head_magician") then obj_img.head_magician=ini_read_string(argument0,argument1,"");
    if (argument1="head_mechanic") then obj_img.head_mechanic=ini_read_string(argument0,argument1,"");
    if (argument1="head_admiral") then obj_img.head_admiral=ini_read_string(argument0,argument1,"");
    if (argument1="organics") then obj_img.organics=ini_read_string(argument0,argument1,"");
    if (argument1="codex") then obj_img.codex=ini_read_string(argument0,argument1,"");
    if (argument1="split") then obj_img.split=ini_read_string(argument0,argument1,"");
}
if (argument0="Faction"){
    var dammit,dammit_num;
    dammit=argument1;
    dammit_num=real(string_digits(argument1));
    
    dammit=string_replace_all(dammit,"0","");dammit=string_replace_all(dammit,"1","");
    dammit=string_replace_all(dammit,"2","");dammit=string_replace_all(dammit,"3","");
    dammit=string_replace_all(dammit,"4","");dammit=string_replace_all(dammit,"5","");
    dammit=string_replace_all(dammit,"6","");dammit=string_replace_all(dammit,"7","");
    dammit=string_replace_all(dammit,"8","");dammit=string_replace_all(dammit,"9","");
    
    if (dammit="faction") then obj_img.faction[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="faction_short") then obj_img.faction_short[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="faction_title") then obj_img.faction_title[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="faction_dude") then obj_img.faction_dude[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="faction_dudes") then obj_img.faction_dudes[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="faction_dude_formal") then obj_img.faction_dude_formal[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="faction_dudes_formal") then obj_img.faction_dudes_formal[dammit_num]=ini_read_string(argument0,argument1,"");
}
if (argument0="Division"){
    var dammit_num;dammit_num=real(string_digits(argument1));
    obj_img.d[dammit_num]=ini_read_string("Division","d"+string(dammit_num),"Division"+string(dammit_num));
    obj_img.d_tooltip[dammit_num]=ini_read_string("Division","d"+string(dammit_num)+"_tooltip","Error: The tooltip is missing.");
}
if (argument0="Mutation"){
    var dammit,dammit_num;
    dammit=argument1;
    dammit_num=real(string_digits(argument1));
    
    dammit=string_replace_all(dammit,"0","");dammit=string_replace_all(dammit,"1","");
    dammit=string_replace_all(dammit,"2","");dammit=string_replace_all(dammit,"3","");
    dammit=string_replace_all(dammit,"4","");dammit=string_replace_all(dammit,"5","");
    dammit=string_replace_all(dammit,"6","");dammit=string_replace_all(dammit,"7","");
    dammit=string_replace_all(dammit,"8","");dammit=string_replace_all(dammit,"9","");
    
    if (dammit="mutation") then obj_img.mutation[dammit_num]=ini_read_string(argument0,argument1,"");
    if (dammit="mutation_description") then obj_img.mutation_description[dammit_num]=ini_read_string(argument0,argument1,"");
}
if (string_length(argument0)=2) or (string_length(argument0)=3){
    var dammit,dammit_num,fac,tip;
    tip=string_letters(argument1);
    
    dammit=string_letters(argument1);
    dammit_num=real(string_digits(argument1));
    fac=real(string_digits(argument0));
    
    if (tip="unit") then obj_img.unit[fac,dammit_num]=ini_read_string(argument0,argument1,"");
    if (tip="ship") then obj_img.ship[fac,dammit_num]=ini_read_string(argument0,argument1,"");
    
    // if (fac=1) then show_message("obj_img.unit["+string(fac)+","+string(dammit_num)+"] = "+string(ini_read_string(argument0,argument1,"")));
    // if (fac=1) then show_message("obj_img.unit["+string(fac)+","+string(dammit_num)+"] = string(ini_read_string("+string(argument0)+","+string(argument1)+") = "+string(ini_read_string(argument0,argument1,"")));
}
if (argument0="Weapon"){
    if (argument1="gyro") then obj_img.gyro=ini_read_string(argument0,argument1,"");
    if (argument1="gyro_adj") then obj_img.gyro_adj=ini_read_string(argument0,argument1,"");
    if (argument1="laser") then obj_img.laser=ini_read_string(argument0,argument1,"");
    if (argument1="hammer") then obj_img.hammer=ini_read_string(argument0,argument1,"");
    if (argument1="blade") then obj_img.blade=ini_read_string(argument0,argument1,"");
    if (argument1="battlesuit") then obj_img.battlesuit=ini_read_string(argument0,argument1,"");
}



if (output="") then output="error";
if (output!="") then return(output);
ini_close();
