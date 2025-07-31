// Laser Halterunf Fuss


module Grundplatte() {
    translate([-3,-3,0])
    cube([45,45,3]);
}


module Wand() {
    
        cube([6,45,15],center=true);

}
module Wandinnen() {
        cube([2.25,45,16], center=true);
    }

module L() {
    Wand();
    translate([45/2-3,45/2-3,0])
    rotate([0,0,90])
    Wand();
}
module Linnen() {
    Wandinnen();
    translate([45/2-2.25/2,45/2-2.25/2,0])
    rotate([0,0,90])
    Wandinnen();
}

module Loch(){
    $fn=60;
    translate([45/2-6,45/2-6,-5])
    cylinder(d=3,h=10);
}

module Halterung(){
    difference(){
        union(){
            translate([-3, -3, 0])
            cube([45, 6, 10]);
            translate([-3, -3, 0])
            cube([6, 45, 10]);
            
        }
        union(){
            translate([-2.25/2, -2.25/2, 0])
            cube([40, 2.25, 22]);
            translate([-2.25/2, -2.25/2, 0])
            cube([2.25, 40, 22]);
            
        }
    }
    difference() {
        Grundplatte();
        Loch();
        rotate([0,0,45])
        translate([60/2,-60/2,-5])
        cube([60,60,20]);
    }
}
Halterung();