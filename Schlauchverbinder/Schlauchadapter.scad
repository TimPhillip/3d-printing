// Schlauchadapterer

Laenge = 20;

Leitung_oben = true;
Leitung_unten = true;
Mitte = true;
Haken1 = true;
Haken2 = false;


if (Leitung_oben) rotate([90,0,0]) Leitung_oben();
if (Leitung_oben) rotate([90,0,0]) Leitung_unten();
if (Mitte) rotate([90,0,0]) Mitte();
if (Haken1) rotate([90,0,0]) Haken1();
if (Haken2) rotate([90,0,0]) Haken2();

module Leitung_oben() {
    $fn=30;
    translate([0,0,Laenge/2])
    difference() {
        cylinder(d=4.5, h=Laenge, center=true);
        cylinder(d=3, h=Laenge+2, center=true);
    }
        
} 

module Leitung_unten() {
    $fn=30;
    translate([0,0,-4/2])
    difference() {
        cylinder(d=5, h=4, center=true);
        cylinder(d=3.5, h=4+2, center=true);
    }
        
} 


module Mitte() {

    difference() {
        $fn=30;
        // Mitte
        cylinder(d=12,h=3, center= true);
        cylinder(d=3, h=Laenge+2, center=true);
    }
}

module Haken1() {
    $fn=30;
    
    difference() {
        union() {
            translate([0,0,6])
            cylinder(d=5.0,h=1, center= true);
        }
        translate([0,0,Laenge/2])
        cylinder(d=3, h=Laenge+2, center=true);
    }
}

module Haken2() {
    $fn=30;
    
    difference() {
        union() {
            translate([0,0,9])
            cylinder(d=5.0,h=1, center= true);
        }
        translate([0,0,Laenge/2])
        cylinder(d=3, h=Laenge+2, center=true);
    }
}