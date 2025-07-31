// Bande V2

Bande = true;
Verbinder = false;
Torbande_links = false;
Torbande_rechts = false;


s_out=0.235;
s_inn=0.205;
//s=1;

module Torbande_links() {
    Bande(14);
    Verbinder(26);
    translate([0,0,13])
    Endstueck();
//    Torkuhle();
}

module Torbande_rechts() {
    translate([0,0,1])
    Bande(14);
    translate([0,0,15])
    Verbinder(26);
    Endstueck();
//    Torkuhle();
}

module Endstueck() {
    hull()
    scale(s_out)
    BandeKontour(1,s_out);
}

module Torkuhle() {
    rotate([0,90,0])
    translate([-22.5,4,-6])
    difference() {
        cylinder(d=8,h=50,center=true);
        cylinder(d=5,h=50,center=true);
        translate([-5,0,-40])
        cube([10,10,100]);
    }
}

module BandeKontour(h,s) {
    translate([0,-188,0])
    linear_extrude(height=h/s) 
    import (file = "Bandekontour.dxf");
}

module Bande(h) {
    difference() {
        scale(s_out)
        BandeKontour(h,s_out);
        translate([1.5,1.0,-1.0])
        scale(s_inn)
        BandeKontour(h+2,s_inn);
        
        translate([1.5,26.5,-1])
        cube([8.5,2.5,h+2]);
    }
}

module Verbinder(h) {
    translate([0,0,-0.5])
    scale(s_out)
    BandeKontour(1,s_out);

    translate([1.5,2.05,-h/2-0.5])
    scale(s_inn-0.002)
    BandeKontour(h,s_inn);

    hull() {
        translate([1.5,2.05,-h/2-0.5])
        scale(s_inn-0.002)
        BandeKontour(1,s_inn);
    }

    hull() {
        translate([1.5,2.05,h/2-1.5])
        scale(s_inn-0.002)
        BandeKontour(1,s_inn);
    }
}

if (Bande) Bande(135);
if (Verbinder) translate([0,0,-1]) Verbinder(60);
if (Torbande_links) Torbande_links();
if (Torbande_rechts) Torbande_rechts();

/*    
scale(s_inn)
BandeKontour(60+2,s_inn);



color("Green")
cube([20,26,50]);

color("Red")
translate([0,26,0])
cube([8,30,50]);


color("Yellow")
translate([0,0,50])
cube([10,1,50]);


*/
