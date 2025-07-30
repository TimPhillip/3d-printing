// Handsaugerhalterung

Saugerhalterung = true;
Zubehoerhalterung = true;


module Halter() {
    difference() {
        $fn=60;
        cylinder(d=70, h=10,center=true);
        cylinder(d=59, h=12,center=true);
    }
    
}

module Fest() {
    difference() {
        cube([50,70,10],center=true);
        translate([5,0,0])
        Loch();
        translate([-10,0,0])
        Loch();
        
        translate([20,0,-30])
        rotate([0,90,0])
        cylinder(d=59, h=120,center=true, $fn=60);

    }
}


module Loch() {
    $fn=60;
    cylinder(d=6,h=3,center=true);
    cylinder(d=4,h=20,center=true);
}


module Saugerhalter () {
    
    rotate([0,90,0])
    Halter();
    
    translate([-20,0,30])
    Fest();
    
}

module Zubehoer() {
    difference() {
        cube([20,160,10],center=true);
        translate([20,0,-30])
        rotate([0,90,0])
        cylinder(d=59, h=120,center=true, $fn=60);
        translate([0,0,0])
        Loch();
    }
    
    difference(){
        translate([-5,55,-30])
        cube([10,50,60],center=true);
        
        translate([0,65,-25])
        rotate([90,-180,-90])
        hull(){
            cylinder(d=14,h=30,center=true);
            translate([0,18,0])
            cylinder(d=14,h=30,center=true);
        }        
                
        translate([0,45,-35])
        rotate([0,90,0])
        cylinder(d=10,h=30,center=true);
    }
    
    difference(){
        translate([-5,-55,-30])
        cube([10,50,60],center=true);
                
        translate([0,-67.5,-20])
        rotate([0,90,0])
        cylinder(d=17,h=30,center=true);
                
        translate([0,-45,-20])
        rotate([0,90,0])
        cylinder(d=17,h=30,center=true);
       
        translate([0,-55,-45])
        rotate([0,90,0])
        cylinder(d=24,h=30,center=true);
       
    }
}

if (Saugerhalterung) Saugerhalter();

if (Zubehoerhalterung) translate([15,0,30])
Zubehoer();