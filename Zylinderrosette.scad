// Zylinderrosette
//

$fn =120;


module Zylinder() {
    union(){
        translate([0,-10,-2])
        cylinder(d=15,h=8);
        translate([-5,-5,-2])
        cube([10,20,8]);

    }       
}

module Loch() {
        #translate([0,0,-2])
        cylinder(d=3,h=8);   
        translate([0,0,4])
        cylinder(d=5,h=2);   
}

module Rosette () {
        minkowski()
        {
            translate([0,0,0])
            sphere(d=1);
            cylinder(d=50,h=5);
        }
}
union(){
    
    difference(){
        Rosette();
        Zylinder();
        translate([15,0,0])
        Loch();
        translate([-15,0,0])
        Loch();
    }  

}