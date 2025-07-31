// Radial Ventilator
$fn = 60;

/* [ Maße ] */
Durchmesser = 33;
Hohe = 12;
Wandstarke = 2;
Motorachse = 2;
Flugelwand = 1;

/* [ Komponenten] */
show_ventilator = true;

// Steuerung für Druck --------------------------

if (show_ventilator) ventilator();
    

// Module ---------------------------------------
module ventilator() {
    Lochscheibe();
    for (i=[0,1,2,3,4,5,6,7])
    rotate([0,0,i*360/8])Flugel();
}

module Lochscheibe() {
    difference() {
        translate([0,0,Wandstarke/2])
        cylinder(d=Durchmesser, h=Wandstarke, center=true);
        cylinder(d=Motorachse, h=Wandstarke+2, center=true); 
    }
        translate([0,0,Hohe/2])
        difference() {
            cylinder(d=Motorachse*3, h=Hohe, center=true); 
            cylinder(d=Motorachse, h=Hohe+2, center=true); 
        }
}

module Flugel() {
        rotate([0,0,20])
        translate([0,0,Hohe/2])
        scale([1,2,1])
    difference() {
        cylinder(d=Durchmesser/2, h=Hohe, center=true);
        cylinder(d=Durchmesser/2-2*Flugelwand, h=Hohe+Wandstarke, center=true);
        translate([0,Durchmesser/4,0])
        cube([Durchmesser,Durchmesser/2,Hohe+1], center=true);
        translate([-Durchmesser/4,0,0])
        cube([Durchmesser/2,Durchmesser,Hohe+1], center=true);
       }
}