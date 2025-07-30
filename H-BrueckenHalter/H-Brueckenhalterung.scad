// H-Brückenhalterung

/*[ quadratischer Halter ]*/
// zeige quadratischer Halter//
show_quadrat = true;

// Q= Größe des Quadrats
Q=45;       
// L = Lochabstand für H-Brücke
L=37; 

/*[ rechteckiger Halter ]*/
// zeige rechteckiger Halter//
show_rechteck = false;
// Breite des Rechtecks
R1 = 20;
// Länge des Rechtecks
R2 = 30;
// Lochabstand breite Seite
L1 = 15;
// Lochabstand lange Seiter
L2 =24;
/*[ Befestigungswinkel ]*/
// A = Abstand des Befestigungswinkels von der Mitte
A= 21;
// LAW = Abstand der Löcher auf Winkel
LAW = 20;

/*[ Löcher ]*/
// DQ = Durchmesser Löcher auf Platte
DP = 2;
// DW = Durchmesser Löcher auf Winkel
DW = 3;

if (show_quadrat) {
    Halter();
} else {
    Rechteck();
}

module Halter() {
    $fn=30;
    difference() {
        cube([Q,Q,3],center=true);
        
        translate([L/2,L/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
        
        translate([-L/2,-L/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
        
        translate([L/2,-L/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
        
        translate([-L/2,L/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
    }    
    

    translate([-A,0,-8])
    rotate([0,90,0])
    difference() {
        cube([15,L-DP,3], center=true);

        translate([0,LAW/2,0])
        rotate([0,0,90])
        cylinder(d=DW,h=5, center=true);
        
        translate([0,-LAW/2,0])
        rotate([0,0,90])
        cylinder(d=DW,h=5, center=true);
        
    }
}

module Rechteck() {
    $fn=30;
    difference() {
        cube([R1,R2,3],center=true);
        
        translate([L1/2,L2/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
        
        translate([-L1/2,-L2/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
        
        translate([L1/2,-L2/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
        
        translate([-L1/2,L2/2,-1])
        rotate([0,0,90])
        cylinder(d=DP,h=7, center=true);
    }    
    

    translate([-A,0,-8])
    rotate([0,90,0])
    difference() {
        cube([15,L2-DP,3], center=true);

        translate([0,LAW/2,0])
        rotate([0,0,90])
        cylinder(d=DW,h=5, center=true);
        
        translate([0,-LAW/2,0])
        rotate([0,0,90])
        cylinder(d=DW,h=5, center=true);
        
    }
}