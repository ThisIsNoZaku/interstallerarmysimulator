


var i, sell;
i=0;sell="";

if (argument0=true){// Load
    alll=1;man_size=0;
    repeat(300){i+=1;
        if (man[i]="man") and (ma_loc[i]=selecting_location) and (ma_god[i]<10){man_sel[i]=1;
            man_size+=scr_unit_size(ma_armor[i],ma_role[i],true);
            
        }
        if (i<=200){
            if (man[i]="vehicle") and (ma_loc[i]=selecting_location){man_sel[i]=1;
                man_size+=scr_unit_size("",ma_role[i],true);
            }
        }
    }
}

if (argument0=false){// Unload
    alll=0;man_size=0;
    repeat(300){i+=1;
        man_sel[i]=0;
    }
}