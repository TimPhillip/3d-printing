// Kuechenstangenhalerung

$fn=60;

module rohr() {
    difference() {
        cylinder(d=19,h=38);
        translate([0,0,4])
        cylinder(d=14,h=40);
    }
}

difference() {
    rohr();
    
    rotate([90,0,0])
    translate([0,38-7-5.25,0])
    cylinder(d=10.5,h=30,center=true);
    
    cylinder(d=6.5,h=30,center=true);
}