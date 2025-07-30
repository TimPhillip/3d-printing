// 3018 Tischadapter

module Loch() {
    cylinder(d=6,h=20,center=true);

}

module Tisch() {
    difference() {
        cube([60,160,9.85],center=true);
        translate([-16,0,0])
        Loch();
        translate([+16,0,0])
        Loch();
        translate([-16,44,0])
        Loch();
        translate([+16,44,0])
        Loch();
        translate([-16,-44,0])
        Loch();
        translate([+16,-44,0])
        Loch();

        translate([0,0,-4.5])
        cube([80,10,9.85],center=true);
    }
}

Tisch();