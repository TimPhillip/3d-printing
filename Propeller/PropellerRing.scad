// Ring-Propeller


import ("propeller75x10.stl");
union() {
    translate([0,0,-1.5])
    difference() {
        cylinder(d=75, h=12, center=true, $fn=60);
        cylinder(d=72.5, h=25, center=true, $fn=60);
    }
}