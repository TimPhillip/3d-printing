
// Pyramide
// --------
/* [Farben der Pyramide einzeln anwählbar ja/nein] */

// Flüegel 
color_Fluegel = "White";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Kuppel = "White";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Adapter = "White";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Achse = "White";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Teller = "White";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Traeger = "CadetBlue";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Traegerblende = "CadetBlue";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Gehause = "CadetBlue";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Kerzenhalter = "CadetBlue";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Eiadapter = "CadetBlue";  // [White,Teal,CornflowerBlue,CadetBlue] 
color_Boden = "CadetBlue";  // [White,Teal,CornflowerBlue,CadetBlue] 

/*-------------------------------------------*/


/* [Teile der Pyramide zunächst sichtbar] */

// runde Bodenplatte anzeigen 
Boden = true; 

// Antriebsgehäuse für Motor
Gehause = true;

// Achse der Pyramide
Achse = true;

// Drehteller unten auf dem die Figuren platziert sind
Teller1 = true;

// Seitenträger
Trager = true;

// Traegerblende
Traegerblende = true;

// Rad
Rad =true;

// Achsadapter
Adapter=true;

// alle Kerzenhalter
alleKerzen = true;


// Kuppel zur Flügelbefestigung
Kuppel =true;

// Eier mit Beleuchtungshalterung
Eier = true;

/* [Teile der Pyramide zunächst unsichtbar] */

// Fluegel
Fluegel = false;

// Ein Kerzenhalter
Kerzenhalter = false;

// Ei mit Beleuchtungshalterung
Ei = false;

// Biegung für LED Montage
LedBiegung = false;

// Drehteller oben auf dem die Figuren platziert sind
Teller2 = false;

// Motor
Motor=false;

// Motorhalterung
Motorhalter=false;

// Batteriehalterung
Batteriehalter=false;

/*-------------------------------------------*/

/* [Durchmesser der Pyramidenteile] */

// Durchmesser des runden Antriebsgehäuses in mm 
dGehause = 130;
dBoden = dGehause - 6;
// Durchmesser der runden Figurentellers in mm 
dTeller1 = 130;
// Durchmesser der runden Figurentellers in mm 
dTeller2 = 100;
// Durchmesser der runden Figurentellers in mm 
dAchse = 8;    

/* [Höhen der Pyramidenteile] */
// Höhe des Antriebsgehäuses
hGehause = 32; //   [20:50]
// Höhe der Achse
hAchse = 150; //    [50:10:200]


/*-------------------------------------------*/

/* [Position der Elemente in der Höhe] */
// Position des unteren Figurenteller in mm 
pTeller2 = 102;   // [0:1:150]
// Position des Achsadapter in mm
pAdapter = 42; // [0:1:150]
// Position des unteren Figurenteller in mm 
pTeller1 = 37;   // [0:1:150]
// Position der Achse in mm
pAchse = 30; // [0:1:150]
// Position der runden Bodenplatte in mm 
pBoden = 0;     // [0:1:150]]


/*-------------------------------------------*/


module Main() {
}

/*-------------------------------------------*/
// Konstanten

$fn = 50;

DickeBoden = 1.2;
DickeTeller = 3;
DickeAdapter = dAchse+6;
HoheAdapter = 30;
hFluegel = 1.8;
Schlupf = 0.4;

module Gehause() {
    translate([0,0,hGehause/2])
    color(color_Gehause)
    difference() {
        // Aussen
        cylinder(d=dGehause, h=hGehause, center=true);
        // Innen Hohlraum
        translate([0,0,-2])
        cylinder(d=dGehause-20, h=hGehause, center=true);
        
        // Einlass für Bodenplatte
        translate([0,0,-hGehause/2])
        cylinder(d=dGehause-4, h=4, center=true);
        
        // Loch für Achsadapter
        cylinder(d=DickeAdapter+7, h=hGehause+3, center=true);
        
        // Befestigung und Kabelkanal für Kerzenhalter 
        for (i=[0:-120:-360]) rotate([0,0,i])
        {
            Befestigungsloch();
            translate([0,0,-11])
            Kabelkanal();
        }
        
        // Befestigung für Träger
        rotate([0,0,180])
        Befestigungsloch();
        
        // Befestigungsloch für Bodenplatte
        for (i=[45:90:360]) rotate([0,0,i])
        translate([-dGehause/2+5,0,-30])
        cylinder(d=2, h=40, center=true);
        
        // Kabelkanal zum Schater
        translate([-80,0,-1])
        rotate([0,90,0])
        cylinder(d=8, h=100, center=true);

        
    }
}



module Bodenplatte() {
    translate([0,0,DickeBoden/2])
    color(color_Boden)
    union() {
        difference() {
            cylinder(d=dBoden, h=DickeBoden, center=true);

            // Befestigungsloch für Bodenplatte
            for (i=[45:90:360]) rotate([0,0,i]){
                translate([-dGehause/2+5,0,0])
                cylinder(d=2, h=40, center=true);
                translate([-dGehause/2+5,0,-20])
                cylinder(d=3.5, h=40, center=true);
            }
        }
        
        // Platzierungshilfe für Motorhalter
        translate([0,0,1.2])
        difference(){
            cylinder(d=70,h=2, center=true);
            cylinder(d=63.5,h=3, center=true);
        }
    }
}

module Figurenteller(dT) {
    if (dT == 1) {
        color(color_Teller)
        difference() {
            cylinder(d=dTeller1, h=DickeTeller, center=true);
            cylinder(d=DickeAdapter+1, h=DickeTeller+4, center=true);
            for (i=[0:120:360]) rotate([0,0,i])translate([dTeller1/4,0,0]) cylinder(d=3.6,h=20, center=true);
        }
    } else {
       color("Lightgray")
       difference() {
            cylinder(d=dTeller2, h=DickeTeller, center=true);
            cylinder(d=dAchse+1, h=DickeTeller+4, center=true);
        }
    }
}


module Achse() {
    translate([0,0,hAchse/2])
    color(color_Achse)
    cylinder(d=dAchse,h=hAchse, $fn = 6, center=true);
}

module Trager() {
    TraegerBreite=16;
    color(color_Traeger)
    union() {
        
        difference() {
            translate([-180,TraegerBreite/2,58])
            rotate([90,0,0])
            linear_extrude(height = TraegerBreite) {
                    scale([0.33,0.44,1])
                    import("Traeger.dxf");
            }
            translate([-115,0,20])
            rotate([0,90,0])
            SchalterLoch();
            
            // Kabelkanal zum Schater
            translate([-80,0,15])
            rotate([0,90,0])
            cylinder(d=8, h=100, center=true);
        }
        
        // Anschluss an Gehäuse
        difference() {
            translate([-dGehause/2-2.5,0,16])
            cube([6,TraegerBreite,hGehause],center=true);
            rotate([0,0,180])
            translate([0,0,16])
            Befestigungsloch();
            
            // Kabelkanal zum Schater
            translate([-80,0,15])
            rotate([0,90,0])
            cylinder(d=8, h=100, center=true);
        }
        
        // Loch für Achsadapter
        translate([0,0,171])
        difference(){
            cylinder(d=50,h=14,center=true);
            cylinder(d=dAchse+1,h=16,center=true);
        }
    }
}


module Fluegel() {
    color(color_Fluegel)
    translate([0,-98,190])
    rotate([0,-45,0])
    union() {
        translate([-127,0,-1])
        linear_extrude(height = hFluegel) {
                scale([0.18,0.34,1])
                import("Fluegel1.dxf");
        }


    }
    
}

module Motor(){
    color("Blue")
    difference() {
        translate([0,8.25,DickeBoden+5])
        union() {
            translate([0,0,5.9+5+1.4])
            cylinder(d=32.5, h=11.8, center=true);
            translate([0,0,5+1.4])
            cylinder(d=25.5, h = 2.8, center=true);
            translate([0,0,0])
            cylinder(d=24.1, h = 10, center=true);
            
            translate([23.5,0,11.8+5])
            cylinder(d=8.2, h=2.6, center=true);
             
            translate([-23.5,0,11.8+5])
            cylinder(d=8.2, h=2.6, center=true);
            
            translate([0,0,11.8+5])
            cube([47,8.2,2.5],center=true);
            
            translate([0,-8.25,11.8+5+1.5])
            cylinder(d=10, h=1, center=true);
            
            translate([0,-8.25,11.8+5+4.5])
            cylinder(d=5, h=6, center=true);
            
            
        }
        translate([23.5,8.25,11.8+5+11])
        cylinder(d=3.3,h=6,center=true);

        translate([-23.5,8.25,11.8+5+11])
        cylinder(d=3.3,h=6,center=true);

    }
}

module Motorhalter() {
    difference() {
        translate([0,0,DickeBoden+11.75])
        cylinder(d=62,h=23.5,center=true);
        translate([0,0,0.5])
        scale([1.05,1.05,1])Motor();
        translate([0,16,DickeBoden+2.25])
        cube([5,35,5],center=true);
    }
}

module Adapter() {
    color(color_Adapter)
    difference() {
        union(){
            cylinder(d=DickeAdapter,h=HoheAdapter, center=true);
            translate([0,0,-HoheAdapter/2+4])
            cylinder(d=DickeAdapter+6,h=8, center=true);
        } 
        // Achsloch
        translate([0,0,HoheAdapter/2])
        cylinder(d=dAchse+2*Schlupf,h=HoheAdapter, $fn=6, center=true);
        
        // Loch zum Motor
        translate([0,0,-1])
        cylinder(d=5+Schlupf,h=HoheAdapter, center=true);
    }
}

module Kerzenhalter() {
    color(color_Kerzenhalter)
    union() {
        translate([dGehause/2+30,0,15])
        difference() {
            cylinder(d=50,h=30,center=true);
            translate([0,0,5])
            cylinder(d=40,h=30,center=true);
            translate([-dGehause/2-40,0,-10])
            Kabelkanal();
       }
        difference(){
            translate([dGehause/2+3,0,15])
            cube([10,10,30], center=true);
            translate([0,0,15])
            Befestigungsloch();
            translate([0,0,5])
            Kabelkanal();
        }
    }
    
}

module Befestigungsloch() {
    rotate([90,0,90])
    translate([0,10,dGehause/2])
    cylinder(d=2, h=30, center=true);
    rotate([90,0,90])
    translate([0,-10,dGehause/2])
    cylinder(d=2, h=30, center=true);
}

module Kabelkanal() {
    rotate([90,0,90])
    translate([0,10,dGehause/2+5])
    cylinder(d=4, h=40, center=true);
}

module SchalterLoch() {
    cube([20,12.5,8], center=true);
    translate([0,0,12])
    cube([22,14.5,16], center=true);
}

module Kuppel(){
    translate([0,0,180])
    color(color_Kuppel)
    difference() {
        scale([0.188,0.188,0.35])
        union() {
            rotate_extrude() {
                    translate([-333.5,60,0])
                    scale([1,0.3,1])
                    import("Kuppel.dxf");
            }
        }
        
        // Befestigungsloch für Flügel
        for (i=[0:45:360])
        translate([0,0,-180])
        rotate([0,0,i])
        FluegelLoch();
        
        // Achsloch
        translate([0,0,-60])
        cylinder(d=dAchse+Schlupf,h=hAchse, $fn = 6, center=true);

    }
}

module FluegelLoch() {
    translate([-1,-35,189])
    rotate([0,-45,0])
    hull() {
        cube([16.3,1,2.0], center=true);
        translate([0,20,0])
        cube([12,1,2.0], center=true);
    }
}

module Ei() {
    color(color_Eiadapter)
    union() {
/*
        difference() {
            union(){
                import("egg_open.stl");
            }
            translate([0,0,-50])
            cube([50,50,50], center=true);
        }
*/
        translate([dGehause/2+29.5,0,11])
        difference() {
            cylinder(d=38,h=20, center=true);
            translate([0,0,-4])
            cylinder(d=30,h=20, center=true);
            translate([0,-20,-4])
            cube([5,20,20], center=true);
            translate([0,0,4])
            cylinder(d=7,h=20, center=true);
            
        }
    }
}

module Traegerblende() {
    color(color_Traegerblende)
    translate([0,0,164])
    difference() {
        cylinder(d=52,h=2,center=true);
        translate([0,0,1])
        cylinder(d=50.6,h=2,center=true);
        translate([-33.5,0,9])
        cube([30,16,25],center=true);
        
        cylinder(d=dAchse+1,h=16,center=true);
    }
}

module LedBiegung() {

    translate([dGehause/2+29.5,0,0])
    difference(){
        rotate([0,90,0])
        cylinder(d=28,h=8,center=true);
        rotate([0,90,0])
        translate([-3,-10,0])
        cylinder(d=25,h=6,center=true);
        translate([0,0,-15])
        cube([30,30,30],center=true);
        cylinder(d=5.5, h=40, center=true);
    }

}

module Batteriehalter() {
    union(){
        rotate([0,180,0])
        translate([39,0,-8])
        import("BatteriehalterAAA.stl");
        rotate([0,180,180])
        translate([39,0,-8])
        import("BatteriehalterAAA.stl");

        difference() {
            translate([0,0,8])
            cube([64,74,13], center=true);  
            cylinder(d=63, h=30, center=true); 
            rotate([0,90,0])
            translate([-5,34,0])
            cylinder(d=4,h=70,center=true);  
            rotate([0,90,0])
            translate([-5,-34,0])
            cylinder(d=4,h=70,center=true);  
        }
    }
}

module Pyramide() {
    
    if (Gehause) Gehause();
    if (Boden)  translate([0,0,pBoden]) Bodenplatte();
    if (Teller1) translate([0,0,pTeller1]) Figurenteller(1);
    if (Teller2) translate([0,0,pTeller2]) Figurenteller(2);
    if (Achse) translate([0,0,pAchse]) Achse();
    if (Trager) Trager();
    if (Traegerblende) Traegerblende();
    if (Fluegel) rotate([0,0,0])Fluegel();
    if (Rad) for (i=[0:45:360]) rotate([0,0,i])Fluegel();
    if (Motor) Motor();
    if (Motorhalter) Motorhalter();
    if (Adapter) translate([0,0,pAdapter]) Adapter();
    if (Kerzenhalter) Kerzenhalter();
    if (alleKerzen) for (i=[0:-120:-360]) rotate([0,0,i])Kerzenhalter();    
    if (Kuppel) Kuppel();
    if (Ei) Ei(); 
    if (Eier) for (i=[0:120:360]) rotate([0,0,i]) Ei();
    if (LedBiegung) LedBiegung();
    if (Batteriehalter) Batteriehalter();
 }


/* Main */

Pyramide();