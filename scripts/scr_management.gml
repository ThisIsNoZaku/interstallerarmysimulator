
// argument0        1: overview         10+: that chapter -10
// Creates the company blocks in the main management screen and assigns text to them

var lol, num, nam, company, trainee;lol="";num=0;nam="";company=50;trainee=0;

if (argument0=1){
    with(obj_managment_panel){instance_destroy();}

    var pane;pane=instance_create(700,180-48,obj_managment_panel);
    pane.company=0;pane.manage=11;pane.header=3;pane.title=string_upper(obj_img.faction_title[1]);
    
    pane=instance_create(475,180-48,obj_managment_panel);
    pane.company=0;pane.manage=14;pane.header=2;pane.title="RECLUSIUM";
    
    pane=instance_create(275,180-48,obj_managment_panel);
    pane.company=0;pane.manage=12;pane.header=2;pane.title="APOTHECARIUM";
    
    pane=instance_create(925,180-48,obj_managment_panel);
    pane.company=0;pane.manage=15;pane.header=2;pane.title="ARMORY";
    
    pane=instance_create(1125,180-48,obj_managment_panel);
    pane.company=0;pane.manage=13;pane.header=2;pane.title="LIBRARIUM";

    
    /*var xx,yy,i,t;
    xx=94;yy=400-48;i=0;
    
    repeat(10){i+=1;t="";
        pane=instance_create(xx,yy,obj_managment_panel);
        pane.company=i;pane.manage=i;pane.header=1;
        
        if (i=1) then t=string(i)+"st ";if (i=2) then t=string(i)+"nd ";
        if (i=3) then t=string(i)+"rd ";if (i>3) then t=string(i)+"th ";
        t+="COMPANY";pane.title=t;
        
        xx+=140;
    }
    
    if (obj_ini.companies>10){
        var xx,yy,i,t;
        xx=94;yy=400-48+(258);i=10;
        
        repeat(obj_ini.companies-10){i+=1;t="";
            pane=instance_create(xx,yy,obj_managment_panel);
            pane.company=i;pane.manage=i+100;// company 11 = management 111?
            pane.header=1;
            
            t=string(i)+"th ";t+="COMPANY";pane.title=t;
            
            xx+=140;
        }
    }*/
    
    
    var xx,yy,i,t;
    xx=25;yy=400-48;i=0;
    
    repeat(10){i+=1;t="";
        pane=instance_create(xx,yy,obj_managment_panel);
        pane.company=i;pane.manage=i;pane.header=1;
        
        if (i=1) then t=string(i)+"st ";if (i=2) then t=string(i)+"nd ";
        if (i=3) then t=string(i)+"rd ";if (i>3) then t=string(i)+"th ";
        t+="COMPANY";pane.title=t;
        
        xx+=156;
    }
    
    if (obj_ini.companies>10){
        var xx,yy,i,t;
        xx=25;yy=400-48+(258);i=10;
        
        repeat(obj_ini.companies-10){i+=1;t="";
            pane=instance_create(xx,yy,obj_managment_panel);
            pane.company=i;pane.manage=i+100;// company 11 = management 111?
            pane.header=1;
            
            t=string(i)+"th ";t+="COMPANY";pane.title=t;
            
            xx+=156;
        }
    }
    
    




    
    var i;i=-1;repeat(50){i+=1;num[i]=0;nam[i]="";}
    
    // Main Panel
    company=0;obj_controller.temp[71]=11;
    num[1]=1;nam[1]=obj_ini.name[company,1];
    i=0;repeat(200){i+=1;if (obj_ini.role[0,i]=obj_ini.role[100,2]) then num[2]+=1;}
    if (num[2]=0) then nam[2]="Strategic Staff";// reserved for co-master alien or something
    if (num[2]>0){nam[2]=string(num)+"x "+string(obj_ini.role[100,2]);nam[3]="Strategic Staff";num[3]=1;}
    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
    i=0;repeat(10){i+=1;obj_managment_panel.line[i]=nam[i];}
    obj_managment_panel.italic[1]=1;instance_activate_object(obj_managment_panel);
    
    
    // ll=0;ll2=0;repeat(200){ll2+=1;if (obj_ini.role[company,ll2]=obj_ini.role[100,2]) then ll+=1;}
    // if (ll>0) then temp[3]=string(ll)+"x "+string(obj_ini.role[100,2]);
    
    
    // Apothecarium
    company=0;obj_controller.temp[71]=12;var q;q=0;
    i=-1;repeat(50){i+=1;num[i]=0;nam[i]="";}
    nam[2]=obj_ini.role[100,15];nam[3]=string(obj_ini.role[100,15])+" Aspirant";// nam[4]="Sister Hospitaler";
    i=0;repeat(200){i+=1;
        if (obj_ini.role[0,i]="Master of the Apothecarion"){num[1]+=1;if (nam[1]="") then nam[1]=obj_ini.name[0,i];}
        if (obj_ini.role[0,i]=obj_ini.role[100,15]) then num[2]+=1;
        if (obj_ini.role[0,i]=string(obj_ini.role[100,15])+" Aspirant") then num[3]+=1;
        // if (obj_ini.role[0,i]="Sister Hospitaler") then num[4]+=1;
    }
    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
    if (num[1]>0){q+=1;obj_managment_panel.line[q]=string(nam[1]);obj_managment_panel.italic[q]=1;}
    if (num[2]>0){q+=1;obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);}
    if (num[3]>0){q+=1;obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);}
    // if (num[4]>0){q+=1;obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);}
    instance_activate_object(obj_managment_panel);
    
    // Reclusium
    company=0;obj_controller.temp[71]=14;var q;q=0;
    i=-1;repeat(50){i+=1;num[i]=0;nam[i]="";}
    nam[2]=obj_ini.role[100,14];nam[3]=string(obj_ini.role[100,14])+" Aspirant";
    i=0;repeat(200){i+=1;
        if (obj_ini.role[0,i]="Master of Sanctity"){num[1]+=1;if (nam[1]="") then nam[1]=obj_ini.name[0,i];}
        if (obj_ini.role[0,i]=obj_ini.role[100,14]) then num[2]+=1;
        if (obj_ini.role[0,i]=string(obj_ini.role[100,14])+" Aspirant") then num[3]+=1;
    }
    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
    if (num[1]>0){q+=1;obj_managment_panel.line[q]=string(nam[1]);obj_managment_panel.italic[q]=1;}
    // if (global.chapter_name!="Space Wolves") 
    if (global.chapter_name!="Iron Hands"){
        if (num[2]>0){q+=1;obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);}
        if (num[3]>0){q+=1;obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);}
    }
    instance_activate_object(obj_managment_panel);
    
    // Armory
    company=0;obj_controller.temp[71]=15;var q;q=0;
    i=-1;repeat(50){i+=1;num[i]=0;nam[i]="";}
    nam[2]=obj_ini.role[100,16];nam[3]=string(obj_ini.role[100,16])+" Aspirant";nam[4]="Techpriest";
    i=0;repeat(200){i+=1;
        if (obj_ini.role[0,i]="Forge Master"){num[1]+=1;if (nam[1]="") then nam[1]=obj_ini.name[0,i];}
        if (obj_ini.role[0,i]=obj_ini.role[100,16]) then num[2]+=1;
        if (obj_ini.role[0,i]=string(obj_ini.role[100,16])+" Aspirant") then num[3]+=1;
        if (obj_ini.role[0,i]="Techpriest") then num[4]+=1;
    }
    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
    if (num[1]>0){q+=1;obj_managment_panel.line[q]=string(nam[1]);obj_managment_panel.italic[q]=1;}
    if (num[2]>0){q+=1;obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);}
    if (num[3]>0){q+=1;obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);}
    if (num[4]>0){q+=1;obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);}
    instance_activate_object(obj_managment_panel);
    
    // Librarium
    company=0;obj_controller.temp[71]=13;var q;q=0;
    i=-1;repeat(50){i+=1;num[i]=0;nam[i]="";}
    nam[2]=obj_ini.role[100,17];nam[3]="Codiciery";nam[4]="Lexicanum";nam[5]=string(obj_ini.role[100,17])+" Aspirant";
    i=0;repeat(200){i+=1;
        if (obj_ini.role[0,i]="Chief "+string(obj_ini.role[100,17])){num[1]+=1;if (nam[1]="") then nam[1]=obj_ini.name[0,i];}
        if (obj_ini.role[0,i]=obj_ini.role[100,17]) then num[2]+=1;
        if (obj_ini.role[0,i]="Codiciery") then num[3]+=1;
        if (obj_ini.role[0,i]="Lexicanum") then num[4]+=1;
        if (obj_ini.role[0,i]=string(obj_ini.role[100,15])+" Aspirant") then num[5]+=1;
    }
    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
    if (num[1]>0){q+=1;obj_managment_panel.line[q]=string(nam[1]);obj_managment_panel.italic[q]=1;}
    if (num[2]>0){q+=1;obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);}
    if (num[3]>0){q+=1;obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);}
    if (num[4]>0){q+=1;obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);}
    if (num[5]>0){q+=1;obj_managment_panel.line[q]=string(num[5])+"x "+string(nam[5]);}
    instance_activate_object(obj_managment_panel);
    
    company=0;
    repeat(obj_ini.companies){
        company+=1;obj_controller.temp[71]=company;var q;q=0;
        i=-1;repeat(50){i+=1;num[i]=0;nam[i]="";}
        
        nam[1]=obj_ini.role[100,5];
        nam[2]=obj_ini.role[100,14];
        nam[3]=obj_ini.role[100,15];
        nam[4]=obj_ini.role[100,17];
        nam[5]="Codiciery";
        nam[6]="Lexicanum";
        nam[7]="Standard Bearer";
        nam[8]=obj_ini.role[100,4];
        nam[9]="Techmarine";
        nam[10]=obj_ini.role[100,3];
        nam[11]=obj_ini.role[100,8];
        nam[12]=obj_ini.role[100,10];
        nam[13]=obj_ini.role[100,9];
        nam[14]=obj_ini.role[100,12];
        nam[15]="Venerable "+string(obj_ini.role[100,6]);
        nam[16]=obj_ini.role[100,6];
        nam[17]=string(obj_img.unit[1,21]);
        nam[18]=string(obj_img.unit[1,19]);
        nam[19]=string(obj_img.unit[1,18]);
        nam[20]=string(obj_img.unit[1,22]);
        nam[21]=string(obj_img.unit[1,20]);
        
        i=0;repeat(300){i+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,5]) then num[1]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,14]) then num[2]+=1;
            if (global.chapter_name!="Space Wolves"){if (obj_ini.role[company,i]=obj_ini.role[100,15]) then num[3]+=1;}
            if (obj_ini.role[company,i]=obj_ini.role[100,17]) then num[4]+=1;
            if (obj_ini.role[company,i]="Codiciery") then num[5]+=1;
            if (obj_ini.role[company,i]="Lexicanum") then num[6]+=1;
            if (obj_ini.role[company,i]="Standard Bearer") then num[7]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,4]) then num[8]+=1;
            if (obj_ini.role[company,i]="Techmarine") then num[9]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,3]) then num[10]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,8]) then num[11]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,10]) then num[12]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,9]) then num[13]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,12]) then num[14]+=1;
            if (obj_ini.role[company,i]="Venerable "+string(obj_ini.role[100,6])) then num[15]+=1;
            if (obj_ini.role[company,i]=obj_ini.role[100,6]) then num[16]+=1;
            if (i<=100){
                if (obj_ini.veh_role[company,i]=string(obj_img.unit[1,21])) then num[17]+=1;
                if (obj_ini.veh_role[company,i]=string(obj_img.unit[1,19])) then num[18]+=1;
                if (obj_ini.veh_role[company,i]=string(obj_img.unit[1,18])) then num[19]+=1;
                if (obj_ini.veh_role[company,i]=string(obj_img.unit[1,22])) then num[20]+=1;
                if (obj_ini.veh_role[company,i]=string(obj_img.unit[1,20])) then num[21]+=1;
            }
        }
        with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
        var d;d=0;repeat(21){d+=1;if (num[d]>0){q+=1;obj_managment_panel.line[q]=string(num[d])+"x "+string(nam[d]);}}
        instance_activate_object(obj_managment_panel);
    }
    
    
    
    
    
    
    
    
}


