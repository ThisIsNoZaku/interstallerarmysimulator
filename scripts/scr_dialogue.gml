

// diplo_last="";

// argument0 = keyphrase

var h;h=0;repeat(4){h+=1;obj_controller.diplo_option[h]="";obj_controller.diplo_goto[h]="";}


var rando, tempd, sorc;rando=0;tempd="";sorc=false;
var rela,trade_msg;rela="neutral";
trade_msg="[[Trade Accepted.  Shipment initialized.]]";

diplo_txt="";
diplo_text="";


// show_message(string(argument0));

if (argument0="declare_war") and (faction_status[diplomacy]!="War"){
    faction_status[diplomacy]="War";var lol;lol="";
    lol=string(obj_controller.faction_title[diplomacy])+" "+string(obj_controller.faction_leader[diplomacy])+" declares war on the "+string(global.chapter_name)+".";
    scr_event_log("red",lol);
    
    if (string_count("|SC|",obj_controller.useful_info)>1) and (diplomacy=4) then sorc=true;
}
if (argument0="declare_war") and (string_count("|SC|",obj_controller.useful_info)>1) and (diplomacy=4) then sorc=true;

if (argument0="intro") or (argument0="intro1") or ((diplomacy=10) and (argument0="intro2")){var lol;lol="";
    lol=string(obj_img.faction_title[1])+" "+string(obj_ini.master_name)+" meets the "+string(obj_controller.faction[diplomacy])+" "+string(obj_controller.faction_title[diplomacy])+", "+string(obj_controller.faction_leader[diplomacy])+".";
    scr_event_log("",lol);
}


var i;i=1;

// repeat(3){
    // i+=1;
    
    i=diplomacy;rela="neutral";
    
    if (diplomacy>0){
    
        // if (diplomacy!=8){
            if (disposition[i]>=60) then rela="friendly";
            if (disposition[i]<60) and (disposition[i]>=20) then rela="neutral";
            if (disposition[i]<20) then rela="hostile";
        // }
        
        if (diplomacy=6){
            if (disposition[i]>=60) then rela="friendly";
            if (disposition[i]<60) and (disposition[i]>=0) then rela="neutral";
            if (disposition[i]<0) then rela="hostile";
        }
        
        if (diplomacy=8){
            if (disposition[i]>=40) then rela="friendly";
            if (disposition[i]<40) and (disposition[i]>=-15) then rela="neutral";
            if (disposition[i]<-15) then rela="hostile";
        }// */
    
    }
    
    // if (i<=5) and (fleet_type=3) and (rela="hostile") then rela="neutral";
    
// }




if (diplomacy>10) and (diplomacy<11){
    /*if (diplomacy=10.1){// Testing
        
    }*/
    diplo_text="Testing text parameters to see how well the daemon audience is set up already.  The main thing I will be looking for is how well the diplo options line up with both three and four options.  I should probably also play around with it when there are only two options, and a single option, just to be safe.  Typing from line of thought right now to try and get a decent block of text to appear within the diplomacy screen.  I have no idea what I am going to eat for dinner tonight- maybe I'll cook up that beef and broccoli meal.  Haven't had them for a while and it's good to practice with chopsticks.";
    diplo_option[1]="Option 1";diplo_option[2]="Option 2";diplo_option[3]="Option 3";diplo_option[4]="Option 4";
}





if (argument0="cs_meeting1"){diplomacy=10;
    diplo_text="So you have brought yourself before me "+string(obj_ini.master_name)+". This pleases me. You are not the first among the "+string(obj_img.faction_dudes_formal[1])+" to come to me. Do not look so shocked. Many have gazed upon the decay and decrepitude of the "+string(obj_img.faction_title_shortest)+" with open eyes, and heard the empty slogans of the Corpse "+string(obj_img.king_title)+" with fresh ears and come to the realization I had so many long millennia ago. There is only one truth in the universe, one path worthy of an "+string(obj_img.faction_dudes_formal[1])+" to walk. The path of true power. The path of true insight into the nature of reality and what lies beyond. The path of "+string(obj_img.evil_prefix)+". Only when free of the pointless bondage of the "+string(obj_img.kingdom_title_shortest)+" can we ascend to our rightful place in the universe.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting2";
    disposition[10]+=10;
}

// First branch of choices
if (argument0="cs_meeting2") or (argument0="cs_meeting20"){diplomacy=10;
    // check for MoS here
    var ii,mos;mos=false;ii=0;
    repeat(obj_temp_meeting.dudes){ii+=1;if (mos=false){if (obj_ini.role[obj_temp_meeting.co[ii],obj_temp_meeting.ide[ii]]=string(obj_img.head_chaplain)) then mos=true;}}
    
    if (argument0="cs_meeting2") then disposition[10]+=10;
    
    // Meeting2
    diplo_text="But still I am puzzled by you /noble/ "+string(obj_img.faction_dudes_formal[1])+". You come before me and put yourself at my mercy. I could extinguish your life in an instant, crush you beneath my boot heel faster than the lowliest insect. These are not the actions of a "+string(obj_img.faction_dude[1])+". Long have you fought for Him. So tell me then "+string(obj_img.faction_dudes_formal[1])+", why do you come to me now?";
    
    // Meeting20
    if (argument0="cs_meeting20"){
        diplo_text="[[A low rumbling growl issues from "+string(obj_controller.faction_leader[10])+"’s power armor before he speaks.]]##I ask you for the last time "+string(obj_img.faction_dudes_formal[1])+". Why did you seek me out?";
    }
    
    if (mos=true) and (argument0!="cs_meeting20"){
        diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting_m1";
    }
    if (mos=false) or (argument0="cs_meeting20"){
        diplo_option[1]="The "+string(obj_img.kingdom_title_shortest)+" has bound us and kept us from our true potential.  We seek strength.";
        diplo_option[2]="The "+string(obj_img.kingdom_title_shortest)+" and "+string(obj_img.faction[4])+"'s ignorance and hypocrisy will be the death of my "+string(obj_img.player_army)+".";
        diplo_option[3]="Our enemies are many and our strength is diminished. We need allies to join with us while we rebuild our forces.";
        diplo_option[4]="I sought you out to slay you with my own hands.";
        
        // Set targets for those options
        diplo_goto[1]="cs_meeting30";
        
        if (obj_controller.disposition[4]<=30) then diplo_goto[2]="cs_meeting40";// Convinced
        if (obj_controller.disposition[4]>30) then diplo_goto[2]="cs_meeting45";// Not convinced, high inquisition dispositioin
        
        var testy;testy=true;
        if (obj_controller.faction_status[2]="War") or (obj_controller.marines<=600) then testy=false;
        if (testy=false) then diplo_goto[3]="cs_meeting50";// Scurrying like a rat, accepts
        if (testy=true) then diplo_goto[3]="cs_meeting55";// Not convinced
        
        diplo_goto[4]="cs_meeting60";
    }
}

if (argument0="cs_meeting21"){
    var tix;tix=string(obj_ini.master_name)+" kills the "+string(global.chapter_name)+" "+string(obj_img.head_chaplain)+" for "+string(obj_controller.faction_leader[10])+".";
    scr_event_log("purple",tix);// scr_alert("purple","lol",string(tix),0,0);
    
    diplo_text="[Missing dialogue- well done]";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting135";
}

// MoS cuts in
if (argument0="cs_meeting_m1"){diplomacy=-5.2;
    diplo_text="[["+string(obj_ini.name[0,3])+" hisses your name over a private vox channel.]]##";
    diplo_text+="My lord!  What are we doing here, treating with this monster of the Traitor Legions? The very existence of the Archenemy is a threat to everything the "+string(obj_img.player_army)+" stands for, and we endanger our immortal souls just being here. You know this! I demand to know your intentions! And I warn you, I will not hesitate to do what I must, for the good of the "+string(obj_img.player_army)+" and the "+string(obj_img.kingdom_title_shortest)+".";
    
    diplo_option[1]="Times change and the "+string(obj_img.player_army)+" must change with them or be ground into the dust of history.  ("+string(obj_img.faction[11])+")";
    diplo_option[2]="We will not serve the "+string(obj_img.kingdom_title_shortest)+"’s crooked ends any longer. Our "+string(obj_img.player_army)+" will control its own destiny.  (Renegade)";
    diplo_option[3]="I haven’t turned traitor and my faith is strong. The Beast has foolishly opened its lair to us. Be ready for my signal.";
    var g;g=0;repeat(3){g+=1;diplo_goto[g]="cs_meeting_m2";}
        
    // Option4 here if all the right conditions are met
    var ii,born;ii=0;born=false;
    repeat(200){ii+=1;if (obj_ini.role[0,ii]=obj_img.faction_title[1]) and (string_count("$",obj_ini.spe[0,ii])>0) then born=true;}
    
    if (obj_ini.chaos[0,3]>=50) and (born=true){
        diplo_option[4]="Right now I need my "+string(obj_img.head_chaplain)+" at my side, trusting that his "+string(obj_img.faction_title[1])+" is doing what is best, what is necessary for the "+string(obj_img.player_army)+", during this dangerous moment. All will be made clear in time, I promise you brother. This is the right path.";
        diplo_goto[4]="cs_meeting_m3";
    }
}

if (argument0="cs_meeting_m2"){
    var tix;tix="The "+string(global.chapter_name)+" "+string(obj_img.head_chaplain)+" takes a stand against you.";
    scr_event_log("purple",tix);// scr_alert("purple","lol",string(tix),0,0);
    diplo_text="You have besmirched the honor of our "+string(obj_img.player_army)+" this day, and I will not forget it /my lord "+string(obj_img.faction_title[1])+"/.##[["+string(obj_ini.name[0,3])+" strides forward and his shout erupts from his external vox speakers with a boom that shatters the silence in the room.]]##We will not stand idly by and bandy words with "+string_lower(obj_img.faction_dude[10])+" scum! To me my brothers! Slay these "+string_lower(obj_img.faction_dudes[11])+" in the name of our "+string(obj_img.king_title)+"!";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting9";
}
if (argument0="cs_meeting_m3"){
    diplo_text="[["+string(obj_ini.name[0,3])+" is silent for a moment, before giving you an imperceptible nod.]]##I stand with you, Lord "+string(obj_ini.master_name)+". Let us face this together.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting20";
    obj_controller.useful_info+="CRMOS|";
}

if (argument0="cs_meeting_m5"){diplomacy=-5.2;instance_activate_all();
    diplo_text="[Missing text- "+string(obj_img.head_chaplain)+" is turning you in to the "+string(obj_img.faction[4])+"]";
    
    diplo_option[1]="Very well.  I did what must be done, and now accept the price.  [Game Over]";
    diplo_option[2]="Never!  [Battle Loyalist "+string(global.chapter_name)+"]";
    diplo_goto[1]="cs_meeting_m6";diplo_goto[2]="cs_meeting_battle7";
}

if (argument0="cs_meeting_m6"){
    global.defeat=3;obj_controller.alarm[7]=5;
}




if (argument0="cs_meeting9"){diplomacy=10;
    diplomacy=10;
    diplo_text="[["+string(obj_controller.faction_leader[10])+" turns to you, his voice even and calm]]##Here is the first step you must take, to prove you’ve truly left the "+string(obj_img.kingdom_title_shortest)+" behind. Kill him. Kill your loyal brothers.##[[His "+string(obj_img.unit[10,5])+"s raise their weapons as one and point them at you. Somewhere behind them a "+string_lower(obj_img.demon_formal)+" cackles.]]##Choose now or be obliterated.";
    
    diplo_option[1]="Stand with me my brothers! Fight for the future of your "+string(obj_img.player_army)+", and slay "+string(obj_ini.name[0,3])+"!  [Battle loyalist "+string(global.chapter_name)+"]";diplo_goto[1]="cs_meeting_battle1";
    diplo_option[2]=string(global.chapter_name)+", I order you to hold your fire! "+string(obj_ini.name[0,3])+", if you doubt my leadership then let it be decided by single combat! [Duel your "+string(obj_img.head_chaplain)+"]";diplo_goto[2]="cs_meeting_battle2";
    diplo_option[3]="I deny you "+string(obj_controller.faction_leader[10])+".  And now I shall destroy you.  For the "+string(obj_img.king_title)+"! [Attack "+string(obj_img.faction[11])+" forces]";diplo_goto[3]="cs_meeting_battle5";
}


// First explanation for chaos
if (argument0="cs_meeting30"){
    diplo_text="Then you have awakened to the truth the "+string(obj_img.kingdom_title_shortest)+" so hypocritically denies, that there is only one real power in the universe, and it goes to those with the will to seize it.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting135";
    disposition[10]+=30;
}

// Fucking inquisition
if (argument0="cs_meeting40"){
    diplo_text="Yes...you do not fit the precious mold the "+string(obj_img.codex)+" carves out for you, do you? And the "+string(obj_img.kingdom_title_shortest)+" destroys that which it cannot understand.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting135";
    disposition[10]+=30;
}
// Nah dawg
if (argument0="cs_meeting45"){
    diplo_text="Do you take me as a fool, "+string(obj_ini.master_name)+"?  Even in the Eye there are whispers of your running to and fro at the "+string(obj_img.faction[4])+"’s beck and call, like a dog playing fetch. You’re a well-trained, and maybe even a clever, dog. I’ve killed so many clever dogs in my time. How do I know this isn’t just a hopelessly doomed plot to try and kill me, hatched by your "+string(obj_img.faction[4])+" masters still holding your leash?";
        
    diplo_option[1]="There are advantages to staying on the "+string(obj_img.faction[4])+"’s good side, and I’m not one to ignore an advantage.";;
    diplo_option[2]="Appeasing the "+string(obj_img.faction[4])+" is no hard choice when your options are obey, or eventually be branded a "+string_lower(obj_img.faction_dude[10])+" and be destroyed.";
    diplo_option[3]="Given enough time, everyone becomes a "+string_lower(obj_img.faction_dude[10])+" in the eyes of the "+string(obj_img.faction[4])+". I will not wait for them to make their move against us.";
    diplo_option[4]="You have one thing right, "+string(obj_controller.faction_leader[10])+". I am here to kill you. Open fire brothers, NOW!  [Battle "+string(obj_img.faction[11])+" forces]";diplo_goto[4]="cs_meeting_battle5";
    
    var q;q=0;repeat(3){q+=1;diplo_goto[q]=choose("cs_meeting46","cs_meeting47");}
}
// Sorry brah, you're not their homie
if (argument0="cs_meeting46"){
    diplo_text="I am not convinced.  A shame.  I was hoping you might actually be of use- but now it is apparent that your use will only be as a bloody, broken offering to the Dark Gods.";
    diplo_option[1]="[Battle "+string(obj_img.faction[11])+" AND any loyalist forces]";diplo_option[2]="cs_meeting_battle6";
}
// you might be their homie, fine
if (argument0="cs_meeting47"){
    diplo_text="You may yet be of use to me.  Very well, we will assist you. It will be no trouble at all to exterminate you, should you displease me at a future time.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting135";
    disposition[10]+=30;
}

// mah numbers
if (argument0="cs_meeting50"){
    diplo_text="Yes we have seen you struggle alone, scurrying from shadow to shadow like a hunted rat. I won’t lie to you though, I’ve seen the potential in you and your….brothers. Alright, we will assist you. It will be no trouble at all to exterminate you, should you displease me.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting135";
    disposition[10]+=30;
}
// such numbers, wow
if (argument0="cs_meeting55"){
    diplo_text="I could overrun this sector with half the warriors you have now. Is your “"+string(obj_img.player_army)+"” so pathetic you need to throw scores more men into the meatgrinder to succeed?  You have not convinced me.  I'd have enjoyed making use of your "+string(obj_img.player_army)+", but this was clearly not meant to be.  Make your peace.";
    diplo_option[1]="[Battle "+string(obj_img.faction[11])+" AND any loyalist forces]";diplo_option[2]="cs_meeting_battle6";
}

// Actually here to kill you
if (argument0="cs_meeting60"){disposition[10]+=10;
    diplo_text="[["+string(obj_controller.faction_leader[10])+" is silent for a moment, then a slow chuckle rises from deep within his ancient power armor. The chuckle erupts into hideous laughter that chills your blood with its otherworldly tenor.]]##I thank you, I have not truly laughed in three hundred years. I shall take your skull as a memento of this day and your fine jest. But before I do, indulge my curiosity. Let us say you did kill me, /then/ what would you do? Claim the price on my head? Go crawling back on your belly to your Imperial masters like a whipped cur, dragging your kill behind you? Become master of this sector yourself now that you’ve bested your greatest foe? Or perhaps you’d offer up my soul to the Dark Gods, ignorantly fumbling about in the darkness for their favor? Tell me.";
    
    diplo_option[1]="The reward for one such as you will be great, and I /will/ claim it.";diplo_goto[1]="cs_meeting61";
    diplo_option[2]="The atrocities you’ve visited on this sector are reason enough.";diplo_goto[2]="cs_meeting63";
    diplo_option[3]="You think me ignorant of the ways of "+string(obj_img.faction[11])+", "+string(obj_controller.faction_leader[10])+", but I know one truth. There is power in blood. Your blood. My power. They will hear me.";diplo_goto[3]="cs_meeting65";
    diplo_option[4]="I’m just tired of listening to you talk, "+string(obj_controller.faction_leader[10])+".";diplo_goto[4]="cs_meeting67";
}

// Reward
if (argument0="cs_meeting61"){
    diplo_text="It is this blind overconfidence that makes killing a "+string(obj_img.faction_dude[1])+" so satisfying.";
    diplo_option[1]="[Battle "+string(obj_img.faction[11])+" forces]";diplo_goto[1]="cs_meeting_battle5";
}
// Atrocities
if (argument0="cs_meeting63"){
    diplo_text="Oh, but I have one more atrocity to commit you simply shouldn’t miss...";
    diplo_option[1]="[Battle "+string(obj_img.faction[11])+" forces]";diplo_goto[1]="cs_meeting_battle5";
}
// BLOOD BLOOD BLOOD
if (argument0="cs_meeting65"){
    diplo_text="You know, I think I would actually enjoy watching you attempt it. But I’ll spare you having your soul torn to shreds by daemons, and just give you an agonizing death instead.";
    diplo_option[1]="[Battle "+string(obj_img.faction[11])+" AND any loyalist forces]";diplo_goto[1]="cs_meeting_battle6";
}
// stahp talking
if (argument0="cs_meeting67"){disposition[10]+=10;
    diplo_text="And I thought we were becoming such fast friends, you and I. Very well, don’t bore me.";
    diplo_option[1]="[Battle "+string(obj_img.faction[11])+" forces]";diplo_goto[1]="cs_meeting_battle5";
}


// Finish the conversation

// 135
// 136
// 137

if (argument0="cs_meeting135"){disposition[10]=max(disposition[10]+10,10);
    diplo_text="[["+string(obj_controller.faction_leader[10])+"’s power armor grinds as he leans forward, his posture predatory.]]##Then we have an accord. We will assist you as you take your first steps on the path toward "+string(obj_img.faction[11])+". And my payment for all this?##[[He chuckles.]]##Enlisting an entire "+string(obj_img.player_army)+" in the service of the Dark Gods is all the reward I require.";
    diplo_text+="##But you cannot simply paint the eight-pointed star on your wargear and begin slaughtering in the name of the Dark Gods. No, some within your "+string(obj_img.player_army)+" will resist the choice you’ve made, either out of loyalty to the Corpse "+string(obj_img.king_title)+" or out of fear of "+string(obj_img.faction[11])+". Just think, it will be like your own little heresy. The ''"+string(obj_ini.master_name)+" Heresy!''";    
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting136";
}
if (argument0="cs_meeting136"){
    var tix;tix=string(obj_controller.faction_leader[10])+" gives you an Artifact, meant to help corrupt your marines to the path of "+string(obj_img.faction[11])+".";
    scr_event_log("purple",tix);// scr_alert("purple","lol",string(tix),0,0);
    diplo_text="[The tones of his humorless laughter are filled with the bitterness of ancient, poisoned memories. He continues.]##You must emerge victorious from this... \Civil War\, and not decimate your ranks in the process, if you are to be of any use to the Gods or to me.  ";
    diplo_text+="And to that end, I give you this.##[["+string(obj_controller.faction_leader[10])+" gestures to one of his "+string(obj_img.unit[1,4])+"s, who presents you with an Artifact. In your mind, something sinister seems to cling to the lines of its form.]]##The more of your warriors that come to accept "+string(obj_img.faction[11])+", the fewer holdouts there will be to overcome when the time comes. This object will speed their introduction to its ways. You must also encourage your warriors to...broaden their horizons wherever possible, so they come to their own understanding of the Primordial Truth. But you must tread carefully at the same time, lest you alert the "+string(obj_img.faction[4])+". They must not have even a hint of what’s taking place in your "+string(obj_img.player_army)+", or they will obliterate you.";
    diplo_option[1]="[Continue]";diplo_goto[1]="cs_meeting137";
}
if (argument0="cs_meeting137"){
    diplo_text="When enough of your warriors have embraced "+string(obj_img.faction[11])+", assemble them together in one place and then speak with me, and I will show you the beginning of the Eightfold Path. Now, begone.##[[As you leave he calls out to you one more time.]]##And "+string(obj_ini.master_name)+", I expect action within a few years. My patience, unlike "+string(obj_img.faction[11])+", is not infinite.";
    complex_event=true;current_eventing="";
    force_goodbye=1;faction_status[10]="Antagonism";
    
    with(obj_star){
        var run,s;run=0;s=0;
        repeat(4){run+=1;s=0;
            repeat(4){s+=1;
                if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap"){p_problem[run,s]="";p_timer[run,s]=-1;}
            }
        }
    }
    
    var ii,born;ii=0;born=false;
    repeat(200){ii+=1;if (obj_ini.role[0,ii]=obj_img.faction_title[1]) then obj_ini.chaos[0,ii]+=floor(random_range(30,50));}
    obj_controller.chaos_rating+=1;
    
    // Casket, Chalice, Tome
    if (obj_ini.fleet_type=1) then scr_add_artifact("chaos_gift","",0,obj_ini.home_name,2);
    if (obj_ini.fleet_type!=1) then scr_add_artifact("chaos_gift","",0,obj_ini.ship[1],501);
}


if (string_count("cs_meeting_battle",argument0)>0){
    current_eventing=argument0;combating=1;
    cooldown=30;diplomacy=0;menu=0;
    instance_activate_all();
    
    
    
    with(obj_temp4){instance_destroy();}
    with(obj_star){
        var run,s;run=0;s=0;
        repeat(4){run+=1;s=0;
            repeat(4){s+=1;
                if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap"){
                    repeat(run){instance_create(x,y,obj_temp4);}
                }
            }
        }
    }
    if (instance_number(obj_temp4)=0){
        with(obj_star){
            if (string_count(name,scr_master_loc())>0){
                repeat(obj_ini.wid[0,1]){instance_create(x,y,obj_temp4);}
            }
        }
    }
    
    
    // show_message(string(instance_number(obj_temp4)));
    
    
    instance_create(0,0,obj_ncombat);
    obj_ncombat.battle_special=argument0;
    obj_ncombat.battle_object=instance_nearest(obj_temp4.x,obj_temp4.y,obj_star);
    obj_ncombat.battle_loc=instance_nearest(obj_temp4.x,obj_temp4.y,obj_star).name;
    obj_ncombat.battle_id=instance_number(obj_temp4);
    with(obj_temp4){instance_destroy();}
    obj_ncombat.dropping=0;
    obj_ncombat.attacking=1;
    obj_ncombat.local_forces=0;
    
    
    if (argument0="cs_meeting_battle1"){obj_ncombat.enemy=1;obj_ncombat.threat=2;}
    if (argument0="cs_meeting_battle2"){obj_ncombat.enemy=1;obj_ncombat.threat=1;}
    if (argument0="cs_meeting_battle5"){obj_ncombat.enemy=10;obj_ncombat.threat=3;}
    if (argument0="cs_meeting_battle6"){obj_ncombat.enemy=10;obj_ncombat.threat=3;}
    if (argument0="cs_meeting_battle7"){obj_ncombat.enemy=1;obj_ncombat.threat=2;}
    
    if (obj_ncombat.enemy=10) and (obj_controller.faction_defeated[10]=0){
        obj_ncombat.leader=1;
        
        with(obj_star){
            var run,s;run=0;s=0;
            repeat(4){run+=1;s=0;
                repeat(4){s+=1;
                    if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap"){p_problem[run,s]="";p_timer[run,s]=-1;}
                }
            }
        }
    }
    
    
    var v;v=0;
    repeat(obj_temp_meeting.dudes){v+=1;
        if (obj_temp_meeting.present[v]=1){
            obj_ncombat.fighting[obj_temp_meeting.co[v],obj_temp_meeting.ide[v]]=1;
        }
    }
    
    
    scr_civil_roster(obj_ncombat.battle_loc,obj_ncombat.battle_id,true);
    
    
    instance_deactivate_all(true);
    instance_activate_object(obj_controller);
    instance_activate_object(obj_ini);
    instance_activate_object(obj_temp_meeting);
    instance_activate_object(obj_ncombat);
    instance_activate_object(obj_centerline);
    instance_activate_object(obj_pnunit);
    instance_activate_object(obj_enunit);
    
    exit;
}






if (diplomacy=10){// Chaos
    if (argument0="civilwar_begin"){
        diplo_text="[Missing dialogue]";force_goodbye=1;
    }
    if (argument0="civilwar_soon"){
        diplo_text="[Missing dialogue]";force_goodbye=1;
    }

    
    if (argument0="intro") or (argument0="intro2"){
        if (faction_gender[10]=1) then tempd="[[An ancient and veteran "+string(obj_img.faction_title[11])+", "+string(faction_leader[10])+" has been a massive threat to "+string(obj_ini.sector_name)+" and the surround region since time remembered.  He has fought against loyal "+string(obj_img.faction_dudes_formal[1])+" and the forces of man for many millennia, if not since the "+string(obj_img.split)+", and is personally responsible for several rebellions.  Were "+string(faction_leader[10])+" to be silenced, his poisonous lies and false promises would no longer taint the sector.]]";
        if (faction_gender[10]=2) then tempd="[An ancient World Eaters "+string(obj_img.faction_title[11])+", "+string(faction_leader[10])+" is a powerful warrior, blessed by "+string(obj_img.war_god)+".  He has personally vanquished dozens of "+string(obj_img.faction_dudes_formal[1])+" Champions and countless more Imperial Servants.  It is by his warband's hands that a massive, bloody path of destruction has been carved through the stars.  His forces are just now arriving within "+string(obj_ini.sector_name)+"- a direct confrontation is ill-advised.]]";
        tempd+="###";
        
        // Need to have situational awareness for here- alternate introductions
        
        if (faction_gender[10]=1) and (argument0="intro"){
            rando=choose(1,1,2);force_goodbye=1;
            if (rando=1) then tempd+="It is a fine day, is it not?  Yet again the "+string(obj_img.faction_title_shortest)+" displays its tyrannical, bureaucratic nature by declaring your "+string(obj_img.player_army)+" traitor.  To unmake your forces, alone, is beyond my reach.  It is fortunate I may simply sit back and watch as it is ground to dust by your former allies.  When we meet again, "+string(obj_ini.master_name)+"- if we meet again- I will enjoy killing you.";
            if (rando=2) then tempd+="We have not met before, "+string(obj_ini.master_name)+", but until now this would have been troublesome.  I am "+string(faction_leader[10])+"- no doubt you know of me, or have at least seen my hand at play.  I am here, now, to laugh at you.  Though it's been long since I could feel joy, or amusement, my hearts are warmed at seeing the "+string(obj_img.kingdom_title_shortest)+" destroying their own.  If we meet again I would very much like to kill you.";
        }
        if (faction_gender[10]=1) and (argument0="intro2"){
            rando=choose(1,1,2,3,3,4,4);force_goodbye=1;
            if (rando=1) then tempd+="Your defeat was a foregone conclusion, "+string(obj_img.faction_dudes_formal[1])+". Your "+string(obj_img.player_army)+"s are like children compared to the Legions of old and we have only grown stronger after millennia of slaughter. Though you are not worthy of it I will honor you with death and make of it an offering to the Dark Gods.";
            if (rando=2) then tempd+="Do not mourn your fallen, mewling wretch of the "+string(obj_img.kingdom_title_shortest)+".  Their deaths were not in vain.  Each was a sacrifice to the Gods of the Warp and you pleased them greatly this day.  For there is no paradise at the side of the False "+string(obj_img.king_title)+" awaiting them, no glorious final battle.  There is only the Warp.  Even now their souls writhe in torment as they are chewed by the teeth of madness, and they will do so for all eternity.  This same fate, and more, awaits you.";
            if (rando=3) then tempd+="Your men were no true challenge, "+string(obj_img.faction_title[1])+", merely wheat before the scythe of my forces. Next time you foolishly send your troops blundering into combat, at least make sure they are troops that offer some diversion. More entertainment was had from the desecration of their corpses than in the stealing of their life, though perhaps this will be true of your entire warband. In time, no doubt I will see.";
            if (rando=4) then tempd+="You should be grateful that I gave your men a chance to die for their "+string(obj_img.king_title)+", to throw their lives away for your corpse god, to squander their might and prestigious gifts on fighting for the glory of a long dead cause. Their deaths, while meaningless to the the rest of the galaxy, must surely have brought them the satisfaction of a vindicated fanatic. Soon, I will give you this gift as well, purely from the generosity of my hearts.";
        }
        if (faction_gender[10]=2){
            rando=choose(1,1,2,2,2);
            if (rando=1) then tempd+="I COME NOW, "+string_upper(obj_ini.master_name)+", FOR YOU.  NONE OF YOUR MEN, NONE OF YOUR ALLIES, AND NOTHING YOU CAN DO WILL PREVENT ME FROM KILLING YOU.  FLEE, AND I WILL RUN YOU DOWN LIKE THE ANIMAL YOU ARE.  YOUR DAYS ARE NUMBERED.";
            if (rando=2) then tempd+="BY "+string_upper(obj_img.war_god)+"'S NAME "+string_upper(obj_ini.sector_name)+" SHALL BURN.  CRAWL INTO A HOLE, OR STAND AND FIGHT, IT MATTERS NOT.  YOU ARE FATED TO DIE BY MY HAND, ALONG WITH THE REST OF YOUR PATHETIC CHAPTER.";
        }
        diplo_text=tempd;
    }
    if (argument0="hello") or ((argument0="propose_alliance") and (faction_gender[10]=2)){
        scr_loyalty("Heretic Contact","+");

        if (faction_gender[10]=1) and (string_count("CHTRP|",obj_controller.useful_info)=0){
            if (chaos_rating>=1){
                rando=choose(1,2,3,4);
                if (rando=1) then diplo_text="Yes, "+string(obj_ini.master_name)+"?";
                if (rando=2) then diplo_text="You require something, "+string(obj_ini.master_name)+"?";
                if (rando=3) then diplo_text="What is it?";
                if (rando=4) then diplo_text="What do you want?";
                
                if (obj_controller.chaos_rating>=1){
                    diplo_option[1]="My "+string(obj_img.player_army)+" is prepared to join "+string(obj_img.faction[11])+".  [Begin]";diplo_goto[1]="civilwar_begin";
                    diplo_option[2]="I require more time to corrupt my brethren.";diplo_goto[2]="civilwar_soon";
                }
            }
            if (disposition[10]>-80) and (chaos_rating=0){
                rando=choose(1,2,2,3,3,3,4,4,4,4,5,5,5);
                if (rando=1) then diplo_text="Ahhhh.  You require something, "+string(obj_ini.master_name)+"?";
                if (rando=2) then diplo_text="You risk much with this audience.  I hope I can make it worth your while.";
                if (rando=3) then diplo_text="Now this is an unlikely meeting.  What can I do for you, "+string(obj_ini.master_name)+"?";
                if (rando=4) then diplo_text="Have you finally seen the light, at long last?";
                if (rando=5) then diplo_text="There are few reasons a "+string(obj_img.faction_title[1])+" might wish an audience, and they are all worthwhile.  What can I and my forces do for you?";
            }
            if (disposition[10]<=-80){
                force_goodbye=1;rando=choose(1,2,2,3,3);turns_ignored[10]+=choose(3,4,5);
                if (rando=1) then diplo_text="There are no more words to be said.";
                if (rando=2) then diplo_text="The forces of "+string(obj_img.faction[11])+" call for your destruction.";
                if (rando=3) then diplo_text="Your soul will be mine.";
            }
            if (rela!="hostile"){// Only happens with leader=1
                // More normal "yes?" greetings
            }
        }
        if (faction_gender[10]=1) and (string_count("CHTRP|",obj_controller.useful_info)>0){
            obj_controller.useful_info=string_replace(obj_controller.useful_info,"CHTRP|","CHTRP2|");
            diplo_text+="I almost refused to believe that my little trap hadn't done you in, but here you are.  I may have misjudged you, "+string(obj_ini.master_name)+".  Of course I still intend to kill you, regardless, but I can give credit where credit is due.";force_goodbye=1;
        }
        if (faction_gender[10]=2){
            force_goodbye=1;turns_ignored[10]+=choose(3,4,5);
            rando=choose(1,2,3);if (argument0="propose_alliance") then rando=choose(1,2,2,3);
            if (rando=1) then diplo_text="I AM GOING TO RIP YOUR HEARTS OUT AND CONSUME THEM IN FRONT OF YOU!";
            if (rando=2) then diplo_text="BEGGING WILL DO YOU NO GOOD, IMPERIAL LAPDOG!";
            if (rando=3) then diplo_text="DEATH COMES FOR ALL!";
        }
    }
    if (argument0="trade_close"){
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="When the time comes for your extinction, I will carve a list of the many times you irked me into your skin. This incident will go on your "+choose("forehead","chest","throat","cheek","heart")+".";
            if (rando=2){diplo_text+="Begone then, the stench of your vaunted sanctity offends me.";force_goodbye=1;}
            if (rando=3){diplo_text+="It must be said that while you fail at almost all aspects of commanding a "+string(obj_img.player_army)+", you are extremely skilled in causing me slight irritations. Congratulations.";force_goodbye=1;}
        }
        if (rela!="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Next time you see fit to contact me, I expect you to have considered your words more carefully. Before you are required to speak them, if possible.";
            if (rando=2) then diplo_text+="You are boorish to converse with but I suppose it cannot be helped; you were trained to kill, not to talk or, indeed, to think.";
            if (rando=3) then diplo_text+="Traditionally, one makes sure one is sure of ones course of action before acting, not afterwards. Something for you to consider, no doubt.";    
        }
    }
    if (argument0="demand_refused"){
        if (faction_gender[10]=1) and (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="I spit upon your demands, loyalist dog. Beg your corpse "+string(obj_img.king_title)+" for something instead.";
            if (rando=2) then diplo_text="A child, blind to the ways of the world, may demand things from an adult but all he gets is a bloody nose.  Insolent whelp.";
            if (rando=3) then diplo_text="Your demands are much like your misguided faith in the ‘"+string(obj_img.king_title)+"'; nothing but dust before the implacable winds of "+string(obj_img.faction[11])+".";
        }
    }
    if (string_count("agree",argument0)=1){
        if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";
        if (trading_artifact!=0) then diplo_text="[[Trade Accepted.]]##";
        if (liscensing>0){
            diplo_text="[[Trade Accepted.  License(s) Transmitted.]]##";
            force_goodbye=1;
            // something else here; schedule the license and do not go to the next audience
        }
        if (rela!="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Very well, let it be so. I will give the relevant commands to my underlings and arrangements will be made.";
            if (rando=2) then diplo_text+="This is an acceptable trade, beneficial to both of us. I agree to it.";
            if (rando=3) then diplo_text+="For now, I will accept this trade. Do not assume I will always do so, however.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Sometimes a lord deigns to exchange with the meanest pauper. It does not make them equals.";
            if (rando=2) then diplo_text+="I will trade with you, little loyalist, if only to be closer to laugh at you when you fall to the inexorable machinations of the Gods.";
            if (rando=3) then diplo_text+="If only to demonstrate how meaningless your efforts are in the grand scheme of the Galaxy, I'll accept this trade.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        annoyed[diplomacy]+=1;
        if (rela="hostile"){
            rando=choose(1,2,3);force_goodbye=1;
            if (rando=1) then diplo_text+="You would offer me scraps for the keys to a kingdom? You are foolish and, worse, you are unaware of your own incompetence.";
            if (rando=2) then diplo_text+="Do not attempt exchanges with those so far above you, lapdog of the Corpse "+string(obj_img.king_title)+", it makes you look even more idiotic than you already do.";
            if (rando=3) then diplo_text+="I would spit upon this ‘offer' you bring before me but I find myself too amused by it.";
        }
        if (rela!="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="You may consider my response to be a ‘no' and assume my attitude to be whatever you like, "+string(obj_img.faction_title[1])+".";
            if (rando=2) then diplo_text+="Have a care that you do not overstep the mark, "+string(obj_img.faction_title[1])+", I see no reason to accept such a trade.";
            if (rando=3) then diplo_text+="An unreasonable trade, whatever our working relationship might be. I refuse.";
        }
        if (annoyed[diplomacy]>=10){force_goodbye=1;
            turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;
        }
    }
    if (argument0="attacked"){
        // 
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="The war already exists, you petulant fool. It has raged for 10,000 years and will outlive us both.";
            if (rando=2) then diplo_text+="And before you ‘declared war'? Did you believe that I had no intention of destroying you at that time? You delusional dog.";
            if (rando=3) then diplo_text+="Do not worry, thrall of the corpse "+string(obj_img.king_title)+", I shall grant you both death and freedom from your bonds of ‘loyalty'.";
        }
        if (rela!="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It is puzzling to me that you believe this changes anything but I see this means a lot to you so I accept your ‘declaration'.";
            if (rando=2) then diplo_text+="Little fool, you do not to understand the nature of the Galaxy. If we have time before I obliterate you, I will educate you.";
            if (rando=3) then diplo_text+="Were we not already engaged in a war 10,000 years old, your declaration might mean something.";
        }
    }
    
    if (argument0="accept_peace"){scr_chaos_alliance_test();}
    
    if (argument0="ignored"){
        // 
    }
    if (argument0="denounced"){
        if (faction_gender[10]=1){disposition[10]-=1;
            rando=choose(1,2,3,4,5,6,6,7,8,9);
         if (rando=1) then diplo_text="You are nothing.";
         if (rando=2) then diplo_text="Pathetic.";
         if (rando=3) then diplo_text="I grow weary of your ineptitude.";
         if (rando=4) then diplo_text="Judgement comes for all.";
         if (rando=5) then diplo_text="Your kind will be destroyed, in time.";
         if (rando=6) then diplo_text="["+string(faction_leader[4])+" lets out an amused, extremely confident chuckle.]";
         if (rando=7) then diplo_text="Your soul will be mine.";
         if (rando=8) then diplo_text="Do not trifle with me, worm.";
         if (rando=9){diplo_text="I have travelled the stars for millennia.  Worlds have burned at my command, countless souls damned.  The ground trembles with every step.  Now I sit here and listen to you.  Where did it all go so wrong?";force_goodbye=1;}
         if (disposition[10]<=-80){diplo_text="Your end will soon be at hand; you need not rush toward it so eagerly.";force_goodbye=1;}
        }
    }
    if (argument0="praised") and (faction_gender[10]=1){
        if (faction_justmet=0) and (disposition[10]<-75) then disposition[diplomacy]+=choose(0,0,1);
        if (faction_justmet=1){disposition[diplomacy]+=2;faction_justmet=0;}
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Save your words for one who is easily swayed by such pleasantries, you blundering oaf.";
            if (rando=2) then diplo_text+="Your words would be better served placating members of your "+string(obj_img.kingdom_title_shortest)+"'s "+string(obj_img.faction[4])+" who will, I am sure, be interested in our correspondences.";
            if (rando=3) then diplo_text+="Prattle on, fool, your words contain less meaning than the solar wind that blows across cold stars.";
        }
        if (rela!="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Whether by accident or design, you speak truth. But do not believe it changes anything about how I see you or how I will treat you.";
            if (rando=2) then diplo_text+="Were I someone who responded to the slightest praise with preferential treatment, I would not have got were I am today.";
            if (rando=3) then diplo_text+="Words will not sway me in the slightest. Only actions display worthiness.";
        }
    }
    if (argument0="offer"){
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="As much as I am loathe to besmirch my ears by listening to your words, needs must when cruel fate drives us into a corner. I have an offer for you.";
            if (rando=2) then diplo_text+="Do not presume that I come to you out of admiration or seeking friendship.  I merely wish to trade you enough rope to hang yourself with.";
            if (rando=3) then diplo_text+="Soon, you will be either dead or close enough that it makes no difference.  At this moment, however, I wish to offer you a trade.";
        }
        if (rela!="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Prove that you are more than just another ten day traitor, trade with me and further both our agendas.";
            if (rando=2) then diplo_text+="If we truly both follow the many stepped path towards the glory of "+string(obj_img.faction[11])+", you will agree to trade with me.";
            if (rando=3) then diplo_text+="Trade, if not allegiance, between the children of "+string(obj_img.faction[11])+" is essential to the furthering of our shared agenda.";
        }
    }
    if (argument0="open_trade") then diplo_text="Make your proposal.";
    if (argument0="artifact_thanks"){
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I would have torn it from your cold, dead hands in any case but this does save us some time.";
            if (rando=2) then diplo_text+="A meaningless gesture, "+string(obj_img.faction_title[1])+", but it brings us a little closer to your inevitable demise so it is appreciated.";
            if (rando=3) then diplo_text+="You have no more idea of what you're doing than a headless Grox, do you? I will consider making you end swift, when the time comes.";
        }
        if (rela!="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I shall examine this gift for any traps or flaws before rendering you any thanks.";
            if (rando=2) then diplo_text+="It will go into my vault to be stored with the many others of its type I have collected. Nevertheless, I thank you for the gesture.";
            if (rando=3) then diplo_text+="If you expect gushing thanks or rapturous praise, you will go on waiting. I am not sure how much of a favour you have done me.";            
        }
    }
    if (argument0="stc_thanks"){
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="There would have been no place you could have hidden it from me when I came to claim it, you insignificant worm.";
            if (rando=2) then diplo_text+="A petty, insignificant, pointless gesture of deference but a gesture of deference nonetheless and I will remember it when my hand is around your throat.";
            if (rando=3) then diplo_text+="I cannot fathom the path of thought that brought you to this action but it doesn't truly matter; it will be rendered meaningless with your death.";
        }
        if (rela!="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Interesting, a gift as rare as this implies that you expect something in return. I shall consider what you want and, more importantly, what I am prepared to give.";
            if (rando=2) then diplo_text+="A gift more valuable than most but still something I have come across before. I shall have it stored in my personal vaults.";
            if (rando=3) then diplo_text+="I shall keep this gift close, both as a reminder of your generosity and to remind me to watch you carefully, "+string(obj_img.faction_title[1])+".";
        }
    }
    if (argument0="trading_demand"){
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Speak, worm, lest I wipe you from existence before you manage even to beg for mercy.";
            if (rando=2) then diplo_text+="I can only hope you intend to beg for mercy and throw yourself upon my dubious mercy.  It will be quicker for all concerned.";
            if (rando=3) then diplo_text+="Words are wind, much like you will be if I don't like what I hear.";
        }
        if (rela!="hostile"){rando=choose(1,2,2,3,3,3);
            if (rando=1) then diplo_text+="Choose the words you use as carefully as your battle gear, least the former mean you need to use the latter.";
            if (rando=2) then diplo_text+="I am not a being of unlimited leisure time, "+string(obj_img.faction_title[1])+", so you will need to be swift with your words.";
            if (rando=3) then diplo_text+="Speak but do not be offended if I seem not to be paying attention; I'm probably not.";
        }
        diplo_option1="Demand Requisition";diplo_option2="Demand Military Assistance";diplo_option3="Cancel";
    }
    
    if (argument0="propose_alliance") and (obj_controller.faction_gender[10]=1){
        with(obj_temp5){instance_destroy();}
        with(obj_star){
            var i,r,yeah;i=0;r=0;yeah=0;repeat(4){i+=1;r=0;repeat(4){r+=1;if (p_problem[i,r]="meeting") or (p_problem[i,r]="meeting_trap") then yeah=r;}}
            if (yeah>0){repeat(yeah){instance_create(x,y,obj_temp5);}}
        }
        if (instance_exists(obj_temp5)){
            rando=choose(1,2);var there;there=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            if (rando=1) then diplo_text="I await your arrival on "+string(there.name)+" "+scr_roman(instance_number(obj_temp5))+", in case it has slipped your mind.";
            if (rando=2) then diplo_text="We agreed to meet upon "+string(there.name)+" "+scr_roman(instance_number(obj_temp5))+".  Do not squander this opportunity.";
        }
        if (!instance_exists(obj_temp5)) then scr_chaos_alliance_test();
        with(obj_temp5){instance_destroy();}
    }
}







if (diplomacy=2){// Imperium
    if (argument0="intro"){
        rando=choose(1,2);
        if (rando=1) then tempd="[[To see "+string(obj_img.faction_title[2])+" "+string(faction_leader[2])+" is to see what happens to heroes when their glory days have passed and the rot of ages sets in. Now a huge mass of fat and flab, he was once a mighty and respected general and the commander of a score of successful campaigns. As his reward for a glorious career, he was given commander of the sector and, as has happened to so many others, the bureaucracy crushed his warrior spirit and turned him into the man he is.]]";
        if (rando=2) then tempd="[[Loyal to allies and venomous to enemies, few figures command such opposing reputations as "+string(faction_leader[2])+". Enemies of the "+string(obj_img.kingdom_title_shortest)+" speak in hushed tones of his incredible cruelty and harsh actions against them, whereas the citizens and organizations that lay claim to the protection of the "+string(obj_img.king_title)+" loudly toast his generosity and stalwart courage. A friend to keep and an enemy to lose.]]";
        tempd+="###";
        rando=choose(1,2);
        if (rando=1) then tempd+=""+string(obj_img.faction_dudes[1])+"s in my sector are expected to conduct themselves as befits one of the "+string(obj_img.faction_dudes_formal[1])+". Do not disappoint me."; 
        if (rando=2) then tempd+="It is good that the vessels of the "+string(obj_img.king_title)+"'s wrath have arrived in this sector- to bring his justice to the xenos and the "+string_lower(obj_img.faction_dude[10])+"."; 
        diplo_text=tempd;
    }
    if (argument0="hello"){
        if (rela="friendly") then diplo_text="What can I do for the hero of "+string(obj_ini.sector_name)+"?";
        if (rela="neutral") then diplo_text="State your business, "+string(obj_img.faction_title[1])+".";
        if (rela="hostile") then diplo_text="What do you want, "+string(obj_img.faction_title[1])+"? I have little time for glorified interplanetary brigands such as yourself.";
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="Were I a less forgiving man, I might find that rude! But there is little I would not forgive you, my friend!";
        if (rela="neutral") then diplo_text="It is hardly courteous to change ones mind when a deal is about to be reached. Still, I suppose you /must/ have your reasons.";
        if (rela="hostile") then diplo_text="How very like you to back out of things. I seem to recall your vows to guard this sector from Xenos, "+string_lower(obj_img.faction_dude[10])+"s and mutants. Strange, but some still seem to be around.";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="I only wish I could assist you in this way, "+string(obj_img.faction_title[1])+", but I am afraid I cannot.";
            if (rando=2) then diplo_text="I am truly sorry, Lord, but I have to chance of fulfilling your request.";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="At this time, I'm afraid it is not possible for me to comply.";
            if (rando=2) then diplo_text="Perhaps at a later date or if you had asked earlier, but now is simply too difficult.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Do not think that you can demand everything because you are an "+string(obj_img.faction_dudes_formal[1])+". I decline.";
            if (rando=2) then diplo_text="Get thee gone, I am in no mood for your presumptions.";
        }
    }
    if (string_count("agree",argument0)=1){
        if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";
        if (trading_artifact!=0) then diplo_text="[[Trade Accepted.]]##";
        if (liscensing>0){
            diplo_text="[[Trade Accepted.  License(s) Transmitted.]]##";
            force_goodbye=1;
            // something else here; schedule the liscene and do not go to the next audience
        }
        
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Mightily agreeable, "+string(obj_img.faction_title[1])+". I will await the fruition of our arrangement.";
            if (rando=2) then diplo_text+="A sound suggestion, let it be so!";
            if (rando=3) then diplo_text+="The "+string(obj_img.king_title)+" was truly merciful when he sent you to us, "+string(obj_img.faction_title[1])+". I agree!";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="An acceptable proposition.  You will have to talk it over with my scribes.";
            if (rando=2) then diplo_text+="The Sector would benefit from such a deal.";
            if (rando=3) then diplo_text+="Indeed, let it be so, "+string(obj_img.faction_title[1])+".";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It is my only option, but I will curse you forever for forcing me into this.";
            if (rando=2) then diplo_text+="If you cross me, the wrath of the "+string(obj_img.king_title)+" will come down on your head.";
            if (rando=3) then diplo_text+="I never thought I would work with as deplorable a character as yourself, but I accept.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        annoyed[diplomacy]+=2;
        if (annoyed[diplomacy]>=10){force_goodbye=1;
            if (rela="friendly") then diplo_text+="I cannot accept this deal and the day grows late; I will not take any more of your time.";
            if (rela="neutral") then diplo_text+="I apologize, "+string(obj_img.faction_title[1])+", but I have more pressing concerns.  The "+string(obj_img.king_title)+" protects.";
            if (rela="hostile") then diplo_text+="Don't you have better things to do, "+string(obj_img.faction_dudes_formal[1])+"?";
            turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;
        }
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I apologize, but my resources must be directed in a different direction.";
            if (rando=2) then diplo_text+="It pains me to deny you but I fear I must.";
            if (rando=3) then diplo_text+="Unfortunately, I and my forces have a prior engagement.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I do not believe this will help either of us.";
            if (rando=2) then diplo_text+="Tempting... but no, I must decline.";
            if (rando=3) then diplo_text+="Perhaps circumstances will change but for now I must decline.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Are you mad? Even if you are not, I suggest you plead insanity when the "+string(obj_img.faction[4])+" comes for you. It might make your death quicker.";
            if (rando=2) then diplo_text+="Do not think me your fool whom you can ask to do whatever you wish.";
            if (rando=3) then diplo_text+="Unlike you, I do only the bidding of the "+string(obj_img.king_title)+". I do not agree.";
        }
    }
    if (argument0="attacked"){
        diplo_text="By striking at me, you strike at the entire "+string(obj_img.kingdom_title_shortest)+"! You will live to regret this.";
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;known[diplomacy]=max(2,known[diplomacy]);
        diplo_text="You have gone too far this time! Lest suspicion fall on me for simply sharing a sector with you, I have no choice but to destroy you.";
        
        with(obj_star){var p;p=0;
            repeat(4){p+=1;
                if (planets>=p){
                    if (p_owner[p]<=2) and (dispo[p]<100) and (string_count("Recru",p_feature[p])>0){
                        p_feature[p]=string_replace(p_feature[p],"Recruiting World|","");
                        scr_alert("red","blarg","Recruiting rights on "+string(name)+" "+scr_roman(p)+" revoked!",x,y);
                        scr_event_log("red","Recruiting rights on "+string(name)+" "+scr_roman(p)+" revoked!");
                        obj_controller.recruiting_worlds=string_replace(obj_controller.recruiting_worlds,string(name)+" "+scr_roman(p)+"|","");
                    }
                    if (p_owner[p]=1) and (dispo[p]<100) and (string_count("Monast",p_feature[p])=0){
                        if (p_first[p]!=1) then p_owner[p]=p_first[p];
                        else p_owner[p]=2;
                        scr_alert("red","blarg","Control of "+string(name)+" "+scr_roman(p)+" lost!",x,y);
                        scr_event_log("red","Control of "+string(name)+" "+scr_roman(p)+" lost!");
                    }
                }
            }
        }
    }
    if (argument0="accept_peace"){
        diplo_text="Perhaps I was hasty in my judgment of you. I will accept peace. For the moment...";
    }
    if (argument0="ignored"){
        diplo_text="It is customary to offer reports of your progress to your sector's commander. And your "+string_lower(obj_img.faction_title[2])+" is me and yet I see a disturbing lack of reports.";
    }
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=5;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Perhaps you could be a little less harsh in your criticisms, friend?";
            if (rando=2) then diplo_text="I shall have to reexamine myself, if such a loyal soldier says such things of me.";
            if (rando=3) then diplo_text="Might I suggest you learn the practice of thinking before speaking?";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Words are wind, "+string(obj_img.faction_dudes_formal[1])+".";
            if (rando=2) then diplo_text="If I took on board the criticisms of everyone in the sector I'd never get a damn thing done.";
            if (rando=3) then diplo_text="I care not for your insults, only for the work you do for the "+string(obj_img.king_title)+".";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Your words are as full of poison as your heart.";
            if (rando=2) then diplo_text="If you think that your words would go unnoticed, you were wrong.";
            if (rando=3) then diplo_text="The true soldiers of the "+string(obj_img.kingdom_title_shortest)+" would not speak so of their rightful commanders.";
        }
    }
    if (argument0="praised"){if (faction_justmet=1){disposition[diplomacy]+=2;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="You are too kind, friend, for it is you that the people see as their champion.";
            if (rando=2) then diplo_text="If all "+string(obj_img.faction_dudes_formal[1])+" were half as bold as you are courteous, there would be not a single foe left in the galaxy.";
            if (rando=3) then diplo_text="Few "+string(obj_img.faction_dudes[1])+"s are as kind as they are valorous.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Back up your sweet words with bold actions and perhaps you shall find a friend in me.";
            if (rando=2) then diplo_text="I thank you for the compliment but it does not alter our relation in the slightest.";
            if (rando=3) then diplo_text="A "+string_lower(obj_img.faction_dude[10])+" rarely speaks with such a kind tongue, but this is an unknowable galaxy and stranger things have happened.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="You won't sway me to your cause with poisoned honey.";
            if (rando=2) then diplo_text="A wicked man speaks wicked lies, but even a stopped chrono is right twice a day.";
            if (rando=3) then diplo_text="You approval means less to me than your enmity.";
        }
    }
    if (argument0="offer"){
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="Would a trade such as this be to your satisfaction?";
        if (rando=2) then diplo_text="I believe this trade would be beneficial to us both.";
        if (rando=3) then diplo_text="What benefits us both benefits the "+string(obj_img.kingdom_title_shortest)+". Who better for you to trade with than myself?";
    }
    if (argument0="open_trade") then diplo_text="Make your proposal, "+string(obj_img.faction_title[1])+".";
    if (argument0="artifact_thanks"){
        diplo_text="Thank you indeed, "+string(obj_img.faction_title[1])+". A relic of such magnificence... I thank you more than I can say.";
    }
    if (argument0="artifact_daemon"){
        diplo_text="Thank you indeed, "+string(obj_img.faction_title[1])+". A relic of such magnificence... I thank you.  This item is precious to me.";
    }
    if (argument0="stc_thanks"){
        rando=choose(1,2,3);
        if (rela="friendly"){
            if (rando=1) then diplo_text+="Such relics are a rare and glorious sight, "+string(obj_img.faction_title[1])+". I thank you for this boon and trust that you know my gratitude will be expressed in a manner pleasing to you.";
            if (rando=2) then diplo_text+="You honour me beyond words with this gift. I thank you, as do all under my command and all who will benefit from it.";
            if (rando=3) then diplo_text+="A mighty gift from a mighty ally, "+string(obj_img.faction_title[1])+". It will be remembered as one of the many great deeds you have done for this sector.";
        }
        if (rela="neutral"){
            if (rando=1) then diplo_text+="Do not think me ungrateful but I am a little suspicious as to what has caused this sudden largesse. Perhaps this gift is not as pure as it seems?";
            if (rando=2) then diplo_text+="Quite a gift, "+string(obj_img.faction_title[1])+". I expect that you will want repaying, even if you have not openly stated thus. We shall see...";
            if (rando=3) then diplo_text+="Were it so simple that I could just take the gift and give you thanks. In these times, there is always a price and always a reckoning.";
        }
        if (rela="hostile"){
            if (rando=1) then diplo_text+="Do you think simple gifts will make us firm friends? I think not, you villainous cur! Away with you, though I will keep this gift, if only to deprive you of it.";
            if (rando=2) then diplo_text+="When a traitor in all but name gives you a gift, one only survives by first checking it for traps and then killing the traitor. And I intend to survive.";
            if (rando=3) then diplo_text+="Your gifts mean nothing to me, even less than your words do. I will not be swayed by either and will keep my own counsel.";
        }
    }
    if (argument0="artifact_angry"){
        diplo_text="";
    }
    if (argument0="bombard_angry"){
        diplo_text="For the love of the "+string(obj_img.king_title)+", what the hell are you doing? That was an Imperial world you layed waste to!";
    }
    if (argument0="trading_demand"){
        if (rela="friendly") then diplo_text=string(obj_ini.master_name)+"?";
        if (rela="neutral") then diplo_text="What is the meaning of this?";
        if (rela="hostile") then diplo_text="Consider your next words carefully.";
        diplo_option[1]="Demand Requisition";diplo_option[2]="Demand Military Assistance";diplo_option[3]="Cancel";
    }
    if (string_count("assassination_angryish",argument0)>0){
        var ta,tb,tc;
        explode_script(argument0,"|");
        ta=string(explode[0]);tb=string(explode[1]);tc=real(explode[2]);
        
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="Several sources indicate that you have killed the Planetary Governor of "+string(tb)+" "+scr_roman(tc)+" and went on to meddle with the succession.  Such subterfuge will not be tolerated, "+string(obj_img.faction_title[1])+".";
        if (rando=2) then diplo_text="I have received word that you have killed the Planetary Governor of "+string(tb)+" "+scr_roman(tc)+" and placed a fool in power.  Your attempts to control this sector, and seemingly emulate the Ultramarines, have not gone unnoticed.  Do not think this will go unpunished.";
        if (rando=3) then diplo_text="What do you think you are doing, "+string(obj_img.faction_title[1])+"?  Killing a Planetary Governor?  Replacing them with one of your tools?  "+string(obj_img.faction_title[4])+" "+string(faction_leader[4])+" will hear of this madness.";
    }
}
// 
if (diplomacy=3){// Mechanicus
    if (argument0="intro"){
        rando=choose(1,2);
        if (rando=1) then diplo_text="[["+string(faction_leader[3])+" is a name often spoken of on the factory floor of "+string(obj_ini.sector_name)+"'s forgeworlds, though it cursed as often as it's praised. Sometimes referred to as “The Iron Whip”, "+string(faction_leader[3])+" is famed for the high level of efficiency he extracts from those working under him, if not particularly for the quality of their works.]]";
        if (rando=2) then diplo_text="[[The flesh is weak. "+string(faction_leader[3])+" believes in this part of the iron creed above all others, forcing all those under him to mirror his dedication. All meaty parts of his body have been removed, leaving only the most vital parts of his brain. His retinue display their rank by showing how little of their body remains.]]";
        diplo_text+="###";
        if (disposition[3]>30) and (disposition[3]<60) then tempd="Greetings. I wish to see you bring the light of civilization to this sector, "+string(obj_img.faction_title[1])+".";
        if (disposition[3]<=30) or (string_count("Tech-Heresy",obj_ini.strin2)>0) then tempd="You are impure, illogical and irritating. Keep your army of techno barbarians away from my territory.";
        if (disposition[3]>=60) or (string_count("Tech-Brothers",obj_ini.strin)>0) then tempd="Hail, "+string(obj_img.faction_title[1])+". Were it not a logical fallacy, I would wish you luck in your coming endeavors.";
        diplo_text+=tempd;
    }
    if (argument0="hello"){
        if (rela="friendly") then diplo_text="What can I and my forces do for you, "+string(obj_img.faction_title[1])+"?";
        if (rela="neutral") then diplo_text="I will allow you a small portion of my time for an audience, "+string(obj_img.faction_dudes_formal[1])+".";
        if (rela="hostile") then diplo_text="Time is a precious resource and I do not wish to spend much of mine on you.";
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="I trust you have recalculated how your resources can be best utilised and deemed this trade inefficient.";
        if (rela="neutral") then diplo_text="I suggest you leaner to calculate a little further into the future, "+string(obj_img.faction_dude[1])+". It will be inefficient for you to continue operating in your current fashion.";
        if (rela="hostile") then diplo_text="It would be illogical to engage in a trade with one as unreliable as you in any case.";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Were it a logical and efficient use of resources, we would gladly comply but it is not.";
            if (rando=2) then diplo_text="We express regret that we cannot currently assist you, "+string(obj_img.faction_title[1])+".";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Your request has been considered and found to be lacking in merit.";
            if (rando=2) then diplo_text="While you make an acceptable case, we decline to enter into this agreement.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="To enter into any agreement with you would be a awful error of judgement.";
            if (rando=2) then diplo_text="It would be more efficient to discharge a plasma rifle into my own chest cavity. [Simulated Mirth]";
        }
    }
    if (argument0="agree"){if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";if (trading_artifact!=0) then diplo_text="[[Trade Accepted.]]##";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Let it be so, and may the "+string(obj_img.machine_god)+" bless this venture.";
            if (rando=2) then diplo_text+="You made a wise decision in bringing this proposal to me.";
            if (rando=3) then diplo_text+="Let this agreement strengthen the bounds of our brotherhood.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Let it be so; it is immaterial in my calculations.";
            if (rando=2) then diplo_text+="I agree, though it will change little in the grand scheme of the galaxy.";
            if (rando=3) then diplo_text+="Logic dictates that I agree.  We have an accord.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It is logical to agree with you, but I dislike it.";
            if (rando=2) then diplo_text+="At least for you, it is lucky that I have little choice.";
            if (rando=3) then diplo_text+="Probability suggests this endeavor will fail, but I agree.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I cannot allow favoritism to affect my calculations.  I decline.";
            if (rando=2) then diplo_text+="Our friendship means fractionally less to me than this bargain. I decline.";
            if (rando=3) then diplo_text="I have calculated the likely benefits weighed against the risks, and find this venture unsatisfactory.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I have calculated the likely benefits weighed against the risks, and find this venture unsatisfactory.";
            if (rando=2) then diplo_text+="My answer is no, for it is the only logical route.";
            if (rando=3) then diplo_text+="I do not think so, though you may find others who are more willing.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="A ludicrous proposal, illogical and dangerous. Take it somewhere else.";
            if (rando=2) then diplo_text+="Do you suppose me to be mad? Do you judge me by your own standard? No.";
            if (rando=3) then diplo_text+="It would be illogical and "+string_lower(obj_img.faction_dude[10])+"al. Extrapolate your answer from that.";
        }
    }
    if (argument0="attacked"){
        if (rela!="friendly") then diplo_text="Your "+string_lower(obj_img.faction_dude[10])+" blasphemy shall not go unpunished.  The Adeptus Mechanicus will destroy without exception all that is your "+string(obj_img.player_army)+".";
        if (rela="friendly") then diplo_text="You have forsaken the "+string(obj_img.machine_god_formal)+"'s generosity; now you shall face judgment.";
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;known[diplomacy]=max(2,known[diplomacy]);
        diplo_text="++ CORPUS FINIS+MACHINA MAGNUS+SANCTUS METALLUM+POTESTAS "+string_upper(obj_img.machine_god_formal)+"+"+string_upper(obj_img.machine_god_formal)+" VULT+DEATH TO THE ENEMIES OF THE "+string_upper(obj_img.machine_god)+" ++";
    }
    if (argument0="accept_peace"){
        diplo_text="We have calculated the price of your destruction and found it excessive.";
    }
    if (argument0="ignored"){
        diplo_text="What cause do you have, to listen to reason and logic once more?";
    }
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=5;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Look to your weapons, your armor, and your ships, "+string(obj_img.faction_title[1])+", and reconsider the logic of your statement.";
            if (rando=2) then diplo_text="It is illogical and unwise to turn aside the "+string(obj_img.faction[3])+"' auspices.";
            if (rando=3) then diplo_text="To speak against us is to speak against the "+string(obj_img.machine_god)+".";
        }
        if (rela!="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="The smallest mind strives to comprehend its limits.";
            if (rando=2) then diplo_text="Your words are illogical and meaningless.";
            if (rando=3) then diplo_text="Do not waste my time with incongruous statements.";
        }
    }
    if (argument0="praised"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Do not be fictitious, "+string(obj_img.faction_title[1])+".  What is it you covet?";
            if (rando=2) then diplo_text="I am unable to be swayed by ingratiating words; the truth of your statement is clear to all.";
        }
        if (rela!="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="I have better things to do than listen to your praise.";
            if (rando=2) then diplo_text="Words such as these have no place in my calculations.";
            if (rando=3) then diplo_text="Do not waste my time.";
        }
    }
    if (argument0="offer"){
        rando=choose(1,2,3,4);
        if (rando=1) then diplo_text="The "+string(obj_img.faction[3])+" offers you this.";
        if (rando=2) then diplo_text="A logical transaction.  What is your answer, "+string(obj_img.faction_title[1])+"?";
        if (rando=3) then diplo_text="You lack resources; the "+string(obj_img.faction[3])+" has much at its disposal.";
        if (rando=4) then diplo_text="Calculations reveal that we shall mutually benefit from this transaction.";
    }
    if (argument0="open_trade") then diplo_text="...";
    if (argument0="artifact"){
        if (rela!="hostile"){
            diplo_option[1]="Propose a trade for the Artifact.";diplo_option[2]="Leave it be; Exit.";
            diplo_text="The "+string(obj_img.faction[3])+" is aware of the Artifact.  Do not concern yourself with that which is rightly within our territory.";
        }
        if (rela="hostile"){
            force_goodbye=1;diplo_text="This Artifact rightly belongs to the "+string(obj_img.faction[3])+".  Keep your techno barbarians out of our territory and we shall not be forced to act.";
        }
    }
    if (argument0="artifact_thanks"){
        diplo_text="We thank you for your help in retrieving this artifact, though we would doubtless have located it eventually.";
    }
    if (argument0="artifact_angry"){
        diplo_text="The "+string(obj_img.faction_short[3])+" does not forgive theft and the "+string(obj_img.faction_short[3])+" does not forgive. We will avenge this. We will return and make you pay.";
    }
    if (argument0="stc_thanks"){
        var rando;rando=choose(1,2,3,4,5,6);
        if (rela="friendly"){
            if (rando=1) then diplo_text="I had every confidence that engaging in a mutually beneficial relationship with you would prove a wise move. I had, in non-logical parlance, a 'hunch'.";
            if (rando=2) then diplo_text="It was the most beneficial action that you could take to inform the "+string(obj_img.faction_short[3])+" of this fragment. I calculated you would take it if ever the opportunity was presented to you.";
            if (rando=3) then diplo_text="Your cooperation in this matter will not go unappreciated, nor will the servants of the "+string(obj_img.machine_god_formal)+" forget your name.";
            if (rando=4) then diplo_text+="Honoured ally, you have performed your function with incredible efficiency.";
            if (rando=5) then diplo_text+="+++ Divinitatae Imperator, Dies Optimus Semper +++";
            if (rando=6) then diplo_text+="A most auspicious gift, "+string(obj_img.faction_title[1])+", which will not be forgotten.";
        }
        if (rela="neutral"){
            if (rando=1) then diplo_text="We are pleased with your contribution, "+string(obj_img.faction_dudes_formal[1])+". An explorator has been dispatched to receive what is ours- you would do well to ensure the STC sanctity remains intact.";
            if (rando=2) then diplo_text="It is pleasing that you made the logical choice in this matter.  Our evaluation of you will be adjusted accordingly.";
            if (rando=3) then diplo_text="You have acted in the interests of the "+string(obj_img.kingdom_title_shortest)+", giving to us what we can utilize for humanity, now trust our judgment to do the same for you.";
            if (rando=4) then diplo_text+="This gift is valuable. Your status in relation to the "+string(obj_img.faction_short[3])+" will be reappraised and reassigned.";
            if (rando=5) then diplo_text+="The origin, purpose, authenticity and quality of this gift will be evaluated before you receive any thanks.";
            if (rando=6) then diplo_text+="Gratitude is an illogical emotion, do not expect any. Instead, accept that "+string(obj_img.faction_short[3])+" will continue to act as is dictated by logic and the "+string(obj_img.machine_god_formal)+".";
        }
        if (rela="hostile"){
            if (rando=1) then diplo_text="Your actions simply prove that you are afraid that the hands of the "+string(obj_img.machine_god_formal)+" are coming for you. Deus Vult.";
            if (rando=2) then diplo_text="We thank you for the fragment but it has not caused us to forgive or to forget. In the eyes of the "+string(obj_img.machine_god_formal)+", you have been seen to be unworthy.";
            if (rando=3) then diplo_text="While you have acted like a loyal servant in this case, it does not erase the records of your trespasses.";
            if (rando=4) then diplo_text+="Query; where did you attain such a technological marvel? Hypothesis; from the lords of "+string(obj_img.faction[11])+". Conclusion; You are an enemy.";
            if (rando=5) then diplo_text+="The servants of the "+string(obj_img.machine_god_formal)+" cannot be bought with trinkets, no matter how valuable, "+string(obj_img.faction_title[1])+".";
            if (rando=6) then diplo_text+="Your clumsy attempt to curry favour with us has been seen through and will be recorded as yet another flaw in your character.";
        }
    }
    if (argument0="bombard_angry"){
        diplo_text="When you strike at us, you strike the guns from the hands of the soldiers of the God "+string(obj_img.king_title)+". This is unacceptable and you have not heard the last of this.";
    }
    if (argument0="trading_demand"){
        if (rela="friendly") then diplo_text="Speak, "+string(obj_img.faction_title[1])+".";
        if (rela="neutral") then diplo_text="I am awaiting your query.";
        if (rela="hostile"){
            var randoo;randoo=floor(random(100))+1;
            if (randoo=1) then diplo_text="Calculations reveal that depending on your query we may have to beat your ass.";
            if (randoo!=1) then diplo_text="Certain queries may have to be answered by action.";
        }
        diplo_option[1]="Demand Requisition";diplo_option[2]="Cancel";
    }
}
// 
if (diplomacy=4){// Inquisition
    if (argument0="intro"){
        rando=choose(1,1,2);
        if (rando=1) then tempd="[[An ancient and well respected "+string(obj_img.faction_title[4])+", "+string(faction_leader[4])+" has purged heresy and exterminated mutants for well over four centuries. His steely gaze and iron will have broken as many "+string_lower(obj_img.faction_dude[10])+"s as have the tools of persuasion wielded by his retinue. Were he to die, the Ordo "+choose("Malleus","Xenos",string_lower(obj_img.faction_dude[10])+"us")+" would dearly miss his services.]]";
        if (rando=2) then tempd="[[A thousand "+string_lower(obj_img.faction_dude[10])+"s have cursed the name of "+string(faction_leader[4])+" with their last breath but he is still not satisfied. Remorse is as alien to him as pity and he will stop at nothing to destroy the enemies of purity.]]";
        tempd+="###";
        if (rela="friendly") then tempd+="Ave Imperator, "+string(obj_img.faction_title[1])+". You show great promise and I look forward to seeing you bring the light of the "+string(obj_img.king_title)+" to "+string(obj_ini.sector_name)+".";
        if (rela="neutral") then tempd+="Greetings, "+string(obj_img.faction_dude[1])+". Serve the "+string(obj_img.king_title)+" in body and soul and you shall have nothing to fear from the "+string(obj_img.faction[4])+".";
        if (rela="hostile") then tempd+="I hear worrying rumors about your conduct, "+string(obj_img.faction_dudes_formal[1])+". I have no doubt we will meet again soon.";
        diplo_text=tempd;
    }
    if (argument0="hello"){
        if (rela="friendly") then diplo_text+="Hail, hero of "+string(obj_ini.sector_name)+".  How may I assist you this day?";
        if (rela="neutral") then diplo_text+="Praise be to the "+string(obj_img.king_title)+".  What is your business here?";
        if (rela="hostile") then diplo_text+="State your business, for many "+string_lower(obj_img.faction_dude[10])+"s pray the "+string(obj_img.king_title)+"'s mercy.";
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="There are few people I would allow to back out of a deal in such a way, "+string(obj_img.faction_title[1])+".  Think of this as a symbol of my friendship.";
        if (rela="neutral") then diplo_text="I have work to do "+string(obj_img.faction_dude[1])+", much of it implements of torture and stubborn "+string_lower(obj_img.faction_dude[10])+"s, please make sure you are ready to commit to a deal when you interrupt my labours next time.";
        if (rela="hostile") then diplo_text="Do not delude yourself in thinking I was truly going to trade with you. Much of my interest was a ruse.";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Only a true friend would be given such a courteous message as this; the "+string(obj_img.faction[4])+" does not agree and does not take kindly to such requests.";
            if (rando=2) then diplo_text="I don't believe I will accept this request, "+string(obj_img.faction_title[1])+", but do not let it dishearten you.";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Do not attempt to sway the mind of an "+string(obj_img.faction_dude_formal[4])+", "+string(obj_img.faction_title[1])+", it cannot be done.";
            if (rando=2) then diplo_text="While your request is not without merit, I think not.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Idleness and greed are the signs of a "+string_lower(obj_img.faction_dude[10])+", "+string(obj_img.faction_title[1])+".";
            if (rando=2) then diplo_text="Do not presume, "+string(obj_img.faction_title[1])+", for you too will be judged by the "+string(obj_img.faction[4])+".";
        }
    }
    if (string_count("agree",argument0)>0){if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";if (trading_artifact!=0) or (liscensing>0) then diplo_text="[[Trade Accepted.]]##";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="An interesting proposal.  I look forward to the fruition of this deal.";
            if (rando=2) then diplo_text+="Agreed, may the "+string(obj_img.king_title)+" bless us both.";
            if (rando=3) then diplo_text+="Exactly what I wished for; this will benefit us both.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Then we are in agreement.";
            if (rando=2) then diplo_text+="Let it be so then and may it benefit us both.";
            if (rando=3) then diplo_text+="This arrangement will be mutually beneficial.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It goes against my instincts, but you have a deal.";
            if (rando=2) then diplo_text+="I believe we shall both come to regret this, but I agree.";
            if (rando=3) then diplo_text+="Try and play me for a fool and you will be destroyed, but I agree.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";annoyed[diplomacy]+=2;
        if (rela="friendly") and (annoyed[diplomacy]>=8){diplo_text+="I cannot help you at this time and advise that you cease pressing the matter.";force_goodbye=1;
        turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;}
        
        if (rela="neutral") and (annoyed[diplomacy]>=6){diplo_text+="You are testing my patience, "+string(obj_img.faction_dudes_formal[1])+".";force_goodbye=1;disposition[diplomacy]-=2;
        turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;}    
    
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I apologize but my resources must be directed in a different direction.";
            if (rando=2) then diplo_text+="It pains me to deny you but I fear I must.";
            if (rando=3) then diplo_text+="Unfortunately, I and my forces have a prior engagement.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I do not believe this will help either of us.";
            if (rando=2) then diplo_text+="Tempting... but no, I must decline.";
            if (rando=3) then diplo_text+="Perhaps circumstances will change but for now I must decline.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);disposition[diplomacy]-=2;force_goodbye=1;turns_ignored[diplomacy]=max(turns_ignored[diplomacy],3);
            if (rando=1) then diplo_text+="Not even when the gates of the "+string_lower(obj_img.magic_world)+" have closed, "+string_lower(obj_img.faction_dude[10])+"!";
            if (rando=2) then diplo_text+="Heresy leaks from your every word. I would rather burn than agree.";
            if (rando=3) then diplo_text+="You have either mistaken me for a fool or wish to offend me. Look to your sins, "+string_lower(obj_img.faction_dude[10])+".";
        }
    }
    if (argument0="attacked"){
        diplo_text="You shall pay dearly for this, as shall your entire "+string(obj_img.player_army)+". So swears "+string(faction_leader[4])+"!";
    }
    if (argument0="declare_war") and (sorc=false){force_goodbye=1;turns_ignored[diplomacy]+=4;
        diplo_text="You have stepped far beyond the acceptable conduct for an "+string(obj_img.faction_dudes_formal[1])+".  Look to your sins and prepare to face the "+string(obj_img.king_title)+"'s judgment.";
    }
    if (argument0="accept_peace"){
        diplo_text="For now, your judgement shall be postponed. Thank the "+string(obj_img.king_title)+" for your respite, or perhaps whatever dark gods you now worship would be more appropriate.";
    }
    if (argument0="ignored"){
        diplo_text="Idleness breeds heresy, marine, and I hear that you have been greatly idle of late.";
    }
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=15;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);disposition[diplomacy]-=choose(0,1);
            if (rando=1) then diplo_text="Words are wind and mean nothing between two servants of the "+string(obj_img.king_title)+"'s eternal glory.";
            if (rando=2) then diplo_text="Your deeds speak far louder than the words that issue from your mouth, and they speak of heroism and loyalty.";
            if (rando=3) then diplo_text="An ego is nothing more than a tool for the darkness to use against a servant of the "+string(obj_img.king_title)+". Say what you will of me.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);disposition[diplomacy]-=2;force_goodbye=1;
            if (rando=1) then diplo_text="I cannot agree with what you have said, but perhaps you have your reasons. I hope they are good ones.";
            if (rando=2) then diplo_text="I will remember what you said today and you will be held accountable.";
            if (rando=3) then diplo_text="In the future, I ask that you consider what you are saying before you say it.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);disposition[diplomacy]-=4;force_goodbye=1;
            if (rando=1) then diplo_text="You dare besmirch the honour of the "+string(obj_img.faction[4])+"!? You have crossed a line this day!";
            if (rando=2) then diplo_text="The mouths of "+string_lower(obj_img.faction_dude[10])+"s are ever full of lies and filth.";
            if (rando=3) then diplo_text="When you stand before the "+string(obj_img.king_title)+" in death, He will remind you of what you said today.";
        }
    }
    if (argument0="praised"){if (faction_justmet=1){disposition[diplomacy]+=2;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="You flatter me, but it would be churlish to deny the truth in your words.";
            if (rando=2) then diplo_text="You speak only the truth, noble "+string(obj_img.faction_dudes_formal[1])+", as is befitting of one of the "+string(obj_img.king_title)+"'s sons.";
            if (rando=3) then diplo_text="Thanks are owed for your kind words and I cannot deny they are accurate.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="I will remember those words, but they will not stay my blade if your actions call for it to fall.";
            if (rando=2) then diplo_text="If only I could believe your actions were as pure as your words.";
            if (rando=3) then diplo_text="I thank you for the compliment but it will not turn my course.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);disposition[diplomacy]-=1;force_goodbye=1;
            if (rando=1) then diplo_text="If you think kissing my boots will make me overlook your crimes you are sorely mistaken.";
            if (rando=2) then diplo_text="For a true servant of mankind's "+string(obj_img.king_title)+", compliments mean nothing. Only vindication in serving him brings us satisfaction.";
            if (rando=3) then diplo_text="Take your liar's, "+string_lower(obj_img.faction_dude[10])+" tongue elsewhere, lest I cut it out and roast it on an open fire.";
        }
    }
    if (argument0="offer"){
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="I believe we would both benefit greatly from an exchange.";
        if (rando=2) then diplo_text="A trade of goods and services would be most useful at this time.";
        if (rando=3) then diplo_text="Do you wish to trade with me for some of the resources in my possession?";
    }
    if (argument0="open_trade") then diplo_text="Make me an offer and I shall consider it, both for its value and its potential heresy.";
    if (argument0="artifact"){
        diplo_option[1]="Propose a trade for the Artifact.";diplo_option[2]="Leave it be; Exit.";
        diplo_text="The "+string(obj_img.faction[4])+" is, of course, aware of the artifact in question. What, precisely, are you offering for it?";
    }
    if (argument0="artifact_thanks"){
        diplo_text="You have earned the gratitude of the "+string(obj_img.faction[4])+", my friend, and you shall be rewarded. This artifact will serve as a reminder of my debt to you.";
    }
    if (argument0="stc_thanks"){
        rando=choose(1,2,3);
        if (rela="friendly"){
            if (rando=1) then diplo_text+="A treasured relic of the "+string(obj_img.kingdom_title_shortest)+"’s glorious past? You do us great honour, "+string(obj_img.faction_title[1])+".";
            if (rando=2) then diplo_text+="As wise as you are fearsome, you choose to place this sacred relic in the care of the "+string(obj_img.faction[4])+". We thank you.";
            if (rando=3) then diplo_text+="Your decision shows you to be a skilful leader, "+string(obj_img.faction_title[1])+", for only the "+string(obj_img.faction[4])+" can be trusted with such a hallowed relic.";
        }
        if (rela="neutral"){
            if (rando=1) then diplo_text+="It is just that you choose to entrusts such a precious relic to the "+string(obj_img.faction[4])+", mankind’s most stalwart defenders in this dark age.";
            if (rando=2) then diplo_text+="Such artifacts may provide a return to the Golden age of Mankind and the "+string(obj_img.faction[4])+" are the best candidates to guide us there. Wise decision, "+string(obj_img.faction_dude[1])+".";
            if (rando=3) then diplo_text+="While you smite the "+string(obj_img.faction_dude[10])+" and the Xenos, the "+string(obj_img.faction[4])+" will will bring light to the sector with this artifact.";
        }
        if (rela="hostile"){
            if (rando=1) then diplo_text+="You think that the "+string(obj_img.faction[4])+" forgive slights simply because you hand us gifts? You are wrong, we take it to remove it from your "+string_lower(obj_img.faction_dude[10])+"al grasp.";
            if (rando=2) then diplo_text+="And where did you acquire such an artefact? From your "+string_lower(obj_img.demon_formal)+"ical accomplices? This device bares careful consideration.";
            if (rando=3) then diplo_text+="A relic owned by a being such as you cannot be taken at face value, much like the honeyed words of a serpent. We are watching you, "+string(obj_img.faction_dudes_formal[1])+".";
        }
    }
    if (argument0="artifact_daemon"){
        if (rela="friendly") then diplo_text="There are few "+string(obj_img.faction_dudes_formal[1])+" who have the wisdom and the humility to recognise when their own abilities are not suited to the task in hand. You are one Marine in a thousand, my friend. The "+string(obj_img.faction[4])+" shall not forget your humble service to the "+string(obj_img.king_title)+".";
        if (rela="neutral") then diplo_text="The "+string(obj_img.faction[4])+" will guard this artifact well, I swear it. Only when it has been assured that the foul "+string_lower(obj_img.demon_formal)+" contained within has no chance of escape will it be used against the "+string(obj_img.king_title)+"'s enemies. Well done, "+string(obj_img.faction_dudes_formal[1])+", you have done the right thing.";
        if (rela="hostile") then diplo_text="Only the truest, most noble and most incorruptible servants of the "+string(obj_img.king_title)+" can be trusted with such an artifact. None but the "+string(obj_img.faction[4])+" have the immutable will to wield such things. Despite the mistakes you have made in the past, it is good that you have recognised our superiority. Perhaps there is hope for you still, but I doubt it.";
    }
    if (argument0="artifact_returned"){scr_quest(3,"artifact_return",4,0);
        diplo_text="It is well that you have returned the artifact, late though it may be.";
        if (rela="friendly") then diplo_text+="  Do not let this happen again.";
        if (rela!="friendly") then diplo_text+="  Our faith was still poorly placed- if you fail another task there will be dire consequences for your "+string(obj_img.player_army)+".  Is this understood?";
    }
    if (argument0="artifact_angry"){
        diplo_text="No man, no woman, no marine, no "+string_lower(obj_img.faction_dude[10])+" and no piece of xenos scum steals from the "+string(obj_img.faction[4])+" and escapes unmarked. There will be a reckoning.";
    }
    if (argument0="gene_trade"){
        if (rela="friendly"){rando=choose(1,2,3);
            if (rando=1) then diplo_text=string(obj_img.faction_title[1])+", even a hero of the "+string(obj_img.kingdom_title_shortest)+" like yourself must abide by the rules of the great "+string(obj_img.codex)+". Please desist in the trading of "+string(obj_img.organics)+" immediately.";
            if (rando=2) then diplo_text="As loathe as I am to reprimand you, I must demand that you cease trading away the genetic material of your "+string(obj_img.player_army)+".";
            if (rando=3) then diplo_text="Normally, I would leave the running of your "+string(obj_img.player_army)+" in your very capable hands. But the trading of your "+string(obj_img.organics)+" must stop and I will not be moved on this.";
        }
        if (rela="neutral"){rando=choose(1,2,3);
            if (rando=1) then diplo_text="Even "+string(obj_img.faction_dudes_formal[1])+" are held to the rule of Law. And those laws decree that "+string(obj_img.organics)+" is to remain within the "+string(obj_img.player_army)+" of its origin.";
            if (rando=2) then diplo_text="No matter what was offered, a true "+string(obj_img.faction_dudes_formal[1])+" does not barter away what is both their birthright and their future.  The trading of your "+string(obj_img.organics)+" must stop.";
            if (rando=3) then diplo_text="The "+string(obj_img.kingdom_title_shortest)+" allows "+string(obj_img.faction_title[1])+"s free hands in most of their dealings, but on the trading of "+string(obj_img.organics)+" we must shackle you, firmly and completely.";
        }
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text="You look like a "+string_lower(obj_img.faction_dude[10])+", sound like a "+string_lower(obj_img.faction_dude[10])+" and act like a "+string_lower(obj_img.faction_dude[10])+", for only a "+string_lower(obj_img.faction_dude[10])+" would place such little store on their own "+string(obj_img.organics)+". Prove I am mistaken or there will be dire consequences.";
            if (rando=2) then diplo_text="By Holy Terra, I need but one more reason to wipe the stain of your existence from the universe and if you do not cease trading in Genetic material, I will have it.";
            if (rando=3) then diplo_text="When you choose to act outside the rule of Law and trade in forbidden substances, the "+string(obj_img.faction[4])+" will either bring you back to the Law or bring the Law to you.";
        }
        gene_sold=0;
        // diplo_text="[Missing Dialogue: gene_angry]";
    }
    if (argument0="gene_xeno"){
        rando=choose(1,2,3);// diplo_text="[Missing Dialogue: gene_xeno]";
        if (rando=1) then diplo_text="You risk the sanctitude of the "+string(obj_img.king_title)+"'s holy sons, the Adeptus "+string(obj_img.faction_dudes_formal[1])+", and for what? Some paltry material reward? You will reap the seeds you have sown, traitor.";
        if (rando=2) then diplo_text="No matter your past deeds, you are now an enemy of the "+string(obj_img.kingdom_title_shortest)+". Only an enemy would give away our most valued secret, the base of the "+string(obj_img.faction_dudes_formal[1])+" themselves.";
        if (rando=3) then diplo_text="You have handed away the root of the "+string(obj_img.kingdom_title_shortest)+"'s most powerful warriors to foul xenos. Did you truly believe a crime of this magnitude would escape the eye of the "+string(obj_img.kingdom_title_shortest)+"?";
        faction_status[diplomacy]="War";var lol;lol="";
        lol=string(obj_controller.faction_title[diplomacy])+" "+string(obj_controller.faction_leader[diplomacy])+" declares war on the "+string(global.chapter_name)+".";
        scr_event_log("red",lol);force_goodbye=1;gene_xeno=0;
    }
    if (argument0="trading_demand"){
        if (rela="friendly") then diplo_text="Remember whom you speak to, "+string(obj_img.faction_title[1])+".";
        if (rela="neutral") then diplo_text="I, "+string(obj_img.faction_title[4])+" "+string(faction_leader[4])+", on behalf of the "+string(obj_img.faction[4])+", am awaiting your words.";
        if (rela="hostile") then diplo_text="Speak your next words very carefully, "+string(obj_img.faction_dudes_formal[1])+", for they may be your last.";
        diplo_option[1]="Demand Requisition";diplo_option[2]="Skip Inspection";diplo_option[3]="Cancel";
        if (inspection_passes>0) then diplo_option[2]="Skip Inspection ("+string(inspection_passes)+" pass)";
    }
    if (argument0="penitent_end"){
        rando=choose(1,2);
        if (rando=1) then diplo_text="It seems that congratulations are in order. While some might think the "+string(obj_img.faction[4])+" blind to the possibility that it, that is to say we, could ever do wrong, it is not so. I know that we are as fallible as any man, save the "+string(obj_img.king_title)+", and can make mistakes when judging character. I took you for a traitor to humanity's cause. I see that I was wrong now and let it not be said I will not give credit where it is due; well done, "+string(obj_img.faction_title[1])+". May the enemies of mankind speak your name in fear and humanity in adoration.";
        if (rando=2) then diplo_text="Few return from a penitent crusade, "+string(obj_img.faction_title[1])+", and I find that those who do are invariably changed by the experience. Tell me, do you feel your vision expanded? Your faults exposed and then erased by his glorious light? I do not doubt that you do. To battle the "+string(obj_img.king_title)+"'s enemies without any thought of pause or relief is the highest form of honour, the highest form of service. You are to be congratulated on your diligence and dedication, not to mention your skill at arms.";
    }
    if (string_count("assassination_angry",argument0)>0){
        // aa|planet_name|planet number|
        var ta,tb,tc;
        explode_script(argument0,"|");
        ta=string(explode[0]);tb=string(explode[1]);tc=real(explode[2]);
        obj_controller.temp[1008]=string(tb)+"|"+string(tc)+"|";
        
        diplo_text="My patience is wearing thin, "+string(obj_img.faction_title[1])+".  I have many more problems more urgent and, yet, you continue to force me away from the work assigned to me by He on Terra.  Your serf on "+string(tb)+" "+scr_roman(tc)+" will be executed along with all the other puppets I ferret out.  You are close to treason, "+string(obj_img.faction_title[1])+".  Choose your next words with exceptional care for they may be your last.";
        
        diplo_option[1]="It will not happen again";
        diplo_option[2]="Very well";
        diplo_option[3]="You will not.  "+string(tb)+" is MINE!";
    }
    if (argument0="you_better"){
        rando=choose(1,2);
        if (rando=1) then diplo_text="I do not know if you are guided by choice or incompetence, "+string(obj_img.faction_title[1])+", however you are not the only player in this most dangerous game you insist upon pursuing.  There is no more room for failure.";
        if (rando=2) then diplo_text="Ensure this is your last mistake, "+string(obj_img.faction_title[1])+".  You and your ivory tower you think stand so tall above man is not indestructible.";
        
    }
    if (argument0="die_heretic"){
        rando=choose(1,1,2);
        
        if (rando=1) then diplo_text="Very well, "+string(obj_img.faction_title[1])+".  I will bury you and your "+string(obj_img.player_army)+" so thoroughly even I will forget your existence.";
        if (rando=2){
            if (obj_ini.fleet_type=1) then diplo_text="I understand.  I am authorizing the deployment of cyclonic torpedoes.  Make peace with your homeworld, "+string(obj_img.faction_title[1])+".";
            if (obj_ini.fleet_type!=1) then diplo_text="I am mobilizing the Segmentum battlefleet.  You may run, "+string_lower(obj_img.faction_dude[10])+", but it will do you no good.";
        }
        
        var who,ev,v;v=0;ev=0;repeat(99){v+=1;if (ev=0) and (event[v]="") then ev=v;}
        event[ev]="game_over_man";event_duration[ev]=1;
    }
    
    
    if (argument0="chaos_audience1"){
        rando=choose(1,2,3);force_goodbye=1;
        if (rando=1) then diplo_text="I have been notified of your corrospondences with "+string(faction_leader[10])+".  There is no reason for you to talk to such a villain, your only interactions should be both short lived and extremely violent.";
        if (rando=2) then diplo_text="Whatever your reasons for seeking an audience with traitors, they can not be sufficient and I trust you will not repeat your mistake.";
        if (rando=3) then diplo_text="The words of those who have turned from His light are not worth risking the sanctity of your soul to listen to.";
    }
    if (argument0="chaos_audience2"){
        rando=choose(1,2,3);force_goodbye=1;
        if (rando=1) then diplo_text="If you give aid to or converse with a "+string_lower(obj_img.faction_dude[10])+" or a traitor, you're either a "+string_lower(obj_img.faction_dude[10])+" or a traitor. Either way, consider yourself under close scrutiny, "+string(obj_img.faction_title[1])+".";
        if (rando=2) then diplo_text="The only people who have any desire to hear the poison that spews from the lips of "+string_lower(obj_img.faction_dude[10])+"s are other "+string_lower(obj_img.faction_dude[10])+"s. You have been warned.";
        if (rando=3) then diplo_text="I can only conclude that you have no conception of how despicable your actions are because you have lost all feeling for how "+string_lower(obj_img.faction_dude[10])+"al it is to converse with a "+string_lower(obj_img.faction_dude[10])+".";
    }
    
    
    if (argument0="sorcery1"){
        rando=choose(1,2,3);force_goodbye=1;
        if (rando=1) then diplo_text="It pains me to see an "+string(obj_img.faction_dudes_formal[1])+" debase his "+string(obj_img.player_army)+" by using the tools of a "+string_lower(obj_img.faction_dude[10])+", especially when you have access to sanctioned "+string_lower(obj_img.magic_men)+" powers.  Ensure that it does not happen again.";
        if (rando=2) then diplo_text="The use of magik and sorcery in place of those powers deemed acceptable by the "+string(obj_img.kingdom_title_shortest)+" is simply not acceptable, "+string(obj_img.faction_title[1])+".  You have been warned.";
        if (rando=3) then diplo_text="Please desist from wielding the same weapons as "+string_lower(obj_img.faction_dudes[10])+"s, traitors and "+string(obj_img.faction[11])+" filth, lest you become one of them.";
    }
    if (argument0="sorcery2") or (sorc=true){
        rando=choose(1,1,2,2,2,3,3,3);force_goodbye=1;turns_ignored[diplomacy]+=4;
        if (rando=1) then diplo_text="Did you not think that the "+string(obj_img.faction[4])+" might notice the use of sorcerous and "+string_lower(obj_img.faction_dude[10])+"al powers? You are either foolish beyond belief or wish for your own destruction.";
        if (rando=2) then diplo_text="To wield such "+string_lower(obj_img.faction_dude[10])+"al powers in the face of an "+string(obj_img.faction[4])+" inspection speaks of a traitorous streak so deep it can only be purged with fire.";
        if (rando=3) then diplo_text="You wield the weapons of a traitor, probably gifted to you by a daemonic ally, and you will be dealt with as a traitor; you will be purged.";
    }
    
    
    
    if (argument0="loyalty_zero"){
        disposition[2]-=20;disposition[3]-=15;disposition[4]-=20;disposition[5]-=20;
        diplo_text="Your arrogant, blatant disregard for proper Imperial conduct can no longer go unanswered, /"+string(obj_img.faction_dudes_formal[1])+"/.  Time and time again you have ignored the "+string(obj_img.kingdom_title_shortest)+"'s call to arms, refusing to strike out at the enemies of man when it was most needed, and callously ignored the "+string(obj_img.faction[4])+"'s wants.  It has become clear that you are not in line with the High Lords of Terra and His will.  This heresy must be cut from your "+string(obj_img.player_army)+" like the festering blight it is.  You may either atone for your "+string(obj_img.player_army)+"'s crimes, in penitence, or see it ground to dust around you.";
        // Speak your next words carefully, obj_img.faction_title[1], for they may damn all the souls of your men to oblivion.
        
        diplo_option[1]="You are right in that we must account for our sins.  Let our Penitence begin.";diplo_goto[1]="loyalty_penitence";
        diplo_option[2]="I answer only to the "+string(obj_img.king_title)+" himself, not to the likes of you.";diplo_goto[2]="die_heretic";
        diplo_option[3]="Threaten my "+string(obj_img.player_army)+" at your own peril.";diplo_goto[3]="die_heretic";
    }
    if (argument0="loyalty_penitence"){
        diplo_text="[Missing text]";
        
        var tx;tx="The "+string(global.chapter_name)+" become Penitent.";
        scr_alert("green","halp",string(tx),0,0);scr_event_log("",string(tx));
        
        var str;str=round((marines+command)/130);
        obj_ini.penitent=1;obj_ini.penitent_current=0;
        obj_ini.penitent_max=(str*1000)+300;obj_ini.penitent_end=str*48;
        obj_controller.penitent=1;obj_controller.penitent_current=0;
        obj_controller.penitent_max=obj_ini.penitent_max;
        obj_controller.penitent_end=obj_ini.penitent_end;
        
        loyalty=50;loyalty_hidden=50;force_goodbye=1;
    }
}
// 
if (diplomacy=5){// Ecclesiarchy
    if (argument0="intro"){
        rando=choose(1,2);
        if (rando=1) then tempd="[[Old and experienced, this "+string(obj_img.faction_title[5])+" of the "+string(obj_img.faction_dudes[5])+" is not a woman to be trifled with.  Clad in an elaborate set of full power armor and with her face sporting several scars, "+string(faction_leader[5])+" exudes battlefield experience.]]";
        if (rando=2) then tempd="[[The "+string(obj_img.faction[5])+" have assigned one of their militant arm to their dealings with you- "+string(obj_img.faction_title[5])+" "+string(faction_leader[5])+".  The woman wears a set of well-used powered armor that has seen many battles, if its charred exterior is to be believed.  Incense burners hang from chains on her belt and waft smoke around her body.]]";
        tempd+="###";
        rando=choose(1,1,2,2,2);
        if (rando=1) then tempd+="Hail, "+string(obj_img.faction_title[1])+"!  As a son of the "+string(obj_img.king_title)+", you will no doubt take great joy in bringing his light to this benighted sector.  I look forward to watching "+string_lower(obj_img.faction_dudes[10])+" fall before your armies."; 
        if (rando=2) then tempd+="And the "+string(obj_img.king_title)+" spoke; “You shall know my servants by the eagle they bear, so the people of old Terra did know the eagle as the symbol of enlightenment and freedom.”  Fitting that we, the instruments of His will, still bear the eagle?  May the "+string(obj_img.king_title)+"'s gaze be upon you, "+string(obj_img.faction_dude[1])+"."; 
        diplo_text=tempd;
    }
    if (argument0="hello"){
        if (rela="friendly") then diplo_text="Hail, hero of "+string(obj_ini.sector_name)+", how may I assist you this day?";
        if (rela="neutral") then diplo_text="Praise be to the "+string(obj_img.king_title)+". What is your business here?";
        if (rela="hostile") then diplo_text="State your business, for many "+string_lower(obj_img.faction_dude[10])+"s pray the "+string(obj_img.king_title)+"'s mercy.";
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="Ave Imperator, "+string(obj_img.faction_title[1])+". No doubt an unslain "+string_lower(obj_img.faction_dudes[8])+" calls for your blade.";
        if (rela="neutral") then diplo_text="I hope there is a good reason for this affront, "+string(obj_img.faction_title[1])+", for it is never wise to slight the "+string(obj_img.king_title)+"'s truest servants.";
        if (rela="hostile") then diplo_text="While it is immaterial whether the "+string(obj_img.faction[5])+" needed those supplies, it is a sign of disrespect for you to act thus. When you slight us, you slight the "+string(obj_img.king_title)+", "+string(obj_img.faction_title[1])+".";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="It is not to be, "+string(obj_img.faction_title[1])+", as much as we wish it otherwise.";
            if (rando=2) then diplo_text="I do not believe we can fulfil your request. Ask the "+string(obj_img.king_title)+" for guidance and perhaps he will see fit to deliver.";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Unless we receive a sign from the Lords of Terra to the contrary, we cannot comply with your request.";
            if (rando=2) then diplo_text="It is not something that we can condone or agree with.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Flee back to the darkness, "+string_lower(obj_img.faction_dude[10])+". You will have nothing from us.";
            if (rando=2) then diplo_text="While we will not fulfill your request, perhaps your warp spawned allies will, "+string_lower(obj_img.faction_dude[10])+" scum?";
        }
    }
    if (argument0="agree"){if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";if (trading_artifact!=0) then diplo_text="[[Trade Accepted.]]##";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Let it be so.";
            if (rando=2) then diplo_text+="You need but ask, "+string(obj_img.faction_title[1])+", and your commands will be fulfilled.";
            if (rando=3) then diplo_text+="As you command, son of the "+string(obj_img.king_title)+".";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It shall be done.";
            if (rando=2) then diplo_text+="I agree, and may the "+string(obj_img.king_title)+" look favorably upon this venture.";
            if (rando=3) then diplo_text+="Doubt is anathema to a true servant of the "+string(obj_img.king_title)+", but still... I have little choice but to agree.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It will take some time in penitence to erase the crime of this action, but I agree.";
            if (rando=2) then diplo_text+="Circumstances force me to agree.";
            if (rando=3) then diplo_text+="Had I any other option, you would be burning in purifying flame at this moment... but I do not. I am with you.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        annoyed[diplomacy]+=2;
        if (rela="neutral") and (annoyed[diplomacy]>=8){diplo_text+="I cannot agree to this, "+string(obj_img.faction_title[1])+", no matter how stubborn you may be.";force_goodbye=1;
        turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;}
        
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I am sorry "+string(obj_img.faction_title[1])+" but I cannot help you.";
            if (rando=2) then diplo_text+="Perhaps another Imperial faction can assist you, but I am unable to.";
            if (rando=3) then diplo_text+="My hands are tied in this matter, my Lord, else I would rush to your aide.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I cannot agree.";
            if (rando=2) then diplo_text+="My sisters and I are unwilling to join you in this course of action.";
            if (rando=3) then diplo_text+="It would not be fitting for my order to join you.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);force_goodbye=choose(0,1);
            if (rando=1) then diplo_text+="I would rather die, "+string_lower(obj_img.faction_dude[10])+".  You have turned from His light and will pay the price!";
            if (rando=2) then diplo_text+="When I made my vows to the "+string(obj_img.king_title)+", I made them for life, unlike you.  Take your deal and burn with it.";
            if (rando=3) then diplo_text+="Your attempt to draw me away from the light are as clumsy as an "+string_lower(obj_img.faction_dude_formal[7])+"'s handwriting!  I say thee nay!";
            
            if (annoyed[diplomacy]>=4){turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;}
        }
    }
    if (argument0="attacked"){
        diplo_text="You pile infamy on sin, traitorous dog.  I will be happy to wipe the stain of your existence from the galaxy.";
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;known[diplomacy]=max(2,known[diplomacy]);
        diplo_text="There is a price for all things and the accounting is now.  Know that you reap only what you have sown.";
    }
    if (argument0="accept_peace"){
        diplo_text="It leaves a bitter taste in my mouth, but you may go in peace.  I will be watching you from now on, however.";
    }
    if (argument0="ignored"){
        diplo_text="Human we may be, but the "+string_lower(obj_img.faction_dudes_formal[5])+" are second in loyalty only to the "+string(obj_img.faction_dudes_formal[1])+" themselves.  Why do you ignore us so?";
    }
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=5;faction_justmet=0;}
        scr_loyalty("Irreverance for His Servants","+");
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="I'm sure you have your reasons for saying such things, my lord.";
            if (rando=2) then diplo_text="Ha, your words would wound me if I thought you were any less loyal to the "+string(obj_img.king_title)+".";
            if (rando=3) then diplo_text="Lucky for you I don't take offense easily.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="You are wrong and I will show you this.";
            if (rando=2) then diplo_text="I couldn't give less of a damn for your words.";
            if (rando=3) then diplo_text="I don't care what you think, only what you do.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Send your poison elsewhere; it is actions and not words that make a man.";
            if (rando=2) then diplo_text="So men act well but speak lies, some speak beautiful truths but act like common criminals.  But you manage to get the worst of both worlds.  It is almost impressive.";
            if (rando=3) then diplo_text="When my flame sends you to your dark gods, it will be too late for such words.";
        }
    }
    if (argument0="praised"){
        if (faction_justmet=1){
            disposition[diplomacy]+=3;faction_justmet=0;
            var o;o=0;repeat(4){if (o<=4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then o=500;}}if (o>100) then obj_controller.disposition[5]+=2;
        }
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Thank you, "+string(obj_img.faction_title[1])+".  That means a lot from a warrior such as you.";
            if (rando=2) then diplo_text="Your words raise my spirits, comrade. I hope to see you on the battlefield soon..";
            if (rando=3) then diplo_text="Apply your mind to defeating the "+string(obj_img.king_title)+"'s enemies, not thinking up clever compliments to pile at my feet.  Unless you feel you can do both?";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="We thank you, but will not let words alter our disposition.";
            if (rando=2) then diplo_text="The only praise that matters is the praise we give to the "+string(obj_img.king_title)+".";
            if (rando=3) then diplo_text="Venerate the "+string(obj_img.king_title)+" with the same enthusiasm and He may look kindly upon you.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Your words will not stall my forces.";
            if (rando=2) then diplo_text="Compliments will not put out the cleansing flame I will bathe you in.";
            if (rando=3) then diplo_text="Save your breath for prayers of forgiveness, for I will destroy you.";
        }
    }
    if (argument0="offer"){
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="Is this trade acceptable to you?";
        if (rando=2) then diplo_text="The "+string(obj_img.king_title)+", hallowed be His name, would doubtless endorse this trade.";
        if (rando=3) then diplo_text="Ask yourself; would a true son of the "+string(obj_img.king_title)+" turn down this trade?";
    }
    if (argument0="open_trade") then diplo_text="Make me an offer, "+string(obj_img.faction_dude[1])+", and I will pray for the guidance to respond.";
    if (argument0="artifact"){
        diplo_option[1]="Propose a trade for the Artifact.";diplo_option[2]="Leave it be; Exit.";
        diplo_text="You have done a service to us by making us aware of this artifact. It is a little amusing that is was under our noses this whole time, though now I am sure it can be retrieved.";
    }
    if (argument0="artifact_thanks"){
        diplo_text="You are a true servant of the "+string(obj_img.king_title)+"! This artifact, while it might be of great value to others, shall forever be a symbol of our friendship.";
    }
    if (argument0="artifact_daemon"){
        if (rela="friendly") then obj_controller.disposition[5]-=2;
        if (rela="neutral") then obj_controller.disposition[5]-=6;
        if (rela="hostile"){obj_controller.disposition[5]-=10;if (obj_controller.faction_status[5]="Allied") then obj_controller.faction_status[5]="Antagonism";}

        if (rela="friendly") then diplo_text=" I am sure it was not your intention, "+string(obj_img.faction_title[1])+", but to give a "+string_lower(obj_img.demon_formal)+"ic artifact to the "+string(obj_img.faction[5])+" is a great insult. Only the "+string(obj_img.faction[4])+" has been given leave to wield such things, and few among our number agree with the practice. You will be forgiven this time, but do not let it happen again.";
        if (rela="neutral") then diplo_text="It is possible that you did not know of the presence of the "+string_lower(obj_img.demon_formal)+" within this artifact, but ignorance is no excuse. Maybe you are simply too corrupt to notice the "+string_lower(obj_img.faction_dude[10])+"al whispers and temptations that the item exudes. I will pray for your soul, or cleanse it with holy fire.";
        if (rela="hostile") then diplo_text=string(obj_img.faction_dude[10])+"! You dare to hand us, the "+string(obj_img.king_title)+"'s most devout followers, a artifact tainted by the presence of a monstrous "+string_lower(obj_img.demon_formal)+"!? Beneath the facade of an "+string(obj_img.faction_dudes_formal[1])+", you are the very embodiment of servant of "+string(obj_img.faction[11])+"! We will not forget this.";
    }
    if (argument0="artifact_angry"){
        diplo_text="How dare you strike at us, the truest and most devoted servants of the "+string(obj_img.king_title)+"!? That artifact was on our territory! You had no right and you shall pay in blood for your actions!";
    }
    if (argument0="stc_thanks"){
        diplo_text="[Missing Dialogue: stc_thanks]";
    }
    if (argument0="trading_demand"){
        if (rela="friendly") then diplo_text=string(obj_ini.master_name)+"?";
        if (rela="neutral") then diplo_text="What is the meaning of this?";
        if (rela="hostile") then diplo_text="“The "+string(obj_img.faction_dude[10])+" and Blasphemer can offer no excuse for their crimes. Those who are pardoned merely live to further shroud Humanity from the Light of the "+string(obj_img.king_title)+" with the Darkness of their souls.”";
        diplo_option[1]="Demand Requisition";diplo_option[2]="Cancel";
    }
    if (argument0="penitent_end"){
        rando=choose(1,2);
        if (rando=1) then diplo_text="Yours is the glory, "+string(obj_img.faction_title[1])+". I admit that I did not expect you to survive this ordeal, having wronged the name of the "+string(obj_img.king_title)+" as you have. It seems, in his wisdom, that he has chosen to spare you for greater things. That you marched through the fires of war and return practically unscathed... it is all the proof I need of your favour with the God "+string(obj_img.king_title)+". Take his word to the "+string_lower(obj_img.faction_dude[10])+", the mutant and the Xenos, "+string(obj_img.faction_dudes_formal[1])+". You have once more earned that right.";
        if (rando=2) then diplo_text="Penitent crusades are a cathartic experience, are they not? To bathe oneself in the blood of The "+string(obj_img.kingdom_title_shortest)+"'s foes, until one's faults are washed away. To let oneself forget restraint and self control, to simply revel in the joy of spilling "+string_lower(obj_img.faction_dude[10])+"al, Xenos blood. Make no mistake, I envy you. It is a long time since I had not thought but of the next kill to fall under my blade. Congratulations on not losing yourself, however. Few return from penitent crusades with as much of their minds in tact as you seem to have.";
    }
}
// 
if (diplomacy=6){// Elfdar
    if (string_count("intro",argument0)>0){
        if (faction_gender[6]=1) then diplo_text="[["+string(faction_leader[diplomacy])+" is a "+string_lower(obj_img.faction_title[6])+", or witch, of the "+string(obj_img.faction[6])+".  He is dressed in a typical fashion of his position, clad in flowing black cloth and bone-like armor.  Almost seeming to relish in conflict, this "+string(obj_img.faction_dude[6])+" is known in local records for "+choose("sudden raid on trade vessels","assassinating a pair of planetary govererners")+".  It is unlikely "+string(faction_leader[diplomacy])+" will be receptive to diplomacy- further audiences are ill-advised.]]";
        if (faction_gender[6]=2){
            var rando;rando=choose(1,2,3);
            diplo_text="[["+string(faction_leader[diplomacy])+" is a witch; an old "+string_lower(obj_img.faction_title[6])+" of "+string(obj_img.faction[6])+" kind.  While obviously a female, the grating voice and inhuman proportions are an unholy mockery of the human form.  She seems to avoid contact with the "+string(obj_img.kingdom_title_shortest)+", as is befitting a "+string(obj_img.faction_dude[6])+".  Little is known about "+string(faction_leader[diplomacy])+", other than ";
            if (rando=1) then diplo_text+="random1.";
            if (rando=2) then diplo_text+="random2.";
            if (rando=3){diplo_text+="rumors of her involvement at the massacre of ";diplo_text+=scr_star_name();diplo_text+=" "+choose("I.","II.","III.","IV.");}
            diplo_text+="  Do not expect futher contact.]]";
        }
        diplo_text+="###";
        if (string_count("1",argument0)>0){// Normal craftworld reveal
            if (obj_ini.tolerant=1) and (string_count("Eldar",obj_ini.strin)=0){diplo_text+="Your future is clouded, human.  Will you be a tool, or a thorn in our side?";}
            if (obj_ini.tolerant=0) and (string_count("Eldar",obj_ini.strin)=0){diplo_text+="Another repulsive "+string(obj_img.faction6_insult)+".  Leave the "+string(obj_img.faction[6])+" alone, primitive.  You have no idea what you face.";}
            if (string_count("Eldar",obj_ini.strin)=1){diplo_text+="This is our home, "+string(obj_img.faction6_insult)+".  Leave it in peace or feel the full wrath of "+string(obj_img.faction6_god)+".";}
        }
        if (string_count("2",argument0)>0){// Running into eldar ships
            if (obj_ini.tolerant=1) and (string_count("Eldar",obj_ini.strin)=0){diplo_text+="This meeting is long since due.  I pray that you pull back your forces, "+string(obj_ini.master_name)+".  None of this concerns you.";}
            if (obj_ini.tolerant=0) or (string_count("Eldar",obj_ini.strin)=1){diplo_text+="You do not understand that which you trifle with.  Leave or be eradicated.";}
        }
        if (argument0="intro"){// Request audience
            if (obj_ini.tolerant=1) and (string_count("Eldar",obj_ini.strin)=0){diplo_text+="We have been expecting you, "+string(obj_ini.master_name)+".";}
            if (obj_ini.tolerant=0) and (string_count("Eldar",obj_ini.strin)=0){diplo_text+="The skeins have foretold of our meeting, "+string(obj_img.faction_dude[1])+".";}
            if (string_count("Eldar",obj_ini.strin)=1){diplo_text+="Another repulsive "+string(obj_img.faction6_insult)+".  Leave the "+string(obj_img.faction[6])+" alone, primitive, you have no idea what you face.";}
        }
        diplo_text+=tempd;
    }
    if (argument0="hello"){
        if (rela="friendly") then diplo_text=choose("For what reason does "+string(obj_ini.master_name)+" seek an audience?","You require something, "+string(obj_ini.master_name)+"?","I have a moment or two to spare.  Speak.");
        if (rela="neutral") then diplo_text=choose("I hope you have good reason for this audience.","What is it, "+string(obj_img.faction_dude[1])+"?","Do not waste my time.");
        if (rela="hostile"){
            rando=floor(random(100))+1;
            if (rando>0) and (rando<=32) then diplo_text="What is it, "+string(obj_img.faction6_insult)+"?";
            if (rando>32) and (rando<=64) then diplo_text="Do not waste my time.";
            if (rando>64) and (rando<=95) then diplo_text="What is the quickest way I may be rid of you?";
            if (rando>95) and (rando<=99) then diplo_text="The runes did not foretell listening to your blabbering "+string(obj_img.faction6_insult)+" mouth.";
            if (rando=100) then diplo_text="I have little patience for your antics.  You... you... DOUBLE "+string_upper(obj_img.faction6_insult)+".";
        }
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="While you are intelligent for a "+string(obj_img.faction6_insult)+", I sometimes forget the limitations of your race. You find it difficult to plan ahead with any efficiency, so I do not take this as a slight.";
        if (rela="neutral") then diplo_text="Oh, did you see a pretty light? Why don't you go and chase it?  I shall return to my own affairs, which are far beyond your understanding.";
        if (rela="hostile") then diplo_text="Typical "+string(obj_img.faction6_insult)+", confused in its intentions to the point of injuring itself. Contact me again when you've climbed a few rungs higher on the evolutionary ladder.";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="While I would like to help you, there are more important things afoot in the galaxy than your problem.";
            if (rando=2) then diplo_text=""+string(obj_img.faction6_insult)+", I would like to help you but I cannot currently.";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="I have heard words like these a thousand times from "+string(obj_img.faction6_insult)+".  And I can only give you one answer; No.";
            if (rando=2) then diplo_text=" If you could only understand the complexity of my schemes... then perhaps you would understand why I cannot currently help you.  Alas, my plans are far beyond your feeble mind.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Children such as yourself should not be as presumptuous with their elders and betters.";
            if (rando=2) then diplo_text="Seek not the reasons for my denial of what you seek, know only that you have neither the skill to find them nor the wisdom to interpret them.";
        }
    }
    if (argument0="agree"){if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";if (trading_artifact!=0) then diplo_text="[[Trade Accepted.]]##";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="We are agreed.";
            if (rando=2) then diplo_text+="Very well.";
            if (rando=3) then diplo_text+="Your logic is clear.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Hmm.  I will say yes...this time.";
            if (rando=2) then diplo_text+="Fine, we'll do it your way.";
            if (rando=3) then diplo_text+="An unlikely alliance, at best.  Still, it shall happen.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="It appears I have no other choice.";
            if (rando=2) then diplo_text+="A repulsive way to put it...but yes.";
            if (rando=3) then diplo_text+="I agree, though not for the reasons you present.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        annoyed[diplomacy]+=2;
        if (rela="friendly") and (annoyed[diplomacy]>=6){diplo_text+="You test my boundries, "+string(obj_ini.master_name)+", and I find tiresome.";force_goodbye=1;
        turns_ignored[diplomacy]=max(turns_ignored[diplomacy],2);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;}
        if (rela!="friendly") and (annoyed[diplomacy]>=4){diplo_text+=choose("I will suffer your presence no longer.","Expect consequences for this offense");force_goodbye=1;
        turns_ignored[diplomacy]=max(turns_ignored[diplomacy],4);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;}
        
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="You test my patience, "+string(obj_ini.master_name)+".";
            if (rando=2) then diplo_text+="I see no good coming of this.";
            if (rando=3) then diplo_text+="I must decline.";
            // 25% chance to close window
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="This is of no concern to us.";
            if (rando=2) then diplo_text+="I cannot allow such a deal.";
            if (rando=3) then diplo_text+="Simply unacceptable.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Remember your place, "+string(obj_img.faction6_insult)+".";
            if (rando=2) then diplo_text+="Do not insult me with such an offer.";
            if (rando=3) then diplo_text+="Expect consequences for this offense.";
            force_goodbye=choose(0,0,0,1);
        }
    }
    if (argument0="attacked"){
        if (rela!="friendly") then diplo_text="Normal 'we were attacked' line goes here.";
        if (rela="friendly") then diplo_text="I would say 'you should know better', "+string(obj_ini.master_name)+", but children are incapable of acting with wisdom, as is their nature.##This act of war obliges us to respond in kind.  I expect to see you upon the fields of battle.";
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;
        diplo_text="The Bloody-Handed God calls for your destruction.  We shall only rest when your filth is cleansed from this sector.";
    }
    if (argument0="accept_peace"){
        diplo_text="A civilization does not survive for as long as ours has without knowing when to put down its weapons. One must also know when to use them again, however.";
    }
    /*if (argument0="ignored"){
        diplo_text="";
    }*/
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=10;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);force_goodbye=choose(0,0,0,1);
            if (rando=1) then diplo_text="You know not what you speak of.";
            if (rando=2) then diplo_text="There are many mysteries, not all easy to understand.";
            if (rando=3) then diplo_text="Our ways are not your ways, "+string(obj_ini.master_name)+".";
        }
        if (rela!="friendly"){
            rando=choose(1,2,3,4,5);force_goodbye=1;
            if (rando=1) then diplo_text="You are like a child.";
            if (rando=2) then diplo_text="Your words harm no one but yourself.";
            if (rando=3) then diplo_text="This audience serves no purpose.";
            if (rando=4) then diplo_text="These words spill forth from your "+string(obj_img.faction6_insult)+" mouth like worms.";
            if (rando=5) then diplo_text="I expect more of a sapient being.";
        }
    }
    if (argument0="praised"){if (faction_justmet=1){disposition[diplomacy]+=1;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="You are amusingly perceptive for your species.";
            if (rando=2) then diplo_text="A rare, but accurate judgement, "+string(obj_ini.master_name)+".";
            if (rando=3) then diplo_text="If only you could grasp how little you have understood... I thank you for the compliment none-the-less.";
        }
        if (rela!="friendly"){
            rando=choose(1,2,3,4,5);
            if (rando=1) then diplo_text="Your words are hollow.";
            if (rando=2) then diplo_text="Compliments from a "+string(obj_img.faction6_insult)+" are as meaningless as the guttural growls of the Orks.";
            if (rando=3) then diplo_text="Do not presume to understand us well enough to appreciate the full breadth and complexity of our actions.";
            if (rando=4) then diplo_text="You are as a man upon laying eyes upon the ocean for the first time; amazed at what he has seen but woefully ignorant of how much he is still unaware of.";
            if (rando=5) then diplo_text="Save your words for your “battle brothers”, to whom they will undoubtedly mean much more.";
        }
    }
    if (argument0="offer"){
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="We offer you this.";
        if (rando=2) then diplo_text="This trade will benefit all.";
        if (rando=3) then diplo_text="What say you of this deal?";
    }
    if (argument0="open_trade") then diplo_text="Speak.";
    if (argument0="artifact"){
        diplo_text="[Missing Dialogue]";
    }
    if (argument0="artifact_thanks"){
        diplo_text="We... thank you, for the gift of this imperial curio. I am sure it will prove useful for something. What, I am not sure.";
    }
    if (argument0="artifact_angry"){
        diplo_text=""+string(obj_img.faction6_insult)+", there will be a reckoning for the arrogance you have displayed here! You cannot take what you please from our lands and worlds, without paying for it in blood or in a more peaceful currency.";
    }
    if (argument0="stc_thanks"){
        rando=choose(1,2,3);
        if (rela="friendly"){
            if (rando=1) then diplo_text+="How quaint, a relic of the “golden age” of your “civilisation”.  Nevertheless, you meant it to be a kind gesture and I thank you.";
            if (rando=2) then diplo_text+="A kind gesture, even if it is a little... pointless. I am grateful that you have seen past the foolish prejudices of your species.";
            if (rando=3) then diplo_text+="I remember when these devices were commonplace. Even then, your species was blind to the wisdom of my people. I thank you for the trinket though.";
        }
        if (rela="neutral"){
            if (rando=1) then diplo_text+="With your limited mental capacity, I suppose you can’t imagine a more advanced piece of technology, which is amusing. I thank you for the jest.";
            if (rando=2) then diplo_text+="I suspect you imagined this dusty piece of technology would help us in some way? Amusing. However, we accept the gift anyway.";
            if (rando=3) then diplo_text+="Your species generally scrabbles for traces of the time before, when you were far greater than you are now. It is good you are letting go and accepting your present lot.";
        }
        if (rela="hostile"){
            if (rando=1) then diplo_text+="A child, handing an adult a misshapen failure of a sculpture made of spit, rocks and hope. Still, perhaps we shall find space for it, somewhere.";
            if (rando=2) then diplo_text+="It is a wonder your species ever mastered space travel, if this was the pinnacle of your “technology”. I don’t know what you expect me to do with it.";
            if (rando=3) then diplo_text+="How brutish, how dirty. I shall fear to put it down, in case it contaminates part of my Craftworld. Perhaps the void would be a better place for it?";
        }
    }
    if (argument0="trading_demand"){
        if (rela="friendly") then diplo_text="You have proven yourself an able ally, "+string(obj_ini.master_name)=".  Consider your next words thoroughly and deliberately.";
        if (rela="neutral") then diplo_text="Speak up, "+string(obj_img.faction6_insult)+".";
        if (rela="hostile"){
            var rando;rando=choose(1,1,2,2,3);
            if (rando=1) then diplo_text="Make your demands, "+string(obj_img.faction6_insult)+", so that I might refute them.";
            if (rando=2) then diplo_text="You may not always have what you wish for, "+string(obj_img.faction6_insult)+".";
            if (rando=3) then diplo_text="Were I a lesser being, such as yourself, spitting in your face might prove tempting.";
        }
        diplo_option[1]="Demand Requisition";diplo_option[2]="Demand Useful Information";diplo_option[3]="Cancel";
    }
    
    
    if (argument0="mission1"){
        diplo_text="The good that might come from simple acts of benevolence are oft underestimated.  A token goodwill gesture can go far, ";
        if (rela="hostile") then diplo_text+=""+string(obj_img.faction6_insult)+"";
        if (rela!="hostile") then diplo_text+="human";
        
        diplo_text+=".  Even something as small as water, raw material, and sustenance can have a profound efect.";
        diplo_option[1]="Give 500 Requisition";
        diplo_option[2]="Maybe";
        diplo_option[3]="Refuse";
        questing=1;
    }
    if (argument0="mission1_thanks"){
        scr_recent("eldar_mission","completed",1);
        var rando;rando=choose(1,1,1,2,2,3,3,3);
        if (rando=1) then diplo_text="You intend to hand over these resources? Without a promise of compensation?  You are a strange human, "+string(obj_img.faction_title[1])+". Few would do this, and it will not be forgotten.";
        if (rando=2) then diplo_text="As little as I expected you to be this generous, I cannot claim complete surprise. While I am a little surprised you were as quick to comply, I expected you to see the light in due course.";
        if (rando=3) then diplo_text="It is not that I am surprised but I confess a little confusion at your forthright generosity.  Perhaps you expect something in return? Regardless, I thank you.";
    }
    if (argument0="mission1_refused"){
        var rando;rando=choose(1,2,3);
        if (rando=1) then diplo_text="Just as I expected, you are exactly like every other member of your race.  I have met a great many "+string(obj_img.faction6_insult)+" in my life, and you are no different from the rest.";
        if (rando=2) then diplo_text="As a brainless fool shouting at the tide to stop, you do your best to fight the inevitable. I shall endure this, however. You too, shall die.";
        if (rando=3) then diplo_text="Expected. You have done nothing than fulfill my projected outcome. If you think yourself clever for refusing or especially loyal to your leader, do not. You are no more fervent or intelligent than any other "+string(obj_img.faction6_insult)+" soldier.";
    }
    if (argument0="mission1_failed"){
        var rando;rando=choose(1,2,3);
        if (rando=1) then diplo_text="One would think, with a life span as short as yours, you would have a better memory. It's not as though you live long enough to have enough time to properly forget anything. This insult will not be forgotten, "+string(obj_img.faction6_insult)+".";
        if (rando=2) then diplo_text="You are as predictable as a the rest of your kind. You say things and make promises, which slip from your tiny mind mere moments afterwards. I pity you more than I scorn you.";
        if (rando=3) then diplo_text="While your mind might be too small to record things for more than a few years, I remember the birth of your “"+string(obj_img.kingdom_title_shortest)+"”. I also remember your words, "+string(obj_img.faction6_insult)+". You have, predictably, disappointed me.";
        force_goodbye=1;
    }
    if (argument0="quest_maybe"){
        var rando;rando=choose(1,2,3);
        if (rando=1) then diplo_text="Ah, the ever cautious "+string(obj_img.faction6_insult)+", too scared by the shadow of his precious "+string(obj_img.king_title)+" to try something new, to adventure a little. Hardly surprising.";
        if (rando=2) then diplo_text="While this is not the gesture I was referring to, I suppose the fact you are yet to scream and shout about ‘Xenos Scum' must be taken as a minor miracle.";
        if (rando=3) then diplo_text="Not hard to see why your species is so universally viewed as foolish. Still, perhaps you will manage to be a little more enlightened than the rest.";
        questing=0;
        var h;h=0;repeat(4){h+=1;obj_controller.diplo_option[h]="";obj_controller.diplo_goto[h]="";}
    }
    
    if (argument0="useful_information"){
        var o1,o2,o3,found;
        o3=choose(1,1,2,3,4,4,5);
        o2=0;found=0;force_goodbye=-1;
        
        // 135 ; 
        // o1=1;
        // if (o1=4) then o1=choose(1,1,2,3);
        
        repeat(30){
            if (o3=5) and (string_count("CM|",obj_controller.useful_info)>0) then o3-=1;
            if (o3=4) and (random_event_next!="") then o3-=1;
            if (o3=3) and ((turn<chaos_turn) or (known[10]>3)) then o3-=1;
            if (o3=2) and ((known[7]<0) or (known[7]>=3) or (string_count("WL7|",obj_controller.useful_info)=1)) then o3-=1;
            if (o3=1) and (string_count("WG|",obj_controller.useful_info)>1) then o3=5;         
        }
        
        o1=o3;
        
        // show_message(o1);// o1=5;
        
        // Most corrupt mahreen
        if (o1=5){
            obj_controller.useful_info+="CM|";
        
            var him_c,him_i,him_num,him_cor,split;
            him_c=0;him_i=0;him_num=0;him_cor=0;split="";
            
            split=scr_max_marine("chaos");
        
            explode_script(split,"|");
            him_c=real(explode[0]);
            him_i=real(explode[1]);
            him_num=string(explode[2]);
            him_cor=real(explode[3]);
            
            if (him_cor=0) then diplo_text="I have looked into the strands of fate, with your "+string(obj_img.player_army)+", and found that the future is not suspect for any of your men.  None of them have their minds poisoned by the taint of "+string_lower(obj_img.faction[11])+".";
            if (him_cor>0) then diplo_text="I have looked into the strands of fate, with your "+string(obj_img.player_army)+".  Your 'battle brother' "+string(him_num)+" has a clouded, dark future- it is advised you watch him carefully.";
        }
        
        
        
        // Next random event
        if (o1=4){
            scr_random_event(false);
            if (random_event_next="strange_behavior") and (obj_controller.disposition[6]<15) then diplo_text="One of your "+string(obj_img.faction6_insult)+" soldiers will no longer act as you expect him to. Be wary, when one "+string(obj_img.faction6_insult)+" is influenced the rest of the herd will be.";
            if (random_event_next="strange_behavior") and (obj_controller.disposition[6]>=15) then diplo_text="One of your soldiers will no longer act as you expect him to. Be wary, when one is influenced the rest of the herd will be.";
            if (random_event_next="space_hulk") then diplo_text="It comes from the warp, a relic from the past. It is steeped in the energies of the ethereal tides. Beware.";
            if (random_event_next="promotion") then diplo_text="One of your soldiers will cover himself in glory. As his “"+string(obj_img.faction_title[1])+"”, a title I find inherently foolish, you may wish to reward him.";
            if (random_event_next="strange_building") then diplo_text="The Red robed ones, their “"+string(obj_img.machine_god)+"”, calls to them. Soon, one shall lose their tenuos grip on the here and now and follow the pictures in his head.";
            if (random_event_next="sororitas") then diplo_text="Your priestesses of war, who worship He Who Fell, will gather their forces soon, to stay.";
            if (random_event_next="inquisition_mission") then diplo_text="They will come very soon, the bearers of hellfire and hate. They will scour the sector for so-called ''Heresy''.";
            if (random_event_next="inquisition_planet") then diplo_text="Your questions askers seek to learn more of a planet.  "+string(obj_img.travel)+" meddlers and free thinkers would be well-served with caution. Beware, "+string(obj_img.faction_title[1])+".";
            if (random_event_next="rogue_trader") then diplo_text="Free thinkers, traders in the vast expanse. They are coming, perhaps you aught to set out your wares?";
            if (random_event_next="fleet_delay") then diplo_text=""+string(obj_img.faction6_insult)+", your fleets may be delayed by my kin. "+string(obj_img.faction[6])+" Pirates, your kind would call them.";
            if (random_event_next="harlequins") then diplo_text="Rillietann. They have come. They are on some world, hidden, or soon will be.";
            if (random_event_next="succession_war") then diplo_text="Your underlings fight for power, "+string(obj_img.faction6_insult)+".  Someone will die who believes he is important. His children and ''friends'' will vie for the rite to call himself or herself governor. Or king. Or whatever self aggrandising title your people name yourselves.";
            if (random_event_next="random_fun") then diplo_text="Something will happen soon. The runes do not show me exactly what will happen, only that it concerns you. Watch the horizon, "+string(obj_img.faction6_insult)+".";
            if (random_event_next="warp_storms") then diplo_text="The tides of the "+string(obj_img.magic_world)+" are unsettled. Of course, it's hard to calculate where the "+string(obj_img.magic_world)+" will affect the "+string(obj_img.real_world)+", but I predict it will come soon.";
            if (random_event_next="enemy_forces") then diplo_text="From beyond your circle of firelight, they are coming. Rest not "+string(obj_img.faction6_insult)+", for they will come soon and are bent on destruction."; 
            if (random_event_next="crusade") then diplo_text="Soon, your masters will call you to heel like a dog to attack the foes of man. One of your ''Crusades'' of hate, ignorance and bigotry will be called."; 
            if (random_event_next="enemy") then diplo_text="You will make an enemy among your fellow man. Soon they shall whisper into their lord's ear, telling that you are a threat, a beetle to be crushed beneath their boot.  You would do well to speak carefully, for some time.";
            if (random_event_next="mutation") then diplo_text="Your 'battle brothers' are twisting like snakes beneath your feet. Watch yourself, "+string(obj_img.faction_title[1])+".";
            if (random_event_next="ship_lost") then diplo_text="The "+string(obj_img.magic_world)+" will swallow one of your ships.  Do not look for it to return.";
            if (random_event_next="chaos_invasion") then diplo_text="Your twisted brethren, who fell to the lure of the "+string(obj_img.magic_world)+", will soon arrive with their wrath and demons. Beware.";
            if (random_event_next="necron_awaken") then diplo_text="Our old enemies, the men of metal, are close. You call them “"+string(obj_img.faction_dudes_formal[13])+"”, and you will need to fight them soon. Or flee, it matters not to me.";            
            if (string_length(diplo_text)<5) then diplo_text="[Missing Dialogue: "+string(random_event_next)+" forcast.]";
        }
        
        
        // Chaos warlord location
        if (o1=3){
            obj_controller.useful_info+="WL10|";
            
            
            if (obj_controller.faction_gender[10]=1){
                repeat(5){if (found=0){instance_activate_object(obj_star);
                    with(obj_temp5){instance_destroy();}
                    with(obj_star){var i;i=0;repeat(4){i+=1;if (string_count("WL10",p_feature[i])>0) then instance_create(x,y,obj_temp5);}}
                    if (instance_exists(obj_temp5)){
                        var you,nuum,plan;
                        you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
                        nuum=you.name;plan=0;
                        var i;i=0;repeat(4){i+=1;if (string_count("WL10",you.p_feature[i])>0) then plan=i;}found=1;
                        diplo_text="The fallen warlord of your kind is located somewhere within the "+string(nuum)+" system.  More I cannot say.  It would be prudent to deal with this soon- that abomination may not remain there long.";
                    }
                }}
            }
            if (obj_controller.faction_gender[10]=2){
                diplo_text="The Lord of Rage turns his foul gaze upon this sector.  With it death and destruction will soon come.  You had best be ready when it does.";
            }
        }
        
        // Ork Warboss Location
        if (o1=2){
            obj_controller.useful_info+="WL7|";
            
            repeat(5){if (found=0){instance_activate_object(obj_star);
                with(obj_temp5){instance_destroy();}
                with(obj_star){var i;i=0;repeat(4){i+=1;if (string_count("WL7|",p_feature[i])>0) then instance_create(x,y,obj_temp5);}}
                if (instance_exists(obj_temp5)){
                    var you,nuum,plan;
                    you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
                    nuum=you.name;plan=0;
                    var i;i=0;repeat(4){i+=1;if (string_count("WL7|",you.p_feature[i])>0) then plan=i;}
                    if (you.p_orks[plan]<6) then you.p_orks[plan]=6;
                    diplo_text="The greenskin horde is led by a massive "+string_lower(obj_img.faction_dude_formal)+", one who calls himself "+string(faction_leader[7])+".  If this "+string_lower(obj_img.faction_title[7])+" were to perish the rest might be dealt with in a more languorous fashion.  He is located on "+string(nuum);
                    if (plan=1) then diplo_text+=" I.";if (plan=2) then diplo_text+=" II.";
                    if (plan=3) then diplo_text+=" III.";if (plan=4) then diplo_text+=" IV.";found=1;
                }
            }}
        }
        
        
        
        
        // Webway Gate Location
        // if (o1=1) and (string_count("WG|",obj_controller.useful_info)=2) then o1+=choose(1,2,3,3);
        if (o1=1){
            obj_controller.useful_info+="WG|";
            
            if (string_count("WG|",obj_controller.useful_info)=1){
            
                repeat(5){if (found=0){instance_activate_object(obj_star);
                    with(obj_temp6){instance_destroy();}with(obj_temp5){instance_destroy();}
                    if (obj_ini.fleet_type=1) then with(obj_star){if (owner=1) then instance_create(x,y,obj_temp6);}
                    if (obj_ini.fleet_type!=1) then with(obj_p_fleet){if (capital_number>0) then instance_create(x,y,obj_temp6);}
                    
                    with(obj_star){
                        if (owner!=2) then instance_deactivate_object(id);
                        if (owner=2) and (point_distance(x,y,obj_temp6.x,obj_temp6.y)>250) then instance_deactivate_object(id);
                        if (owner=2) and (planets<1) then instance_deactivate_object(id);
                    }
                    var that,good;good=0;that=instance_nearest(random(room_width),random(room_height),obj_star);
                    
                    
                    repeat(5){
                        if (good=0) then with(that){
                            var i,onceh;i=0;onceh=0;
                            repeat(10){i=floor(random(planets))+1;if (p_feature[i]="") and (onceh=0) then onceh=i;}
                            if (onceh!=0){
                                p_feature[onceh]+="Webway Gate|";obj_controller.temp[90]=name;good=1;
                                if (onceh=1) then obj_controller.temp[90]+=" I";if (onceh=2) then obj_controller.temp[90]+=" II";
                                if (onceh=3) then obj_controller.temp[90]+=" III";if (onceh=4) then obj_controller.temp[90]+=" IV";
                            }
                        }
                    }
                    if (good=1){diplo_text="A series of labyrinthian corridors and veins connect the galaxy.  The planet you know as "+string(obj_controller.temp[90])+" contains a dormant entrance to this realm.";found=1;}
                }}
                
            }
            
            
            if (string_count("WG|",obj_controller.useful_info)=2){
            
                repeat(5){if (found=0){instance_activate_object(obj_star);
                    with(obj_temp6){instance_destroy();}with(obj_temp5){instance_destroy();}
                    if (obj_ini.fleet_type=1) then with(obj_star){if (owner=1) then instance_create(x,y,obj_temp6);}
                    if (obj_ini.fleet_type!=1) then with(obj_p_fleet){if (capital_number>0) then instance_create(x,y,obj_temp6);}
                    with(obj_star){
                        if (owner!=2) then instance_deactivate_object(id);
                        if (owner=2) and (point_distance(x,y,obj_temp6.x,obj_temp6.y)<800) then instance_deactivate_object(id);
                        if (owner=2) and (planets<1) then instance_deactivate_object(id);
                    }
                    var that,good;good=0;that=instance_nearest(random(room_width),random(room_height),obj_star);
                    
                    repeat(5){
                        if (good=0) then with(that){
                            var i,onceh;i=0;onceh=0;
                            repeat(10){i=floor(random(planets))+1;if (p_feature[i]="") and (onceh=0) then onceh=i;}
                            if (onceh!=0){
                                p_feature[onceh]+="Webway Gate|";obj_controller.temp[90]=name;good=1;
                                if (onceh=1) then obj_controller.temp[90]+=" I";if (onceh=2) then obj_controller.temp[90]+=" II";
                                if (onceh=3) then obj_controller.temp[90]+=" III";if (onceh=4) then obj_controller.temp[90]+=" IV";
                            }
                        }
                    }
                    if (good=1){diplo_text="The second dormant webway gate lays upon "+string(obj_controller.temp[90])+".";found=1;}
                }}
                
            }
            
            with(obj_temp6){instance_destroy();}
            with(obj_temp5){instance_destroy();}
            instance_activate_object(obj_star);
            
        }
        
        
    }
    
}
// 
if (diplomacy=7){// Orks orks orks orks

    if (disposition[diplomacy]>=20) then rela="friendly";
    if (disposition[diplomacy]<20) and (disposition[diplomacy]>=-20) then rela="neutral";
    if (disposition[diplomacy]<-20) then rela="hostile";

    if (argument0="intro"){// Request audience
        var rando;rando=choose(1,2);
        if (rando=1) then diplo_text="[["+string(faction_leader[diplomacy])+" is the scourge of the sector, a colossal "+string(obj_img.faction7_adjective)+" brute infamous for the destruction of a dozen worlds. He rules his vicious horde of xenos savages the only way "+string(obj_img.faction7_adjective)+"skins know how; with brute force. Trophies from the champions of a score of races bedeck his armour, including many from "+string(choose("other "+string(obj_img.faction_dudes_formal[1])+"","the "+string(obj_img.faction[9]),"the "+string(obj_img.faction[8])))+".]]";
        if (rando=2) then diplo_text="[["+string(faction_leader[diplomacy])+" is a veteran of countless engagements, leading his tribe into battle with an almost manic giddiness. His name is synonymous with extended campaigns of looting and senseless violence, even more so than the other members of his barbaric race. He and the rest of his tribe hail from the "+string(choose(obj_img.faction7_clan1,obj_img.faction7_clan2,obj_img.faction7_clan3,obj_img.faction7_clan4,obj_img.faction7_clan4))+" clan.]]";
        diplo_text+="###";
        if (obj_ini.tolerant=1) and (string_count("Ork",obj_ini.strin)=0){diplo_text+="You seem good for a scrap, ya beaky faced ponce! Bring your lads down my way some time and we'll have one!";}
        if (obj_ini.tolerant=0) and (string_count("Ork",obj_ini.strin)=0){diplo_text+="All you "+string(obj_img.faction_dudes[1])+"s seem da same ta me. I reckon we'll be seein' each other soon enough...";}
        if (string_count("Ork",obj_ini.strin)=1){diplo_text+="Oi Beaky! I ain't heard your name round here before! If ya eva get bored of havin' your ‘ead attached to your shouldas, good old "+string(faction_leader[diplomacy])+" can sort dat out for ya!";}
        diplo_text+=tempd;
    }
    if (argument0="new_warboss"){
        var rando;rando=1;
        diplo_text="[["+string(faction_leader[diplomacy])+" is the scourge of many sectors, a colossal "+string(obj_img.faction7_adjective)+" brute infamous for the destruction of dozens of worlds.  His name is synonymous with extended campaigns of looting and senseless violence, even more so than the other members of his barbaric race. He and the rest of his tribe hail from the "+string(choose(obj_img.faction7_clan1,obj_img.faction7_clan2,obj_img.faction7_clan3,obj_img.faction7_clan4,obj_img.faction7_clan4))+" clan.  He is recently arrived to the sector, bringing with him a massive invasion fleet.]]";
        diplo_text+="###";
        rando=choose(1,1,1,2);
        if (rando=1) then diplo_text+="I've got good news, humie! "+string(faction_leader[diplomacy])+" is da warboss now! An' ya know wot dat means? It means yer krumped! Krumped good an' well, just as soon as me Mekboys get dis piece o junk movin'. Thaz right!  Get ready fer a foight, humies; me an' da boyz'll be antsy when we gets there, and it'd be downroight inhorspitotalibile not to give us a good one!"
        if (rando=2) then diplo_text+="Tasty humie worldz. All dat loot. All dat MEAT. By "+string(obj_img.faction7_god1)+" an "+string(obj_img.faction7_god2)+", we's gonna smash it all up wiv an ax, burn it to da ground and have a proppa meal!  "+string(faction_leader[diplomacy])+" is da warboss now, and I's commin for you humie!  Git ready for da WWWAAAGGGGGGGGGGHHHHHHH!"
    }
    if (argument0="hello"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text+="Hey, if it isn't me favorite ‘umie! What can I do for ya? Want some help with some skumgrods, a quick trade or just come to chat with old "+string(faction_leader[7])+"?";
            if (rando=2) then diplo_text+="Pull up a chair, Chapta masta! Want some fungus ale? It's good stuff! There's even a squig fight on in da pits today! Oh, but you're always buisness, ain't ya?";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text+="Alright ‘umie, whatcha want? I got betta things ta do today but ‘umies are always good for a laugh so I'll give ya a little while.";
            if (rando=2) then diplo_text+="Go on den ‘umie, say you piece. But if ya call me xenos or mention the === even once, this is gunna end badly.";// Emprah
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text+="What da zog do ya want, ‘umie? I ain't in da mood for any of your squig dung, so make it quick before I start shootin'.";
            if (rando=2) then diplo_text+="Ya got eight words to tell me what you want, ‘cause dat's how many finers I got left. After dat, I'll show ya what I learned losing the other three.";
        }
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="Oi', don't rush off! Why don't ya drink a fungus ale wit me and the nobz? We could discuss business while watching a ===! No? Suit ya self.";// squigfight
        if (rela="neutral") then diplo_text="Well dat was a waste of time. See ya ‘around "+string(obj_img.faction_dude[1])+".";
        if (rela="hostile") then diplo_text="Next time you says you got a deal for me, you beta zoggin' well ‘ave one!";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Nah, I ain't seein it mate. Maybe next time, 'eh?";
            if (rando=2) then diplo_text="Dun't sound like fun, ===. I fink I'll take the boys for a scrap someplace else.";
            // Spash Mareen
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Get lost 'umie, I got me own fings ta do.";
            if (rando=2) then diplo_text="I'll fink about it but I ain't sure it sounds like fun.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="Da only fing I'll 'elp ya with is the removal of you head!";
            if (rando=2) then diplo_text="Next time ya want somefing, try askin' someone who dun't fink you're a piece of mouldy grot dung.";
        }
    }
    if (string_count("agree",argument0)>0){if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";if (trading_artifact!=0) or (liscensing>0) then diplo_text="[[Trade Accepted.]]##";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Ha, this is gunna be a whole lot of fun! I'm in!";
            if (rando=2) then diplo_text+="You ain't "+string(obj_img.faction7_adjective)+" but ya fink like an "+string_lower(obj_img.faction_dude_formal[7])+" all right! It's a deal!";
            if (rando=3) then diplo_text+="‘ERE WE GO, ‘ERE WE GO, ‘ERE WE GO!";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Yeah, all right, why not?";
            if (rando=2) then diplo_text+="You're lucky I'm such a nice boss, no other "+string_lower(obj_img.faction_dude_formal[7])+"'d agree to this.";
            if (rando=3) then diplo_text+="Well, I don't see no reasons why I shouldn't agree.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I dun't like it but I ain't got no choice.";
            if (rando=2) then diplo_text+="If you cross me, I'll pick me teef with your ribs!";
            if (rando=3) then diplo_text+="You're a lousy ‘umie skumgrod but you got a deal.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        annoyed[diplomacy]+=2;
        if (annoyed[diplomacy]>=6){diplo_text+="You'ze wasting my time.";force_goodbye=1;
        turns_ignored[diplomacy]=max(turns_ignored[diplomacy],4);diplo_last=string(argument0);diplo_char=0;diplo_alpha=0;exit;}
        
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Not dis time but don't let it get ya down.";
            if (rando=2) then diplo_text+="Ha, sounds like a good time but dere's too many === on me plate right now.";// squigs
            if (rando=3) then diplo_text+="Pull the uvver one mate, it's got bells on it!";
            // 25% chance to close window
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Nah, I don't like the sound of dat.";
            if (rando=2) then diplo_text+="Maybe some uvver time, there's a fight on at the === pits.";// squig
            if (rando=3) then diplo_text+="Find some uvver "+string_lower(obj_img.faction_dude_formal[7])+", this one ain't got da time.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Not a chance, ya fleshy pink git!";
            if (rando=2) then diplo_text+="I got a better idea; get zogged!";
            if (rando=3) then diplo_text+="If dat's a serious offer, you're out of your tiny ‘uman mind.";
            force_goodbye=choose(0,0,0,1);
        }
    }
    if (argument0="attacked"){
        diplo_text="So it's krumping time is it, you stupid beaky!? I'm gunna find you and smash your zogging face in with me bare hands! Nobody starts a fight round ‘ere ‘cept me!";
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;
        diplo_text="Me boyz ain't fought anyone for... at least half a zoggin' hour! It's skrapping time and may da best "+string_lower(obj_img.faction_dude_formal[7])+" win!";
    }
    
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=5;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);// force_goodbye=1;
            if (rando=1) then diplo_text="Ha, I know ya dun't mean that!";
            if (rando=2) then diplo_text="Say dat again and I'll slap ya ‘round the head, ya daft git! Just kiddin'!";
            if (rando=3) then diplo_text="If ya think dat, ya must have === dropping between yur ears.";// squig
        }
        if (rela="neutral"){
            rando=choose(1,2,3);// force_goodbye=1;
            if (rando=1) then diplo_text="Words is all ya got, is it?";
            if (rando=2) then diplo_text="Dat was a paffetic excuse for an insult, dung-for-brains.";
            if (rando=3) then diplo_text="We'll just see if dem words are true, won't we?";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);force_goodbye=choose(0,0,1);
            if (rando=1) then diplo_text="Say dat to me face and see what happens, ya "+string_lower(obj_img.faction7_god1)+" damned beaky!";
            if (rando=2) then diplo_text="I'm gunna take dem words and ram ‘em down your throat!";
            if (rando=3) then diplo_text="Let's see ya say that without a head!";
        }
    }
    if (argument0="praised"){
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="You're a mate, ta say such nice fings about little ole' me.";
            if (rando=2) then diplo_text="Dat's da truth, plain and simple. Well said!.";
            if (rando=3) then diplo_text="Job's a good ‘un!";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);force_goodbye=choose(0,0,0,1);
            if (rando=1) then diplo_text="You know how ta polish a name, but do ya know how to wield a blade?";
            if (rando=2) then diplo_text="That dun't push me one way or the uvver.";
            if (rando=3) then diplo_text="Words don't last, ‘umie, it's deeds that get remembered.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);force_goodbye=choose(0,1);if (faction_justmet=1) then force_goodbye=1;
            if (rando=1) then diplo_text="Get your nose outta me arse ‘umie! I dun't want your pretty words, just your head!";
            if (rando=2) then diplo_text="Quick ta turn tail and kiss arse, ain't ya? It wun't help.";
            if (rando=3) then diplo_text=string(faction_leader[diplomacy])+" dun't like be called names by ‘umies, not even good ones.";
        }
        if (faction_justmet=1){disposition[diplomacy]+=5;faction_justmet=0;}
    }
    if (argument0="offer"){
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="You wanna swap dis ‘ere fine bolter for dat fing?";
        if (rando=2) then diplo_text="Oi, you want some of dis? Special offer for a limited time only!";
        if (rando=3) then diplo_text="Take it or leave it, dat's me final offer.";
    }
    if (argument0="stc_thanks"){
        rando=choose(1,2,3);
        if (rela="friendly"){
            if (rando=1) then diplo_text+="It’s a... shinybit! Fanks fer da shinybit Beaky!";
            if (rando=2) then diplo_text+="Wot, so it’s like a box o’ ideas fer ‘Umie teknology? Fanks!";
            if (rando=3) then diplo_text+="Cor, looks real nice! I’ll stick it on me Choppa!";
        }
        if (rela="neutral"){
            if (rando=1) then diplo_text+="It’s a... not really useful fer anyfin’, is it?";
            if (rando=2) then diplo_text+="Ya know ‘umie, I dun’t like bitz that dun’t do nuffin’. Just sayin’ fer next time.";
            if (rando=3) then diplo_text+="So wat, ya want a fank you note or summin’?";
        }
        if (rela="hostile"){
            if (rando=1) then diplo_text+="If ya dun’t zog off, I’m gunna ram dis down yer throat!";
            if (rando=2) then diplo_text+="Fanks, now get lost ‘afore I smashes ya!";
            if (rando=3) then diplo_text+="Maybe one o’ da grots will like it, ‘cos I dun’t.";
        }
    }
    if (argument0="artifact_thanks"){
        if (rela="friendly"){rando=choose(1,2,3);
            if (rando=1) then diplo_text="Thanks mate, dis'll make a good toof pick!";
            if (rando=2) then diplo_text="Cor, shiny fing, ain't it!? Dun't worry, I'll find a place fer it.";
            if (rando=3) then diplo_text="Yer a good mate, givin' me such nice dakka!";
        }
        if (rela="neutral"){rando=choose(1,2,3);
            if (rando=1) then diplo_text="Not bad, not bad. I'll see if I can find sum grot ta use it.";
            if (rando=2) then diplo_text="Aright, just dun't spect me ta give ya one back for Gorkmas!";
            if (rando=3) then diplo_text="Well, so long as ya aren't askin' for sum teef in return fer it.";
        }
        if (rela="hostile"){rando=choose(1,2,3);
            if (rando=1) then diplo_text="Ha, you givin' me a somefin ta shove down your throat, beaky!?";
            if (rando=2) then diplo_text="It wus mine anyway, seein' as I'll take all yer stuff eventually.";
            if (rando=3) then diplo_text="Wot a piece o' rubbish. ‘Ope you got better dakka an' dis somewhere.";
        }
    }
    if (argument0="open_trade") then diplo_text="Wut?";
    if (argument0="trading_demand"){
        diplo_text="Yeah?  Wut?";
        diplo_option[1]="Demand Requisition";diplo_option[2]="Demand Military Assistance";diplo_option[3]="Cancel";
    }
}
// 
if (diplomacy=8){// Tau
    if (argument0="intro"){
        rando=choose(1,2);
        // if (rando=1) then tempd="[[To see Sector Commander "+string(faction_leader[2])+" is to see what happens to heroes when their glory days have passed and the rot of ages sets in. Now a huge mass of fat and flab, he was once a mighty and respected general and the commander of a score of successful campaigns. As his reward for a glorious career, he was given commander of the sector and, as has happened to so many others, the bureaucracy crushed his warrior spirit and turned him into the man he is.]]";
        
        if (rando=1) then tempd="[[Tall and slender, its skin is blue and clammy-looking.  Disgusting.  Its face contains two large, expressionless eyes, a slit-like mouth, and a bizarre I-shaped gash between its eyes that must function as a nose.  So this is "+string(faction_title[8])+" "+string(faction_leader[8])+".  This particular xenos is said to "+choose("have quite the silver tongue","have negotiated the surrender of many Imperial worlds","have a great deal of military backing.")+".]]";        
        if (rando=2) then tempd="[[Tall and slender, its skin is a light blue and looks almost reptilian.  A Y-shaped slit nestles between its eyes, and a mouth like a slit sits below that.  This must be "+string(faction_title[8])+" "+string(faction_leader[8])+".  The Ordo Xenos tells us that this particular xeno "+choose("can sense weakness in a rock","knows more than it will let on","uses its words like a scalpel")+".]]";
        tempd+="###";
        rando=choose(1,2);
        if (rando=1) then tempd+="Greetings, "+string(obj_img.faction_title[1])+".  As you know, we have claimed for ourselves planets along the borders of your "+string(obj_img.kingdom_title_shortest)+".  I wish to clarify that we of the "+string(obj_img.faction_dude_formal[8])+" do not seek a war.  Rather, we hope to cooperate with you so that we may both work towards a "+string(obj_img.faction8_philosophy)+"."; 
        if (rando=2) then tempd+="Salutations, "+string(obj_ini.master_name)+".  I represent the interests of the "+string(obj_img.faction[8])+".  We wish to exist in peace beside you for now, and hope that one day you will see the wisdom of the "+string(obj_img.faction8_philosophy)+". We will be more than happy to accept you into the fold, for the way of the "+string(obj_img.faction_dude_formal[8])+" is one of benevolence and acceptance."; 
        diplo_text=tempd;
    }
    if (argument0="hello"){
        if (rela="friendly") then diplo_text=string(obj_ini.master_name)+"! How may we help one another today?";
        if (rela="neutral") then diplo_text="We welcome you, "+string(obj_img.faction_title[1])+". What do you wish of the "+string(obj_img.faction_dude_formal[8])+"?";
        if (rela="hostile") then diplo_text=string(obj_img.faction_title[1])+". Have you finally decided to submit yourself to The "+string(obj_img.faction8_philosophy)+"?";
    }
    if (argument0="trade_close"){
        if (rela="friendly") then diplo_text="I will await your word with anxious anticipation, honoured ally, for I am sure something of great importance draws you away.";
        if (rela="neutral") then diplo_text="Please reconsider your actions.  I believe we would both benefit from a trade, "+string(obj_img.faction8_human)+"";
        if (rela="hostile") then diplo_text="I am saddened by your lack of respect, and can only attribute it to inferior cultural surroundings.";
    }
    if (argument0="demand_refused"){
        if (rela="friendly"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="While I truly sympathise with your plight, I'm afraid I cannot acquiesce at this time.";
            if (rando=2) then diplo_text="I am sorry, friend, but I simply cannot comply at this time.";
        }
        if (rela="neutral"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="It is not possible for such a thing to be done, whatever your reasons.";
            if (rando=2) then diplo_text="As eloquent as your arguments have been, I cannot give this my approval.";
        }
        if (rela="hostile"){
            rando=choose(1,2);
            if (rando=1) then diplo_text="It will not happen, and you must deal with that.";
            if (rando=2) then diplo_text="No, and that is our final word upon the matter.";
        }
    }
    if (argument0="agree"){if (trading_artifact=0) then diplo_text=string(trade_msg)+"##";if (trading_artifact!=0) then diplo_text="[[Trade Accepted.]]##";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Yes!  We wholeheartedly agree to this deal.  The "+string(obj_img.faction[8])+" thanks you for your continuing support.";
            if (rando=2) then diplo_text+="Of course. We are always happy to be able to meet the needs of our friends and allies- such is the philosophy of the "+string(obj_img.faction8_philosophy)+".";
            if (rando=3) then diplo_text+="Your terms are most amicable.  May the light of wisdom shine on you ever, "+string(obj_img.faction_title[1])+".  "+string(obj_img.faction8_philosophy)+" prevails.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="Hmm.  Agreed.  I hope that this will pave the way to better relations overall.";
            if (rando=2) then diplo_text+="We accept.  The "+string(obj_img.faction8_philosophy)+" teaches us cooperation, and this is just one of the many ways it applies.";
            if (rando=3) then diplo_text+="As you say, we are in need of such things... I think this arrangement will profit us both.  Perhaps we shall work together more in the future.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="You drive a hard bargain... but it is for The "+string(obj_img.faction8_philosophy)+".";
            if (rando=2) then diplo_text+="An unfair bargain does no good for any... but you force our hand.";
            if (rando=3) then diplo_text+="Under other circumstances we would refuse... but the word of the "+string(obj_img.faction8_leader)+"'s is heard by all.";
        }
    }
    if (argument0="disagree"){if (trading_artifact=0) then diplo_text="[[Trade Refused]]##";if (trading_artifact=1) then diplo_text="";
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="I am sorry but I will have to say no for now.";
            if (rando=2) then diplo_text+="You must forgive us, but we are unable to agree to your terms.  We simply cannot fulfil the obligations you suggest.";
            if (rando=3) then diplo_text+="Your terms are agreeable, and past deeds have proven your trustworthiness... but I fear the consequences of this trade.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="This arrangement does not benefit us at this time.  Perhaps if you were to offer again later...";
            if (rando=2) then diplo_text+="Unfortunately we cannot accept these terms.  I apologize.";
            if (rando=3) then diplo_text+="We will have to consider it.  For now, you would do well to seek another partner.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text+="The "+string(obj_img.faction8_leader)+"'s decree is final. Your terms do not benefit The "+string(obj_img.faction8_philosophy)+".";
            if (rando=2) then diplo_text+="Absolutely not.  We of the "+string(obj_img.faction[8])+" have pride of our own to maintain.";
            if (rando=3) then diplo_text+="Your terms are practically insulting.  The "+string(obj_img.faction8_philosophy)+" is not so impotent that we cannot simply go to someone else.";
        }
    }
    if (argument0="attacked"){
        diplo_text="You will regret this day, "+string(obj_img.faction_dude[1])+".  The "+string(obj_img.faction_dude_formal[8])+" grow stronger by the hour; a dozen races have joined our cause.  The "+string(obj_img.faction8_philosophy)+" is no mere philosophy but a way of life we will fight for.";
    }
    if (argument0="declare_war"){force_goodbye=1;turns_ignored[diplomacy]+=4;
        diplo_text="We have attempted diplomacy, "+string(obj_img.faction_title[1])+".  Time and again, "+string(obj_img.faction_dude_formal[8])+" ambassadors have contacted your "+string(obj_img.kingdom_title_shortest)+" with peaceful intentions... and time and again they have been betrayed.  No more.  It is war, "+string(obj_img.faction_dude[1])+".  Surrender, or face the fury of those who dream of a "+string(obj_img.faction8_philosophy)+"!";
    }
    if (argument0="accept_peace"){
        diplo_text="We, the "+string(obj_img.faction_dude_formal[8])+", agree to a complete cessation of hostilities.  Perhaps you may yet join us and achieve a "+string(obj_img.faction8_philosophy)+".";
    }
    if (argument0="ignored"){
        diplo_text="You request for an audience is granted, but I would hope that you attempt to keep up more regular contact in future.";
    }
    if (argument0="denounced"){if (faction_justmet=1){disposition[diplomacy]-=2;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Was this communication sent in error? Do we not all serve a "+string(obj_img.faction8_philosophy)+"?";
            if (rando=2) then diplo_text="We apologise if we have caused any offence. We are not above admitting our mistakes.";
            if (rando=3) then diplo_text="This is most unlike you, "+string(obj_img.faction_title[1])+". Are you unwell?";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Such sentiments are regrettable. We hope one day you realize your mistakes and submit to The "+string(obj_img.faction8_philosophy)+".";
            if (rando=2){diplo_text="Foolish notions are below our recognition. Contact us when you have a message of substance.";force_goodbye=1;}
            if (rando=3) then diplo_text="Coming to insults so soon? Embrace The "+string(obj_img.faction8_philosophy)+", "+string(obj_img.faction8_human)+", and we will show you the true way.";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);force_goodbye=choose(0,0,1);
            if (rando=1) then diplo_text="Your tiresome slander is noted and dismissed. We do not hold it against you.";
            if (rando=2) then diplo_text=""+string(obj_img.faction8_human)+" are obviously less sophisticated than the "+string(obj_img.faction_dude_formal[8])+". We know not to sling feces at others.";
            if (rando=3) then diplo_text="Our greatest poets would respond to your laughable taunts, but none of your race could understand them.";
        }
    }
    if (argument0="praised"){if (faction_justmet=1){disposition[diplomacy]+=4;faction_justmet=0;}
        if (rela="friendly"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Let us feast and celebrate, "+string(obj_img.faction_title[1])+"! Friends like you are rare in these times.";
            if (rando=2) then diplo_text="The "+string(obj_img.faction8_philosophy)+" thanks you!";
            if (rando=3) then diplo_text="The "+string(obj_img.faction8_leader)+"'s send their humble thanks, "+string(obj_img.faction_title[1])+". You should feel honoured.";
        }
        if (rela="neutral"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Your entreaty is noted and will be considered in future.";
            if (rando=2) then diplo_text="A simple gesture, "+string(obj_img.faction_title[1])+"... but we thank you.";
            if (rando=3) then diplo_text="Hmm... perhaps you are not beyond redemption.  May the "+string(obj_img.faction8_philosophy)+" be with you, "+string(obj_img.faction_title[1])+".";
        }
        if (rela="hostile"){
            rando=choose(1,2,3);
            if (rando=1) then diplo_text="Words are cheap, "+string(obj_img.faction_title[1])+".  Actions are worth far more.";
            if (rando=2) then diplo_text="Grovelling before The "+string(obj_img.faction8_philosophy)+"?  Do you have no pride?";
            if (rando=3) then diplo_text="Forgiveness is earned, not given.  Show us your worth, "+string(obj_img.faction_title[1])+".";
        }
    }
    if (argument0="offer"){
        rando=choose(1,2,3);
        if (rando=1) then diplo_text="Our emissaries bring gifts, "+string(obj_img.faction_title[1])+". Perhaps you would consider a mutually beneficial arrangement?";
        if (rando=2) then diplo_text="The "+string(obj_img.faction8_leader)+"'s ask much of you, "+string(obj_img.faction_title[1])+"... but we are more than willing to repay you in full.";
        if (rando=3) then diplo_text="Let us forget our differences, for we may all reap the rewards of The "+string(obj_img.faction8_philosophy)+".";
    }
    if (argument0="open_trade"){
        rando=choose(1,2);
        if (rando=1) then diplo_text="Make your proposal and the "+string(obj_img.faction_dude_formal[8])+" shall answer.";
        if (rando=2) then diplo_text="Ah, you have something that might possibly allow us both to benefit of The "+string(obj_img.faction8_philosophy)+"?";
    }
    if (argument0="artifact_thanks") then diplo_text="Your generosity will not be forgotten, friend of the "+string(obj_img.faction_dude_formal[8])+".  What you have done shall advance The "+string(obj_img.faction8_philosophy)+".";
    if (argument0="stc_thanks"){
        diplo_text="[Missing Dialogue: stc_thanks]";
    }
    
    if (argument0="bombard_angry"){
        diplo_text="What are you doing!? The bombardment of our planet is inexcusable and shall be met with an immediate and forceful response!";
    }
}
// 

if (argument0="trade_error_1") and (obj_ini.fleet_type=1) then diplo_text="[Error 1: No valid planet to trade with.]";
if (argument0="trade_error_1") and (obj_ini.fleet_type!=1) then diplo_text="[Error 1: No valid fleet to trade with.]";
if (argument0="trade_error_2") then diplo_text="[Error 2: "+string(obj_controller.faction[diplomacy])+" has no valid origin for a fleet.]";



if (force_goodbye=1) then turns_ignored[diplomacy]=max(turns_ignored[diplomacy],1);



diplo_last=string(argument0);
diplo_char=0;
diplo_alpha=0;
