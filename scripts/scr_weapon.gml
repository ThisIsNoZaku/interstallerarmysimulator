
// argument0: name
// argument1: weapon2 name
// argument2: man?
// argument3: ID number
// argument4: dreaded
// argument5: nuum
// argument6: description?

// More spaghetti code.  This either calculates damage for battle blocks or generates a tooltip for the shop/management.

var i,wip,wip1,wip2,atta,arp,acr,att1,apa1,att2,apa2,acr1,acr2,melee_hands,ranged_hands,rang1,rang2,rang,ammo1,ammo2,amm,spli1,spli2,spli,rending,thawep,descr,descr2,spe_descr,statt;
var disk1,rending1,spe_descr1;
i=0;wip1="";wip2="";wip="";thawep="";descr="";descr2="";spe_descr="";spe_descr1="";statt=0;rending=0;disk1="";rending1=0;
melee_hands=0;ranged_hands=0;
rang=0;atta=0;arp=0;acr=0;
att1=0;apa1=0;att2=0;
apa2=0;acr1=0;acr2=0;
rang1=0;rang2=0;
spli=0;spli1=0;spli2=0;
ammo1=-1;ammo2=-1;amm=-1;


thawep=argument0;

obj_controller.temp[9000]="";

repeat(2){
    i+=1;amm=-1;spli=0;
    var emor;emor=0;
    
    if (argument6="description") or (argument6="description_long"){
        if (i=1) then thawep=argument1;
        if (i=2) then thawep=argument0;
        if (i=2){wip1=thawep;}
        if (i=1){wip2=argument1;}
    }
    if (argument6!="description") and (argument6!="description_long"){
        if (i=1) then thawep=argument0;
        if (i=2) then thawep=argument1;
        if (i=1){wip1=thawep;}
        if (i=2){wip2=argument1;}
    }
    
    if (string_count("&",thawep)>0) or (string_count("|",thawep)>0){
        // Artifact Armor
        var arti_armor;
        arti_armor=false;
        if (string_count("Power Armor",thawep)>0){statt=30;emor=1;arti_armor=true;}
        if (string_count("Artificer",thawep)>0){statt=37;emor=1;arti_armor=true;spe_descr="+10% Melee";}
        if (string_count(obj_img.battlesuit,thawep)>0){statt=46;emor=1;arti_armor=true;spe_descr="+20% Melee, -10% Ranged, Strength";}
        if (string_count(obj_img.unit[1,6],thawep)>0){statt=44;emor=1;arti_armor=true;}
        
        // Artifact weapons
        if (arti_armor=false){
            if (string_count(string(obj_img.gyro),thawep)>0){
                atta=60;arp=0;rang=12;ranged_hands+=2;amm=15;spli=1;
                if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
            }
            if (string_count("Plasma Pistol",thawep)>0){atta=105;arp=1;rang=3.1;melee_hands+=1;}
            if (string_count("Plasma Gun",thawep)>0){atta=210;arp=1;rang=10;ranged_hands+=2;spli=1;}
            if (string_count("Power Sword",thawep)>0){atta=180;arp=0;rang=1;melee_hands+=1;spli=1;spe_descr="Parry";}
            if (string_count("Power Spear",thawep)>0){atta=200;arp=0;rang=1;melee_hands+=2;spli=1;}
            if (string_count("Power Axe",thawep)>0){atta=195;arp=0;rang=1;melee_hands+=1;spli=1;}
            if (string_count("Power Fist",thawep)>0){atta=450;arp=0;rang=1;melee_hands+=1;ranged_hands+=1;spli=1;}
            if (string_count("Lightning Claw",thawep)>0){atta=345;arp=1;rang=1;melee_hands+=1;ranged_hands+=1;spli=1;}
            if (string_count("Relic Blade",thawep)>0){atta=700;arp=0;rang=1;melee_hands+=2;spli=1;}
            
            if (string_count("Relic Blade",thawep)=0) and (atta>0){atta=atta*1.5;}
            
            if (string_count("Tome",thawep)>0){atta=0;arp=0;rang=1;melee_hands+=1;ranged_hands+=1;}
            
            if (string_count("DUB",thawep)>0){atta=floor(atta*1.5);melee_hands+=1;ranged_hands+=1;spli=1;}
            if (string_count("Dae",thawep)>0){atta=floor(atta*1.5);amm=-1;}
            if (string_count("VOI",thawep)>0){atta=floor(atta*1.2);}
            if (string_count("ADA",thawep)>0){atta=floor(atta*1.1);}
            
            if (string_count("mnr",thawep)>0){atta=floor(atta*0.85);}
            if (string_count("MNR",thawep)>0){atta=floor(atta*0.85);}
        }
        
        
        /*
        if (string_count("Power",targ.marine_armor[targ.men])>0) then targ.marine_ac[targ.men]=30;
        if (string_count("Artificer",targ.marine_armor[targ.men])>0){targ.marine_ac[targ.men]=37;targ.marine_attack[targ.men]+=0.1;}
        if (string_count(string(obj_img.battlesuit),targ.marine_armor[targ.men])>0){targ.marine_ac[targ.men]=42;targ.marine_ranged[targ.men]-=0.1;targ.marine_attack[targ.men]+=0.2;}
        if (string_count(string(obj_img.unit[1,6]),targ.marine_armor[targ.men])>0) then targ.marine_ac[targ.men]=44;
        */
        
    }
    
    
    if (i=1){
        if (argument0="Ork Armor"){statt=15;spe_descr="";emor=1;}
    
        if (argument0="Scout Armor"){statt=8;spe_descr="";emor=1;
            descr="A non-powered suit made up of carapace armor and ballistic nylon.  Includes biohazard shielding, nutrient feed, and camoflauge.";}
        if (argument0="MK3 Iron Armor"){statt=20;spe_descr="-10% Ranged";emor=1;
            descr="An ancient set of Armorum Ferrum.  Has thicker armor plating but the added weight slows down the wearer.";}
        if (argument0="MK4 Maximus"){statt=19;spe_descr="+5% Melee, +5% Ranged";emor=1;
            descr="Armor dating to the end of the Great Crusade.  Often considered the ultimate "+string(obj_img.faction_dude[1])+" armor.  The components are no longer reproducable.";}
        if (argument0="MK6 Corvus"){statt=18;spe_descr="+10% Ranged";emor=1;
            descr="Relatively old beakie armor, sleek as can be.  Boosted olfactory and auditory sensors increase the ranged accuracy of the wearer.";}
        if (argument0="MK7 Aquila"){statt=18;spe_descr="";emor=1;
            descr="Developed during the Horus Heresy, this Mark of armor is the most commonly used amongst all the "+string(obj_img.faction_dudes_formal[1])+".";}
        if (argument0="MK8 Errant"){statt=19;spe_descr="";emor=1;
            descr="Highly modified MK7, this armor has additional protection along the neck and cables.  It is oft worn as a symbol of high rank.";}
        if (argument0="Power Armor"){statt=19;spe_descr="";emor=1;
            descr="A suit of "+string(obj_img.faction_dude_formal[1])+" power armor.  The Mark can no longer be determined- it appears to be a combination of several types.";}
        if (argument0="Artificer Armor"){statt=35;spe_descr="+10% Melee";emor=1;
            descr="Heavily modified by the chapter artificers, and decorated without compare, this ancient Power Armor is beyond priceless.";}
        if (argument0=string(obj_img.battlesuit)){statt=40;spe_descr="+20% Melee, -10% Ranged, Strength";emor=1;
            descr="The toughest and most powerful armor designed by humanity.  Only the most veteran of "+string(obj_img.faction_dudes_formal[1])+" are allowed to wear these.";}
        if (argument0="Tartaros"){statt=44;spe_descr="+20% Melee, -5% Ranged, Strength";emor=1;
            descr="Even more advanced than the Indomitus "+string(obj_img.battlesuit)+", this upgraded armor offer greater mobility at no cost to protection.";}
        if (argument0=obj_img.unit[1,6]){statt=40;spe_descr="";emor=1;
            descr="A massive war-machine that can be piloted by an honored "+string(obj_img.faction_dude[1])+", who otherwise would have fallen in combat.";}
        if (argument0="Jump Pack"){spe_descr="+10% Damage Resistance, Jump Pack";
            descr="A back mounted device containing turbines or jets powerful enough to lift even a user in Power Armour.";}
                if (argument0="hammer_of_wrath"){atta=120;arp=0;rang=1;spli=0;amm=1;}
        if (argument0="Bionics"){
            spe_descr="Restores 30HP";if (global.chapter_name="Iron Hands") then spe_descr="Restores 50 HP";
            descr="Bionics may be given to wounded marines to quickly get them back into combat-ready status, replacing damaged flesh.";}
        if (argument0="Narthecium"){spe_descr="Medical field kit";
            descr="An advanced medical field kit, these allow "+string(obj_ini.role[100,15])+"s to heal or recover "+string(obj_img.organics)+" from fallen marines.";}
        if (argument0="Psychic Hood"){spe_descr="-50% chance of perils*";
            descr="An arcane hood that protects "+string(obj_ini.role[100,17])+"s from enemy psychic powers and enhances their control.";}
        if (argument0="Rosarius"){spe_descr="+33% Damage Resistance";
            descr="Also called the 'Soul's Armor', this amulet has a built-in, powerful shield generator.  They are an icon of the Imperial Creed.";}
        if (argument0="Iron Halo"){spe_descr="+33% Damage Resistance, +20 HP";
            descr="An ancient artifact, these powerful conversion field generators are granted to high ranking battle brothers or heroes.  Bearers are oft looked to for guidance.";}
        if (argument0="Plasma Bomb"){spe_descr="Destroys destructibles";
            descr="A special plasma charge, this bomb can be used to seal underground caves or destroy enemy structures.";}
        if (argument0="Exterminatus"){spe_descr="Destroys planets";
            descr="A weapon of the "+string(obj_img.king_title)+", and His divine judgement, this weapon can be placed upon a planet to obliterate it entirely.";}
        if (argument0="Bike"){spe_descr="+25% HP, Bike";
            descr="A robust bike that can propel a marine at very high speeds.  Boasts highly responsive controls and Twin Linked "+string(obj_img.gyro)+"s.";}
        if (thawep="Company Standard"){spe_descr="Boosts morale";atta=20;arp=0;rang=1;melee_hands+=0;ranged_hands+=1;spli=1;
            descr="A banner that represents the honour of a particular company and will bolster the morale abilities of nearby "+string(obj_img.faction_dudes[1])+".";}
        if (argument0="Servo Arms"){spe_descr="Integrated flamer, repairs";
            descr="A pair of powerful, mechanical arms.  They include several tools that allow trained marines to repair vehicles rapidly.";}
        if (argument0="Master Servo Arms"){spe_descr="Integrated flamer, repairs";
            descr="This master servo harness includes additional mechanical arms and tools, allowing a greater capacity and rate of repairs.";}
    }
    
    // Other stuff above
    if (thawep="Choppa"){atta=28;arp=0;rang=1;melee_hands+=1;spli=1;}
    if (thawep="Snazzgun"){atta=80;arp=0;rang=10;ranged_hands+=2;spli=1;}
    if (thawep="Shuriken Pistol"){atta=25;arp=0;rang=2.1;melee_hands+=1;spli=1;}
    if (thawep="Ranger Long Rifle"){atta=60;arp=0;rang=25;ranged_hands+=2;spli=0;}
    
    
    
    if (thawep="Storm Shield"){melee_hands+=1;ranged_hands+=1;atta=0;arp=0;rang=0;spli=0;
        descr="A powered shield that must be held with a hand.  While powered by the marines armor it shimmers with blue energy.";
        spe_descr="+30% HP, +8 Armor";}
    if (thawep="Boarding Shield"){melee_hands+=1;atta=0;arp=0;rang=0;spli=0;
        descr="Used in siege or boarding operations, this shield offers additional protection.  It may be used with a 2-handed ranged weapon.";
        spe_descr="+20% HP, +4 Armor";}
    if (thawep="Hellgun"){atta=30;arp=0;rang=6.1;ranged_hands+=2;amm=10;
        descr="";}
    if (thawep="Hellrifle"){atta=150;arp=90;rang=8;ranged_hands+=2;
        descr="Normally used by Radical "+string(obj_img.faction_dude_formal[4])+"s, it appears an antiquated rifle but fires razor-sharp shards of "+string(obj_img.demon_formal)+"ic matter.";}
    if (thawep="Archeotech Laspistol"){atta=120;arp=0;rang=3.1;ranged_hands+=1;
        descr="Known as a Lasrod or Gelt Gun, this pistol is an ancient design of Laspistol with much greater range and power.";}
    
    if (thawep="Combat Knife"){atta=40;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="More of a sword than knife proper, this tough and thick blade becomes a deadly weapon in the hand of an "+string(obj_img.faction_dude_formal[1])+".";}
    if (thawep="Sarissa"){atta=40;arp=0;rang=1;spli=1;
        descr="A vicious combat attachment that is attached to "+string(obj_img.gyro)+"s, in order to allow them to be used in melee combat.";}
    if (thawep=string(obj_img.blade)+"sword"){atta=60;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="A standard Chainsword.  It is popular among Assault Marines due to the raw power and anti-armor capabilities.";}
    if (thawep=string(obj_img.blade)+"axe"){atta=80;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="A weapon most frequently seen in the hands of Chaos, this Chainaxe uses motorized chainsaw teeth to maim and tear.";}
    if (thawep="Eviscerator"){atta=160;arp=0;rang=1;melee_hands+=2;spli=1;
        descr="An obscenely large Chainsword, this two-handed weapon can carve through flesh and plasteel with equal ease.";}
    if (thawep="Power Sword"){atta=120;arp=0;rang=1;melee_hands+=1;spli=1;spe_descr="Parry";
        descr="A preeminent type of Power Weapon.  When active the blade becomes sheathed in a lethal haze of disruptive energy.";}
    if (thawep="Master Crafted Power Sword"){atta=144;arp=0;rang=1;melee_hands+=1;spli=1;spe_descr="Parry";
        descr="";}
    if (thawep=string(obj_img.faction[6])+" Power Sword"){atta=150;arp=0;rang=1;melee_hands+=1;spli=1;spe_descr="Parry";
        descr="";}
    if (thawep="Power Weapon"){atta=120;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="";}
    if (thawep="Power Axe"){atta=130;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="Similar to the Power Sword, this weapon can be activated to sheathe the axe-head in a lethal haze of disruptive energy.";}
    if (thawep="Power Fist"){atta=300;arp=0;rang=1;melee_hands+=1;ranged_hands+=1;spli=1;
        descr="A large, metal gauntlet surrounded by an energy field.  Though large and slow it dishes out tremendous damage.";}
    if (thawep="Lightning Claw"){atta=230;arp=1;rang=1;melee_hands+=1;ranged_hands+=1;spli=1;
        descr="Created by attaching several long, energized blades to a standard power fist.  Allows better ripping and tearing.";}
    if (thawep=string(obj_img.blade)+"fist"){atta=300;arp=1;rang=1;melee_hands+=1;ranged_hands+=1;spli=0;
        descr="Created by mounting a chainsword to a power fist, this weapon is easily able to carve through armored bulkheads.";}
    if (thawep="Lascutter"){atta=100;arp=1;rang=1;melee_hands+=1;spli=0;
        descr="Origonally industrial tools used for breaking through bulkheads, this laser weapon is devastating in close combat.";}
    
    
    if (thawep="Force Weapon"){
        atta=400;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="An advanced, psychically-attuned close combat weapon that is only fully effective in the hands of a psyker.";
        if (argument6!="description") and (argument6!="description_long"){
        if (string_count("0",marine_powers[argument3])>0){atta=400;arp=0;rang=1;melee_hands+=1;spli=1;}
        if (string_count("0",marine_powers[argument3])=0){thawep="Inactive Force Weapon";atta=30;arp=0;rang=1;melee_hands+=1;}}
        // if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then melee_hands-=1;
    }
    if (thawep="Master Crafted Force Weapon"){
        atta=480;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="A more expertly crafted Force Weapon, the fine craftsmanship confers greater ease and control with disrupting matter.";
        if (argument6!="description") and (argument6!="description_long"){
        if (string_count("0",marine_powers[argument3])>0){atta=480;arp=0;rang=1;melee_hands+=1;spli=1;}
        if (string_count("0",marine_powers[argument3])=0){thawep="Inactive Master Crafted Force Weapon";atta=30;arp=0;rang=1;melee_hands+=1;}}
        // if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then melee_hands-=1;
    }
    
    if (thawep=string(obj_img.hammer)){atta=300;arp=1;rang=1;melee_hands+=1;spli=1;
        descr="This weapon unleashes a massive, disruptive field on impact.  Only experienced marines can use Thunder Hammers.";}
    if (thawep="Master Crafted Thunder Hammer"){atta=360;arp=0;rang=1;melee_hands+=1;spli=1;
        descr="";}
    
    if (thawep=string(obj_img.gyro_adj)+" Pistol"){atta=35;arp=0;rang=3.1;melee_hands+=1;amm=18;
        descr="A smaller, more compact version of the venerable Boltgun.  Standard Godwyn pattern.";}
    if (thawep="Webber"){atta=40;arp=0;rang=4.1;ranged_hands+=2;amm=5;spli=0;
        descr="";}
    if (thawep="Underslung "+string(obj_img.gyro)){atta=60;arp=0;rang=10;amm=8;spli=1;}// Bursts
    
    if (thawep=string(obj_img.gyro)){atta=40;arp=0;rang=12;ranged_hands+=2;amm=15;spli=1;
        if (argument6!="description") and (argument6!="description_long"){
        if (string_count(obj_img.battlesuit,marine_armor[argument3])>0) then melee_hands-=1;
        if (marine_armor[argument3]="Tartaros") then melee_hands-=1;}
        if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
        descr="A standard Godwyn Pattern "+string(obj_img.gyro)+".  This blessed weapon is used by most "+string(obj_img.faction_dudes_formal[1])+".";}// Bursts
    if (thawep="Master Crafted Combiflamer"){atta=50;arp=0;rang=12;ranged_hands+=2;amm=15;spli=1;
        descr="";}// Bursts
    if (thawep="Combiflamer"){atta=40;arp=0;rang=12;ranged_hands+=2;amm=15;spli=1;
        descr="A Boltgun with a one-shot Flamer strapped to the side.  It is useful for close quarters fighting.";}// Bursts
    if (thawep="Twin Linked "+string(obj_img.gyro)+"s"){atta=60;arp=0;rang=12;ranged_hands+=2;amm=15;spli=1;
        descr="";}// Bursts
    
    if (thawep="Heavy "+string(obj_img.gyro)){atta=160;arp=0;rang=16;ranged_hands+=2;amm=20;spli=1;
        descr="An enormous "+string(obj_img.gyro)+"gun.  This weapon can fire a hail of powerful, armor-piercing bolts at the enemy.";}
    if (thawep="Master Crafted Heavy "+string(obj_img.gyro)){atta=192;arp=0;rang=16;ranged_hands+=2;amm=20;spli=1;
        descr="";}
    if (thawep="Storm "+string(obj_img.gyro)){atta=60;arp=0;rang=8;ranged_hands+=2;amm=10;spli=1;
        if (argument6!="description") and (argument6!="description_long"){
        if (string_count(obj_img.battlesuit,marine_armor[argument3])>0) then melee_hands-=1;
        if (marine_armor[argument3]="Tartaros") then melee_hands-=1;}
        if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
        descr="Compact, and double barreled, this bolt weapon is inaccurate but grants an enormous amount of firepower.";}
    if (thawep="Flamer"){atta=160;arp=-1;rang=2.1;ranged_hands+=2;amm=4;spli=1;
        if (argument6!="description") and (argument6!="description_long"){
        if (string_count(obj_img.battlesuit,marine_armor[argument3])>0) then melee_hands-=1;
        if (marine_armor[argument3]="Tartaros") then melee_hands-=1;
        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then atta=40;
        }
        if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
        descr="Blackened at the tip, this weapon unleashes a torrent of burning promethium- all the better to cleanse sin and impurity with.";}
    if (thawep="Underslung Flamer"){atta=200;arp=-1;rang=2.1;amm=4;spli=1;
        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then atta=35;
    }
    if (thawep="Incinerator"){atta=200;arp=-1;rang=2.1;ranged_hands+=2;amm=4;spli=1;
        if (argument6!="description") and (argument6!="description_long"){
        if (string_count(obj_img.battlesuit,marine_armor[argument3])>0) then melee_hands-=1;
        if (marine_armor[argument3]="Tartaros") then melee_hands-=1;
        if (obj_ncombat.enemy=10) and (obj_ncombat.threat=7) then atta=300;
        }
        if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
        descr="This flamer weapon includes special promethium and sacred oils.  It is particularly effective against "+string(obj_img.demons_formal)+" and their ilk.";}
    if (thawep="Heavy Flamer"){atta=250;arp=-1;rang=2;ranged_hands+=2;amm=6;spli=1;
        if (argument6!="description") and (argument6!="description_long"){
        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then atta=60;
        }
        descr="A much larger and bulkier flamer.  Few armies carry them on hand, instead choosing to mount them to vehicles.";}
    if (thawep="CCW Heavy Flamer"){atta=250;arp=-1;rang=2.1;amm=6;spli=1;
        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then atta=60;
    }
    if (thawep="Inferno Cannon"){atta=400;arp=-1;rang=3.1;spli=1;
        if (argument6!="description") and (argument6!="description_long"){
        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then atta=90;
        }
        descr="A huge, vehicle mounted flame weapon that fires with explosive force.  The resevoir is liable to explode.";}
    
    
    if (thawep="Meltagun"){atta=200;arp=1;rang=2.1;ranged_hands+=2;amm=4;
        descr="A relatively quiet weapon, this gun vaporizes flesh and armor alike.  Due to heat dissipation it has only a short range.";}
        if (thawep="Master Crafted Meltagun"){atta=240;arp=1;rang=2.1;ranged_hands+=2;amm=4;
        descr="";}
    if (thawep="Multi-Melta"){atta=300;arp=1;rang=4.1;ranged_hands+=2;amm=6;
        descr="Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.";}
    if (thawep="Plasma Pistol"){atta=70;arp=1;rang=3.1;melee_hands+=1;
        descr="A smaller version of the plasma gun, this dangerous-to-use weapon has exceptional armor-piercing capabilities.";}
    if (thawep="Master Crafted Plasma Pistol"){atta=120;arp=0;rang=3.1;melee_hands+=1;
        descr="";}
    if (thawep="Infernus Pistol"){atta=100;arp=1;rang=2.1;melee_hands+=1;amm=4;
        descr="";}
    if (thawep="Plasma Gun"){atta=140;arp=1;rang=10;ranged_hands+=2;spli=1;
        descr="A 2-handed firearm that launches bolts of plasma.  They are considered both sacred and dangerous, occasionally overheating.";}
    if (thawep="Master Crafted Plasma Gun"){atta=168;arp=1;rang=10;ranged_hands+=2;spli=1;
        descr="";}
    
    if (thawep="Sniper Rifle"){atta=60;arp=0;rang=25;ranged_hands+=2;amm=20;
        descr="Fires a solid shell and boasts powerful telescopic sights, allowing the user to target enemy weak points and distant foes.";}
    if (thawep="Assault Cannon"){atta=170;arp=0;rang=18;ranged_hands+=2;amm=10;spli=1;
        descr="A heavy, rotary auto-cannon frequently used by "+string(obj_img.unit[1,6])+"s and "+string(obj_ini.role[100,4])+"s.  Has an incredible rate of fire.";
        if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
    }
    if (thawep="Autocannon"){atta=140;arp=0;rang=14;ranged_hands+=2;amm=10;spli=1;
        descr="A rapid-firing weapon able to use a wide variety of ammunition, from mass-reactive explosive to solid shells.";
        if (obj_controller.menu=1) and ((string_count(obj_img.battlesuit,marine_armor[0])>0) or (marine_armor[0]="Tartaros")) then ranged_hands-=1;
    }
    if (thawep="Missile Launcher"){atta=200;arp=1;rang=20;ranged_hands+=1;amm=4;spli=1;
        descr="This heavy weapon is capable of firing either armor-piercing or fragmentation rockets.  Has low ammunition count.";}
    if (thawep=string(obj_img.laser)+"cannon"){atta=200;arp=1;rang=20;ranged_hands+=2;amm=8;
        descr="A formidable laser weapon, this lascannon can pierce most vehicle or power armor from a tremendous range.";}
    
    if (thawep="Conversion Beam Projector"){atta=100;arp=0;rang=20;ranged_hands+=1;spli=1;
        descr="";}
    if (thawep="Integrated "+string(obj_img.gyro)+"s"){atta=60;arp=0;rang=8.1;amm=20;spli=1;
        descr="";}
    if (thawep="Power Fists"){atta=450;arp=0;rang=1;melee_hands+=2;spli=1;
        descr="While not quite as strong as two Power Fist, these artifacts allow the use of an additional, third weapon.";}
    
    
    if (thawep="Close Combat Weapon"){atta=200;arp=1;rang=1;melee_hands+=1;spli=1;
        descr="While a variety of melee weapons are used by "+string(obj_img.unit[1,6])+"s, this power fist with flamer is the most common.";}
    
    if (thawep="Twin Linked Heavy "+string(obj_img.gyro)){atta=240;arp=0;rang=16;spli=1;
        descr="";}
    if (thawep="Twin Linked Lascannon"){atta=400;arp=1;rang=20;
        descr="";}
    if (thawep="Lascannons"){atta=400;arp=1;rang=20;
        descr="";}
    if (thawep="Heavy "+string(obj_img.gyro)+"s"){atta=320;arp=0;rang=16;spli=1;
        descr="";}
    if (thawep="Whirlwind Missiles"){atta=250;arp=0;rang=20;spli=1;
        descr="";}
    
        
    
    
    
    // STC Bonuses
    if (obj_controller.stc_bonus[1]>0){
        if (obj_controller.stc_bonus[1]=1){if (string_count(string(obj_img.gyro_adj)+" ",thawep)>0){atta=round(atta*1.07);}}
        if (obj_controller.stc_bonus[1]=2){if (string_count(string(obj_img.blade)+"",thawep)>0){atta=round(atta*1.07);}}
        if (obj_controller.stc_bonus[1]=3) and ((thawep="Flamer") or (thawep="Heavy Flamer")
         or (thawep="Inferno Cannon") or (thawep="CCW Heavy Flamer")){atta=round(atta*1.1);}
        if (obj_controller.stc_bonus[1]=4){if (thawep="Missile Launcher") or (thawep="Whirlwind Missiles"){atta=round(atta*1.1);}}
        if (obj_controller.stc_bonus[1]=5) and (emor>0) and (statt>0){if (statt>=40) then statt+=2;if (statt<40) then statt+=1;}
    }
    if (obj_controller.stc_bonus[2]>0){
        if (obj_controller.stc_bonus[2]=1){if (string_count("ist",thawep)>0){atta=round(atta*1.1);}}
        if (obj_controller.stc_bonus[2]=2){if (string_count("Plasma",thawep)>0){atta=round(atta*1.1);}}
        if (obj_controller.stc_bonus[2]=3) and (emor>0) and (statt>0){if (statt>=40) then statt+=2;if (statt<40) then statt+=1;}
    }
    
    if (argument2=false) and (obj_controller.stc_bonus[3]=2){
        if (atta>0) then atta=round(atta*1.05);
        // if (arp>0) then arp=round(arp*1.05);
    }
    
        
    
    
        
    
    
    
    if (argument6="description") or (argument6="description_long"){// was i=2
        /*if (i=1){
            disk1=descr;
            atta1=atta;
            arp1=arp;
            rang1=rang;
            ammo1=amm;
            spli1=spli;
            rending1=rending;
            spe_descr1=spe_descr;
        }
        
        descr=disk1;
        atta=att1;
        arp=apa1;
        rang=rang1;
        amm=ammo1;
        spli=spli1;
        rending=rending1;
        spe_descr=spe_descr1;*/
        
        
        
        if (string_count(string(obj_img.gyro),thawep)>0) and (string_count("Drilling",obj_ini.strin)>0){
            if (atta>0) then atta=round(atta*1.15);
            // if (arp>0) then arp=round(arp*1.15);
        }
        
        if (instance_exists(obj_shop)){
            if (atta>0){
                obj_shop.tooltip_weapon=1;
                obj_shop.tooltip_stat1=atta;
                obj_shop.tooltip_stat2=arp;
                obj_shop.tooltip_stat3=max(ranged_hands,melee_hands);
                obj_shop.tooltip_stat4=amm;
                
                if (rang<=1.1){
                    obj_shop.tooltip_other="Melee";
                    if (spli=1) then obj_shop.tooltip_other+=", Splash";
                }
                if (rang>1.1){
                    obj_shop.tooltip_other=string(round(rang))+" Range";
                    if (spli=1) then obj_shop.tooltip_other+=", Rapid Fire";
                }
                
                if (arp=-1) then obj_shop.tooltip_other+=", Low Penetration";
                if (arp=1) then obj_shop.tooltip_other+=", Armor Piercing";
                
            }
            if (atta=0) and (statt=0){// Held something
                obj_shop.tooltip_weapon=2;
                obj_shop.tooltip_other=spe_descr;
            }
            if (atta=0) and (melee_hands+ranged_hands=0) and (statt>0){// Armor
                obj_shop.tooltip_weapon=3;
                obj_shop.tooltip_stat1=statt;
                obj_shop.tooltip_other=spe_descr;
            }
        }
        
        if (!instance_exists(obj_shop)) and (!instance_exists(obj_ncombat)) and (((obj_controller.menu=1) and (obj_controller.managing>0)) or (obj_controller.menu=13)){
            // 0.6
            menu_artifact_type=4;
            
            if (atta>0){
                obj_controller.tooltip_stat1=atta;
                obj_controller.tooltip_stat2=arp;
                obj_controller.tooltip_stat3=max(ranged_hands,melee_hands);
                obj_controller.tooltip_stat4=amm;
                
                if (rang<=1.1){menu_artifact_type=1;
                    obj_controller.tooltip_other="Melee";
                    if (spli=1) then obj_controller.tooltip_other+=", Splash";
                }
                if (rang>1.1){menu_artifact_type=1;
                    obj_controller.tooltip_other=string(round(rang))+" Range";
                    if (spli=1) then obj_controller.tooltip_other+=", Rapid Fire";
                }
                
                if (arp=-1) then obj_controller.tooltip_other+=", Low Penetration";
                if (arp=1) then obj_controller.tooltip_other+=", Armor Piercing";
            }
            if (atta=0) and (statt=0){// Held something
                obj_controller.tooltip_other=spe_descr;
                menu_artifact_type=3;
                obj_controller.tooltip_stat1=0;
                obj_controller.tooltip_stat2=0;
                obj_controller.tooltip_stat3=max(ranged_hands,melee_hands);
                obj_controller.tooltip_stat4=0;
            }
            if (atta=0) and (statt>0){// Armor
                obj_controller.tooltip_stat1=statt;
                obj_controller.tooltip_other=spe_descr;
                menu_artifact_type=2;
            }
        }
        
        // exit;exit;
    }
    
    
    
    
    
    if (argument6!="description") and (argument6!="description_long"){
        if (argument2=false) then amm=-1;
        if (argument2!=false){if (string_count(obj_img.unit[1,6],marine_armor[argument3])>0) and (marine_mobi[argument3]="") then amm=-1;}
        if (thawep="Whirlwind Missiles") then amm=6;
        
        if (rending1=1){
            var rend;rend=choose(1,2,3,4,5,6);
            if (rend=6){
                if (atta>0) then atta=atta*2;
                // if (arm>0) then arp=arp*2;
            }
        }
        if (rang1=1){
            atta=atta*marine_attack[argument3];// arp=arp*marine_attack[argument3];
            if (marine_might[argument3]>0){
                atta=atta*2;// arp=arp*2;
            }
            if (marine_spatial[argument3]>0){
                atta=atta*1.75;// arp=arp*1.75;
            }
            if (marine_fiery[argument3]>0){
                atta=atta*1.3;// arp=arp*1.3;
            }
        }
        if (rang1>1){
            atta=atta*marine_ranged[argument3];
            // arp=arp*marine_ranged[argument3];
        }
        
        if (obj_ncombat.bolter_drilling=1) and ((string_count(string(obj_img.gyro_adj)+" ",thawep)>0) or (string_count("ombi",thawep)>0)){
            atta=round(atta*1.15);// arp=round(arp*1.15)
        }
        if (obj_ncombat.melee=1) and (rang=1){
            atta=round(atta*1.1);// arp=round(arp*1.1);
        }
        if (rang=1){
            atta=round(atta*obj_ncombat.global_melee);
            // arp=round(arp*obj_ncombat.global_melee);
        }
        
        
        if (argument2=true){
            if (marine_exp[argument3]>30){
                var ttt;ttt=marine_exp[argument3]-30;
                ttt=(ttt*0.0014)+1;ttt=max(1,(min(ttt,1.5)));// was 1.25
                if (ttt>=1) then atta=floor(atta*ttt);
                // if (ttt>=1) then arp=floor(arp*ttt);
                atta=atta*obj_ncombat.global_attack;
                // arp=arp*obj_ncombat.global_attack;
            }
        }
        if (argument2=false){
            atta=atta*obj_ncombat.global_attack;
            // arp=arp*obj_ncombat.global_attack;
        }
        
        
        if (ranged_hands>2) and (rang>1) and (argument2=true) and (argument4=false){
            atta=atta*0.6;// arp=arp*0.6;
        }
        if (melee_hands>2) and (rang<=1) and (argument2=true) and (argument4=false){
            atta=atta*0.6;// arp=arp*0.6;
        }
        
        if (i=1){att1=atta;apa1=arp;rang1=rang;ammo1=amm;spli1=spli;}
        if (i=2){att2=atta;apa2=arp;rang2=rang;ammo2=amm;spli2=spli;}
        
    
        // This is giving problems
        if (melee_hands=0) and (argument2=true) and (argument4=false) and (i=2){
            var atta;
            atta=obj_ncombat.global_attack*10;
            var b,goody,opn;b=0;goody=0;opn=0;
            repeat(30){b+=1;
                if (wep[b]="melee"){
                    goody=b;att[b]+=atta;range[b]=1;wep_num[b]+=1;splash[b]=0;ammo[b]=-1;
                }
                if (wep[b]="") and (opn=0) then opn=b;
                if (goody=0){
                    wep[opn]="melee";att[opn]+=atta;range[opn]=1;wep_num[opn]=1;splash[opn]=0;ammo[opn]=-1;
                }
            }
        }
        
    
    
    
    
    }
    
    
    obj_controller.temp[9000]+=string(thawep)+": "+string(melee_hands)+","+string(ranged_hands)+"|";    
}





// End repeat(2)

if (argument6="description") or (argument6="description_long"){
    if (!instance_exists(obj_shop)) and (!instance_exists(obj_ncombat)) and (obj_controller.menu=1) and (obj_controller.managing>0){
        // obj_controller.temp[9000]="Melee Hands: "+string(melee_hands)+", Ranged Hands: "+string(ranged_hands);
        if (melee_hands<=2) or (argument4=true) then obj_controller.ui_melee_penalty=0;
        if (ranged_hands<=2) or (argument4=true) then obj_controller.ui_ranged_penalty=0;
        if (melee_hands>2) and (argument4=false) then obj_controller.ui_melee_penalty=1;
        if (ranged_hands>2) and (argument4=false) then obj_controller.ui_ranged_penalty=1;
    }
    
    if (argument6="description") then return(descr);
    if (argument6="description_long") then return(descr2);
}





if (argument6!="description") and (argument6!="description_long"){
    var b,goody,found,stack;b=0;goody=0;found=0;stack=1;
    
    thawep=argument0;// 137 135 136 flip fix?
    
    
    if (argument5!="") then stack=0;
    
    
    repeat(60){b+=1;
    
        // show_message(string(goody));
        
        var canc;canc=false;
        if (rang1>1) and (marine_ranged[argument3]=0){
             canc=true;if (floor(rang1)==rang1) then canc=false
        }if (canc=true) then goody=1;
        
        if (goody=0){
            if (stack=1) and (wep[b]=thawep) and (goody=0){
                // if (thawep=wip1){
                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
                    // if (marine_type[argument3]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
                    if (obj_ncombat.started=0) then ammo[b]=ammo1;
                // }
            }
            if (stack=0) and (obj_ncombat.started=0) and (wep[b]="") and (goody=0) and (wep_solo[b]=""){
                if (goody=0){
                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
                    // if (marine_type[argument3]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
                    ammo[b]=ammo1;
                    
                    var title;title=true;
                    if (marine_type[argument3]=obj_img.faction_title[1]) then title=false;
                    if (marine_type[argument3]="Master of Sanctity") then title=false;
                    if (marine_type[argument3]="Chief "+string(obj_ini.role[100,17])) then title=false;
                    if (marine_type[argument3]="Forge Master") then title=false;
                    if (marine_type[argument3]="Master of the Apothecarion") then title=false;
                    if (title=true) then wep_title[b]=string(marine_type[argument3]);
                    wep_solo[b]=string(obj_ini.name[marine_co[argument3],marine_id[argument3]]);
                }
            }
            
            if (stack=0) and (obj_ncombat.started=1) and (wep[b]=thawep) and (wep_solo[b]=argument5) and (goody=0){
                att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
                // if (marine_type[argument3]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
                
                var title;title=true;
                if (marine_type[argument3]=obj_img.faction_title[1]) then title=false;
                if (marine_type[argument3]="Master of Sanctity") then title=false;
                if (marine_type[argument3]="Chief "+string(obj_ini.role[100,17])) then title=false;
                if (marine_type[argument3]="Forge Master") then title=false;
                if (marine_type[argument3]="Master of the Apothecarion") then title=false;
                if (title=true) then wep_title[b]=string(marine_type[argument3]);
                wep_solo[b]=string(obj_ini.name[marine_co[argument3],marine_id[argument3]]);
            }
        }
    }
    
    b=0;
    if (stack=1) and (goody=0){
        repeat(60){b+=1;
            var canc;canc=false;
            if (rang1>1) and (marine_ranged[argument3]=0){
                 canc=true;if (floor(rang1)==rang1) then canc=false
            }
            
            if (wep[b]="") and (goody=0) and (canc=false){
                // if (thawep=wip1){
                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
                    // if (marine_type[argument3]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
                    if (obj_ncombat.started=0) then ammo[b]=ammo1;
                // }
            }
        }
    }
    

}
