
// Works as COMPANY VIEW but for the subsections of HQ

var v, i, mans, onceh, company, bad, oth;
gogogo=0;mans=0;vehicles=0;last_man=0;last_vehicle=0;bad=0;company=0;oth=0;

var squads, squad_typ, squad_loc, squad_members;
squads=0;squad_typ="";squad_loc=0;squad_members=0;

var i;i=-1;repeat(20){i+=1;sel_uni[i]="";sel_veh[i]="";}
i=-1;
repeat(501){i+=1;
    man[i]="";ide[i]=0;man_sel[i]=0;ma_lid[i]=0;ma_wid[i]=0;ma_promote[i]=0;ma_bio[i]=0;
    ma_race[i]=0;ma_loc[i]="";ma_name[i]="";ma_role[i]="";ma_wep1[i]="";ma_mobi[i]="";
    ma_wep2[i]="";ma_armor[i]="";ma_gear[i]="";ma_health[i]=100;ma_chaos[i]=0;ma_exp[i]=0;ma_god[i]=0;
    sh_ide[i]=0;sh_uid[i]=0;sh_name[i]="";sh_class[i]="";sh_loc[i]="";sh_hp[i]="";sh_cargo[i]=0;sh_cargo_max[i]="";
    squad[i]=0;
    
    if (i<=50){penit_co[i]=0;penit_id[i]=0;}
    // if (i<=100){event[i]="";event_duration[i]=0;}
}

/*if (argument0=1) then gogogo=obj_ini.firsts;if (argument0=2) then gogogo=obj_ini.seconds;if (argument0=3) then gogogo=obj_ini.thirds;
if (argument0=4) then gogogo=obj_ini.fourths;if (argument0=5) then gogogo=obj_ini.fifths;if (argument0=6) then gogogo=obj_ini.sixths;
if (argument0=7) then gogogo=obj_ini.sevenths;if (argument0=8) then gogogo=obj_ini.eighths;if (argument0=9) then gogogo=obj_ini.ninths;
if (argument0=10) then gogogo=obj_ini.tenths;*/

mans=0;vehicles=0;v=0;i=0;b=0;

// v: check number
// mans: number of mans that a hit has gotten




b=0;
if (argument0=11) or (argument0=0) then repeat(199){// HQ
    v+=1;bad=0;
    if (obj_ini.lid[company,v]>0){
        var ham;ham=obj_ini.lid[0,v];
        if (obj_ini.ship_location[ham]="Lost") then bad=1;
    }
    
    if ((obj_ini.role[0,v]=obj_img.faction_title[1]) or (obj_ini.role[0,v]=obj_ini.role[100,2])) and (bad=0){
        b+=1;
        mans+=1;man[b]="man";ide[b]=v;
        ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
        ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
        ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
        ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
        last_man=b;ma_promote[b]=0;ma_god[b]=obj_ini.god[0,v];ma_bio[b]=obj_ini.bio[0,v];
    }
    
    if (bad=0){
        var yep;yep=0;
        if (obj_ini.role[0,v]="Skitarii") then yep=1;
        if (obj_ini.role[0,v]="Crusader") then yep=1;
        if (obj_ini.role[0,v]="Ranger") then yep=1;
        if (obj_ini.role[0,v]=obj_img.unit[5,7]) then yep=1;
        if (obj_ini.role[0,v]=obj_img.unit[5,17]) then yep=1;
        if (obj_ini.role[0,v]="Ork Sniper") then yep=1;
        if (obj_ini.role[0,v]="Flash Git") then yep=1;
        if (yep=1){
            b+=1;
            mans+=1;man[b]="man";ide[b]=v;ma_bio[b]=obj_ini.bio[0,v];
            ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
            ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
            ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
            ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
            if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
            last_man=b;ma_promote[b]=0;ma_god[b]=obj_ini.god[0,v];ma_god[b]=obj_ini.god[0,v];
        }
    }
}

v=0;
if (argument0=12) or (argument0=0) then repeat(199){// Apothecarion
    v+=1;bad=0;
    if (obj_ini.lid[company,v]>0){
        var ham;ham=obj_ini.lid[0,v];
        if (obj_ini.ship_location[ham]="Lost") then bad=1;
    }
    if ((obj_ini.role[0,v]="Master of the Apothecarion") or (obj_ini.role[0,v]=obj_ini.role[100,15]) or (obj_ini.role[0,v]=obj_ini.role[100,15]+" Aspirant")) and (bad=0){
        b+=1;
        mans+=1;man[b]="man";ide[b]=v;
        ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
        ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
        ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
        ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
        last_man=b;ma_promote[b]=0;ma_god[b]=obj_ini.god[0,v];ma_bio[b]=obj_ini.bio[0,v];
        if (obj_ini.role[0,v]=obj_ini.role[100,15]) then ma_promote[b]=1;
    }
}

v=0;
if (argument0=13) or (argument0=0) then repeat(199){// Librarium
    v+=1;bad=0;
    if (obj_ini.lid[company,v]>0){
        var ham;ham=obj_ini.lid[0,v];
        if (obj_ini.ship_location[ham]="Lost") then bad=1;
    }
    if ((obj_ini.role[0,v]="Chief "+string(obj_ini.role[100,17])) or (obj_ini.role[0,v]=obj_ini.role[100,17]) or (obj_ini.role[0,v]="Lexicanum") or (obj_ini.role[0,v]="Codiciery") or (obj_ini.role[0,v]=obj_ini.role[100,17]+" Aspirant")) and (bad=0){
        b+=1;
        mans+=1;man[b]="man";ide[b]=v;
        ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
        ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
        ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
        ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
        last_man=b;ma_promote[b]=0;ma_god[b]=obj_ini.god[0,v];ma_bio[b]=obj_ini.bio[0,v];
        if (obj_ini.role[0,v]!="Chief "+string(obj_ini.role[100,17])){
            if (obj_ini.role[0,v]=obj_ini.role[100,17]) then ma_promote[b]=0;
            if (obj_ini.role[0,v]="Lexicanum") and (ma_exp[b]>=80) then ma_promote[b]=1;
            if (obj_ini.role[0,v]="Codiciery") and (ma_exp[b]>=125) then ma_promote[b]=1;
        }
    }
}

v=0;
if (argument0=14) or (argument0=0) then repeat(199){// Reclusium
    v+=1;bad=0;
    if (obj_ini.lid[company,v]>0){
        var ham;ham=obj_ini.lid[0,v];
        if (obj_ini.ship_location[ham]="Lost") then bad=1;
    }
    if (obj_ini.role[0,v]="Master of Sanctity") and (bad=0){b+=1;
        mans+=1;man[b]="man";ide[b]=v;ma_god[b]=obj_ini.god[0,v];
        ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
        ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
        ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
        ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
        last_man=b;ma_promote[b]=0;ma_bio[b]=obj_ini.bio[0,v];
        if (obj_ini.role[0,v]=obj_ini.role[100,14]) then ma_promote[b]=1;
    }
    if ((obj_ini.role[0,v]=obj_ini.role[100,14]) or (obj_ini.role[0,v]=obj_ini.role[100,14]+" Aspirant")) and (bad=0) and (global.chapter_name!="Iron Hands"){b+=1;
        mans+=1;man[b]="man";ide[b]=v;ma_god[b]=obj_ini.god[0,v];
        ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
        ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
        ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
        ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
        last_man=b;ma_promote[b]=0;ma_bio[b]=obj_ini.bio[0,v];
        if (obj_ini.role[0,v]=obj_ini.role[100,14]) then ma_promote[b]=1;
    }
}

v=0;squads=0;
if (argument0=15) or (argument0=0) then repeat(199){// Armamentarium
    v+=1;bad=0;
    if (obj_ini.lid[company,v]>0){
        var ham;ham=obj_ini.lid[0,v];
        if (obj_ini.ship_location[ham]="Lost") then bad=1;
    }
    if ((obj_ini.role[0,v]="Forge Master") or (obj_ini.role[0,v]=obj_ini.role[100,16]) or (obj_ini.role[0,v]=obj_ini.role[100,16]+" Aspirant") or (obj_ini.role[0,v]="Techpriest")) and (bad=0){
        b+=1;
        mans+=1;man[b]="man";ide[b]=v;ma_god[b]=obj_ini.god[0,v];
        ma_race[b]=obj_ini.race[0,v];ma_loc[b]=obj_ini.loc[0,v];ma_name[b]=obj_ini.name[0,v];
        ma_role[b]=obj_ini.role[0,v];ma_wep1[b]=obj_ini.wep1[0,v];ma_wep2[b]=obj_ini.wep2[0,v];
        ma_armor[b]=obj_ini.armor[0,v];ma_gear[b]=obj_ini.gear[0,v];ma_health[b]=obj_ini.hp[0,v];
        ma_exp[b]=obj_ini.experience[0,v];ma_lid[b]=obj_ini.lid[0,v];ma_wid[b]=obj_ini.wid[0,v];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];ma_mobi[b]=obj_ini.mobi[0,v];
        last_man=b;ma_promote[b]=0;ma_bio[b]=obj_ini.bio[0,v];
    }
}






// b=last_man;
last_man=b;
i=0;last_vehicle=0;

repeat(100){// 100
    i+=1;
    
    if (obj_ini.veh_race[company,i]!=0){b+=1;
        man[b]="vehicle";ide[b]=i;last_vehicle+=1;
        ma_loc[v]=obj_ini.veh_loc[company,i];ma_role[v]=obj_ini.veh_role[company,i];ma_wep1[v]=obj_ini.veh_wep1[company,i];
        ma_wep2[v]=obj_ini.veh_wep2[company,i];ma_gear[v]=obj_ini.veh_upgrade[company,i];ma_health[v]=obj_ini.veh_hp[company,i];
        ma_lid[v]=obj_ini.veh_lid[company,i];ma_wid[v]=obj_ini.veh_wid[company,i];
        if (ma_lid[v]>0) then ma_loc[v]=obj_ini.ship[ma_lid[v]];
        
    }
}



i=0;squads=0;
repeat(200){i+=1;onceh=0;
    var ahuh;ahuh=0;
    if (man[i]="man"){if (ma_role[i]!="") then ahuh=1;}
    if (man[i]="vehicle"){if (ma_role[i]!="") then ahuh=1;}
    
    if (ahuh=1){
        // Select All
        var w,go,op;go=0;op=0;w=-1;
        if (man[i]="man"){
            repeat(20){w+=1;
                if (sel_uni[w]="") and (op=0) then op=w;
                if (sel_uni[w]=ma_role[i]) then go=1;
            }
            if (go=0) then sel_uni[op]=ma_role[i];
        }
        go=0;op=0;w=-1;
        if (man[i]="vehicle"){
            repeat(20){w+=1;
                if (sel_veh[w]="") and (op=0) then op=w;
                if (sel_veh[w]=ma_role[i]) then go=1;
            }
            if (go=0) then sel_veh[op]=ma_role[i];
        }
        
        
        // Squads
        if (squads>0){var new;new=1;
            if (squad_typ=obj_ini.role[100,15]) then new=0;
            if (squad_typ=obj_ini.role[100,14]) then new=0;
            if (squad_typ=obj_ini.role[100,17]) then new=0;
            if (squad_typ=obj_ini.role[100,16]) then new=0;
            if (squad_typ="Codiciery") then new=0;
            if (squad_typ="Lexicanum") then new=0;
            if (squad_typ=ma_role[i]) then new=0;
            if (squad_typ=obj_ini.role[100,17]) and (ma_role[i]="Codiciery") then new=1;
            if (squad_typ="Codiciery") and (ma_role[i]="Lexicanum") then new=1;
            
            if (squad_typ="Master of Sanctity") then new=1;
            if (squad_typ="Chief "+string(obj_ini.role[100,17])) then new=1;
            if (squad_typ="Forge Master") then new=1;
            if (squad_typ=obj_img.faction_title[1]) then new=1;
            if (squad_typ="Master of the Apothecarion") then new=1;
            
            if (squad_members+1>10) then new=1;
            if ((ma_wid[i]+(ma_lid[i]/100))!=squad_loc) then new=1;
            if (squad_typ=obj_ini.role[100,6]) then new=2;
            
            if (new=0){squad_members+=1;squad_typ=ma_role[i];squad[i]=squads;}
            if (new=1){squads+=1;squad_members=1;squad_typ=ma_role[i];squad[i]=squads;squad_loc=ma_wid[i]+(ma_lid[i]/100);}
            if (new=2){squad[i]=0;}
        }
        if (squads=0){squads+=1;squad_members=1;squad_typ=ma_role[i];squad[i]=squads;squad_loc=ma_wid[i]+(ma_lid[i]/100);}
    }
    
}

man_current=1;man_max=last_man+last_vehicle;man_see=38-4;
if (man_max>=man_see) then man_max+=2;
// if (argument0=13) then man_max+=2;


// Now have the maximum (man_last + vehicle last), the types of each of those slots, and the relevant ID
// Should be enough to display everything else
