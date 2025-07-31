// Liquid-Sensor IR




tube = true;
sensor = true;
led = true;
blende = true;
b = 13;
t = 30;
h = 8;
L = 2.0;

if (tube) tube();
if (led) {
    translate([1.25,9.5,0])
    color("purple",0.4)
    led();
    translate([1.25,-9.5,0])
    rotate([0,0,180])
    color("purple",0.4)
    led();
}
if (sensor) 
    difference() {
        sensor();
        tube();
    }
    

module tube () {
    $fn=60;
    color("lightblue",0.1)
    cylinder(d=5.5,h=50,center=true);
    
}   


module sensor() {
    $fn=60;
    
    color("green",0.70)
    difference () {
        cube([b,t,h], center=true);
        translate([1.25,0,0])
        led_loch();
    }
    if (blende) blende();
    
}

module led_loch() {
    translate([0,0,0])
    rotate([90,0,0])
    cylinder(d=5.5,h=t+1,center=true);
    translate([0,t/2,0])
    rotate([90,0,0])
    cylinder(d=6.5,h=2,center=true);
    translate([0,-t/2,0])
    rotate([90,0,0])
    cylinder(d=6.5,h=2,center=true);
    
    
    
}

module blende() {
    $fn=60;
    
    translate([1.25,0,0])
    rotate([90,0,0])
    difference() {
        cylinder(d=5.5,h=7.5,center=true);
        cylinder(d=L,h=7.5+1,center=true);
    }
}

module led() {
    $fn=60;
    rotate([90,0,0])
    cylinder(d=5,h=12,center=true);
    translate([0,5.5,0])
    rotate([90,0,0])
    cylinder(d=6,h=1,center=true);
}