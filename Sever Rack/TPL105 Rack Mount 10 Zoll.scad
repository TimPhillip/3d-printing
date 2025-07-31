// TP - Link 105


module Ears(){
    import("raspberry-pi-rack-1u-ears.stl");
}
    
module TPL105 () {
    translate([0,50,0])
    color("Lightgray") cube([100,98,25],true);
};

module Boden() {
    cube ([206,100,12],true);
}

module Loch(){
    rotate([0,90,0])
    cylinder(d=5.0,h=50.0, $fn=50);
}

module ZollRack() {
    difference(){
        cube([206,5,42],true);
        translate([0,0,-4])
        union(){ 
            translate([-50,0,0])
            scale([1.01,1.0,1.02])
            TPL105();
            translate([+50,0,0])
            scale([1.01,1.0,1.02])
            TPL105();
        
            translate([-50,-50,0])
            scale([0.95,1.0,0.95])
            TPL105();
            scale([0.98,1.0,0.95])
            translate([+50,-50,0])
            TPL105();
        }
    }
    translate([0,50,15.0])
    difference() {
        Boden();
        translate([-120,34,0])
        Loch();
        translate([-120,-44,0])
        Loch();
        translate([70,34,0])
        Loch();
        translate([70,-44,0])
        Loch();
    }
}

/*
translate([-50,0,0])
TPL105();
translate([+50,0,0])
TPL105();


rotate([0,-90,0])
translate([31.0,0,103])
Ears();
*/
ZollRack();
    