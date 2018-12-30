




if (argument0=1) then with(obj_ini){
    
    // show_message(instance_number(obj_restart_vars));
    
    obj_restart_vars.restart_name=global.chapter_name;
    obj_restart_vars.restart_founding=global.founding;
    
    obj_restart_vars.restart_secret=global.founding_secret;
    obj_restart_vars.restart_title[0]="";
    var i;i=0;
    repeat(11){i+=1;obj_restart_vars.restart_title[i]=obj_ini.company_title[i];}
    
    obj_restart_vars.restart_icon=icon;
    obj_restart_vars.restart_icon_name=icon_name;
    obj_restart_vars.restart_powers=psy_powers;
    
    var ad;ad=-1;
    repeat(5){ad+=1;
        if (ad=0){obj_restart_vars.restart_adv[ad]="";obj_restart_vars.restart_dis[ad]="";}
        if (ad>0){obj_restart_vars.restart_adv[ad]=adv[ad];obj_restart_vars.restart_dis[ad]=dis[ad];}
    }
    // show_message("A: "+string(obj_restart_vars.restart_dis[1]));
    
    obj_restart_vars.restart_recruiting_type=recruiting_type;
    obj_restart_vars.restart_trial=aspirant_trial;
    obj_restart_vars.restart_recruiting_name=recruiting_name;
    obj_restart_vars.restart_home_type=home_type;
    obj_restart_vars.restart_home_name=home_name;
    obj_restart_vars.restart_fleet_type=fleet_type;
    obj_restart_vars.restart_flagship_name=obj_creation.flagship_name;
    
    obj_restart_vars.restart_recruiting_exists=obj_creation.recruiting_exists;
    obj_restart_vars.restart_homeworld_exists=obj_creation.homeworld_exists;
    obj_restart_vars.restart_homeworld_rule=obj_creation.homeworld_rule;
    
    obj_restart_vars.restart_battle_cry=obj_creation.battle_cry;
    
    obj_restart_vars.restart_main_color=obj_creation.main_color;
    obj_restart_vars.restart_secondary_color=obj_creation.secondary_color;
    obj_restart_vars.restart_trim_color=obj_creation.trim_color;
    obj_restart_vars.restart_pauldron2_color=obj_creation.pauldron2_color;
    obj_restart_vars.restart_pauldron_color=obj_creation.pauldron_color;
    obj_restart_vars.restart_lens_color=obj_creation.lens_color;
    obj_restart_vars.restart_weapon_color=obj_creation.weapon_color;
    obj_restart_vars.restart_col_special=obj_creation.col_special;
    obj_restart_vars.restart_trim=obj_creation.trim;
    obj_restart_vars.restart_skin_color=obj_creation.skin_color;
    
    obj_restart_vars.restart_hapothecary=obj_creation.hapothecary;
    obj_restart_vars.restart_hchaplain=obj_creation.hchaplain;
    obj_restart_vars.restart_clibrarian=obj_creation.clibrarian;
    obj_restart_vars.restart_fmaster=obj_creation.fmaster;
    obj_restart_vars.restart_recruiter=obj_creation.recruiter;
    obj_restart_vars.restart_admiral=obj_creation.admiral;
    
    obj_restart_vars.restart_equal_specialists=obj_creation.equal_specialists;
    obj_restart_vars.restart_load_to_ships=obj_creation.load_to_ships;
    obj_restart_vars.restart_successors=obj_creation.successors;
    
    obj_restart_vars.restart_mutations=obj_creation.mutations;
    obj_restart_vars.restart_preomnor=obj_creation.preomnor;
    obj_restart_vars.restart_voice=obj_creation.voice;
    obj_restart_vars.restart_doomed=obj_creation.doomed;
    obj_restart_vars.restart_lyman=obj_creation.lyman;
    obj_restart_vars.restart_omophagea=obj_creation.omophagea;
    obj_restart_vars.restart_ossmodula=obj_creation.ossmodula;
    obj_restart_vars.restart_membrane=obj_creation.membrane;
    obj_restart_vars.restart_zygote=obj_creation.zygote;
    obj_restart_vars.restart_betchers=obj_creation.betchers;
    obj_restart_vars.restart_catalepsean=obj_creation.catalepsean;
    obj_restart_vars.restart_secretions=obj_creation.secretions;
    obj_restart_vars.restart_occulobe=obj_creation.occulobe;
    obj_restart_vars.restart_mucranoid=obj_creation.mucranoid;
    
    obj_restart_vars.restart_master_name=obj_creation.chapter_master_name;
    obj_restart_vars.restart_master_melee=obj_creation.chapter_master_melee;
    obj_restart_vars.restart_master_ranged=obj_creation.chapter_master_ranged;
    obj_restart_vars.restart_master_specialty=obj_creation.chapter_master_specialty;
    
    obj_restart_vars.restart_strength=obj_creation.strength;
    obj_restart_vars.restart_cooperation=obj_creation.cooperation;
    obj_restart_vars.restart_purity=obj_creation.purity;
    obj_restart_vars.restart_stability=obj_creation.stability;
    
    i=99;
    repeat(3){i+=1;
        obj_restart_vars.r_race[i,2]=1;
        obj_restart_vars.r_role[i,2]="Honor Guard";obj_restart_vars.r_wep1[i,2]="Power Sword";obj_restart_vars.r_wep2[i,2]=string(obj_img.gyro);
        obj_restart_vars.r_armor[i,2]="Power Armor";obj_restart_vars.r_mobi[i,2]="";obj_restart_vars.r_gear[i,2]="";
        
        obj_restart_vars.r_race[i,3]=1;
        obj_restart_vars.r_role[i,3]="Veteran";obj_restart_vars.r_wep1[i,3]=string(obj_img.blade)+"sword";obj_restart_vars.r_wep2[i,3]=string(obj_img.gyro);
        obj_restart_vars.r_armor[i,3]="Power Armor";obj_restart_vars.r_mobi[i,3]="";obj_restart_vars.r_gear[i,3]="";
        
        obj_restart_vars.r_race[i,4]=1;
        obj_restart_vars.r_role[i,4]="Terminator";obj_restart_vars.r_wep1[i,4]="Power Fist";obj_restart_vars.r_wep2[i,4]="Storm "+string(obj_img.gyro);
        obj_restart_vars.r_armor[i,4]=string(obj_img.battlesuit);obj_restart_vars.r_mobi[i,4]="";obj_restart_vars.r_gear[i,4]="";
        
        obj_restart_vars.r_race[i,5]=1;
        obj_restart_vars.r_role[i,5]="Captain";obj_restart_vars.r_wep1[i,5]="Power Fist";obj_restart_vars.r_wep2[i,5]=string(obj_img.gyro_adj)+" Pistol";
        obj_restart_vars.r_armor[i,5]="Power Armor";obj_restart_vars.r_mobi[i,5]="";obj_restart_vars.r_gear[i,5]="";
        
        obj_restart_vars.r_race[i,6]=1;
        obj_restart_vars.r_role[i,6]=obj_img.unit[1,6];obj_restart_vars.r_wep1[i,6]="Close Combat Weapon";obj_restart_vars.r_wep2[i,6]=string(obj_img.laser)+"cannon";
        obj_restart_vars.r_armor[i,6]=obj_img.unit[1,6];obj_restart_vars.r_mobi[i,6]="";obj_restart_vars.r_gear[i,6]="";
        
        obj_restart_vars.r_race[i,7]=1;
        obj_restart_vars.r_role[i,7]="Company Champion";obj_restart_vars.r_wep1[i,7]="Power Sword";obj_restart_vars.r_wep2[i,7]="Storm Shield";
        obj_restart_vars.r_armor[i,7]="Power Armor";obj_restart_vars.r_mobi[i,7]="";obj_restart_vars.r_gear[i,7]="";
        
        obj_restart_vars.r_race[i,8]=1;
        obj_restart_vars.r_role[i,8]="Tactical Marine";obj_restart_vars.r_wep1[i,8]=string(obj_img.gyro);obj_restart_vars.r_wep2[i,8]=string(obj_img.blade)+"sword";
        obj_restart_vars.r_armor[i,8]="Power Armor";obj_restart_vars.r_mobi[i,8]="";obj_restart_vars.r_gear[i,8]="";
        
        obj_restart_vars.r_race[i,9]=1;
        obj_restart_vars.r_role[i,9]="Devastator";obj_restart_vars.r_wep1[i,9]="Heavy Ranged";obj_restart_vars.r_wep2[i,9]=string(obj_img.gyro_adj)+" Pistol";
        obj_restart_vars.r_armor[i,9]="Power Armor";obj_restart_vars.r_mobi[i,9]="";obj_restart_vars.r_gear[i,9]="";
        
        obj_restart_vars.r_race[i,10]=1;
        obj_restart_vars.r_role[i,10]="Assault Marine";obj_restart_vars.r_wep1[i,10]=string(obj_img.blade)+"sword";obj_restart_vars.r_wep2[i,10]=string(obj_img.gyro_adj)+" Pistol";
        obj_restart_vars.r_armor[i,10]="Power Armor";obj_restart_vars.r_mobi[i,10]="Jump Pack";obj_restart_vars.r_gear[i,10]="";
        
        obj_restart_vars.r_race[i,12]=1;
        obj_restart_vars.r_role[i,12]="Scout";obj_restart_vars.r_wep1[i,12]="Sniper Rifle";obj_restart_vars.r_wep2[i,12]=string(obj_img.blade)+"sword";
        obj_restart_vars.r_armor[i,12]="Scout Armor";obj_restart_vars.r_mobi[i,12]="";obj_restart_vars.r_gear[i,12]="";
        
        obj_restart_vars.r_race[i,14]=1;
        obj_restart_vars.r_role[i,14]="Chaplain";obj_restart_vars.r_wep1[i,14]="Power Sword";obj_restart_vars.r_wep2[i,14]="Storm "+string(obj_img.gyro);
        obj_restart_vars.r_armor[i,14]="Power Armor";obj_restart_vars.r_gear[i,14]="Rosarius";obj_restart_vars.r_mobi[i,14]="";
        
        obj_restart_vars.r_race[i,15]=1;
        obj_restart_vars.r_role[i,15]="Apothecary";obj_restart_vars.r_wep1[i,15]="Power Sword";obj_restart_vars.r_wep2[i,15]="Storm "+string(obj_img.gyro);
        obj_restart_vars.r_armor[i,15]="Power Armor";obj_restart_vars.r_gear[i,15]="Narthecium";obj_restart_vars.r_mobi[i,15]="";
        
        obj_restart_vars.r_race[i,16]=1;
        obj_restart_vars.r_role[i,16]="Techmarine";obj_restart_vars.r_wep1[i,16]="Power Axe";obj_restart_vars.r_wep2[i,16]="Storm "+string(obj_img.gyro);
        obj_restart_vars.r_armor[i,16]="Power Armor";obj_restart_vars.r_gear[i,16]="Servo Arms";obj_restart_vars.r_mobi[i,16]="";
        
        obj_restart_vars.r_race[i,17]=1;
        obj_restart_vars.r_role[i,17]="Librarian";obj_restart_vars.r_wep1[i,17]="Force Weapon";obj_restart_vars.r_wep2[i,17]="Storm "+string(obj_img.gyro);
        obj_restart_vars.r_armor[i,17]="Power Armor";obj_restart_vars.r_gear[i,17]="Psychic Hood";obj_restart_vars.r_mobi[i,17]="";
    
    }// 100 is defaults, 101 is the allowable starting equipment
    
    i=-1;repeat(21){i+=1;
        obj_restart_vars.r_race[100,i]=race[100,i];
        obj_restart_vars.r_role[100,i]=role[100,i];
        obj_restart_vars.r_wep1[100,i]=wep1[100,i];
        obj_restart_vars.r_wep2[100,i]=wep2[100,i];
        obj_restart_vars.r_armor[100,i]=armor[100,i];
        obj_restart_vars.r_gear[100,i]=gear[100,i];
        obj_restart_vars.r_mobi[100,i]=mobi[100,i];
    }
    
}




if (argument0=2){

    obj_controller.restart_name=obj_restart_vars.restart_name;
    obj_controller.restart_founding=obj_restart_vars.restart_founding;
    
    obj_controller.restart_secret=obj_restart_vars.restart_secret;
    obj_controller.restart_title[0]="";
    var i;i=0;
    repeat(11){i+=1;obj_controller.restart_title[i]=obj_restart_vars.restart_title[i];}
    
    obj_controller.restart_icon=obj_restart_vars.restart_icon;
    obj_controller.restart_icon_name=obj_restart_vars.restart_icon_name;
    obj_controller.restart_powers=obj_restart_vars.restart_powers;
    
    var ad;ad=-1;
    repeat(5){ad+=1;
        if (ad=0){obj_controller.restart_adv[ad]="";obj_controller.restart_dis[ad]="";}
        if (ad>0){obj_controller.restart_adv[ad]=obj_restart_vars.restart_adv[ad];obj_controller.restart_dis[ad]=obj_restart_vars.restart_dis[ad];}
    }
    // show_message("B: "+string(obj_controller.restart_dis[1]));
    
    obj_controller.restart_recruiting_type=obj_restart_vars.restart_recruiting_type;
    obj_controller.restart_trial=obj_restart_vars.restart_trial;
    obj_controller.restart_recruiting_name=obj_restart_vars.restart_recruiting_name;
    obj_controller.restart_home_type=obj_restart_vars.restart_home_type;
    obj_controller.restart_home_name=obj_restart_vars.restart_home_name;
    obj_controller.restart_fleet_type=obj_restart_vars.restart_fleet_type;
    obj_controller.restart_flagship_name=obj_restart_vars.restart_flagship_name;
    
    obj_controller.restart_recruiting_exists=obj_restart_vars.restart_recruiting_exists;
    obj_controller.restart_homeworld_exists=obj_restart_vars.restart_homeworld_exists;
    obj_controller.restart_homeworld_rule=obj_restart_vars.restart_homeworld_rule;
    
    obj_controller.restart_battle_cry=obj_restart_vars.restart_battle_cry;
    
    obj_controller.restart_main_color=obj_restart_vars.restart_main_color;
    obj_controller.restart_secondary_color=obj_restart_vars.restart_secondary_color;
    obj_controller.restart_trim_color=obj_restart_vars.restart_trim_color;
    obj_controller.restart_pauldron2_color=obj_restart_vars.restart_pauldron2_color;
    obj_controller.restart_pauldron_color=obj_restart_vars.restart_pauldron_color;
    obj_controller.restart_lens_color=obj_restart_vars.restart_lens_color;
    obj_controller.restart_weapon_color=obj_restart_vars.restart_weapon_color;
    obj_controller.restart_col_special=obj_restart_vars.restart_col_special;
    obj_controller.restart_trim=obj_restart_vars.restart_trim;
    obj_controller.restart_skin_color=obj_restart_vars.restart_skin_color;
    
    obj_controller.restart_hapothecary=obj_restart_vars.restart_hapothecary;
    obj_controller.restart_hchaplain=obj_restart_vars.restart_hchaplain;
    obj_controller.restart_clibrarian=obj_restart_vars.restart_clibrarian;
    obj_controller.restart_fmaster=obj_restart_vars.restart_fmaster;
    obj_controller.restart_recruiter=obj_restart_vars.restart_recruiter;
    obj_controller.restart_admiral=obj_restart_vars.restart_admiral;
    
    obj_controller.restart_equal_specialists=obj_restart_vars.restart_equal_specialists;
    obj_controller.restart_load_to_ships=obj_restart_vars.restart_load_to_ships;
    obj_controller.restart_successors=obj_restart_vars.restart_successors;
    
    obj_controller.restart_mutations=obj_restart_vars.restart_mutations;
    obj_controller.restart_preomnor=obj_restart_vars.restart_preomnor;
    obj_controller.restart_voice=obj_restart_vars.restart_voice;
    obj_controller.restart_doomed=obj_restart_vars.restart_doomed;
    obj_controller.restart_lyman=obj_restart_vars.restart_lyman;
    obj_controller.restart_omophagea=obj_restart_vars.restart_omophagea;
    obj_controller.restart_ossmodula=obj_restart_vars.restart_ossmodula;
    obj_controller.restart_membrane=obj_restart_vars.restart_membrane;
    obj_controller.restart_zygote=obj_restart_vars.restart_zygote;
    obj_controller.restart_betchers=obj_restart_vars.restart_betchers;
    obj_controller.restart_catalepsean=obj_restart_vars.restart_catalepsean;
    obj_controller.restart_secretions=obj_restart_vars.restart_secretions;
    obj_controller.restart_occulobe=obj_restart_vars.restart_occulobe;
    obj_controller.restart_mucranoid=obj_restart_vars.restart_mucranoid;
    
    obj_controller.restart_master_name=obj_restart_vars.restart_master_name;
    obj_controller.restart_master_melee=obj_restart_vars.restart_master_melee;
    obj_controller.restart_master_ranged=obj_restart_vars.restart_master_ranged;
    obj_controller.restart_master_specialty=obj_restart_vars.restart_master_specialty;
    
    obj_controller.restart_strength=obj_restart_vars.restart_strength;
    obj_controller.restart_cooperation=obj_restart_vars.restart_cooperation;
    obj_controller.restart_purity=obj_restart_vars.restart_purity;
    obj_controller.restart_stability=obj_restart_vars.restart_stability;
    
    i=99;
    repeat(3){i+=1;
        obj_controller.r_race[i,2]=1;
        obj_controller.r_role[i,2]="Honor Guard";obj_controller.r_wep1[i,2]="Power Sword";obj_controller.r_wep2[i,2]=string(obj_img.gyro);
        obj_controller.r_armor[i,2]="Power Armor";obj_controller.r_mobi[i,2]="";obj_controller.r_gear[i,2]="";
        
        obj_controller.r_race[i,3]=1;
        obj_controller.r_role[i,3]="Veteran";obj_controller.r_wep1[i,3]=string(obj_img.blade)+"sword";obj_controller.r_wep2[i,3]=string(obj_img.gyro);
        obj_controller.r_armor[i,3]="Power Armor";obj_controller.r_mobi[i,3]="";obj_controller.r_gear[i,3]="";
        
        obj_controller.r_race[i,4]=1;
        obj_controller.r_role[i,4]="Terminator";obj_controller.r_wep1[i,4]="Power Fist";obj_controller.r_wep2[i,4]="Storm "+string(obj_img.gyro);
        obj_controller.r_armor[i,4]=string(obj_img.battlesuit);obj_controller.r_mobi[i,4]="";obj_controller.r_gear[i,4]="";
        
        obj_controller.r_race[i,5]=1;
        obj_controller.r_role[i,5]="Captain";obj_controller.r_wep1[i,5]="Power Fist";obj_controller.r_wep2[i,5]=string(obj_img.gyro_adj)+" Pistol";
        obj_controller.r_armor[i,5]="Power Armor";obj_controller.r_mobi[i,5]="";obj_controller.r_gear[i,5]="";
        
        obj_controller.r_race[i,6]=1;
        obj_controller.r_role[i,6]=obj_img.unit[1,6];obj_controller.r_wep1[i,6]="Close Combat Weapon";obj_controller.r_wep2[i,6]=string(obj_img.laser)+"cannon";
        obj_controller.r_armor[i,6]=obj_img.unit[1,6];obj_controller.r_mobi[i,6]="";obj_controller.r_gear[i,6]="";
        
        obj_controller.r_race[i,7]=1;
        obj_controller.r_role[i,7]="Company Champion";obj_controller.r_wep1[i,7]="Power Sword";obj_controller.r_wep2[i,7]="Storm Shield";
        obj_controller.r_armor[i,7]="Power Armor";obj_controller.r_mobi[i,7]="";obj_controller.r_gear[i,7]="";
        
        obj_controller.r_race[i,8]=1;
        obj_controller.r_role[i,8]="Tactical Marine";obj_controller.r_wep1[i,8]=string(obj_img.gyro);obj_controller.r_wep2[i,8]=string(obj_img.blade)+"sword";
        obj_controller.r_armor[i,8]="Power Armor";obj_controller.r_mobi[i,8]="";obj_controller.r_gear[i,8]="";
        
        obj_controller.r_race[i,9]=1;
        obj_controller.r_role[i,9]="Devastator";obj_controller.r_wep1[i,9]="Heavy Ranged";obj_controller.r_wep2[i,9]=string(obj_img.gyro_adj)+" Pistol";
        obj_controller.r_armor[i,9]="Power Armor";obj_controller.r_mobi[i,9]="";obj_controller.r_gear[i,9]="";
        
        obj_controller.r_race[i,10]=1;
        obj_controller.r_role[i,10]="Assault Marine";obj_controller.r_wep1[i,10]=string(obj_img.blade)+"sword";obj_controller.r_wep2[i,10]=string(obj_img.gyro_adj)+" Pistol";
        obj_controller.r_armor[i,10]="Power Armor";obj_controller.r_mobi[i,10]="Jump Pack";obj_controller.r_gear[i,10]="";
        
        obj_controller.r_race[i,12]=1;
        obj_controller.r_role[i,12]="Scout";obj_controller.r_wep1[i,12]="Sniper Rifle";obj_controller.r_wep2[i,12]=string(obj_img.blade)+"sword";
        obj_controller.r_armor[i,12]="Scout Armor";obj_controller.r_mobi[i,12]="";obj_controller.r_gear[i,12]="";
        
        obj_controller.r_race[i,14]=1;
        obj_controller.r_role[i,14]="Chaplain";obj_controller.r_wep1[i,14]="Power Sword";obj_controller.r_wep2[i,14]="Storm "+string(obj_img.gyro);
        obj_controller.r_armor[i,14]="Power Armor";obj_controller.r_gear[i,14]="Rosarius";obj_controller.r_mobi[i,14]="";
        
        obj_controller.r_race[i,15]=1;
        obj_controller.r_role[i,15]="Apothecary";obj_controller.r_wep1[i,15]="Power Sword";obj_controller.r_wep2[i,15]="Storm "+string(obj_img.gyro);
        obj_controller.r_armor[i,15]="Power Armor";obj_controller.r_gear[i,15]="Narthecium";obj_controller.r_mobi[i,15]="";
        
        obj_controller.r_race[i,16]=1;
        obj_controller.r_role[i,16]="Techmarine";obj_controller.r_wep1[i,16]="Power Axe";obj_controller.r_wep2[i,16]="Storm "+string(obj_img.gyro);
        obj_controller.r_armor[i,16]="Power Armor";obj_controller.r_gear[i,16]="Servo Arms";obj_controller.r_mobi[i,16]="";
        
        obj_controller.r_race[i,17]=1;
        obj_controller.r_role[i,17]="Librarian";obj_controller.r_wep1[i,17]="Force Weapon";obj_controller.r_wep2[i,17]="Storm "+string(obj_img.gyro);
        obj_controller.r_armor[i,17]="Power Armor";obj_controller.r_gear[i,17]="Psychic Hood";obj_controller.r_mobi[i,17]="";
    
    }// 100 is defaults, 101 is the allowable starting equipment
    
    i=-1;repeat(21){i+=1;
        obj_controller.r_race[100,i]=obj_restart_vars.r_race[100,i];
        obj_controller.r_race[101,i]=obj_restart_vars.r_race[100,i];
        obj_controller.r_race[102,i]=obj_restart_vars.r_race[100,i];
        
        obj_controller.r_role[100,i]=obj_restart_vars.r_role[100,i];
        obj_controller.r_wep1[100,i]=obj_restart_vars.r_wep1[100,i];
        obj_controller.r_wep2[100,i]=obj_restart_vars.r_wep2[100,i];
        obj_controller.r_armor[100,i]=obj_restart_vars.r_armor[100,i];
        obj_controller.r_gear[100,i]=obj_restart_vars.r_gear[100,i];
        obj_controller.r_mobi[100,i]=obj_restart_vars.r_mobi[100,i];
    }
    
    
}






if (argument0=3){// Controller to restart vars
    obj_restart_vars.restart_name=obj_controller.restart_name;
    obj_restart_vars.restart_founding=obj_controller.restart_founding;
    
    obj_restart_vars.restart_secret=obj_controller.restart_secret;
    obj_restart_vars.restart_title[0]=obj_controller.restart_title[0];
    var i;i=0;
    repeat(11){i+=1;obj_restart_vars.restart_title[i]=obj_controller.restart_title[i];
    }
    
    obj_restart_vars.restart_icon=obj_controller.restart_icon;
    obj_restart_vars.restart_icon_name=obj_controller.restart_icon_name;
    obj_restart_vars.restart_powers=obj_controller.restart_powers;
    
    var ad;ad=-1;
    repeat(5){ad+=1;
        if (ad=0){obj_restart_vars.restart_adv[ad]="";obj_restart_vars.restart_dis[ad]="";}
        if (ad>0){obj_restart_vars.restart_adv[ad]=obj_controller.restart_adv[ad];obj_restart_vars.restart_dis[ad]=obj_controller.restart_dis[ad];}
    }
    
    // show_message("C: "+string(obj_restart_vars.restart_dis[1]));
    
    
    obj_restart_vars.restart_recruiting_type=obj_controller.restart_recruiting_type;
    obj_restart_vars.restart_trial=obj_controller.restart_trial;
    obj_restart_vars.restart_recruiting_name=obj_controller.restart_recruiting_name;
    obj_restart_vars.restart_home_type=obj_controller.restart_home_type;// Good here
    obj_restart_vars.restart_home_name=obj_controller.restart_home_name;
    obj_restart_vars.restart_fleet_type=obj_controller.restart_fleet_type;
    obj_restart_vars.restart_flagship_name=obj_controller.restart_flagship_name;
    
    obj_restart_vars.restart_recruiting_exists=obj_controller.restart_recruiting_exists;
    obj_restart_vars.restart_homeworld_exists=obj_controller.restart_homeworld_exists;
    obj_restart_vars.restart_homeworld_rule=obj_controller.restart_homeworld_rule;
    
    obj_restart_vars.restart_battle_cry=obj_controller.restart_battle_cry;
    
    obj_restart_vars.restart_main_color=obj_controller.restart_main_color;
    obj_restart_vars.restart_secondary_color=obj_controller.restart_secondary_color;
    obj_restart_vars.restart_trim_color=obj_controller.restart_trim_color;
    obj_restart_vars.restart_pauldron2_color=obj_controller.restart_pauldron2_color;
    obj_restart_vars.restart_pauldron_color=obj_controller.restart_pauldron_color;
    obj_restart_vars.restart_lens_color=obj_controller.restart_lens_color;
    obj_restart_vars.restart_weapon_color=obj_controller.restart_weapon_color;
    obj_restart_vars.restart_col_special=obj_controller.restart_col_special;
    obj_restart_vars.restart_trim=obj_controller.restart_trim;
    obj_restart_vars.restart_skin_color=obj_controller.restart_skin_color;
    
    obj_restart_vars.restart_hapothecary=obj_controller.restart_hapothecary;
    obj_restart_vars.restart_hchaplain=obj_controller.restart_hchaplain;
    obj_restart_vars.restart_clibrarian=obj_controller.restart_clibrarian;
    obj_restart_vars.restart_fmaster=obj_controller.restart_fmaster;
    obj_restart_vars.restart_recruiter=obj_controller.restart_recruiter;
    obj_restart_vars.restart_admiral=obj_controller.restart_admiral;
    
    obj_restart_vars.restart_equal_specialists=obj_controller.restart_equal_specialists;
    obj_restart_vars.restart_load_to_ships=obj_controller.restart_load_to_ships;
    obj_restart_vars.restart_successors=obj_controller.restart_successors;
    
    obj_restart_vars.restart_mutations=obj_controller.restart_mutations;
    obj_restart_vars.restart_preomnor=obj_controller.restart_preomnor;
    obj_restart_vars.restart_voice=obj_controller.restart_voice;
    obj_restart_vars.restart_doomed=obj_controller.restart_doomed;
    obj_restart_vars.restart_lyman=obj_controller.restart_lyman;
    obj_restart_vars.restart_omophagea=obj_controller.restart_omophagea;
    obj_restart_vars.restart_ossmodula=obj_controller.restart_ossmodula;
    obj_restart_vars.restart_membrane=obj_controller.restart_membrane;
    obj_restart_vars.restart_zygote=obj_controller.restart_zygote;
    obj_restart_vars.restart_betchers=obj_controller.restart_betchers;
    obj_restart_vars.restart_catalepsean=obj_controller.restart_catalepsean;
    obj_restart_vars.restart_secretions=obj_controller.restart_secretions;
    obj_restart_vars.restart_occulobe=obj_controller.restart_occulobe;
    obj_restart_vars.restart_mucranoid=obj_controller.restart_mucranoid;
    
    obj_restart_vars.restart_master_name=obj_controller.restart_master_name;
    obj_restart_vars.restart_master_melee=obj_controller.restart_master_melee;
    obj_restart_vars.restart_master_ranged=obj_controller.restart_master_ranged;
    obj_restart_vars.restart_master_specialty=obj_controller.restart_master_specialty;
    
    obj_restart_vars.restart_strength=obj_controller.restart_strength;
    obj_restart_vars.restart_cooperation=obj_controller.restart_cooperation;
    obj_restart_vars.restart_purity=obj_controller.restart_purity;
    obj_restart_vars.restart_stability=obj_controller.restart_stability;
    
    i=-1;repeat(21){i+=1;
        obj_restart_vars.r_race[100,i]=obj_controller.r_race[100,i];
        obj_restart_vars.r_race[101,i]=obj_controller.r_race[100,i];
        obj_restart_vars.r_race[102,i]=obj_controller.r_race[100,i];
        
        obj_restart_vars.r_role[100,i]=obj_controller.r_role[100,i];
        obj_restart_vars.r_wep1[100,i]=obj_controller.r_wep1[100,i];
        obj_restart_vars.r_wep2[100,i]=obj_controller.r_wep2[100,i];
        obj_restart_vars.r_armor[100,i]=obj_controller.r_armor[100,i];
        obj_restart_vars.r_gear[100,i]=obj_controller.r_gear[100,i];
        obj_restart_vars.r_mobi[100,i]=obj_controller.r_mobi[100,i];
    }
}



if (argument0=4){
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
        race[i,2]=1;role[i,2]="Honor Guard";wep1[i,2]="Power Sword";wep2[i,2]=string(obj_img.gyro);armor[i,2]="Power Armor";
        race[i,3]=1;role[i,3]="Veteran";wep1[i,3]=string(obj_img.blade)+"sword";wep2[i,3]=string(obj_img.gyro);armor[i,3]="Power Armor";
        race[i,4]=1;role[i,4]="Terminator";wep1[i,4]="Power Fist";wep2[i,4]="Storm "+string(obj_img.gyro);armor[i,4]=string(obj_img.battlesuit);
        race[i,5]=1;role[i,5]="Captain";wep1[i,5]="Power Fist";wep2[i,5]=string(obj_img.gyro_adj)+" Pistol";armor[i,5]="Power Armor";
        race[i,6]=1;role[i,6]=obj_img.unit[1,6];wep1[i,6]="Close Combat Weapon";wep2[i,6]=string(obj_img.laser)+"cannon";armor[i,6]=obj_img.unit[1,6];
        race[i,8]=1;role[i,8]="Tactical Marine";wep1[i,8]=string(obj_img.gyro);wep2[i,8]=string(obj_img.blade)+"sword";armor[i,8]="Power Armor";
        race[i,9]=1;role[i,9]="Devastator";wep1[i,9]="Heavy Ranged";wep2[i,9]=string(obj_img.gyro_adj)+" Pistol";armor[i,9]="Power Armor";
        race[i,10]=1;role[i,10]="Assault Marine";wep1[i,10]=string(obj_img.blade)+"sword";wep2[i,10]=string(obj_img.gyro_adj)+" Pistol";armor[i,10]="Power Armor";mobi[i,10]="Jump Pack";
        race[i,12]=1;role[i,12]="Scout";wep1[i,12]="Sniper Rifle";wep2[i,12]=string(obj_img.blade)+"sword";armor[i,12]="Scout Armor";
        race[i,14]=1;role[i,14]="Chaplain";wep1[i,14]="Power Sword";wep2[i,14]="Storm "+string(obj_img.gyro);armor[i,14]="Power Armor";gear[i,14]="Rosarius";
        race[i,15]=1;role[i,15]="Apothecary";wep1[i,15]="Power Sword";wep2[i,15]="Storm "+string(obj_img.gyro);armor[i,15]="Power Armor";gear[i,15]="Narthecium";
        race[i,16]=1;role[i,16]="Techmarine";wep1[i,16]="Power Axe";wep2[i,16]="Storm "+string(obj_img.gyro);armor[i,16]="Power Armor";gear[i,16]="Servo Arms";
        race[i,17]=1;role[i,17]="Librarian";wep1[i,17]="Force Weapon";wep2[i,17]="Storm "+string(obj_img.gyro);armor[i,17]="Power Armor";gear[i,17]="Psychic Hood";
    }i=100;
    
    
    points=100;selected_chapter=999;
    chapter=obj_restart_vars.restart_name;
    founding=obj_restart_vars.restart_founding;
    founding_secret=obj_restart_vars.restart_secret;
    
    company_title[0]="";
    var i;i=0;
    repeat(11){i+=1;company_title[i]=obj_restart_vars.restart_title[i];}
    
    icon=obj_restart_vars.restart_icon;
    icon_name=obj_restart_vars.restart_icon_name;
    discipline=obj_restart_vars.restart_powers;
    
    var ad;ad=-1;
    repeat(5){ad+=1;
        if (ad=0){adv[ad]="";dis[ad]="";}
        if (ad>0){adv[ad]=obj_restart_vars.restart_adv[ad];dis[ad]=obj_restart_vars.restart_dis[ad];}
    }
    
    // show_message("D: "+string(dis[1]));
    
    // Need disposition here
    
    // 
    
    recruiting=obj_restart_vars.restart_recruiting_type;
    aspirant_trial=obj_restart_vars.restart_trial;
    recruiting_name=obj_restart_vars.restart_recruiting_name;
    homeworld=obj_restart_vars.restart_home_type;
    homeworld_name=obj_restart_vars.restart_home_name;
    fleet_type=obj_restart_vars.restart_fleet_type;
    flagship_name=obj_restart_vars.restart_flagship_name;
    
    recruiting_exists=obj_restart_vars.restart_recruiting_exists;
    homeworld_exists=obj_restart_vars.restart_homeworld_exists;
    homeworld_rule=obj_restart_vars.restart_homeworld_rule;
    
    battle_cry=obj_restart_vars.restart_battle_cry;
    
    main_color=obj_restart_vars.restart_main_color;
    secondary_color=obj_restart_vars.restart_secondary_color;
    trim_color=obj_restart_vars.restart_trim_color;
    pauldron2_color=obj_restart_vars.restart_pauldron2_color;
    pauldron_color=obj_restart_vars.restart_pauldron_color;
    lens_color=obj_restart_vars.restart_lens_color;
    weapon_color=obj_restart_vars.restart_weapon_color;
    col_special=obj_restart_vars.restart_col_special;
    trim=obj_restart_vars.restart_trim;
    skin_color=obj_restart_vars.restart_skin_color;
    
    hapothecary=obj_restart_vars.restart_hapothecary;
    hchaplain=obj_restart_vars.restart_hchaplain;
    clibrarian=obj_restart_vars.restart_clibrarian;
    fmaster=obj_restart_vars.restart_fmaster;
    recruiter=obj_restart_vars.restart_recruiter;
    admiral=obj_restart_vars.restart_admiral;
    
    equal_specialists=obj_restart_vars.restart_equal_specialists;
    load_to_ships=obj_restart_vars.restart_load_to_ships;
    successors=obj_restart_vars.restart_successors;
    
    mutations=obj_restart_vars.restart_mutations;
    preomnor=obj_restart_vars.restart_preomnor;
    voice=obj_restart_vars.restart_voice;
    doomed=obj_restart_vars.restart_doomed;
    lyman=obj_restart_vars.restart_lyman;
    omophagea=obj_restart_vars.restart_omophagea;
    ossmodula=obj_restart_vars.restart_ossmodula;
    membrane=obj_restart_vars.restart_membrane;
    zygote=obj_restart_vars.restart_zygote;
    betchers=obj_restart_vars.restart_betchers;
    catalepsean=obj_restart_vars.restart_catalepsean;
    secretions=obj_restart_vars.restart_secretions;
    occulobe=obj_restart_vars.restart_occulobe;
    mucranoid=obj_restart_vars.restart_mucranoid;
    
    chapter_master_name=obj_restart_vars.restart_master_name;
    chapter_master_melee=obj_restart_vars.restart_master_melee;
    chapter_master_ranged=obj_restart_vars.restart_master_ranged;
    chapter_master_specialty=obj_restart_vars.restart_master_specialty;
    
    strength=obj_restart_vars.restart_strength;
    cooperation=obj_restart_vars.restart_cooperation;
    purity=obj_restart_vars.restart_purity;
    stability=obj_restart_vars.restart_stability;
    
    i=-1;repeat(21){i+=1;
        race[100,i]=obj_restart_vars.r_race[100,i];
        
        role[100,i]=obj_restart_vars.r_role[100,i];
        wep1[100,i]=obj_restart_vars.r_wep1[100,i];
        wep2[100,i]=obj_restart_vars.r_wep2[100,i];
        armor[100,i]=obj_restart_vars.r_armor[100,i];
        gear[100,i]=obj_restart_vars.r_gear[100,i];
        mobi[100,i]=obj_restart_vars.r_mobi[100,i];
    }
    
    custom=1;restarted=1;
    mutations_selected=mutations;
    
    var n;i=0;repeat(4){i+=1;n=0;
        if (adv[i]!="") and (adv_num[i]=0){
            repeat(40){n+=1;
                if (advantage[n]=adv[i]) then adv_num[i]=n;
            }
        }
    }
    i=0;repeat(4){i+=1;n=0;
        if (dis[i]!="") and (dis_num[i]=0){
            repeat(40){n+=1;
                if (disadvantage[n]=dis[i]) then dis_num[i]=n;
            }
        }
    }
    
}
