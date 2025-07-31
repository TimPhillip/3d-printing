// Jungwippe

Links = true;
Rechts = true;

module Wippe() { 

    translate([6,-25,0])
    import("Jung_560_Cover.stl");
}


module WippeLinks() {
    difference() {
        Wippe();
        translate([0,49.75,0])
        cube([100,100,100],center=true);
    }
}

module WippeRechts() {
    difference() {
        Wippe();
        translate([0,-49.75,0])
        cube([100,100,100],center=true);
    }
}

if (Links) WippeLinks();
if (Rechts) WippeRechts();

