// Terrassendach

/*[Umgebung]*/

Mauer = true;
Hauswand = true;
Boden = true;
Rasen = true;
Kies = true;
Weg = true;
Brunnen = true;
Tischgruppe = true;
Baum = true;

/*[Terrassendach]*/
Ueberstand = true;


/*[Modell]*/
Typ = "Seeger"; // ["Seeger","Tirol"]

module Loch() {
    rotate([90,0,0])
    translate([0,22,-8])
    cylinder(d=11,h=10);
}

Dachhoehe = 250;
Dachtiefe = 290; 
RAL9006 = [161/255, 161/255, 160/255];
RAL9007 = [135/255, 139/255, 129/255];

Dachfarbe = RAL9006;

module Lochreihe(){
    if (Ueberstand) {
        for (i=[30:50:500])
            translate([i,0,0])
            Loch();
    } else {
        for (i=[20:50:480])
            translate([i,0,0])
            Loch();
        
    }
}

module Wandtraeger() {
    
    if (Typ == "Seeger") {
        cube([490,5,10]);
        translate([0,-10,10])
        cube([490,15,5]);
    }
    if (Typ == "Tirol") {
        translate([0,-10,7])
        cube([450,15,20]);
    }
}

module Stahltraeger() {
    if (Typ == "Seeger") {
        if (Ueberstand) {
            difference() {
                l= 520;
                union() {
                    translate([0,0.5,10])
                    cube([l,5,18]);
                    
                    translate([0,-1.5,10])
                    cube([l,9,5]);
                    
                    translate([0,-1.5,28])
                    cube([l,9,5]);
                }
                Lochreihe();
            }
        } else {
            difference() {
                l= 490;
                union() {
                    translate([0,0.5,10])
                    cube([l,5,18]);
                    
                    translate([0,-1.5,10])
                    cube([l,9,5]);
                    
                    translate([0,-1.5,28])
                    cube([l,9,5]);
                }
                Lochreihe();
            }
       }
   }
   
   if (Typ == "Tirol") {
        translate([0,Dachtiefe-302,0])
        cube([450,17.7,25]);
   }
   
}

module Stuetze() {
    if (Typ == "Seeger") {
         translate([0,-283,0])
         cube([7,7,Dachhoehe+10]);
   }
    if (Typ == "Tirol") {
         translate([0,-Dachtiefe-25,0])
         cube([15,17.7,Dachhoehe]);
   }
}

module Glas() {
    if (Typ == "Seeger") {
        %cube([95,320,3]);
    }
    if (Typ == "Tirol") {
        translate([0,10,0])
        %cube([74,Dachtiefe-10,3]);
    }
}

module Glasdach() {
    if (Typ == "Seeger") {
        for (i=[0:1:4])
            translate([97*i,0,0])
            Glas();
    }
    if (Typ == "Tirol") {
        for (i=[0:1:5])
            translate([75*i,0,0])
            Glas();
    }
}

module Aluleiste(){
    if (Typ == "Seeger") {
        cube([6,320,2]);
    }
    if (Typ == "Tirol") {
        translate([0,10,8])
        cube([6,Dachtiefe-10,2]);
    }
}

module Aluleisten() {
    if (Typ == "Seeger") {
        for (i=[0:1:5])
            translate([96.5*i,0,0])
            Aluleiste();
    }
    if (Typ == "Tirol") {
        for (i=[0:1:6])
            translate([74*i,0,0])
            Aluleiste();
    }
}

module Quertraeger() {
    if (Typ == "Seeger") {
        cube([7,320,7]);
    }
    if (Typ == "Tirol") {
        translate([0,10,0])
        cube([10,Dachtiefe-10,15]);
    }
}

module Glasstuetze() {
    if (Typ == "Seeger") {
        for (i=[0:1:5])
            translate([96.5*i,0,0])
            Quertraeger();
    }
    if (Typ == "Tirol") {
        for (i=[0:1:6])
            translate([73.3*i,0,0])
            Quertraeger();
    }
}

module Rohr(l) {
    $fn=60;
    difference() {
        cylinder(d=8,h=l);
        cylinder(d=5,h=l+5);
    }
}

module Regenrinne() {
    if (Typ == "Seeger") {
        difference() {
            cube([490,8,5]);
            translate([2,1.5,2])
            cube([486,5,5]);
            
            translate([14,4,-3])
            cylinder(d=5,h=8,$fn=60);
            
        }
        translate([4,4,-27])
        Rohr(27);
        
        rotate([60,0,0])
        translate([4,-20,-55])
        Rohr(41);
        
        translate([4,36,-272])
        Rohr(230);
    }
}

module Markisenkassette() {
    cube([450,20,20]);
}

module Markisenfuehrung() {
    translate([4,5,-Dachhoehe])
    cube([8,10,Dachhoehe]);
}

module Frontmarkise(l,c) {
    color(c)
    translate([6,8,-l*$t])
    cube([435,5,l*$t]);
}

module Unterdachmarkise(l,c1,c2) {
    rotate([-85,0,0])
    union() {
        for (i=[0:15:430])
        color(c1)
        translate([i,-20,300])
        translate([6,8,-l*$t])
        cube([15,5,l*$t]);
        
        for (i=[0:30:430])
        color(c2)
        translate([i,-20,300])
        translate([6,8,-l*$t])
        cube([15,5,l*$t]);
        
    }
}

module Front() {
    translate([0,-Dachtiefe-20,Dachhoehe])
        union(){
        if (Typ == "Tirol") {
            color(Dachfarbe) Markisenkassette();
            color(Dachfarbe) Markisenfuehrung();
            color(Dachfarbe) translate([434,0,0])
            Markisenfuehrung();
            Frontmarkise(250,"Lightgray");
            Unterdachmarkise(300,"Blue","Blue");
        }
    }
}

module Wand() {
    cube([540,30,500]);
}

module Fenster() {
    translate([70,-5,90])
    cube([172,50,150]);
}

module Tuer() {
    translate([266,-5,10])
    cube([172,50,230]);
}

module Hausfront() {
    difference() {
        color("White")
        union() {
            Wand();
            Fallrohr();
        }
        Fenster();
        Tuer();
    }
}

module Platte() {
    cube([59,39,3]);
}

module Boden() {
    color("Darkgray")
    translate([-20,0,0])
    difference() {
    union() {
        for (i=[0:1:9])
            for (j=[0:1:4])
            if (j%2 == 0) {
                translate([30,0,0])
                translate([(60*i),-40+(-40*j),0])
                Platte();
            }   
            else {
                translate([(60*i),-40+(-40*j),0])
                Platte();
            }
        for (i=[0:1:7])
            for (j=[5:1:5])
            if (j%2 == 0) {
                translate([30,0,0])
                translate([(60*i),-40+(-40*j),0])
                Platte();
            }   
            else {
                translate([(60*i),-40+(-40*j),0])
                Platte();
            }
        for (i=[0:1:6])
            for (j=[6:1:6])
            if (j%2 == 0) {
                translate([30,0,0])
                translate([(60*i),-40+(-40*j),0])
                Platte();
            }   
            else {
                translate([(60*i),-40+(-40*j),0])
                Platte();
            }
    }
        translate([-10,-301,-5])
        cube([40,300,10]);
        
        translate([600,-300,-5])
        cube([40,300,10]);
    }
}

module Stein() {
    cube([20,59,14]);
}

module Mauer() {
    
    color("Lightgray")
    union() {
        difference() {
        for (i=[0:1:3])
            for(j=[0:1:11])
            if (j%2 != 0) {
                translate([0,-30,0])
                translate([-10,-35-(60*i),(15*j)])
                Stein();
            }
            else {
                translate([-10,-35-(60*i),(15*j)])
                Stein();
            }
            translate([-15,-335.5,0])
            cube([30,120,200]);
            
            translate([-15,-5.5,0])
            cube([30,120,200]);
        }
        
        difference() {
            translate([0,-120,0])
            for (i=[0:1:3])
                for(j=[0:1:7])
                if (j%2 != 0) {
                    translate([0,-30,0])
                    translate([-10,-35-(60*i),(15*j)])
                    Stein();
                }
                else {
                    translate([-10,-35-(60*i),(15*j)])
                    Stein();
                }
            translate([-15,-455.5,0])
            cube([30,120,200]);
        }
    }
}


module Rasen() {
    color("Lightgreen")
    translate([10,-580,0])
    cube([360,300,5]);
}

module Kies() {
    color("White")
    translate([370,-580,0])
    cube([210,380,2]);
}

module Fallrohr() {
    translate([515,-10,0])
    cylinder(d=15,h=500, center=false);
}

module Trittstein() {
    cube([30,20,1.5]);
}

module Weg() {
    translate([520,-260,3])
    Trittstein();
    
    translate([510,-320,3])
    Trittstein();
    
    translate([490,-380,3])
    Trittstein();
    
    translate([470,-440,3])
    Trittstein();
}

module Brunnen() {
    translate([405,-340,12])
    union() {
        difference() {
            cylinder(d=60,h=20, center=true);
            translate([0,0,5])
            cylinder(d=40,h=20, center=true);
        }
        translate([0,0,25])
        cylinder(d=15,h=50, center=true);
    }
}

module Tisch() {
    color("Gray")
    union() {
        translate([80,-190,70]) {
            cube([170,100,5]);
            for (i=[0:1:1])
                for (j=[0:1:1])
                    translate([5+i*155,5+j*85,-70])
                    cube([5,5,70]);
            }
        }
}

module Stuhl() {
    color("Gray")

    union(){
        translate([0,0,40])
        cube([60,60,5]);
        
        // Stuhlbeine
        rotate([-5,0,0])
        translate([5,0,0])
        cube([5,5,42]);
        
        rotate([-5,0,0])
        translate([50,0,0])
        cube([5,5,42]);
        
        rotate([5,0,0])
        translate([5,55,-5])
        cube([5,5,42]);      
        
        rotate([5,0,0])
        translate([50,55,-5])
        cube([5,5,42]);
        
        // Stuhllehne
        rotate([-8,0,0])
        translate([2.5,45,50])
        cube([55,5,60]);
        
        
    }
}

module Tischgruppe() {
    Tisch();
    translate([140,-130,0])
    Stuhl();
    
    translate([200,-160,0])
    rotate([0,0,180])
    Stuhl();
    
    translate([220,-120,0])
    rotate([0,0,270])
    Stuhl();
    
    translate([120,-180,0])
    rotate([0,0,90])
    Stuhl();
}

module Terrassendach() {
    color(Dachfarbe)
    {
        translate([0,0,Dachhoehe])
        union() {
            translate([0,0,28])
            Wandtraeger();
            translate([0,-283,0])
            Stahltraeger();    
            
            if (Typ == "Seeger") {
                rotate([2,0,0])
                translate([0,-314,43])
                union(){
                    Glasstuetze();
                    translate([0.5,0,10])
                    Aluleisten();
                }
            }
            
            if (Typ == "Tirol") {
                rotate([5,0,0])
                translate([0,-294,35])
                union(){
                    Glasstuetze();
                    translate([0,0,10])
                    Aluleisten();
                }
            }
        }
                
        if (Typ == "Seeger") {
            Stuetze();
            if (Ueberstand)
                translate([513,0,0])
                Stuetze();
            else
                translate([483,0,0])
                Stuetze();
        }
        
        if (Typ == "Tirol") {
            translate([0,20,0])
            Stuetze();
            translate([435,20,0])
            Stuetze();
        }
        
     }

    if (Typ == "Seeger") {
        translate([4,0,250])
//        color("White")
        rotate([2,0,0])

        translate([0,-314,50])
        union() {
            Glasdach();
        }
    }
    if (Typ == "Tirol") {
        translate([0,0,250])
//        color("White")
        rotate([5,0,0])

        translate([0,-294,50])
        union() {
            Glasdach();
        }
    }    
    color(Dachfarbe)
    translate([0,-324,285])
    Regenrinne();
    
    if (Typ == "Tirol") {
        Front();
    }
}

module Ast() {
    translate([0,-5,235])
    rotate([80,0,0])
    cylinder(d=15,h=80);
    translate([0,-65,250])
    rotate([100,0,0])
    cylinder(d=10,h=80);
}

module Baum(bh,bb){
    difference() {
        color("Moccasin")
        translate([40,-380,0])
        union(){
            cylinder(d=30,h=bh);
            for (i=[0:30:360])
                rotate([0,0,i])
                Ast();
        }
        translate([-40,-330])
        cube([250,150,300]);
        translate([-162,-530])
        cube([150,250,300]);
    }
}


translate([12,-5,0])
Terrassendach();
if (Hauswand) Hausfront();
if (Boden) Boden();
if (Mauer) Mauer();
if (Rasen) Rasen();
if (Kies) Kies();
if (Weg)  color("Darkgray") Weg();
if (Brunnen) color("Darkgray") Brunnen();
if (Tischgruppe) Tischgruppe();
if (Baum) Baum(240,120);

