// Wassermuehle

/* [Gesamtmasse] */
// Breite der Muehle
BB = 600;
// Laenge der Muehle
LL = 800;
// Hoehe der Muehle
HH = 600;
// Wandstaerke der Muehle
WW = 5;

/* [Fachwerk] */
// Breite des Fachwerkbalken
FB = 30;
// Abstand der Fachwerkbalken BA = BB/3
BA = 200;

/* [Anzeige der Elemente] */
// Vorne
Vorne = true;
// Fachwerk vorne
FachwerkVorne = true;


module VorneKontour() {
    difference(){
        cube([BB,WW,HH],center=true);
        rotate([0,-45,0]) translate([0,0,BB/1.175]) 
        cube([BB,WW+2,HH],center=true);
        rotate([0,45,0]) translate([0,0,BB/1.175]) 
        cube([BB,WW+2,HH],center=true);
    }
}

module FachwerkVorne() {
    
        // senkrechte Baken
        translate([-BB/2+FB/2,0,0])
        Balken(HH/2);
        translate([BB/2-FB/2,0,0])
        Balken(HH/2);
        translate([BB/2-BA,0,0])
        Balken(HH*0.8);
        translate([-BB/2+BA,0,0])
        Balken(HH*0.8);
    
        // waagrechte Balken
        rotate([0,90,0])
        union() {
            translate([-FB/2,0,-BB/2])
            Balken(BB);
            translate([-FB/2-BA,0,-BB/2])
            Balken(BB);
            translate([-FB/2-2*BA,0,-BB*0.3])
            Balken(BB*0.6);
       }    
       
        // Dachbalken
        translate([BB/2-FB/2,0,HH/2-FB/3])
        rotate([0,-45,0])
        Balken(BB*0.7);
            
        translate([-BB/2+FB/2,0,HH/2-FB/3])
        rotate([0,45,0])
        Balken(BB*0.7);
            
        // schraege Balken
        rotate([0,25,0])
        translate([80,0,0])
        Balken(BB*2/3);
        

}

module Balken(BH) {
    translate([0,0,BH/2])
    cube([30,WW+2,BH],center=true);
}

module Vorne() {
    
    difference() {
        translate([0,0,HH/2])
        VorneKontour();
        FachwerkVorne();
    }
}

if (Vorne) color("White") Vorne();

if (FachwerkVorne)
    color("Brown")
    FachwerkVorne();
