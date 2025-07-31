// Laser Halterunf Fuss


module Grundplatte() {
    translate([-18,-3,0])
    cube([15,45,3]);
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
    }
    difference() {
        union() {
            Grundplatte();
            translate([45-6,0,0])
            rotate([0,0,90])
            Grundplatte();
        }
        translate([0,-25,0])
        Loch();
        translate([-25,0,0])
        Loch();
        rotate([0,0,45])
        translate([-54.25,-23,-3])
        cube([50,50,60]);
    }
}
Halterung();