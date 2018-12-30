  
  
  
// 48,48      over like 256, down to 480-128

if (obj_controller.menu=60){var xx,yy;
    xx=view_xview[0]+25;yy=view_yview[0]+165;
    
    draw_sprite(spr_popup_large,1,xx,yy);
    // draw_set_color(0);draw_rectangle(xx+31,yy+29,xx+593,yy+402,0);
    draw_set_color(c_gray);
    // draw_rectangle(xx+31,yy+47,xx+593,yy+402,1);
    
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    var title,ups;title="";ups=obj_temp_build.lair+obj_temp_build.arsenal+obj_temp_build.gene_vault;
    
    if (obj_temp_build.new=1){
        title="Secret Lair ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
        draw_text_transformed(xx+312-64,yy+10,title,0.7,0.7,0);
        
        draw_set_font(fnt_40k_14b);
        draw_text(xx+312,yy+45,"Select a Secret Lair style.");
        draw_set_halign(fa_left);
        
        var r,wob,word;r=0;wob="";word="";
        repeat(9){r+=1;
            if (r=1){wob="Barbarian";word="Heavy on leather, hides, and trophy body parts.";}
            if (r=2){wob="Disco";word="Rainbow colored dance floor and steel rafters.";}
            if (r=3){wob="Feudal";word="Mortar and brick surfaces with wood furnishings.";}
            if (r=4){wob="Gothic";word="Lots of stone, metal filigree, and statues.";}
            if (r=5){wob="Mechanicus";word="Grates, tubes, gears, and augmented reality.";}
            if (r=6){wob="Prospero";word="Marble or standstone surfaces and gold filigree.";}
            if (r=7){wob="Rave Club";word="Large, open area with neon or strobe lights.";}
            if (r=8){wob="Steel";word="Stainless steel surfaces and water fountains.";}
            if (r=9){wob="Utilitarian";word="Plaster or concrete surfaces with carpeting.";}
            
            draw_set_color(c_gray);draw_rectangle(xx+21,yy+38+(r*30),xx+600,yy+56+(r*30),0);
            if (scr_hit(xx+21,yy+38+(r*30),xx+600,yy+56+(r*30))=true){
                draw_set_color(c_black);draw_set_alpha(0.2);draw_rectangle(xx+21,yy+38+(r*30),xx+600,yy+56+(r*30),0);draw_set_alpha(1);
                
                if (obj_controller.mouse_left=1) and (obj_controller.cooldown<=0){
                    obj_controller.cooldown=8000;var tag;tag="";
                    if (r=1) then tag="BRB";if (r=2) then tag="DIS";if (r=3) then tag="FEU";
                    if (r=4) then tag="GTH";if (r=5) then tag="MCH";if (r=6) then tag="PRS";
                    if (r=7) then tag="RAV";if (r=8) then tag="STL";if (r=9) then tag="UTL";
                    obj_temp_build.target.p_upgrades[obj_controller.selecting_planet]+=string(tag)+"|";
                    obj_temp_build.new=0;
                }
            }
            draw_set_color(0);
            draw_set_font(fnt_40k_14b);draw_text_transformed(xx+23,yy+40+(r*30),string(wob),1,0.8,0);
            draw_set_font(fnt_40k_14);draw_text_transformed(xx+121,yy+40+(r*30),string(word),1,0.8,0);
        }
        exit;
    }
    
    
    
    
    
    if (ups=0) then title="Build ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
    if (ups!=0) and (string_count("Secret",obj_temp_build.target.p_feature[obj_controller.selecting_planet])>0){
        if (obj_temp_build.lair!=0) then title="Secret Lair ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
        if (obj_temp_build.arsenal!=0) then title="Secret Arsenal ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
        if (obj_temp_build.gene_vault!=0) then title="Secret Gene-Vault ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
    }
    if (ups!=0) and (string_count("Secret",obj_temp_build.target.p_feature[obj_controller.selecting_planet])=0){
        if (obj_temp_build.lair!=0) then title="Lair ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
        if (obj_temp_build.arsenal!=0) then title="Arsenal ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
        if (obj_temp_build.gene_vault!=0) then title="Gene-Vault ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
    }
    draw_text_transformed(xx+312,yy+10,title,0.7,0.7,0);
    
    
    draw_set_halign(fa_left);
    
    
    
    if (ups>0) and (obj_temp_build.lair>0){
        var woob;woob="";secret=true;
        if (string_count("Secret",obj_temp_build.target.p_feature[obj_controller.selecting_planet])=0) then secret=false;
        
        var r,butt,alp,cost,fuck,tooltip,tooltip2,tooltip3,tooltip4,tcost;r=0;tcost=0;butt="";alp=1;cost=0;fuck=obj_temp_build;tooltip="";tooltip2="";tooltip3="";tooltip4="";
        repeat(12){r+=1;alp=1;cost=0;
            if (r=1){if (fuck.forge>0) then alp=0.33;cost=1000;butt="Forge";tooltip2="A modest, less elaborate forge able to employ a handful of Astartes or Techpriest.";}
            if (r=2){if (fuck.hippo>0) then alp=0.33;cost=1000;butt="Hippodrome";tooltip2="A moderate sized garage fit to hold, service, and display vehicles.";}
            if (r=3){if (fuck.beastarium>0) then alp=0.33;cost=1000;butt="Beastarium";tooltip2="An enclosure with simulated greenery and foilage meant to hold beasts.";}
            if (r=4){if (fuck.torture>0) then alp=0.33;cost=500;butt="Torture Chamber";tooltip2="Only the best for the best.  A room full of torture tools and devices.";}
            if (r=5){if (fuck.narcotics>0) then alp=0.33;cost=500;butt="Narcotics";tooltip2="Several boxes worth of Obscura, Black Lethe, Kyxa... line it up.";}
            if (r=6){if (fuck.relic>0) then alp=10+fuck.relic;cost=500;butt="Relic Room";tooltip2="A room meant for displaying trophies.  May be purchased successive times.";}
            if (r=7){if (fuck.cookery>0) then alp=0.33;cost=250;butt="Cookery";tooltip2="A larger, well-stocked cookery, complete with a number of Imperial Chef servants.";}
            if (r=8){if (fuck.vox>0) then alp=0.33;cost=250;butt="Vox Casters";tooltip2="All the bass one could ever imaginably need.";}
            if (r=9){if (fuck.librarium>0) then alp=0.33;cost=250;butt="Librarium";tooltip2="A study fit to hold a staggering amount of tomes and scrolls.";}
            if (r=10){if (fuck.throne>0) then alp=0.33;cost=250;butt="Throne";tooltip2="A massive, ego boosting throne.";}
            if (r=11){if (fuck.stasis>0) then alp=0.33;cost=200;butt="Stasis Pods";tooltip2="Though they start empty, you may capture and display your foes in these.";}
            if (r=12){if (fuck.swimming>0) then alp=0.33;cost=100;butt="Swimming Pool";tooltip2="A large body of water meant for excersize or relaxation.";}
            tooltip=butt;
            
            draw_set_font(fnt_40k_14);draw_set_alpha(alp);draw_set_color(c_gray);
            draw_rectangle(xx+494,yy+12+((r-1)*22),xx+614,yy+32+((r-1)*22),0);draw_set_color(c_black);
            draw_text_transformed(xx+496,yy+14+((r-1)*22),string(butt),1,0.9,0);draw_set_alpha(1);
            
            if (scr_hit(xx+494,yy+12+((r-1)*22),xx+614,yy+32+((r-1)*22))=true){
                if (alp<=0.33) then draw_set_alpha(0.1);if (alp>0.33) then draw_set_alpha(0.2);draw_set_color(0);
                draw_rectangle(xx+494,yy+12+((r-1)*22),xx+614,yy+32+((r-1)*22),0);draw_set_alpha(1);
                tooltip3=tooltip;tooltip4=tooltip2;tcost=cost;
                if (obj_controller.mouse_left=1) and (obj_controller.cooldown<=0) and (obj_controller.requisition>=tcost) and (alp!=0.33){
                    obj_controller.cooldown=8000;obj_controller.requisition-=tcost;
                    
                    if (r=1){fuck.forge+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="forge|";}
                    if (r=2){fuck.hippo+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="hippo|";}
                    if (r=3){fuck.beastarium+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="beast|";}
                    if (r=4){fuck.torture+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="tort|";}
                    if (r=5){fuck.narcotics+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="narc|";}
                    if (r=6){fuck.relic+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="$";}
                    if (r=7){fuck.cookery+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="cook|";}
                    if (r=8){fuck.vox+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="vox|";}
                    if (r=9){fuck.librarium+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="libra|";}
                    if (r=10){fuck.throne+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="throne|";}
                    if (r=11){fuck.stasis+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="stas|";}
                    if (r=12){fuck.swimming+=1;fuck.target.p_upgrades[obj_controller.selecting_planet]+="swim|";}
                }
            }
        }
        
        woob="Deep beneath the surface of "+string(fuck.target.name)+" "+scr_roman(obj_controller.selecting_planet)+" lays your ";
        if (secret=true) then woob+="secret lair.  ";if (secret=false) then woob+="previously discovered lair.  ";
        var upp;upp="";upp=string(fuck.target.p_upgrades[obj_controller.selecting_planet]);
        
        woob+="It is massive";
        if (string_count("BRB",upp)>0) then woob+=", the walls decorated with animal hides and leather.  Among the copius body-trophies and bones are torches that hiss and spit.  ";
        if (string_count("DIS",upp)>0) then woob+="- the main attraction is the rainbow-colored, lit up grid flooring which quickly change color.  Far overhead are metal rafters.  ";
        if (string_count("FEU",upp)>0) then woob+=", the walls made up of sturdy blocks of stones.  It is heavily decorated with wooden furniture, banners, and medieval weaponry.  ";
        if (string_count("GTH",upp)>0) then woob+=", the walls made up of lightly-dusty stone.  Mosaics and statues are abundant throughout, giving it that comfortable gothic feel.  ";
        if (string_count("MCH",upp)>0) then woob+="- at a glance it appears decorated like a factory.  Those with a neural network see the lair as brightly colored and lit, full of knowledge, learning, and chapter iconography.  ";
        if (string_count("PRS",upp)>0) then woob+=", the walls made up of polished sandstone or marble.  All throughout are chapter iconography and ancient symbols, wrought in gold.  ";
        if (string_count("RAV",upp)>0) then woob+=" but nearly pitch-black inside.  The only illumination is provided by loopy neon lux-casters, and strobes, which blast out light in random, flickering patterns.  ";
        if (string_count("STL",upp)>0) then woob+=".  All of the surfaces are made up of highly polished stainless steel.  An occasional small water fountain or plant decorates the place.  ";
        if (string_count("UTL",upp)>0) then woob+=" and almost civilian looking in nature- the walls are up of simple concrete or plaster.  A thick carpet covers much of the floor.";
        
        
        if (string_count("throne",upp)>0){
            woob+="  The center chamber is dominated by ";
            var yep,c;yep=false;c=0;
            
            if (obj_controller.temp[104]=string(obj_temp_build.target.name)+"."+string(obj_controller.selecting_planet)) then yep=true;
            if (yep=true) then woob+="a massive throne, which you are currently seated upon.  ";
            if (yep=false) then woob+="a massive throne, though it is currently vacant.  ";
        }
        if (string_count("vox",upp)>0) and (fuck.target.p_player[obj_controller.selecting_planet]>0) then woob+="Heretical music blasts from the vox-casters, shaking the walls.  ";
        if (string_count("narc",upp)>0) then woob+="  Many of the tables have lines of white powder set on paper or bunches of needles.  Plastic straws lay close by.  ";
        if (string_count("cook",upp)>0){
            if (fuck.target.p_player[obj_controller.selecting_planet]>0) then woob+="Imperial Chefs are currently bustling to and from the kitchen, cooking savory treats and food for those present.  ";
            if (fuck.target.p_player[obj_controller.selecting_planet]=0) then woob+="The Imperial Chefs are mostly idle, making use of the other rooms and facilities.  ";
        }
        
        if (string_count("$",upp)=1) then woob+="  One of the chambers is hollowed out to display war trophies and gear.  ";
        if (string_count("$",upp)=2) then woob+="  One of the chambers holds war trophies from recent conquests.  ";
        if (string_count("$",upp)=3) then woob+="  War trophies taken from several Xeno races are displayed in the Relic Room.  ";
        if (string_count("$",upp)=4) then woob+="  Your Relic Room contains trophies and skulls, taken from every Xeno race.  ";
        if (string_count("$",upp)=5) then woob+="  Your Relic Room contains trophies, skulls, and suits of armor taken from Xenos races.  ";
        if (string_count("$",upp)=6) then woob+="  Your Relic Room contains wargear and suits of armor from all races, several Adeptus Astartes suits included.  ";
        if (string_count("$",upp)=7) then woob+="  One of the chambers holds wargear and suits of armor from all races.  A suit of Terminator armor is included, half of the armor taken off to reveal the inner workings.";
        if (string_count("$",upp)=8) then woob+="  Your Relic Room's trophies, skulls, and armors now spill out into the hallways, such is their number.  ";
        if (string_count("$",upp)=9) then woob+="  Many of the xenos war trophies and suits of armor are placed around the Lair, filling out spare surfaces.  ";
        if (string_count("$",upp)=10) then woob+="  In addition to the many war trophies your Relic Room also has small amounts of gold coins.  ";
        if (string_count("$",upp)=11) then woob+="  In addition to the many war trophies your Relic Room also has small piles of gold coins and clutter.  ";
        if (string_count("$",upp)=12) then woob+="  In addition to the many war trophies your Relic Room also has sizeable piles of gold.  ";
        if (string_count("$",upp)=13) then woob+="  In addition to the many war trophies your Relic Room also has chests and cabinets full of gold.  ";
        if (string_count("$",upp)=14) then woob+="  In addition to the many war trophies your Relic Room also has chests full to the brim of gold and many precious gems.  ";
        if (string_count("$",upp)=15) then woob+="  War trophies, chests of gold, precious gems, your lair has it all.  ";
        if (string_count("$",upp)=16) then woob+="  War trophies, chests of gold, precious gems, your lair has it all, and in abundance.  ";
        if (string_count("$",upp)=17) then woob+="  The abundant gold and gem piles have begun to spill out into the hallway.  ";
        if (string_count("$",upp)=18) then woob+="  The abundant gold and gems spill out into the hallway, your forces idly stepping across it.  ";
        if (string_count("$",upp)=19) then woob+="  A sizeable portion of your lair is carelessly covered in gold coins, objects, and gems.  ";
        if (string_count("$",upp)=20) then woob+="  Much of your lair is carelessly covered in gold coins, objects, and gems.  ";
        if (string_count("$",upp)>=21) and (string_count("$",upp)<25) then woob+="  Your abundant wealth is evident in your lair- every surface and much of the floor smothered by gold or gems.  ";
        if (string_count("$",upp)>=25) and (string_count("$",upp)<30) then woob+="  Gold and gems are everywhere, occasionally attached to the walls and ceiling where able.  ";
        if (string_count("$",upp)>=30) then woob+="  Gold and gems are EVERYWHERE.  The main chamber in particular is a sea of gold and gems, especially deep at the corners.  In all it is nearly three feet deep.  Coins clink and settle as your forces walk through the room.  ";
        
        if (string_count("forge",upp)>0) then woob+="  Your lair has a forge, fit to be used by several astartes at once.  ";
        if (string_count("hippo",upp)>0) then woob+="  Your lair has a hippodrome, or garage, that holds luxury vehicles.  ";
        if (string_count("tort",upp)>0) then woob+="  One of the rooms is a well-stocked torture chamber.  ";
        // if (string_count("forge",upp)>0) then woob+="  Your lair has a forge, fit to be used by several astartes at once.  ";
        if (string_count("libra",upp)>0) then woob+="  A large librarium makes up one of the wings, holding countless novels, books, scrolls, and documents on various topics.  ";
        if (string_count("beast",upp)>0) then woob+="  Your lair has a beastarium, animals native to your homeworld living within.  ";
        if (string_count("swim",upp)>0) then woob+="  A large swimming pool with chapter-themed floaties is emplaced near the entrance.  ";
        if (string_count("stas",upp)>0) then woob+="  One of the chambers holds several stasis pods for display.  They are currently empty.  ";
        
        
        draw_set_color(c_gray);draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
        draw_rectangle(xx+12,yy+45,xx+486,yy+378,1);
        
        var hh;hh=1;
        repeat(2){if (((string_height_ext(string(woob),-1,470))*hh)>330) then hh-=0.1;}
        draw_text_ext_transformed(xx+14,yy+47,string(woob),-1,470*(2+(hh*-1)),hh,hh,0);
        
        if (tooltip3!=""){
            draw_set_alpha(1);
            draw_set_font(fnt_40k_14);draw_set_halign(fa_left);draw_set_color(0);
            draw_rectangle(mouse_x+18,mouse_y+20,mouse_x+string_width_ext(tooltip4,-1,500)+24,mouse_y+64+string_height_ext(tooltip4,-1,500),0);
            draw_set_color(c_gray);
            draw_rectangle(mouse_x+18,mouse_y+20,mouse_x+string_width_ext(tooltip4,-1,500)+24,mouse_y+64+string_height_ext(tooltip4,-1,500),1);
            draw_set_font(fnt_40k_14b);draw_text(mouse_x+22,mouse_y+22,string(tooltip3));
            draw_set_font(fnt_40k_14);draw_text_ext(mouse_x+22,mouse_y+42,string(tooltip4),-1,500);
            
            draw_set_color(16291875);if (obj_controller.requisition<tcost) then draw_set_color(c_red);
            draw_sprite(spr_requisition,0,mouse_x+22,mouse_y+45+string_height_ext(tooltip4,-1,500));
            draw_text(mouse_x+42,mouse_y+42+string_height_ext(tooltip4,-1,500),string(tcost));
        }
        
        
    }
    
    
    
    
    if (ups>0) and (obj_temp_build.lair=0){
        var woob,secret;woob="";secret=true;
        if (string_count("Secret",obj_temp_build.target.p_feature[obj_controller.selecting_planet])=0) then secret=false;
        
        draw_set_font(fnt_40k_14b);
        
        if (obj_temp_build.arsenal>0){
            if (secret=true) then woob="A moderate sized secret Arsenal, this structure has ample holding area to store any number of artifacts and wargear.  Chaos and Daemonic items will be sent here by your Master of Relics, and due to the secret nature of its existance, the Inquisition will not find them during routine inspections.";
            if (secret=false) then woob="A moderate sized Arsenal, this structure has ample holding area to store any number of artifacts and wargear.  Since being discovered it may no longer hide Chaos and Daemonic wargear from routine Inquisition inspections.  You may wish to construct another Arsenal on a different planet.";
        }
        if (obj_temp_build.gene_vault>0){
            if (secret=true) then woob="A large facility with Gene-Vaults and additional spare rooms, this structure safely stores the majority of your "+string(obj_img.organics)+" and is ran by servitors.  Due to its secret nature you may amass "+string(obj_img.organics)+" and Test-Slave Incubators without fear of Inquisition reprisal or taking offense.";
            if (secret=false) then woob="A large facility with Gene-Vaults and additional spare rooms, this structure safely stores the majority of your "+string(obj_img.organics)+" and is ran by servitors.  Since being discovered all the contents are known to the Inquisition.  Your "+string(obj_img.organics)+" remains protected but you may wish to build a new, secret one.";
        }
        draw_text_ext(xx+21,yy+65,string(woob),-1,595);
    }
    
    if (ups<0){draw_set_font(fnt_40k_14b);
        draw_text(xx+21,yy+65,"This feature will be constructed in "+string(ups*-1)+" months.");
    }
    if (ups=0){
        draw_set_font(fnt_40k_14b);
        if (obj_temp_build.lair=0) then draw_text(xx+21,yy+45,"Lair");
        if (obj_temp_build.arsenal=0) then draw_text(xx+21,yy+110,"Arsenal");
        if (obj_temp_build.gene_vault=0) then draw_text(xx+21,yy+175,"Gene-Vault");
        draw_set_font(fnt_40k_14);
    
        draw_sprite(spr_requisition,0,xx+160,yy+47);
        draw_set_color(16291875);if (obj_controller.requisition<1000) then draw_set_color(c_red);draw_text(xx+180,yy+47,"1000");draw_set_color(c_gray);
        draw_text_ext(xx+21,yy+65,"Customizable hideout that your forces may garrison into.  The Lair may be upgraded further.",-6,600);
        draw_rectangle(xx+300,yy+45,xx+400,yy+65,0);
        draw_set_halign(fa_center);draw_set_color(0);
        draw_text(xx+350,yy+47,"Build");draw_text(xx+351,yy+48,"Build");
        if (scr_hit(xx+300,yy+45,xx+400,yy+65)=true){
            draw_set_alpha(0.2);draw_rectangle(xx+300,yy+45,xx+400,yy+65,0);draw_set_alpha(1);
            
            if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=1000){
                obj_temp_build.target.p_feature[obj_controller.selecting_planet]+="Secret Lair|";
                obj_temp_build.target.p_upgrades[obj_controller.selecting_planet]="Lair.2|";
                obj_temp_build.lair=-2;obj_temp_build.new=1;
                obj_controller.cooldown=8000;obj_controller.requisition-=1000;
            }
        }draw_set_halign(fa_left);
        
        draw_sprite(spr_requisition,0,xx+160,yy+112);
        draw_set_color(16291875);if (obj_controller.requisition<1500) then draw_set_color(c_red);draw_text(xx+180,yy+112,"1500");draw_set_color(c_gray);
        draw_text_ext(xx+21,yy+130,"Hidden armory that stores unused Chaos and Daemonic artifacts, preventing them from discovery.",-1,600);
        draw_rectangle(xx+300,yy+110,xx+400,yy+130,0);
        draw_set_halign(fa_center);draw_set_color(0);
        draw_text(xx+350,yy+112,"Build");draw_text(xx+351,yy+113,"Build");
        if (scr_hit(xx+300,yy+110,xx+400,yy+130)=true){
            draw_set_alpha(0.2);draw_rectangle(xx+300,yy+110,xx+400,yy+130,0);draw_set_alpha(1);
            
            if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=1500){
                obj_temp_build.target.p_feature[obj_controller.selecting_planet]+="Secret Arsenal|";
                obj_temp_build.target.p_upgrades[obj_controller.selecting_planet]="Arsenal.2|";
                obj_temp_build.arsenal=-2;
                obj_controller.cooldown=8000;obj_controller.requisition-=1500;
            }
        }draw_set_halign(fa_left);
        
        draw_sprite(spr_requisition,0,xx+160,yy+177);
        draw_set_color(16291875);if (obj_controller.requisition<4000) then draw_set_color(c_red);draw_text(xx+180,yy+177,"4000");draw_set_color(c_gray);
        draw_text_ext(xx+21,yy+195,"Hidden gene-vault that off-sources the majority of your "+string(obj_img.organics)+" and Test-Slave Incubators.",-1,600);
        draw_rectangle(xx+300,yy+175,xx+400,yy+195,0);
        draw_set_halign(fa_center);draw_set_color(0);
        draw_text(xx+350,yy+177,"Build");draw_text(xx+351,yy+178,"Build");
        if (scr_hit(xx+300,yy+175,xx+400,yy+195)=true){
            draw_set_alpha(0.2);draw_rectangle(xx+300,yy+175,xx+400,yy+195,0);draw_set_alpha(1);
            
            if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=4000){
                obj_temp_build.target.p_feature[obj_controller.selecting_planet]+="Secret Gene-Vault|";
                obj_temp_build.target.p_upgrades[obj_controller.selecting_planet]="Gene-Vault.3|";
                obj_temp_build.gene_vault=-3;
                obj_controller.cooldown=8000;obj_controller.requisition-=4000;
            }
        }draw_set_halign(fa_left);
        
    }
    
    
    
    draw_set_font(fnt_40k_30b);draw_set_color(c_gray);
    draw_rectangle(xx+312-60,yy+388,xx+312+60,yy+420,0);
    draw_set_halign(fa_center);draw_set_color(0);
    draw_text(xx+312,yy+388,"Back");
    if (scr_hit(xx+312-60,yy+388,xx+312+60,yy+420)=true){
        draw_set_alpha(0.2);draw_rectangle(xx+312-60,yy+388,xx+312+60,yy+420,0);draw_set_alpha(1);
        
        if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1){
            obj_controller.menu=0;obj_controller.cooldown=8000;
        }

    }draw_set_halign(fa_left);
}








if (selected!=0) and (!instance_exists(selected)) then selected=0;



if (popup>0) and (selected!=0) and (zoomed=0) and (sel_system_x+sel_system_y=0) and (diplomacy<=0) and (instance_exists(obj_fleet_select)){
    var zm, tit, mnz;zm=1;tit="";mnz=0;
    
    if (fleet_minimized=0){
        draw_set_color(c_black);draw_rectangle(view_xview[0]+44,view_yview[0]+110,view_xview[0]+267,view_yview[0]+110+obj_fleet_select.void_hei,0);
        draw_set_color(c_gray);draw_rectangle(view_xview[0]+44,view_yview[0]+110,view_xview[0]+267,view_yview[0]+110+obj_fleet_select.void_hei,1);
    }
    if (fleet_minimized=1){mnz=1;
        draw_set_color(c_black);draw_rectangle(view_xview[0]+44,view_yview[0]+110,view_xview[0]+267,view_yview[0]+137,0);
        draw_set_color(c_gray);draw_rectangle(view_xview[0]+44,view_yview[0]+110,view_xview[0]+267,view_yview[0]+137,1);
    }
    draw_set_font(fnt_40k_14);
    
    // draw_text(view_xview[0]+46,view_yview[0]+117,"Title");
    // draw_text(view_xview[0]+46,view_yview[0]+142,"1#2#3#4#5#6#7#8#9#10#11#1#13#14#15#16#17#18#19#20#21#22#23#24#25");    
    
    var type,lines,posi,colu,x3,y3,es,fr,ca,ty,shit,robj,nem,sal,sib,scale,void_h,shew,helth;
    type="capital";lines=0;posi=0;colu=1;x3=48;y3=142-20;ty=0;shit=0;robj=0;nem="";sal=0;scale=1;void_h=122;helth=0;
    es=obj_fleet_select.escort;
    fr=obj_fleet_select.frigate;
    ca=obj_fleet_select.capital;
    
    robj=instance_nearest(obj_fleet_select.x,obj_fleet_select.y,obj_p_fleet);
    
    if (es>0) then ty+=1;
    if (fr>0) then ty+=1;
    if (ca>0) then ty+=1;
    
    repeat(es+fr+ca+ty){
        y3+=20;lines+=1;posi+=1;scale=1;shew=1;helth=100;
        if (colu=1) then void_h=min(void_h+20,560);
        
        if (posi=1){if (mnz=0) then draw_text(view_xview[0]+x3,view_yview[0]+y3,"=Capital Ships=");y3+=20;}
        if (posi=ca+1) and (fr>0){y3+=20;if (mnz=0) then draw_text(view_xview[0]+x3,view_yview[0]+y3,"=Frigates=");y3+=20;}
        if (posi=ca+fr+1) and (es>0){y3+=20;if (mnz=0) then draw_text(view_xview[0]+x3,view_yview[0]+y3,"=Escorts=");y3+=20;}
        
        if (y3>670) and (posi<=es+fr+ca){lines=1;y3=142;x3+=223;posi+=1;colu+=1;}
        
        if (posi<=ca){
            shit=posi;nem=robj.capital[shit];
            if (string_width(nem)*scale>179) then repeat(9){if (string_width(nem)*scale>179) then scale-=0.05;}
            if (mouse_x>=view_xview[0]+x3) and (mouse_x<view_xview[0]+x3+209) and (mouse_y>=view_yview[0]+y3) and (mouse_y<=view_yview[0]+y3+18){
                if (string_width(nem)*scale>135) then repeat(9){if (string_width(nem)*scale>135) then scale-=0.05;}shew=2;
            }
            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
                if (mouse_x>=view_xview[0]+x3) and (mouse_x<view_xview[0]+x3+25) and (mouse_y>=view_yview[0]+y3) and (mouse_y<=view_yview[0]+y3+18){
                    var onceh;onceh=0;cooldown=8000;
                    if (obj_controller.fest_scheduled>0) and (obj_controller.fest_sid=robj.capital_num[shit]) then onceh=1;
                    if (robj.capital_sel[shit]=1) and (onceh=0){robj.capital_sel[shit]=0;onceh=1;}
                    if (robj.capital_sel[shit]=0) and (onceh=0){robj.capital_sel[shit]=1;onceh=1;}
                }
            }
            if (obj_ini.ship_maxhp[shit]>0) then helth=round((obj_ini.ship_hp[shit]/obj_ini.ship_maxhp[shit])*100);
            sal=robj.capital_sel[shit];if (sal=0) then sib="[ ]";if (sal=1) then sib="[x] ";if (mnz=0) then draw_text(view_xview[0]+x3+2,view_yview[0]+y3,sib);
            if (mnz=0) and (shew=2) then draw_text(view_xview[0]+x3+160,view_yview[0]+y3," "+string(helth)+"%");
            if (helth<=60) and (helth>40) then draw_set_color(c_yellow);
            if (helth<=40) and (helth>20) then draw_set_color(c_orange);
            if (helth<=20) then draw_set_color(c_red);
            if (mnz=0) then draw_text_transformed(view_xview[0]+x3+30,view_yview[0]+y3,string(nem),scale,1,0);
            draw_set_color(c_gray);
        }
        if (posi>ca) and (posi<=ca+fr){
            shit=posi-ca;nem=robj.frigate[shit];
            if (string_width(nem)*scale>179) then repeat(9){if (string_width(nem)*scale>179) then scale-=0.05;}
            if (mouse_x>=view_xview[0]+x3) and (mouse_x<view_xview[0]+x3+209) and (mouse_y>=view_yview[0]+y3) and (mouse_y<=view_yview[0]+y3+18){
                if (string_width(nem)*scale>135) then repeat(9){if (string_width(nem)*scale>135) then scale-=0.05;}shew=2;
            }
            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
                if (mouse_x>=view_xview[0]+x3) and (mouse_x<view_xview[0]+x3+25) and (mouse_y>=view_yview[0]+y3) and (mouse_y<=view_yview[0]+y3+18){
                    var onceh;onceh=0;cooldown=8000;
                    if (obj_controller.fest_scheduled>0) and (obj_controller.fest_sid=robj.frigate_num[shit]) then onceh=1;
                    if (robj.frigate_sel[shit]=1) and (onceh=0){robj.frigate_sel[shit]=0;onceh=1;}
                    if (robj.frigate_sel[shit]=0) and (onceh=0){robj.frigate_sel[shit]=1;onceh=1;}
                }
            }
            if (obj_ini.ship_maxhp[shit]>0) then helth=round((obj_ini.ship_hp[shit]/obj_ini.ship_maxhp[shit])*100);
            sal=robj.frigate_sel[shit];if (sal=0) then sib="[ ]";if (sal=1) then sib="[x] ";if (mnz=0) then draw_text(view_xview[0]+x3+2,view_yview[0]+y3,sib);
            if (mnz=0) and (shew=2) then draw_text(view_xview[0]+x3+160,view_yview[0]+y3," "+string(helth)+"%");
            if (helth<=60) and (helth>40) then draw_set_color(c_yellow);
            if (helth<=40) and (helth>20) then draw_set_color(c_orange);
            if (helth<=20) then draw_set_color(c_red);
            if (mnz=0) then draw_text_transformed(view_xview[0]+x3+30,view_yview[0]+y3,string(nem),scale,1,0);
            draw_set_color(c_gray);
        }
        if (posi>ca+fr) and (posi<=ca+fr+es){
            shit=posi-(ca+fr);nem=robj.escort[shit];
            if (string_width(nem)*scale>179) then repeat(9){if (string_width(nem)*scale>179) then scale-=0.05;}
            if (mouse_x>=view_xview[0]+x3) and (mouse_x<view_xview[0]+x3+209) and (mouse_y>=view_yview[0]+y3) and (mouse_y<=view_yview[0]+y3+18){
                if (string_width(nem)*scale>135) then repeat(9){if (string_width(nem)*scale>135) then scale-=0.05;}shew=2;
            }
            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
                if (mouse_x>=view_xview[0]+x3) and (mouse_x<view_xview[0]+x3+25) and (mouse_y>=view_yview[0]+y3) and (mouse_y<=view_yview[0]+y3+18){
                    var onceh;onceh=0;cooldown=8000;
                    if (obj_controller.fest_scheduled>0) and (obj_controller.fest_sid=robj.escort_num[shit]) then onceh=1;
                    if (robj.escort_sel[shit]=1) and (onceh=0){robj.escort_sel[shit]=0;onceh=1;}
                    if (robj.escort_sel[shit]=0) and (onceh=0){robj.escort_sel[shit]=1;onceh=1;}
                }
            }
            if (obj_ini.ship_maxhp[shit]>0) then helth=round((obj_ini.ship_hp[shit]/obj_ini.ship_maxhp[shit])*100);
            sal=robj.escort_sel[shit];if (sal=0) then sib="[ ]";if (sal=1) then sib="[x] ";if (mnz=0) then draw_text(view_xview[0]+x3+2,view_yview[0]+y3,sib);
            if (mnz=0) and (shew=2) then draw_text(view_xview[0]+x3+160,view_yview[0]+y3," "+string(helth)+"%");
            if (helth<=60) and (helth>40) then draw_set_color(c_yellow);
            if (helth<=40) and (helth>20) then draw_set_color(c_orange);
            if (helth<=20) then draw_set_color(c_red);
            if (mnz=0) then draw_text_transformed(view_xview[0]+x3+30,view_yview[0]+y3,string(nem),scale,1,0);
            draw_set_color(c_gray);
        }
    }
    
    obj_fleet_select.void_x=44;
    obj_fleet_select.void_y=110;
    obj_fleet_select.void_wid=colu*223;
    obj_fleet_select.void_hei=void_h;
    
    draw_set_halign(fa_center);
    draw_text(view_xview[0]+46+(obj_fleet_select.void_wid/2),view_yview[0]+115,string(global.chapter_name)+" Fleet");
    draw_set_halign(fa_left);
    
    draw_set_color(c_gray);
    draw_rectangle(view_xview[0]+18+obj_fleet_select.void_wid,view_yview[0]+116,view_xview[0]+36+obj_fleet_select.void_wid,view_yview[0]+134,0);
    
    
    
    
    draw_set_color(c_black);
    if (mnz=0) then draw_text(view_xview[0]+25+obj_fleet_select.void_wid,view_yview[0]+117,"-");
    if (mnz=1) then draw_text(view_xview[0]+23+obj_fleet_select.void_wid,view_yview[0]+116,"+");
    
    draw_set_color(c_gray);
    draw_line(view_xview[0]+44,view_yview[0]+137,view_xview[0]+44+obj_fleet_select.void_wid,view_yview[0]+137);
    
    if (fleet_all=0) then draw_text(view_xview[0]+50,view_yview[0]+117,"[ ]",);
    if (fleet_all=1) then draw_text(view_xview[0]+50,view_yview[0]+116,"[x]");
    
    if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
        if (mouse_x>=view_xview[0]+50) and (mouse_x<view_xview[0]+x3+70) and (mouse_y>=view_yview[0]+117) and (mouse_y<=view_yview[0]+y3+137){
            if (cooldown<=0) and (fleet_all=0){cooldown=8000;fleet_all=1;}
            if (cooldown<=0) and (fleet_all=1){cooldown=8000;fleet_all=0;}
            if (fleet_all=1) then with(selected){
                var i;i=-1;
                repeat(91){i+=1;
                    if (i<=20) then capital_sel[i]=1;
                    frigate_sel[i]=1;
                    escort_sel[i]=1;
                }
            }
            if (fleet_all=0) then with(selected){
                var i;i=-1;
                repeat(91){i+=1;
                    if (i<=20) then capital_sel[i]=0;
                    frigate_sel[i]=0;
                    escort_sel[i]=0;
                }
            }
        }
    }
    
    // draw_set_color(c_red);
    // draw_rectangle(view_xview[0]+obj_fleet_select.void_x,view_yview[0]+obj_fleet_select.void_y,view_xview[0]+obj_fleet_select.void_x+obj_fleet_select.void_wid,view_yview[0]+obj_fleet_select.void_y+obj_fleet_select.void_hei,1);
}




var xx,yy;
xx=view_xview[0]+0;
yy=view_yview[0]+0;

if (scr_hit(xx+5,yy+10,xx+137,yy+38)=true) and (zoomed=0){
    var tx,ty,tool1,tool2,plu;
    tx=0;ty=0;tool1="";tool2="";plu="";
    
    if (obj_ini.fleet_type=1){
        plu="";if (income_base>0) then plu="+";tool1+="Base Income: "+string(plu)+string(income_base);tool2+="Base Income: ";
        plu="";if (income_home>0) then plu="+";tool1+="#"+string(obj_img.hq_ground)+" Bonus: "+string(plu)+string(income_home);tool2+="#"+string(obj_img.hq_ground)+" Bonus: ";
        plu="";if (income_forge>0) then plu="+";if (income_forge>0){tool1+="#Nearby Forge Worlds: "+string(plu)+string(income_forge);tool2+="#Nearby Forge Worlds:";}
        plu="";if (income_agri>0) then plu="+";if (income_forge>0){tool1+="#Nearby Agri Worlds: "+string(plu)+string(income_agri);tool2+="#Nearby Agri Worlds:";}
        plu="";if (income_recruiting>0) then plu="+";if (income_recruiting!=0){tool1+="#Astartes Recruitment: "+string(plu)+string(income_recruiting);tool2+="#Astartes Recruitment:";}
        plu="";if (income_training>0) then plu="+";if (income_training!=0){tool1+="#Specialist Training: "+string(plu)+string(income_training);tool2+="#Specialist Training:";}
        plu="";if (income_fleet>0) then plu="+";tool1+="#Fleet Maintenance: "+string(plu)+string(income_fleet);tool2+="#Fleet Maintenance:";
        plu="";if (income_tribute>0) then plu="+";if (income_tribute!=0){tool1+="#Planet Tithes: "+string(plu)+string(income_tribute);tool2+="#Planet Tithes:";}
    }
    if (obj_ini.fleet_type!=1){
        plu="";if (income_base>0) then plu="+";tool1+="Base Income: "+string(plu)+string(income_base);tool2+="Base Income: ";
        plu="";if (income_home>0) then plu="+";tool1+="#"+string(obj_img.ship[1,1])+" Trade: "+string(plu)+string(income_home);tool2+="#"+string(obj_img.ship[1,1])+" Trade: ";
        plu="";if (income_recruiting>0) then plu="+";if (income_recruiting!=0){tool1+="#Astartes Recruitment: "+string(plu)+string(income_recruiting);tool2+="#Astartes Recruitment:";}
        plu="";if (income_training>0) then plu="+";if (income_training!=0){tool1+="#Specialist Training: "+string(plu)+string(income_training);tool2+="#Specialist Training:";}
        plu="";if (income_fleet>0) then plu="+";tool1+="#Fleet Maintenance: "+string(plu)+string(income_fleet);tool2+="#Fleet Maintenance:";
        plu="";if (income_tribute>0) then plu="+";if (income_tribute!=0){tool1+="#Planet Tithes: "+string(plu)+string(income_tribute);tool2+="#Planet Tithes:";}
    }
    
    if (tool1!=""){
        draw_set_color(0);draw_rectangle(xx+10,yy+42,xx+string_width(tool1)+16,yy+string_height(tool1)+48,0);
        draw_set_color(c_gray);draw_rectangle(xx+10,yy+42,xx+string_width(tool1)+16,yy+string_height(tool1)+48,1);
        draw_set_alpha(0.5);draw_rectangle(xx+11,yy+43,xx+string_width(tool1)+15,yy+string_height(tool1)+47,1);
        draw_set_alpha(1);
        draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
        draw_text(xx+12.5,yy+44.5,string(tool1));
        draw_text(xx+13.5,yy+45.5,string(tool1));
    }
}


if (scr_hit(xx+153,yy+10,xx+221,yy+38)=true) and (zoomed=0){
    var tx,ty,tool1,tool2,plu;
    tx=0;ty=0;tool1="";tool2="";plu="";
    
    
    var d,lines;d=0;lines=0;
    repeat(20){d+=1;
        if (loyal_num[d]>1) and (lines=0){
            tool1+=string(loyal[d])+": -"+string(loyal_num[d])+"#";
            tool2+=string(loyal[d])+": #";
            lines+=1;
        }
        if (loyal_num[d]>1) and (lines>0){
            tool1+=string(loyal[d])+": -"+string(loyal_num[d])+"#";
            tool2+=string(loyal[d])+": #";
            lines+=1;
        }
    }
    
    if (tool1="") then tool1="Loyalty";
    
    if (tool1!=""){
        draw_set_color(0);draw_rectangle(xx+150,yy+42,xx+string_width(tool1)+153,yy+string_height(tool1)+48,0);
        draw_set_color(c_gray);draw_rectangle(xx+150,yy+42,xx+string_width(tool1)+153,yy+string_height(tool1)+48,1);
        draw_set_alpha(0.5);draw_rectangle(xx+151,yy+43,xx+string_width(tool1)+152,yy+string_height(tool1)+47,1);
        draw_set_alpha(1);
        draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
        draw_text(xx+152.5,yy+44.5,string(tool1));
        draw_text(xx+153.5,yy+45.5,string(tool1));
    }
}



if (scr_hit(xx+247,yy+10,xx+338,yy+38)=true) and (zoomed=0){
    var tx,ty,tool1,tool2,plu;tx=0;ty=0;tool1="";tool2="";plu="";
    tool1=string(obj_img.organics);
    if (tool1!=""){
        draw_set_color(0);draw_rectangle(xx+249,yy+42,xx+string_width_ext(tool1,-1,400)+249,yy+string_height_ext(tool1,-1,400)+43,0);
        draw_set_color(c_gray);draw_rectangle(xx+249,yy+42,xx+string_width_ext(tool1,-1,400)+249,yy+string_height_ext(tool1,-1,400)+43,1);
        draw_set_alpha(0.5);draw_rectangle(xx+250,yy+43,xx+string_width_ext(tool1,-1,400)+248,yy+string_height_ext(tool1,-1,400)+42,1);
        draw_set_alpha(1);draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
        draw_text_ext(xx+252,yy+44.5,string(tool1),-1,400);
        draw_text_ext(xx+253,yy+45.5,string(tool1),-1,400);
    }
}

if (scr_hit(xx+373,yy+10,xx+463,yy+38)=true) and (zoomed=0){
    var tx,ty,tool1,tool2,plu;tx=0;ty=0;tool1="";tool2="";plu="";
    tool1="Astartes#(Normal/Command)";
    tool2="Astartes";
    if (tool1!=""){
        draw_set_color(0);draw_rectangle(xx+373,yy+42,xx+string_width_ext(tool1,-1,400)+373,yy+string_height_ext(tool1,-1,400)+43,0);
        draw_set_color(c_gray);draw_rectangle(xx+373,yy+42,xx+string_width_ext(tool1,-1,400)+373,yy+string_height_ext(tool1,-1,400)+43,1);
        draw_set_alpha(0.5);draw_rectangle(xx+374,yy+43,xx+string_width_ext(tool1,-1,400)+372,yy+string_height_ext(tool1,-1,400)+42,1);
        draw_set_alpha(1);draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
        draw_text_ext(xx+376,yy+44.5,string(tool1),-1,400);
        draw_text_ext(xx+377,yy+45.5,string(tool1),-1,400);
    }
}


if (scr_hit(xx+813,yy+10,xx+960,yy+38)=true) and (penitent=1) and (zoomed=0){
    var tx,ty,tool1,tool2,plu,hei_bonus;
    tx=0;ty=0;tool1="";tool2="";plu="";
    
    var endb,endb2;endb=0;endb2="";
    endb=min(0,(((penitent_turn+1)*(penitent_turn+1))-512)*-1);
    
    if (obj_controller.blood_debt=1){
        tool1="Blood Spilled: "+string(penitent_current);tool2="Blood Spilled: ";
        tool1+="#Blood Debt: "+string(penitent_max);tool2+="#Blood Debt: ";
        tool1+="#Decay Rate: "+string(endb);tool2+="#Decay Rate: ";
        
        tool1+="##Attacking enemies, Raiding enemies, and losing Astartes will lower your "+string(obj_img.player_army)+"'s Blood Debt.  Over #time it decays.  Bombarding enemies will prevent decay.";
        hei_bonus=-20;
    }
    if (obj_controller.blood_debt=0){
        tool1="Current Penitence: "+string(penitent_current);tool2="Current Penitence: ";
        tool1+="#Required Penitence: "+string(penitent_max);tool2+="#Required Penitence: ";
        // tool1+="#Each Turn: +1";tool2+="#Each Turn: ";
        // tool1+="#  ";tool2+="#  ";
        
        tool1+="##Penitence will be gained slowly over time.  After the timer runs out your "+string(obj_img.player_army)+" will no longer be#considered Penitent.";
        hei_bonus=23;
    }
    
    if (tool1!=""){
        draw_set_color(0);draw_rectangle(xx+813,yy+42,xx+string_width_ext(tool1,-1,400)+819,yy+string_height_ext(tool1,-1,400)+23+hei_bonus,0);
        draw_set_color(c_gray);draw_rectangle(xx+813,yy+42,xx+string_width_ext(tool1,-1,400)+819,yy+string_height_ext(tool1,-1,400)+23+hei_bonus,1);
        draw_set_alpha(0.5);draw_rectangle(xx+814,yy+43,xx+string_width_ext(tool1,-1,400)+818,yy+string_height_ext(tool1,-1,400)+22+hei_bonus,1);
        draw_set_alpha(1);
        draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
        draw_text_ext(xx+816,yy+44.5,string(tool1),-1,400);
        draw_text_ext(xx+817,yy+45.5,string(tool1),-1,400);
    }
}




exit;



if (mouse_x>=view_xview[0]+113) and (mouse_y>=view_yview[0]+4) and (mouse_x<view_xview[0]+185) and (mouse_y<view_yview[0]+19) and (zoomed=0){
    var blurp,blurp2,lines,i;blurp="";blurp2="";lines=0;i=0;draw_set_halign(fa_left);
    
    repeat(20){
        i+=1;if (loyal_num[i]>1){
            blurp+=string(loyal[i])+": -"+string(loyal_num[i])+"#";
            blurp2+=string(loyal[i])+": #";
            lines+=1;
        }
    }
    
    if (lines>0){
        var wi;wi=183+93;
        if (string_count("Irreverance",blurp)>0) then wi+=51;
        
        draw_set_color(c_black);
        draw_rectangle(view_xview[0]+113,view_yview[0]+24,view_xview[0]+wi,view_yview[0]+30+(lines*10),0);
        draw_set_color(38144);
        draw_rectangle(view_xview[0]+113,view_yview[0]+24,view_xview[0]+wi,view_yview[0]+30+(lines*10),1);
        
        draw_set_font(fnt_info);
        draw_text_transformed(view_xview[0]+24+93,view_yview[0]+26,string(blurp),0.7,0.7,0);
        draw_text_transformed(view_xview[0]+24.5+93,view_yview[0]+26,string(blurp2),0.7,0.7,0);
    }
}
