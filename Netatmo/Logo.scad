// Netatmo Logo

front=true;
back=true;

module Schrift(Text) {
    linear_extrude(1.2)
    text(size=8,Text,halign="center");
}

module front() {
    color("Black")
translate([0,0,-0.30])
Schrift("Netatmo");
}

module frontLoch() {
    color("Black")
translate([0,0,-0.45])
Schrift("Netatmo");
}

module back() {
    color("White")
translate([0,3.5,0])
cube([45,9,0.6],center=true);
}

module cover() {
    difference() {
        back();
        frontLoch();
    }
}

if (front) front();

if (back) cover();