Laenge = 25;

Leitung = true;
Mitte = true;
Haken1 = true;
Haken2 = false;
Adapter = true;

if (Leitung) rotate([90,0,0]) Leitung();
if (Mitte) rotate([90,0,0]) Mitte();
if (Haken1) rotate([90,0,0]) Haken1();
if (Haken2) rotate([90,0,0]) Haken2();
if (Adapter) rotate([90,0,0]) Adapter();
    
module Leitung() {
    $fn=30;
    difference() {
        cylinder(d=4.5, h=Laenge, center=true);
        cylinder(d=3, h=Laenge+2, center=true);
    }
        
} 

module Mitte() {

    difference() {
        $fn=30;
        // Mitte
        rotate([90,0,0])
        cylinder(d=10,h=5, center= true);
        cylinder(d=3, h=Laenge+2, center=true);
    }
}

module Haken1() {
    $fn=30;
    
    difference() {
        union() {
            translate([0,0,10])
            cylinder(d=5,h=1, center= true);
        }
        cylinder(d=3, h=Laenge+2, center=true);
    }
}

module Haken2() {
    $fn=30;
    
    difference() {
        union() {
            translate([0,0,7])
            cylinder(d=5,h=1, center= true);
        }
        cylinder(d=3, h=Laenge+2, center=true);
    }
}

module Adapter() {
    $fn=30;

    translate([0,0,-10])
    difference() {
        union() {
            translate([0,0,-5])
            cylinder(d=15,h=10, center= true);
        }
        cylinder(d=4, h=Laenge+2, center=true);
        translate([0,0,-10])
        cylinder(d=6.8, h=Laenge-10, center=true);
    }
}   