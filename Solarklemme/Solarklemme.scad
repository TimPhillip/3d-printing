// Solarkabelklemme


module Loch() {
    
   cylinder(d=4,h=20,center=true,$fn=40);
   translate([0,0,11])
   cylinder(d=6,h=20,center=true,$fn=40);

}

module Base(n) {
    
    difference() {
        cube([20+n*20,15,5],center=true);
        translate([-n*10,0,0])
        Loch();
        translate([n*10,0,0])
        Loch();
    }
    
    for (i=[0:1:n-1])
        translate([-(n-1)*10+i*20,0,0])
        Snap(6.5);
}


module Snap(ri) {
    rotate([90,0,0])
    translate([0,6.5,0])
    difference(){
        cylinder(d=ri+6,h=10,center=true);
        cylinder(d=ri,h=11,center=true);
        translate([0,7,0])
        cube([5.5,10,15],center=true);
    }
}

Base(4);
