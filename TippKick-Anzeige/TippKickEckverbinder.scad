// Tipp Kick Eckverbinder

module Knubbel() {
    rotate([0,0,0])
    translate([0,0,26])
    cylinder(d=3,h=1,$fn=40);
}

module Teller() {
    rotate([0,0,0])
    translate([0,0,0])
    cylinder(d=12,h=3.5,$fn=40);
}

module Stange_lang() {
    rotate([0,0,0])
    translate([0,0,0])
    cylinder(d=2.5,h=27,$fn=40);
}

module Stange_kurz() {
    rotate([0,0,0])
    translate([0,0,0])
    cylinder(d=3.8,h=11,$fn=40);
}

module Eckverbinder() {
    Knubbel();
    Stange_lang();
    Stange_kurz();
    Teller();
}

Eckverbinder();
