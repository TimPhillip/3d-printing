// Jet-Turbine


import ("Modern_Turbine_SpinnerV2.stl");
union() {
    translate([0,0,+3.5])
    difference() {
        cylinder(d=23, h=7, center=true, $fn=60);
        cylinder(d=2, h=25, center=true, $fn=60);
    }
}