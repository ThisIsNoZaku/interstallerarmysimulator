var xx,yy,show_stuff;
xx=view_xview[0]+0;
yy=view_yview[0]+0;
show_stuff=false;

// This script draws all of the diplomacy stuff, up to and including trading.

xx+=6;

if (menu=20) and (diplomacy=0){// Main diplomacy screen
    draw_set_alpha(1);draw_set_color(0);draw_rectangle(xx,yy,xx+1600,yy+900,0);
    draw_set_alpha(0.5);draw_sprite(spr_rock_bg,0,xx,yy);draw_set_alpha(1);

    /*draw_set_color(38144);
    draw_rectangle(xx+31,yy+281,xx+438,yy+416,0);
    draw_rectangle(xx+31,yy+417,xx+438,yy+552,0);
    draw_rectangle(xx+31,yy+553,xx+438,yy+688,0);
    draw_rectangle(xx+31,yy+689,xx+438,yy+824,0);
    // 
    draw_rectangle(xx+451,yy+281,xx+858,yy+125,0);
    draw_rectangle(xx+451,yy+417,xx+858,yy+125+91,0);
    draw_rectangle(xx+451,yy+553,xx+858,yy+125+182,0);
    draw_rectangle(xx+451,yy+689,xx+858,yy+125+273,0);*/
    
    
    
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    draw_text(xx+800,yy+74,"Diplomacy");
    
    
    xx+=55;yy-=20;
    
    
    var imm;imm=0;
    if (known[2]>0) then imm=2;if (known[2]<1) then imm=3;// draw_sprite(spr_diplomacy_med,imm,xx+31,yy+281);
    scr_image("diplomacy_icon",imm,xx+31,yy+281,153,135);
    if (faction_defeated[2]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+31,yy+281);
    
    if (known[3]>0) then imm=4;if (known[3]<1) then imm=5;// draw_sprite(spr_diplomacy_med,imm,xx+31,yy+417);
    scr_image("diplomacy_icon",imm,xx+31,yy+417,153,135);
    if (faction_defeated[3]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+31,yy+417);
    
    if (known[4]>0) then imm=6;if (known[4]<1) then imm=7;// draw_sprite(spr_diplomacy_med,imm,xx+31,yy+553);
    scr_image("diplomacy_icon",imm,xx+31,yy+553,153,135);
    if (faction_defeated[4]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+31,yy+553);
    
    if (known[5]>0) then imm=8;if (known[5]<1) then imm=9;// draw_sprite(spr_diplomacy_med,imm,xx+31,yy+689);
    scr_image("diplomacy_icon",imm,xx+31,yy+689,153,135);
    if (faction_defeated[5]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+31,yy+689);
    
    
    if (faction_gender[6]=1){if (known[6]>0) then imm=10;if (known[6]<1) then imm=11;// draw_sprite(spr_diplomacy_med,imm,xx+1041,yy+281);
    scr_image("diplomacy_icon",imm,xx+1041,yy+281,153,135);}
    
    if (faction_gender[6]=2){if (known[6]>0) then imm=20;if (known[6]<1) then imm=21;// draw_sprite(spr_diplomacy_med,imm,xx+1041,yy+281);
    scr_image("diplomacy_icon",imm,xx+1041,yy+281,153,135);
    }
    
    if (faction_defeated[6]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+1041,yy+281);
    
    if (known[7]>0) then imm=12;if (known[7]<1) then imm=13;// draw_sprite(spr_diplomacy_med,imm,xx+1041,yy+417);
    scr_image("diplomacy_icon",imm,xx+1041,yy+417,153,135);
    if (faction_defeated[7]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+1041,yy+417);
    
    if (known[8]>0) then imm=14;if (known[8]<1) then imm=15;// draw_sprite(spr_diplomacy_med,imm,xx+1041,yy+553);
    scr_image("diplomacy_icon",imm,xx+1041,yy+553,153,135);
    if (faction_defeated[8]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+1041,yy+553);
    
    if (known[10]>0) and (faction_gender[10]=1) then imm=18;if (known[10]>0) and (faction_gender[10]=2) then imm=26;
    if (known[10]<1) and (faction_gender[10]=1) then imm=19;if (known[10]<1) and (faction_gender[10]=2) then imm=27;
    // draw_sprite(spr_diplomacy_med,imm,xx+1041,yy+689);
    scr_image("diplomacy_icon",imm,xx+1041,yy+689,153,135);
    if (faction_defeated[10]=1) then draw_sprite(spr_diplomacy_defeated,0,xx+1041,yy+689);
    
    
    /*draw_rectangle(xx+26,yy+34,xx+312,yy+125,1);draw_line(xx+128,yy+34,xx+128,yy+125);
    draw_rectangle(xx+26,yy+34+91,xx+312,yy+125+91,1);draw_line(xx+128,yy+34+91,xx+128,yy+125+91);
    draw_rectangle(xx+26,yy+34+182,xx+312,yy+125+182,1);draw_line(xx+128,yy+34+182,xx+128,yy+125+182);
    draw_rectangle(xx+26,yy+34+273,xx+312,yy+125+273,1);draw_line(xx+128,yy+34+273,xx+128,yy+125+273);
    // 
    draw_rectangle(xx+26+286,yy+34,xx+312+286,yy+125,1);draw_line(xx+128+286,yy+34,xx+128+286,yy+125);
    draw_rectangle(xx+26+286,yy+34+91,xx+312+286,yy+125+91,1);draw_line(xx+128+286,yy+34+91,xx+128+286,yy+125+91);
    draw_rectangle(xx+26+286,yy+34+182,xx+312+286,yy+125+182,1);draw_line(xx+128+286,yy+34+182,xx+128+286,yy+125+182);
    draw_rectangle(xx+26+286,yy+34+273,xx+312+286,yy+125+273,1);draw_line(xx+128+286,yy+34+273,xx+128+286,yy+125+273);*/
    
    // draw_sprite(spr_diplo_symbols,0,xx+128,yy+174);
    // draw_sprite(spr_diplo_symbols,1,xx+558,yy+174);
    // draw_sprite(spr_diplo_symbols,2,xx+1147,yy+174);
    scr_image("symbol",0,xx+128,yy+174,217,107);
    scr_image("symbol",1,xx+588,yy+174,217,107);
    scr_image("symbol",2,xx+1147,yy+174,217,107);
    
    
    draw_rectangle(xx+31,yy+281,xx+438,yy+416,1);draw_line(xx+184,yy+281,xx+184,yy+416);
    draw_rectangle(xx+31,yy+417,xx+438,yy+552,1);draw_line(xx+184,yy+417,xx+184,yy+553);
    draw_rectangle(xx+31,yy+553,xx+438,yy+688,1);draw_line(xx+184,yy+553,xx+184,yy+689);
    draw_rectangle(xx+31,yy+689,xx+438,yy+824,1);draw_line(xx+184,yy+689,xx+184,yy+824);
    // 
    draw_rectangle(xx+451,yy+281,xx+858,yy+416,1);draw_line(xx+604,yy+281,xx+604,yy+416);
    draw_rectangle(xx+451,yy+417,xx+858,yy+552,1);draw_line(xx+604,yy+417,xx+604,yy+553);
    draw_rectangle(xx+451,yy+553,xx+858,yy+688,1);draw_line(xx+604,yy+553,xx+604,yy+689);
    draw_rectangle(xx+451,yy+689,xx+858,yy+824,1);draw_line(xx+604,yy+689,xx+604,yy+824);
    // 
    draw_rectangle(xx+1041,yy+281,xx+1448,yy+416,1);draw_line(xx+1194,yy+281,xx+1194,yy+416);
    draw_rectangle(xx+1041,yy+417,xx+1448,yy+552,1);draw_line(xx+1194,yy+417,xx+1194,yy+553);
    draw_rectangle(xx+1041,yy+553,xx+1448,yy+688,1);draw_line(xx+1194,yy+553,xx+1194,yy+689);
    draw_rectangle(xx+1041,yy+689,xx+1448,yy+824,1);draw_line(xx+1194,yy+689,xx+1194,yy+824);
    
    
    
    draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
    draw_text(xx+189,yy+285,obj_img.kingdom_title_short);
    draw_text(xx+189,yy+421,obj_img.faction[3]);
    draw_text(xx+189,yy+557,obj_img.faction[4]);
    draw_text(xx+189,yy+693,obj_img.faction[5]);
    draw_text(xx+609,yy+285,string(obj_img.player_army)+" 1");
    draw_text(xx+609,yy+421,string(obj_img.player_army)+" 2");
    draw_text(xx+609,yy+557,string(obj_img.player_army)+" 3");
    draw_text(xx+609,yy+693,string(obj_img.player_army)+" 4");
    draw_text(xx+1199,yy+285,obj_img.faction[6]);
    draw_text(xx+1199,yy+421,obj_img.faction[7]);
    draw_text(xx+1199,yy+557,obj_img.faction[8]);
    draw_text(xx+1199,yy+693,obj_img.faction[10]);
    
    draw_set_font(fnt_40k_14);draw_set_halign(fa_right);
    draw_text_transformed(xx+431,yy+289,string(faction_status[2]),0.7,0.7,0);
    draw_text_transformed(xx+431,yy+425,faction_status[3],0.7,0.7,0);
    draw_text_transformed(xx+431,yy+561,faction_status[4],0.7,0.7,0);
    draw_text_transformed(xx+431,yy+697,faction_status[5],0.7,0.7,0);
    /*draw_text_transformed(xx+851,yy+289,faction_status[6],0.7,0.7,0);
    draw_text_transformed(xx+851,yy+425,faction_status[7],0.7,0.7,0);
    draw_text_transformed(xx+851,yy+561,faction_status[8],0.7,0.7,0);
    draw_text_transformed(xx+851,yy+697,faction_status[10],0.7,0.7,0);*/
    draw_text_transformed(xx+1441,yy+289,faction_status[6],0.7,0.7,0);
    draw_text_transformed(xx+1441,yy+425,faction_status[7],0.7,0.7,0);
    draw_text_transformed(xx+1441,yy+561,faction_status[8],0.7,0.7,0);
    draw_text_transformed(xx+1441,yy+697,faction_status[10],0.7,0.7,0);
    
    draw_set_halign(fa_left);var txt;
    txt="????";if (known[2]>0) then txt=string(obj_img.faction_title[2])+" "+string(faction_leader[2]);draw_text_transformed(xx+189,yy+309,txt,0.7,0.7,0);
    txt="????";if (known[3]>0) then txt=string(obj_img.faction_title[3])+" "+string(faction_leader[3]);draw_text_transformed(xx+189,yy+445,txt,0.7,0.7,0);
    txt="????";if (known[4]>0) then txt=string(obj_img.faction_title[4])+" "+string(faction_leader[4]);draw_text_transformed(xx+189,yy+581,txt,0.7,0.7,0);
    txt="????";if (known[5]>0) then txt=string(obj_img.faction_title[5])+" "+string(faction_leader[5]);draw_text_transformed(xx+189,yy+717,txt,0.7,0.7,0);
    /*txt="????";if (known[6]>0) then txt=string(faction_title[6])+" "+string(faction_leader[6]);draw_text_transformed(xx+609,yy+309,txt,0.7,0.7,0);
    txt="????";if (known[7]>0) then txt=string(faction_title[7])+" "+string(faction_leader[7]);draw_text_transformed(xx+609,yy+445,txt,0.7,0.7,0);
    txt="????";if (known[8]>0) then txt=string(faction_title[8])+" "+string(faction_leader[8]);draw_text_transformed(xx+609,yy+581,txt,0.7,0.7,0);
    txt="????";if (known[10]>0) then txt=string(faction_title[10])+" "+string(faction_leader[10]);draw_text_transformed(xx+609,yy+717,txt,0.7,0.7,0);*/
    txt="????";if (known[6]>0) then txt=string(obj_img.faction_title[6])+" "+string(faction_leader[6]);draw_text_transformed(xx+1199,yy+309,txt,0.7,0.7,0);
    txt="????";if (known[7]>0) then txt=string(obj_img.faction_title[7])+" "+string(faction_leader[7]);draw_text_transformed(xx+1199,yy+445,txt,0.7,0.7,0);
    txt="????";if (known[8]>0) then txt=string(obj_img.faction_title[8])+" "+string(faction_leader[8]);draw_text_transformed(xx+1199,yy+581,txt,0.7,0.7,0);
    txt="????";if (known[10]>0) then txt=string(obj_img.faction_title[10])+" "+string(faction_leader[10]);draw_text_transformed(xx+1199,yy+717,txt,0.7,0.7,0);
    
    draw_text_transformed(xx+189,yy+324,"Disposition: "+string(disposition[2]),0.7,0.7,0);
    draw_text_transformed(xx+189,yy+460,"Disposition: "+string(disposition[3]),0.7,0.7,0);
    draw_text_transformed(xx+189,yy+596,"Disposition: "+string(disposition[4]),0.7,0.7,0);
    draw_text_transformed(xx+189,yy+732,"Disposition: "+string(disposition[5]),0.7,0.7,0);
    /*draw_text_transformed(xx+609,yy+324,"Disposition: "+string(disposition[6]),0.7,0.7,0);
    draw_text_transformed(xx+609,yy+460,"Disposition: "+string(disposition[7]),0.7,0.7,0);
    draw_text_transformed(xx+609,yy+596,"Disposition: "+string(disposition[8]),0.7,0.7,0);
    draw_text_transformed(xx+609,yy+732,"Disposition: "+string(disposition[10]),0.7,0.7,0);*/
    draw_text_transformed(xx+1199,yy+324,"Disposition: "+string(disposition[6]),0.7,0.7,0);
    draw_text_transformed(xx+1199,yy+460,"Disposition: "+string(disposition[7]),0.7,0.7,0);
    draw_text_transformed(xx+1199,yy+596,"Disposition: "+string(disposition[8]),0.7,0.7,0);
    draw_text_transformed(xx+1199,yy+732,"Disposition: "+string(disposition[10]),0.7,0.7,0);
    
    
    
    scr_draw_rainbow(xx+270,yy+325,xx+420,yy+335,(disposition[2]/200)+0.5);
    scr_draw_rainbow(xx+270,yy+325+136,xx+420,yy+335+136,(disposition[3]/200)+0.5);
    scr_draw_rainbow(xx+270,yy+325+272,xx+420,yy+335+272,(disposition[4]/200)+0.5);
    scr_draw_rainbow(xx+270,yy+325+408,xx+420,yy+335+408,(disposition[5]/200)+0.5);
    
    scr_draw_rainbow(xx+270+1010,yy+325,xx+420+1010,yy+335,(disposition[6]/200)+0.5);
    scr_draw_rainbow(xx+270+1010,yy+325+136,xx+420+1010,yy+335+136,(disposition[7]/200)+0.5);
    scr_draw_rainbow(xx+270+1010,yy+325+272,xx+420+1010,yy+335+272,(disposition[8]/200)+0.5);
    scr_draw_rainbow(xx+270+1010,yy+325+408,xx+420+1010,yy+335+408,(disposition[10]/200)+0.5);
    
    
    
    /*draw_sprite(spr_disposition_small,round((disposition[2]+100)/10),xx+131,yy+74);
    draw_sprite(spr_disposition_small,round((disposition[3]+100)/10),xx+131+286,yy+74);
    
    draw_sprite(spr_disposition_small,round((disposition[4]+100)/10),xx+131,yy+74+91);
    draw_sprite(spr_disposition_small,round((disposition[5]+100)/10),xx+131+286,yy+74+91);
    
    draw_sprite(spr_disposition_small,round((disposition[6]+100)/10),xx+131,yy+74+182);
    draw_sprite(spr_disposition_small,round((disposition[7]+100)/10),xx+131+286,yy+74+182);
    
    draw_sprite(spr_disposition_small,round((disposition[8]+100)/10),xx+131,yy+74+273);
    draw_sprite(spr_disposition_small,round((disposition[10]+100)/10),xx+131+286,yy+74+273);*/
    
    
    draw_set_halign(fa_left);
    draw_set_color(38144);
    
    var x6,y6,x7,y7;
    x6=0;y6=0;x7=0;y7=0;
    xx-=55;yy+=20;
    
    if (known[2]>0.7) and (faction_defeated[2]=0){
        x6=xx+250;y6=yy+334;x7=x6+92;y7=y6+15;
        if (turns_ignored[2]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[2]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[2]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
        
    
        /*var fis;fis="[Request Audience]";
        if (turns_ignored[2]>0) then fis="                  ";
        if (ignore[2]<1) then draw_text_transformed(xx+189,yy+354,string(fis)+"  [Ignore]",0.7,0.7,0);
        if (ignore[2]>=1) then draw_text_transformed(xx+189,yy+354,string(fis)+"[Unignore]",0.7,0.7,0);*/
    }
    
    if (known[3]>0.7) and (faction_defeated[3]=0){
        x6=xx+250;y6=yy+334+136;x7=x6+92;y7=y6+15;
        if (turns_ignored[3]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[3]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[3]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    if (known[4]>0.7) and (faction_defeated[4]=0){
        x6=xx+250;y6=yy+334+272;x7=x6+92;y7=y6+15;
        if (turns_ignored[4]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[4]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[4]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    if (known[5]>0.7) and (faction_defeated[5]=0){
        x6=xx+250;y6=yy+334+408;x7=x6+92;y7=y6+15;
        if (turns_ignored[5]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[5]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[5]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    
    
    
    
    
    if (known[6]>0.7) and (faction_defeated[2]=0){
        x6=xx+250+1010;y6=yy+334;x7=x6+92;y7=y6+15;
        if (turns_ignored[6]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349+1010;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[6]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[6]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    if (known[7]>0.7) and (faction_defeated[3]=0){
        x6=xx+250+1010;y6=yy+334+136;x7=x6+92;y7=y6+15;
        if (turns_ignored[7]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349+1010;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[7]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[7]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    if (known[8]>0.7) and (faction_defeated[4]=0){
        x6=xx+250+1010;y6=yy+334+272;x7=x6+92;y7=y6+15;
        if (turns_ignored[8]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349+1010;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[8]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[8]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    if (known[10]>0.7) and (faction_defeated[5]=0){
        x6=xx+250+1010;y6=yy+334+408;x7=x6+92;y7=y6+15;
        if (turns_ignored[10]<=0){
            draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);
            draw_set_color(c_black);draw_text_transformed(x6,y6+1," Request Audience",0.7,0.7,0);
            if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
                draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
            }
        }
        x6=xx+349+1010;x7=x6+51;
        draw_set_color(38144);draw_rectangle(x6,y6,x7,y7,0);draw_set_color(c_black);
        if (ignore[10]<1) then draw_text_transformed(x6,y6+1,"   Ignore",0.7,0.7,0);
        if (ignore[10]>=1) then draw_text_transformed(x6,y6+1," Unignore",0.7,0.7,0);
        if (mouse_x>=x6) and (mouse_y>=y6) and (mouse_x<x7) and (mouse_y<y7){
            draw_set_alpha(0.2);draw_rectangle(x6,y6,x7,y7,0);draw_set_alpha(1);
        }
    }
    
    
    
    
    
    
    
    
    
    /*if (known[6]>0.7) and (faction_defeated[6]=0){
        var fis;fis="[Request Audience]";
        if (turns_ignored[6]>0) then fis="                  ";
        if (ignore[6]<1) then draw_text_transformed(xx+1199,yy+354,string(fis)+"  [Ignore]",0.7,0.7,0);
        if (ignore[6]>=1) then draw_text_transformed(xx+1199,yy+354,string(fis)+"[Unignore]",0.7,0.7,0);
    }
    if (known[7]>0.7) and (faction_defeated[7]=0){
        var fis;fis="[Request Audience]";
        if (turns_ignored[7]>0) then fis="                  ";
        if (ignore[7]<1) then draw_text_transformed(xx+1199,yy+490,string(fis)+"  [Ignore]",0.7,0.7,0);
        if (ignore[7]>=1) then draw_text_transformed(xx+1199,yy+490,string(fis)+"[Unignore]",0.7,0.7,0);
    }
    if (known[8]>0.7) and (faction_defeated[8]=0){
        var fis;fis="[Request Audience]";
        if (turns_ignored[8]>0) then fis="                  ";
        if (ignore[8]<1) then draw_text_transformed(xx+1199,yy+631,string(fis)+"  [Ignore]",0.7,0.7,0);
        if (ignore[8]>=1) then draw_text_transformed(xx+1199,yy+631,string(fis)+"[Unignore]",0.7,0.7,0);
    }
    if (known[10]>0.7) and (faction_defeated[10]=0){
        var fis;fis="[Request Audience]";
        if (turns_ignored[10]>0) then fis="                  ";
        if (ignore[10]<1) then draw_text_transformed(xx+1199,yy+762,string(fis)+"  [Ignore]",0.7,0.7,0);
        if (ignore[10]>=1) then draw_text_transformed(xx+1199,yy+762,string(fis)+"[Unignore]",0.7,0.7,0);
    }*/
    
    
    
    
    
    
    
    /*
    faction_leader[0]="";faction_title[0]="";faction_status[0]="";faction_leader[1]="";faction_title[1]="";faction_status[1]="";
    faction_leader[2]="";faction_title[2]="Sector Commander";faction_status[2]="Allied";
    faction_leader[3]="";faction_title[3]="Magos";faction_status[3]="Allied";
    faction_leader[4]="";faction_title[4]="Inquisitor Lord";faction_status[4]="Allied";
    faction_leader[5]="";faction_title[5]="Prioress";faction_status[5]="Allied";
    faction_leader[6]="";faction_title[6]="Farseer";faction_status[6]="War";
    faction_leader[7]="";faction_title[7]="Warboss";faction_status[7]="War";
    faction_leader[8]="";faction_title[8]="Diplomat";faction_status[8]="War";
    faction_leader[9]="";faction_title[9]="";faction_status[9]="War";
    faction_leader[10]="";faction_title[10]="Master";faction_status[10]="War";
    */
    
    
    
}


xx=view_xview[0];yy=view_yview[0];

if (menu=20) and (diplomacy<-5) and (diplomacy>-6){
    draw_sprite(spr_rock_bg,0,xx,yy);
    // draw_sprite(spr_diplo_splash,diplomacy,xx+916,yy+33);
    draw_set_alpha(0.75);draw_set_color(0);draw_rectangle(xx+326+16,yy+66,xx+887+16,yy+820,0);
    draw_set_alpha(1);draw_set_color(38144);draw_rectangle(xx+326+16,yy+66,xx+887+16,yy+820,1);
    
    var advi,fra;advi="";fra=0;
    if (diplomacy=-5.1){advi="apoth";fra=1;}
    if (diplomacy=-5.2){advi="chap";fra=2;if (global.chapter_name="Space Wolves") then fra=11;}
    if (diplomacy=-5.3){advi="libr";fra=3;if (global.chapter_name="Space Wolves") then fra=10;}
    if (diplomacy=-5.4){advi="tech";fra=4;}
    if (diplomacy=-5.5){advi="recr";fra=5;}
    if (diplomacy=-5.6){advi="flee";fra=6;}
    
    // draw_sprite(spr_advisors,fra,xx+16,yy+43);
    scr_image("advisor",fra,xx+16,yy+43,310,828);
    draw_set_halign(fa_center);
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    
    var fac, fac2, fac3,warning;fac="";
    fac2=string(global.chapter_name)+" (Imperium)";fac3="";warning=0;
    
    if (advi="flee") then fac="Master of the Fleet "+string(obj_ini.lord_admiral_name);
    if (advi="apoth") then fac="Master of the Apothecarion "+string(obj_ini.name[0,4]);
    if (advi="chap") then fac="Master of Sanctity "+string(obj_ini.name[0,3]);
    if (advi="libr") then fac="Chief "+string(obj_ini.role[100,17])+" "+string(obj_ini.name[0,5]);
    if (advi="tech") then fac="Forge Master "+string(obj_ini.name[0,2]);
    if (advi="") then fac="First Sergeant "+string(recruiter_name); 
    
    draw_text_transformed(xx+622,yy+66,string(fac2),1,1,0);
    draw_text_transformed(xx+622,yy+104,string(fac),0.6,0.6,0);
    
    show_stuff=true;
}



if (menu=20) and (diplomacy>0){// Diplomacy - Speaking
    var daemon;daemon=false;if (diplomacy>10) and (diplomacy<11) then daemon=true;
    draw_sprite(spr_rock_bg,0,xx,yy);
    // draw_sprite(spr_diplo_splash,diplomacy,xx+916,yy+33);
    draw_set_alpha(0.75);draw_set_color(0);draw_rectangle(xx+326+16,yy+66,xx+887+16,yy+820,0);
    draw_set_alpha(1);draw_set_color(38144);draw_rectangle(xx+326+16,yy+66,xx+887+16,yy+820,1);
    
    if (daemon=false){
        if (diplomacy!=6) then scr_image("diplomacy_splash",diplomacy-1,xx+16,yy+43,310,828);
        if (diplomacy!=6) or ((diplomacy=6) and (faction_gender[6]=1)) then scr_image("diplomacy_splash",diplomacy-1,xx+16,yy+16,310,828);
        if (diplomacy=6) and (faction_gender[6]=2) then scr_image("diplomacy_splash",11,xx+16,yy+16,310,828);
        if (diplomacy=10) and (faction_gender[10]=2) then scr_image("diplomacy_splash",12,xx+16,yy+43,310,828);
        /*if (diplomacy!=6) then draw_sprite(spr_diplomacy,diplomacy,xx+16,yy+43);
        if (diplomacy!=6) or ((diplomacy=6) and (faction_gender[6]=1)) then draw_sprite(spr_diplomacy,diplomacy,xx+16,yy+16);
        if (diplomacy=6) and (faction_gender[6]=2) then draw_sprite(spr_diplomacy,11,xx+16,yy+16);
        if (diplomacy=10) and (faction_gender[10]=2) then draw_sprite(spr_diplomacy,12,xx+16,yy+16);*/
    }
    if (daemon=true){
        // if (diplomacy=10.1) then draw_sprite(spr_diplomacy_dae,0,xx+16,yy+43);
        if (diplomacy=10.1) then scr_image("diplomacy_daemon",0,xx+16,yy+43,310,828);
    }
    
    draw_set_halign(fa_center);
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    
    var fac, fac2, fac3,warning;fac="";fac2=" ("+string(obj_img.kingdom_title_short)+")";fac3="";warning=0;
    if (diplomacy>=6) then fac2="";
    
    
    if (diplomacy=2) then fac=obj_img.faction[diplomacy];
    if (diplomacy=3) then fac=obj_img.faction[diplomacy];
    if (diplomacy=4) then fac=obj_img.faction[diplomacy];
    if (diplomacy=5) then fac=obj_img.faction[diplomacy];
    if (diplomacy=6) then fac=obj_img.faction[diplomacy];
    if (diplomacy=7) then fac=obj_img.faction[diplomacy];
    if (diplomacy=8) then fac=obj_img.faction[diplomacy];
    if (diplomacy=10) then fac=obj_img.faction[diplomacy];
    if (diplomacy>10) and (diplomacy<11) then fac=obj_img.evil_prefix;
    
    draw_text_transformed(xx+622,yy+66,string(fac),1,1,0);
    
    if (daemon=true) then draw_text_transformed(xx+622,yy+104,"???????",0.6,0.6,0);
    if (daemon=false) then draw_text_transformed(xx+622,yy+104,string(faction_title[diplomacy])+" "+string(faction_leader[diplomacy])+string(fac2),0.6,0.6,0);
    
    draw_set_font(fnt_40k_14);
    
    if (daemon=false){
        fac3="Disposition: ";
        if (disposition[diplomacy]<=-20) then fac3+="Hated";
        if (disposition[diplomacy]>-20) and (disposition[diplomacy]<0) then fac3+="Hostile";
        if (disposition[diplomacy]>=0) and (disposition[diplomacy]<10) then fac3+="Suspicious";
        if (disposition[diplomacy]>=10) and (disposition[diplomacy]<20) then fac3+="Uneasy";
        if (disposition[diplomacy]>=20) and (disposition[diplomacy]<40) then fac3+="Neutral";
        if (disposition[diplomacy]>=40) and (disposition[diplomacy]<60) then fac3+="Allies";
        if (disposition[diplomacy]>=60) and (disposition[diplomacy]<80) then fac3+="Close Allies";
        if (disposition[diplomacy]>=80) then fac3+="Battle Brothers";
        fac3+=" ("+string(disposition[diplomacy])+")";
        // draw_set_halign(fa_center);
        draw_text(xx+622,yy+144,string(fac3));
        scr_draw_rainbow(xx+366,yy+165,xx+871,yy+175,(disposition[diplomacy]/200)+0.5);
    }
    draw_set_color(c_gray);draw_rectangle(xx+366,yy+165,xx+871,yy+175,1);
    
    show_stuff=true;
}
    
    
    
if (show_stuff=true){
    draw_set_font(fnt_40k_14);draw_set_alpha(1);
    draw_set_color(38144);draw_set_halign(fa_left);
    draw_text_ext(xx+336+16,yy+209,string(diplo_txt),-1,536);
    xx=view_xview[0];yy=view_yview[0];draw_set_halign(fa_center);
    draw_line(xx+429,yy+710,xx+800,yy+710);
    
    if (trading=0) and (diplo_option[1]="") and (diplo_option[2]="") and (diplo_option[3]="") and (diplo_option[4]=""){
        draw_set_color(38144);
        if ((audience=0) and (force_goodbye=0)) or (faction_justmet=1){
            if (audience=0) and (force_goodbye=0){
                draw_rectangle(xx+442,yy+719,xx+547,yy+738,0);
                draw_rectangle(xx+562,yy+719,xx+667,yy+738,0);
                draw_rectangle(xx+682,yy+719,xx+787,yy+738,0);
            }
            
            draw_rectangle(xx+442,yy+753,xx+547,yy+772,0);
            draw_rectangle(xx+562,yy+753,xx+667,yy+772,0);
            if (audience=0) and (force_goodbye=0){draw_rectangle(xx+682,yy+753,xx+787,yy+772,0);}
            
            if (audience=0) and (force_goodbye=0){draw_rectangle(xx+552,yy+785,xx+677,yy+804,0);}// Declare War?
        }
        draw_rectangle(xx+818,yy+796,xx+897,yy+815,0);
        
        draw_set_color(0);
        draw_text(xx+442+52,yy+720,"Trade");
        draw_text(xx+562+52,yy+720,"Demand");
        draw_text(xx+682+52,yy+720,"Discuss");
        draw_text(xx+442+52,yy+754,"Denounce");
        draw_text(xx+562+52,yy+754,"Praise");
        draw_text(xx+682+52,yy+754,"Propose Alliance");
        draw_text(xx+614.5,yy+786,"DECLARE WAR");
        draw_text(xx+857.5,yy+797,"Exit");
        
        draw_set_alpha(0.2);
        if ((audience=0) and (force_goodbye=0)) or (faction_justmet=1){
            var show;show=false;if (faction_justmet=1) then show=true;
            
            if (mouse_x>=xx+360) and (mouse_y>=yy+143) and (mouse_x<=xx+884) and (mouse_y<=yy+180) then warning=1;
        
            if (mouse_y>=yy+719) and (mouse_y<yy+738) and (audience=0) and (force_goodbye=0){
                if (mouse_x>=xx+442) and (mouse_x<xx+547){draw_rectangle(xx+442,yy+719,xx+547,yy+738,0);warning=1;}
                if (mouse_x>=xx+562) and (mouse_x<xx+667) then draw_rectangle(xx+562,yy+719,xx+667,yy+738,0);
                if (mouse_x>=xx+682) and (mouse_x<xx+787) then draw_rectangle(xx+682,yy+719,xx+787,yy+738,0);
            }
            if (mouse_y>=yy+753) and (mouse_y<yy+772){
                if (show=true){
                    if (mouse_x>=xx+442) and (mouse_x<xx+547) then draw_rectangle(xx+442,yy+753,xx+547,yy+772,0);
                    if (mouse_x>=xx+562) and (mouse_x<xx+667) then draw_rectangle(xx+562,yy+753,xx+667,yy+772,0);
                }
                if (audience=0) and (force_goodbye=0){
                    if (mouse_x>=xx+682) and (mouse_x<xx+787) then draw_rectangle(xx+682,yy+753,xx+787,yy+772,0);
                }
            }
            if (audience=0) and (force_goodbye=0){
                if (mouse_x>=xx+552) and (mouse_y>=yy+785) and (mouse_x<=xx+677) and (mouse_y<=yy+804) then draw_rectangle(xx+552,yy+785,xx+677,yy+804,0);
            }
        }
        if (mouse_x>=xx+818) and (mouse_y>=yy+796) and (mouse_x<=xx+897) and (mouse_y<=yy+815) then draw_rectangle(xx+818,yy+796,xx+897,yy+815,0);
        
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_color(0);
        
        if (warning=1) and (diplomacy>=6){
            var warn;
            if (diplomacy<10) and (warning=1) then warn="Consorting with xenos will cause your disposition with the Imperium to lower.";
            if (diplomacy>=10) and (warning=1) then warn="Consorting with heretics will cause your disposition with the Imperium to plummet.";
        
            draw_rectangle(mouse_x-2,mouse_y+20,mouse_x+2+string_width_ext(string(warn),-1,600),mouse_y+24+string_height_ext(string(warn),-1,600),0);
            draw_set_color(38144);
            draw_rectangle(mouse_x-2,mouse_y+20,mouse_x+2+string_width_ext(string(warn),-1,600),mouse_y+24+string_height_ext(string(warn),-1,600),1);
            draw_text_ext(mouse_x,mouse_y+22,string(warn),-1,600);
        }
        
        // draw_line(xx+220,yy+317,xx+592,yy+317);
    }
    
    if (trading=0) and ((diplo_option[1]!="") or (diplo_option[2]!="") or (diplo_option[3]!="") or (diplo_option[4]!="")){
        if (force_goodbye=0){
            draw_set_halign(fa_center);
            
            var opts,slot,dp;opts=0;slot=0;dp=0;
            repeat(4){dp+=1;if (diplo_option[dp]!="") then opts+=1;}
            if (opts=4) then yy-=30;
            if (opts=2) then yy+=30;
            if (opts=1) then yy+=60;
            
            repeat(4){slot+=1;
                if (diplo_option[slot]!=""){
                    draw_set_color(38144);draw_rectangle(xx+354,yy+694,xx+887,yy+717,0);
                    draw_set_color(0);
                    
                    var sw;sw=1;
                    repeat(4){if (string_width(diplo_option[slot])*sw>530) then sw-=0.05;}
                    if (string_width(diplo_option[slot])*sw<=530) and (sw=1) then draw_text_transformed(xx+620,yy+696,string(diplo_option[slot]),sw,sw,0);
                    if (string_width(diplo_option[slot])*sw<=530) and (sw<1) then draw_text_transformed(xx+620,yy+696+2,string(diplo_option[slot]),sw,sw,0);
                    if (string_width(diplo_option[slot])*sw>530){
                        draw_text_ext_transformed(xx+620,yy+696-4,string(diplo_option[slot]),16,530/sw,sw,sw,0);
                    }
                    
                    if (mouse_x>=xx+354) and (mouse_y>=yy+694) and (mouse_x<xx+887) and (mouse_y<yy+717){
                        draw_set_alpha(0.2);draw_rectangle(xx+354,yy+694,xx+887,yy+717,0);draw_set_alpha(1);
                    }
                }
                yy+=30;
            }
            
            yy=view_yview[0];
        }
        
        if (force_goodbye=1){
            draw_rectangle(xx+818,yy+796,xx+897,yy+815,0);
            draw_set_color(0);draw_text(xx+857.5,yy+797,"Exit");draw_set_alpha(0.2);
            if (mouse_x>=xx+818) and (mouse_y>=yy+796) and (mouse_x<=xx+897) and (mouse_y<=yy+815) then draw_rectangle(xx+818,yy+796,xx+897,yy+815,0);
            draw_set_alpha(1);
        }
        
    }
    // xx=view_xview[0];yy=view_yview[0];
    
    
    
    if (trading=1){
        draw_set_color(38144);
        draw_rectangle(xx+342,yy+326,xx+486,yy+673,1);draw_rectangle(xx+343,yy+327,xx+485,yy+672,1);// Left Main Panel
        draw_rectangle(xx+504,yy+371,xx+741,yy+641,1);draw_rectangle(xx+505,yy+372,xx+740,yy+640,1);// Center panel
        draw_rectangle(xx+759,yy+326,xx+903,yy+673,1);draw_rectangle(xx+760,yy+327,xx+902,yy+672,1);// Right Main Panel
        
        draw_rectangle(xx+342,yy+326,xx+486,yy+371,1);// Left Title Panel
        draw_rectangle(xx+759,yy+326,xx+903,yy+371,1);// Right Title Panel
        
        draw_set_font(fnt_40k_14b);draw_set_halign(fa_center);
        draw_text(xx+411,yy+330,string(obj_controller.faction[diplomacy])+"#Items");
        draw_text(xx+829,yy+330,string(global.chapter_name)+"#Items");
        
        if (trade_likely!="") then draw_text(xx+623,yy+348,"["+string(trade_likely)+"]");
        
        // Buttons
        draw_rectangle(xx+510,yy+649,xx+615,yy+668,0);// Clear
        draw_rectangle(xx+630,yy+649,xx+735,yy+668,0);// Offer
        draw_rectangle(xx+818,yy+796,xx+897,yy+815,0);// Cancel
        
        draw_set_color(0);
        draw_text(xx+562,yy+649,"Clear");
        draw_text(xx+682,yy+649,"Offer");
        draw_text(xx+857.5,yy+797,"Exit");
        
        draw_set_alpha(0.2);
        if (scr_hit(xx+510,yy+649,xx+615,yy+668)=true) then draw_rectangle(xx+510,yy+649,xx+615,yy+668,0);
        if (scr_hit(xx+630,yy+649,xx+735,yy+668)=true) then draw_rectangle(xx+630,yy+649,xx+735,yy+668,0);
        if (scr_hit(xx+818,yy+796,xx+897,yy+815)=true) then draw_rectangle(xx+818,yy+796,xx+897,yy+815,0);
        draw_set_alpha(1);
        
        draw_set_halign(fa_left);draw_set_font(fnt_40k_14);draw_set_color(38144);
        if (trading_artifact=0){
            draw_set_alpha(1);if (disposition[diplomacy]<trade_disp[1]) then draw_set_alpha(0.3);
            draw_text_ext(xx+347,yy+382,string(trade_theirs[1]),-1,136);
            if (trade_theirs[1]!="") then draw_line(xx+342,yy+422,xx+485,yy+422);
            if (trade_theirs[1]!="") and (scr_hit(xx+342,yy+371,xx+485,yy+422)=true){
                draw_set_color(c_gray);draw_set_alpha(0.15);
                draw_rectangle(xx+342,yy+371,xx+485,yy+422,0);
                draw_set_color(38144);
            }
            draw_set_alpha(1);
            
            draw_set_alpha(1);if (disposition[diplomacy]<trade_disp[2]) then draw_set_alpha(0.3);
            draw_text_ext(xx+347,yy+430,string(trade_theirs[2]),-1,136);
            if (trade_theirs[2]!="") then draw_line(xx+342,yy+470,xx+485,yy+470);
            if (trade_theirs[2]!="") and (scr_hit(xx+342,yy+422,xx+485,yy+470)=true){
                draw_set_color(c_gray);draw_set_alpha(0.15);
                draw_rectangle(xx+342,yy+422,xx+485,yy+470,0);
                draw_set_color(38144);
            }
            draw_set_alpha(1);
            
            draw_set_alpha(1);if (disposition[diplomacy]<trade_disp[3]) then draw_set_alpha(0.3);
            draw_text_ext(xx+347,yy+478,string(trade_theirs[3]),-1,136);
            if (trade_theirs[3]!="") then draw_line(xx+342,yy+517,xx+485,yy+517);
            if (trade_theirs[3]!="") and (scr_hit(xx+342,yy+470,xx+485,yy+517)=true){
                draw_set_color(c_gray);draw_set_alpha(0.15);
                draw_rectangle(xx+342,yy+470,xx+485,yy+517,0);
                draw_set_color(38144);
            }
            draw_set_alpha(1);
            
            draw_set_alpha(1);if (disposition[diplomacy]<trade_disp[4]) then draw_set_alpha(0.3);
            draw_text_ext(xx+347,yy+525,string(trade_theirs[4]),-1,136);
            if (trade_theirs[4]!="") then draw_line(xx+342,yy+564,xx+485,yy+564);
            if (trade_theirs[4]!="") and (scr_hit(xx+342,yy+517,xx+485,yy+564)=true){
                draw_set_color(c_gray);draw_set_alpha(0.15);
                draw_rectangle(xx+342,yy+517,xx+485,yy+564,0);
                draw_set_color(38144);
            }
            draw_set_alpha(1);
            
            draw_set_alpha(1);if (disposition[diplomacy]<trade_disp[5]) then draw_set_alpha(0.3);
            draw_text_ext(xx+347,yy+572,string(trade_theirs[5]),-1,136);
            if (trade_theirs[5]!="") then draw_line(xx+342,yy+611,xx+485,yy+611);
            if (trade_theirs[5]!="") and (scr_hit(xx+342,yy+564,xx+485,yy+611)=true){
                draw_set_color(c_gray);draw_set_alpha(0.15);
                draw_rectangle(xx+342,yy+564,xx+485,yy+611,0);
                draw_set_color(38144);
            }
            draw_set_alpha(1);
        }
        
        
        xx+=419;
        if (requisition<=0) then draw_set_alpha(0.33);draw_text_ext(xx+347,yy+379,string(trade_mine[1]),-1,136);draw_set_alpha(1);
        if (trade_mine[1]!="") then draw_line(xx+342,yy+422,xx+485,yy+422);
        if (scr_hit(xx+342,yy+371,xx+485,yy+422)=true){
            draw_set_color(c_gray);draw_set_alpha(0.15);
            draw_rectangle(xx+342,yy+371,xx+485,yy+422,0);
            draw_set_color(38144);
        }
        draw_set_alpha(1);
        
        if (gene_seed<=0) then draw_set_alpha(0.33);draw_text_ext(xx+347,yy+430,string(trade_mine[2]),-1,136);draw_set_alpha(1);
        if (trade_mine[2]!="") then draw_line(xx+342,yy+470,xx+485,yy+470);
        if (scr_hit(xx+342,yy+422,xx+485,yy+470)=true){
            draw_set_color(c_gray);draw_set_alpha(0.15);
            draw_rectangle(xx+342,yy+422,xx+485,yy+470,0);
            draw_set_color(38144);
        }
        draw_set_alpha(1);
        
        if (stc_wargear_un+stc_vehicles_un+stc_ships_un<=0) then draw_set_alpha(0.33);draw_text_ext(xx+347,yy+478,string(trade_mine[3]),-1,136);draw_set_alpha(1);
        if (trade_mine[3]!="") then draw_line(xx+342,yy+517,xx+485,yy+517);
        if (scr_hit(xx+342,yy+470,xx+485,yy+517)=true){
            draw_set_color(c_gray);draw_set_alpha(0.15);
            draw_rectangle(xx+342,yy+470,xx+485,yy+517,0);
            draw_set_color(38144);
        }
        draw_set_alpha(1);
        
        if (info_chips<=0) then draw_set_alpha(0.33);draw_text_ext(xx+347,yy+525,string(trade_mine[4]),-1,136);draw_set_alpha(1);
        if (trade_mine[4]!="") then draw_line(xx+342,yy+564,xx+485,yy+564);
        if (scr_hit(xx+342,yy+517,xx+485,yy+564)=true){
            draw_set_color(c_gray);draw_set_alpha(0.15);
            draw_rectangle(xx+342,yy+517,xx+485,yy+564,0);
            draw_set_color(38144);
        }
        xx-=419;draw_set_alpha(1);
        
        
        if (trade_tnum[1]+trade_tnum[2]+trade_tnum[3]+trade_tnum[4]>0){
            draw_set_font(fnt_40k_14b);
            draw_text(xx+507,yy+381,string(obj_controller.faction[diplomacy])+":");
            draw_set_font(fnt_40k_14);
            if (trading_artifact=0){
                if (trade_tnum[1]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+399);
                if (trade_tnum[2]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+419);
                if (trade_tnum[3]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+439);
                if (trade_tnum[4]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+459);
            }
            if (trade_tnum[1]=1) and (trade_take[1]!="Artifact") then draw_text(xx+530,yy+399,string(trade_take[1]));
            if (trade_tnum[1]=1) and (trade_take[1]="Artifact") then draw_text(xx+530,yy+399,string(trade_take[1]));
            // 
            if (trade_tnum[1]>1) then draw_text(xx+530,yy+399,string(trade_take[1])+" ("+string(trade_tnum[1])+")");
            if (trade_tnum[2]=1) then draw_text(xx+530,yy+419,string(trade_take[2]));
            if (trade_tnum[2]>1) then draw_text(xx+530,yy+419,string(trade_take[2])+" ("+string(trade_tnum[2])+")");
            if (trade_tnum[3]=1) then draw_text(xx+530,yy+439,string(trade_take[3]));
            if (trade_tnum[3]>1) then draw_text(xx+530,yy+439,string(trade_take[3])+" ("+string(trade_tnum[3])+")");
            if (trade_tnum[4]=1) then draw_text(xx+530,yy+459,string(trade_take[4]));
            if (trade_tnum[4]>1) then draw_text(xx+530,yy+459,string(trade_take[4])+" ("+string(trade_tnum[4])+")");
        }
        if (trade_mnum[1]+trade_mnum[2]+trade_mnum[3]+trade_mnum[4]>0){
            draw_set_font(fnt_40k_14b);
            draw_text(xx+507,yy+529,string(global.chapter_name)+":");
            draw_set_font(fnt_40k_14);
            if (trade_mnum[1]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+547);
            if (trade_mnum[2]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+567);
            if (trade_mnum[3]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+587);
            if (trade_mnum[4]>0) then draw_sprite(spr_cancel_small,0,xx+507,yy+607);
            
            if (trade_mnum[1]=1) then draw_text(xx+530,yy+547,string(trade_give[1]));
            if (trade_mnum[1]>1) then draw_text(xx+530,yy+547,string(trade_give[1])+" ("+string(trade_mnum[1])+")");
            if (trade_mnum[2]=1) then draw_text(xx+530,yy+567,string(trade_give[2]));
            if (trade_mnum[2]>1) then draw_text(xx+530,yy+567,string(trade_give[2])+" ("+string(trade_mnum[2])+")");
            if (trade_mnum[3]=1) then draw_text(xx+530,yy+587,string(trade_give[3]));
            if (trade_mnum[3]>1) then draw_text(xx+530,yy+587,string(trade_give[3])+" ("+string(trade_mnum[3])+")");
            if (trade_mnum[4]=1) then draw_text(xx+530,yy+607,string(trade_give[4]));
            if (trade_mnum[4]>1) then draw_text(xx+530,yy+607,string(trade_give[4])+" ("+string(trade_mnum[4])+")");
        }
        
    }
    
    
}
