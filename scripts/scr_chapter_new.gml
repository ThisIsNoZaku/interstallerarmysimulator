
// argument0 = chapter


var i;i=-1;
repeat(21){i+=1;world[i]="";world_type[i]="";world_feature[i]="";}
var i;i=-1;repeat(6){i+=1;adv[i]="";adv_num[i]=0;dis[i]="";dis_num[i]=0;}
points=100;maxpoints=100;custom=0;

hapothecary=scr_marine_name();
hchaplain=scr_marine_name();
clibrarian=scr_marine_name();
fmaster=scr_marine_name();
recruiter=scr_marine_name();
admiral=scr_marine_name();

i=99;
repeat(3){i+=1;// First is for the correct slot, second is for default
    role[i,2]=obj_img.unit[1,2];wep1[i,2]="Power Sword";wep2[i,2]=string(obj_img.gyro);armor[i,2]="Power Armor";
    role[i,3]=obj_img.unit[1,3];wep1[i,3]=string(obj_img.blade)+"sword";wep2[i,3]=string(obj_img.gyro);armor[i,3]="Power Armor";
    role[i,4]=obj_img.unit[1,4];wep1[i,4]="Power Fist";wep2[i,4]="Storm "+string(obj_img.gyro);armor[i,4]=string(obj_img.battlesuit);
    role[i,5]=obj_img.unit[1,5];wep1[i,5]="Power Fist";wep2[i,5]=string(obj_img.gyro_adj)+" Pistol";armor[i,5]="Power Armor";
    role[i,6]=obj_img.unit[1,6];wep1[i,6]="Close Combat Weapon";wep2[i,6]=string(obj_img.laser)+"cannon";armor[i,6]=obj_img.unit[1,6];
    role[i,8]=obj_img.unit[1,8];wep1[i,8]=string(obj_img.gyro);wep2[i,8]=string(obj_img.blade)+"sword";armor[i,8]="Power Armor";
    role[i,9]=obj_img.unit[1,9];wep1[i,9]="Heavy Ranged";wep2[i,9]=string(obj_img.gyro_adj)+" Pistol";armor[i,9]="Power Armor";
    role[i,10]=obj_img.unit[1,10];wep1[i,10]=string(obj_img.blade)+"sword";wep2[i,10]=string(obj_img.gyro_adj)+" Pistol";armor[i,10]="Power Armor";mobi[i,10]="Jump Pack";
    role[i,12]=obj_img.unit[1,12];wep1[i,12]="Sniper Rifle";wep2[i,12]=string(obj_img.blade)+"sword";armor[i,12]="Scout Armor";
    role[i,14]=obj_img.unit[1,14];wep1[i,14]="Power Sword";wep2[i,14]="Storm "+string(obj_img.gyro);armor[i,14]="Power Armor";gear[i,14]="Rosarius";
    role[i,15]=obj_img.unit[1,15];wep1[i,15]="Power Sword";wep2[i,15]="Storm "+string(obj_img.gyro);armor[i,15]="Power Armor";gear[i,15]="Narthecium";
    role[i,16]=obj_img.unit[1,16];wep1[i,16]="Power Axe";wep2[i,16]="Storm "+string(obj_img.gyro);armor[i,16]="Power Armor";gear[i,16]="Servo Arms";
    role[i,17]=obj_img.unit[1,17];wep1[i,17]="Force Weapon";wep2[i,17]="Storm "+string(obj_img.gyro);armor[i,17]="Power Armor";gear[i,17]="Psychic Hood";
}i=100;

chapter="nopw_nopw";






if (argument0="Dark Angels"){founding="N/A";points=150;
    selected_chapter=1;chapter=argument0;icon=1;icon_name="da";founding=0;fleet_type=1;strength=10;purity=8;stability=10;cooperation=5;
    homeworld="Dead";homeworld_name="The Rock";recruiting_world="Death";recruiting_name="Kimmeria";
    homeworld_exists=1;recruiting_exists=1;homeworld_rule=3;aspirant_trial="Survival of the Fittest";
    adv[1]="Enemy: Fallen";dis[1]="Never Forgive";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Dark Green";color_to_secondary="Dark Green";color_to_trim="Silver";
    color_to_pauldron="Dark Green";color_to_pauldron2="Dark Green";color_to_lens="Dark Red";
    color_to_weapon="Black";col_special=0;trim=0;
    hchaplain="Sapphon";clibrarian="Ezekial";
    battle_cry="Repent!  For tomorow you may die";
    equal_specialists=0;load_to_ships=2;successors=9;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    // disposition[1]=0;// Prog
    disposition[2]=65;disposition[3]=60;disposition[4]=60;disposition[5]=60;
    disposition[6]=50;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Azreal";chapter_master_specialty=2;
    chapter_master_melee=4;chapter_master_ranged=4;
    company_title[1]="Deathwing";
    company_title[2]="Ravenwing";
}


if (argument0="Ultramarines"){founding="N/A";points=150;
    selected_chapter=7;chapter=argument0;icon=7;icon_name="um";founding=0;fleet_type=1;strength=5;purity=10;stability=10;cooperation=10;
    homeworld="Temperate";homeworld_name="Macragge";recruiting_world="Death";recruiting_name="Parmenio";
    homeworld_exists=1;recruiting_exists=1;homeworld_rule=3;aspirant_trial="Exposure";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Ultramarine";color_to_secondary="Ultramarine";color_to_trim="Gold";
    color_to_pauldron="Ultramarine";color_to_pauldron2="Ultramarine";color_to_lens="Red";
    color_to_weapon="Red";col_special=0;
    hapothecary="Corpus Helix";hchaplain="Ortan Cassius";clibrarian="Varro Tigurius";fmaster="Fennias Maxim";admiral="Lazlo Tiberius";
    battle_cry="Courage and honor";// monastery_name="Fortress of Hera";master_name=
    equal_specialists=0;load_to_ships=2;successors=27;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    // disposition[1]=0;// Prog
    disposition[2]=80;disposition[3]=65;disposition[4]=65;disposition[5]=65;
    disposition[6]=65;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Marneus Calgar";chapter_master_melee=1;
    chapter_master_ranged=1;chapter_master_specialty=1;
    company_title[1]="Warriors of Ultramar";
    company_title[2]="Guardians of the Temple";
    company_title[3]="Scourge of the Xenos";
    company_title[4]="Defenders of Ultramar";
    company_title[5]="Wardens of the Eastern Fringe";
}



if (argument0="Space Wolves"){founding="N/A";points=150;
    selected_chapter=3;chapter=argument0;icon=3;icon_name="sw";founding=0;fleet_type=1;strength=10;purity=8;stability=5;cooperation=4;
    adv[1]="Melee Enthusiasts";dis[1]="Black Rage";dis[2]="Suspicious";
    homeworld="Ice";homeworld_name="Fenris";recruiting_world="Death";recruiting_name="Parmenio";
    homeworld_exists=1;recruiting_exists=0;homeworld_rule=2;aspirant_trial="Exposure";discipline="rune Magick";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Fenrisian Grey";color_to_secondary="Fenrisian Grey";color_to_trim="Gold";
    color_to_pauldron="Gold";color_to_pauldron2="Gold";color_to_lens="Dark Red";
    color_to_weapon="Blue";col_special=0;trim=0;
    hapothecary="Ranek Icewalker";hchaplain="Ulrik the Slayer";clibrarian="Njal Stormcaller";fmaster="Krom Dragongaz";admiral="Engir Krakendoom";
    battle_cry="For Russ and the Allfather";// monastery_name="Fortress of Hera";master_name=
    equal_specialists=0;load_to_ships=2;successors=1;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    // disposition[1]=0;// Prog
    disposition[2]=50;disposition[3]=40;disposition[4]=15;disposition[5]=15;
    disposition[6]=40;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Logan Grimnar";chapter_master_melee=5;
    chapter_master_ranged=1;chapter_master_specialty=2;
    
    company_title[1]="Champions of Fenris";company_title[2]="The Bloodmaws";company_title[3]="The Seawolves";
    company_title[4]="The Sons of Morkai";company_title[5]="The Red Moons";company_title[6]="The Deathwolves";
    company_title[7]="The Stormwolves";company_title[8]="The Ironwolves";company_title[9]="The Drakeslayers";
    company_title[10]="The Blackmanes";company_title[11]="The Firehowlers";company_title[12]="The Grimbloods";
    company_title[13]="The Wulfen";
    
    i=99;repeat(3){i+=1;
        role[i,2]="Wolf Guard";wep1[i,2]="Power Axe";wep2[i,2]=string(obj_img.gyro);armor[i,2]="Power Armor";
        role[i,3]="Veteran";wep1[i,3]=string(obj_img.blade)+"axe";
        role[i,5]="Wolf Lord";role[i,8]="Grey Hunter";role[i,9]="Long Fang";
        role[i,10]="Blood Claw";wep1[i,10]=string(obj_img.blade)+"axe";
        role[i,12]="Wolf Scout";wep1[i,12]="Sniper Rifle";wep2[i,12]=string(obj_img.blade)+"axe";
        race[i,14]=0;role[i,14]="Wolf Priest";wep1[i,14]="Power Axe";
        role[i,15]="Wolf Priest";wep1[i,15]="Power Axe";
        role[i,16]="Iron Priest";wep1[i,16]="Power Axe";
        role[i,17]="Rune Priest";wep1[i,17]="Force Weapon";
    }
}




if (argument0="Blood Angels"){founding="N/A";points=150;
    selected_chapter=5;chapter=argument0;icon=5;icon_name="ba";founding=0;fleet_type=1;strength=5;purity=9;stability=9;cooperation=7;
    adv[1]="Melee Enthusiasts";dis[1]="Black Rage";
    homeworld="Desert";homeworld_name="Baal";
    homeworld_exists=1;recruiting_exists=0;homeworld_rule=3;aspirant_trial="Blood Duel";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Red";color_to_secondary="Red";color_to_trim="Black";
    color_to_pauldron="Red";color_to_pauldron2="Red";color_to_lens="Dark Green";
    color_to_weapon="Black";col_special=0;trim=0;
    hchaplain="Astorash the Grim";clibrarian="Mephiston";fmaster="Incarael";
    battle_cry="For the "+string(obj_img.king_title)+" and Sanguinius! Death! DEATH";// monastery_name="Fortress of Hera";master_name=
    equal_specialists=0;load_to_ships=2;successors=3;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    // disposition[1]=0;// Prog
    disposition[2]=75;disposition[3]=60;disposition[4]=50;disposition[5]=60;
    disposition[6]=60;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Dante";chapter_master_melee=5;
    chapter_master_ranged=2;chapter_master_specialty=2;
    company_title[1]="Archangels";company_title[2]="The Blooded";company_title[3]="Ironhelms";
    company_title[4]="Knights of Baal";company_title[5]="Daemonbanes";company_title[6]="Eternals";
    company_title[7]="Unconquerables";company_title[8]="Bloodbanes";company_title[9]="Sunderers";
    company_title[10]="Redeemers";
    
    i=99;repeat(3){i+=1;
        role[i,2]="Sanguinary Guard";wep1[i,2]="Power Axe";wep2[i,2]=string(obj_img.gyro_adj)+" Pistol";mobi[i,2]="Jump Pack";
        role[i,15]="Sanguinary Priest";wep1[i,15]="Power Axe";
    }
}


if (argument0="Iron Hands"){founding="N/A";points=150;
    selected_chapter=6;chapter=argument0;icon=6;icon_name="ih";founding=0;fleet_type=1;strength=5;purity=8;stability=8;cooperation=2;
    adv[1]="Tech-Brothers";adv[2]="Slow and Purposeful";dis[1]="Splintered";dis[2]="Suspicious";
    homeworld="Lava";homeworld_name="Medusa";homeworld_exists=1;recruiting_exists=0;
    homeworld_rule=3;aspirant_trial="Knowledge of Self";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Black";color_to_secondary="Black";color_to_trim="Silver";
    color_to_pauldron="Black";color_to_pauldron2="Black";color_to_lens="Dark Red";
    color_to_weapon="Silver";col_special=0;trim=0;
    hchaplain="Shulgaar";clibrarian="Lydriik";fmaster="Feirros";hapothecary="Grolvoch";
    battle_cry="The flesh is weak";// monastery_name="Fortress of Hera";master_name=
    equal_specialists=1;load_to_ships=2;successors=6;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    // disposition[1]=0;// Prog
    disposition[2]=30;disposition[3]=80;disposition[4]=35;disposition[5]=30;
    disposition[6]=50;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Kardan Stronos";chapter_master_melee=3;
    chapter_master_ranged=3;chapter_master_specialty=2;
    
    company_title[1]="Clan Avernii";company_title[2]="Clan Garrsak";company_title[3]="Clan Felg";
    company_title[4]="Clan Garrsak";company_title[5]="Clan Kaargul";company_title[6]="Clan Morragul";
    company_title[7]="Clan Sorrgol";company_title[8]="Clan Borrgar";company_title[9]="Clan Ungavarr";
    company_title[10]="Clan Dorrvok";
    
    i=99;repeat(3){i+=1;
        race[i,14]=0;role[i,14]="Iron Father";role[i,16]="Iron Father";
    }
}



if (argument0="Salamanders"){founding="N/A";points=150;
    selected_chapter=8;chapter=argument0;icon=8;icon_name="sl";founding=0;fleet_type=1;strength=2;purity=8;stability=8;cooperation=10;
    adv[1]="Crafters";adv[2]="Slow and Purposeful";
    homeworld="Lava";homeworld_name="Nocturne";homeworld_exists=1;recruiting_exists=0;
    homeworld_rule=1;aspirant_trial="Apprenticeship";discipline="pyromancy";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Green";color_to_secondary="Green";color_to_trim="Copper";
    color_to_pauldron="Black";color_to_pauldron2="Black";color_to_lens="Dark Red";
    color_to_weapon="Black";col_special=0;trim=0;
    fmaster="Vulkan He'stan";
    battle_cry="Into the fires of battle!  Unto the anvil of war";// monastery_name="Fortress of Hera";master_name=
    equal_specialists=0;load_to_ships=2;successors=2;
    mutations=1;mutations_selected=1;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=1;occulobe=0;mucranoid=0;
    // disposition[1]=0;// Prog
    disposition[2]=80;disposition[3]=65;disposition[4]=65;disposition[5]=60;
    disposition[6]=60;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Tu'Shan";chapter_master_melee=3;
    chapter_master_ranged=2;chapter_master_specialty=2;
    company_title[1]="The Firedrakes";
}




if (argument0="Blood Ravens"){founding=10;points=100;
    selected_chapter=12;chapter=argument0;icon=12;icon_name="br";
    fleet_type=2;strength=5;purity=10;stability=6;cooperation=7;
    adv[1]="Scavengers";adv[2]="Psyker Abundance";dis[1]="Suspicious";
    // hapothecary="Ranek Icewalker";hchaplain="Mikelus";clibrarian="Njal Stormcaller";fmaster="Krom Dragongaz";admiral="Engir Krakendoom";
    homeworld="Dead";homeworld_name="Aurelia";flagship_name="Omnis Arcanum";
    homeworld_exists=0;recruiting_exists=1;
    recruiting_world="Death";recruiting_name="Trontiux";
    homeworld_rule=0;aspirant_trial="Knowledge of Self";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Sanguine";color_to_secondary="Sanguine";color_to_trim="Black";
    color_to_pauldron2="Bone";color_to_pauldron="Bone";color_to_lens="Green";
    color_to_weapon="Black";col_special=0;trim=1;
    battle_cry="Knowledge is power, guard it well";
    equal_specialists=0;load_to_ships=2;successors=0;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    disposition[1]=50;// Prog
    disposition[2]=40;disposition[3]=30;disposition[4]=45;disposition[5]=25;
    disposition[6]=35;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Gabriel Angelos";chapter_master_melee=3;
    chapter_master_ranged=3;chapter_master_specialty=1;
}






if (argument0="Lamenters"){founding=5;points=100;
    selected_chapter=14;chapter=argument0;icon=14;icon_name="lam";founding=5;
    fleet_type=3;strength=1;purity=10;stability=9;cooperation=10;
    adv[1]="Melee Enthusiasts";dis[1]="Shitty Luck";dis[2]="Sieged";dis[3]="Suspicious";
    homeworld="Dead";homeworld_name="Lacrima Vex";
    homeworld_exists=0;recruiting_exists=1;
    recruiting_world="Death";recruiting_name=scr_star_name();
    homeworld_rule=0;aspirant_trial="Challenge";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Gold";color_to_secondary="Gold";color_to_trim="Gold";
    color_to_pauldron2="White";color_to_pauldron="Gold";color_to_lens="Dark Red";
    color_to_weapon="Black";col_special=0;trim=1;
    battle_cry="For those we cherish, we die in Glory";
    equal_specialists=0;load_to_ships=2;successors=0;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    disposition[1]=60;// Prog
    disposition[2]=15;disposition[3]=20;disposition[4]=10;disposition[5]=25;
    disposition[6]=50;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Malakim Phoros";chapter_master_melee=2;
    chapter_master_ranged=2;chapter_master_specialty=2;
}



if (argument0="Doom Benefactors"){points=100;
    selected_chapter=135;chapter=argument0;icon=0;icon_name="eye";founding=0;scr_icon("");
    fleet_type=1;strength=1;purity=10;stability=7;cooperation=8;
    homeworld="Forge";homeworld_name="Ariana Prime";recruiting_world="Death";recruiting_name=scr_star_name();
    homeworld_exists=1;recruiting_exists=1;homeworld_rule=2;aspirant_trial="Apprenticeship";
    // Pauldron2: Left, Pauldron: Right
    color_to_main="Dark Red";color_to_secondary="Black";color_to_trim="Copper";
    color_to_pauldron="Black";color_to_pauldron2="Black";color_to_lens="Sanguine";
    color_to_weapon="Black";col_special=0;trim=1;
    hapothecary="Vaylund";
    hchaplain="Eli";
    clibrarian="Dagoth";
    fmaster="Mjenzi";
    admiral=scr_marine_name();
    battle_cry="Death to the enemy!  DEATH";// monastery_name="Fortress of Hera";master_name=
    equal_specialists=0;
    
    load_to_ships=2;
    // load_to_ships=0;
    
    successors=0;
    mutations=0;mutations_selected=0;
    preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
    zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;
    disposition[1]=60;// Prog
    disposition[2]=50;disposition[3]=40;disposition[4]=25;disposition[5]=40;
    disposition[6]=50;// Astartes
    disposition[7]=0;// Reserved
    chapter_master_name="Duke Sacerdos";chapter_master_melee=7;
    chapter_master_ranged=3;chapter_master_specialty=3;
    
    adv[1]="Paragon";
    adv[2]="Reverent Guardians";
    adv[3]="Crafters";
    dis[1]="First In, Last Out";
    
    stage=6;
}





/*
if (h=1) then it="Power Fists";
if (h=2) then it="Relic Blade";
if (h=3) then it="Master Crafted "+string(obj_img.hammer)
if (h=4) then it="Master Crafted Power Sword";
if (h=5) then it="Master Crafted Power Axe";
if (h=6) then it="Master Crafted Eviscerator";
if (h=7) then it="Master Crafted Force Weapon";

if (h=1) then it="Integrated "+string(obj_img.gyro)+"s";
if (h=2) then it="Infernus Pistol";
if (h=3) then it="Plasma Pistol";
if (h=4) then it="Plasma Gun";
if (h=5) then it="Master Crafted Heavy "+string(obj_img.gyro);
if (h=6) then it="Master Crafted Meltagun";
if (h=7) then it="Storm Shield";
*/









var i,a;i=0;a=0;
repeat(4){a+=1;i=0;
    repeat(40){i+=1;
        if (adv[a]!="") and (advantage[i]=adv[a]) then adv_num[a]=i;
        if (dis[a]!="") and (disadvantage[i]=dis[a]) then dis_num[a]=i;
    }
}



maxpoints=points;
