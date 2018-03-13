


module abzeichen () {
    $fn = 50;
    offset= 10;
    rad=5;
    raum = 5;
    difference() {
        cube([50,15,3]);
        translate([1,1,2])
        cube([48,13,2]);
        translate([0*rad+offset+0*raum,7.5,1])
        cylinder(r=rad,h=3);
        translate([2*rad+offset+1*raum,7.5,1])
        cylinder(r=rad,h=3);
        translate([4*rad+offset+2*raum,7.5,1])
        cylinder(r=rad,h=3);
    }
};

module nippel() {
    offset= 10;
    rad=5;
    raum = 5;
    translate([0*rad+offset+0*raum,7.5,1])
    cylinder(r=rad,h=2);
};

abzeichen();



scale (0.98) nippel();