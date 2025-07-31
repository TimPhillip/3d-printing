$fn=30;

difference() {
    halter();
    translate([-40,0,-40])
    cube([80,20,80]);
    
    translate([-25,2,0])
    rotate([90,0,0])
    cylinder(d=2.5,h=10);
    
    translate([-25,2,-20])
    rotate([90,0,0])
    cylinder(d=2.5,h=10);
    
    translate([-25,2,20])
    rotate([90,0,0])
    cylinder(d=2.5,h=10);

    translate([25,2,0])
    rotate([90,0,0])
    cylinder(d=2.5,h=10);
    
    translate([25,2,-20])
    rotate([90,0,0])
    cylinder(d=2.5,h=10);
    
    translate([25,2,20])
    rotate([90,0,0])
    cylinder(d=2.5,h=10);
    
}

module halter() {
    difference() {
        
        huelse();
        cylinder(d=18,h=75, center=true);
    }
}

module huelse() {
    
    cube([70,10,70], center=true);
    cylinder(d=36, h=70, center=true);
}
