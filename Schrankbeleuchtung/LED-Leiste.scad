// LED-Leiste


/* [Teile] */
Doppelschrank=true;
Einzelschrank=false;
Sensorkappe=false;

/* [Test] */
test_modul= false;
LEDLeiste= false;
Sensor = false;
LEDs = false;
LEDStreifen = false;
LEDProfil = false;


module triangle(s){
    difference(){
        square([s, s]);
        
        translate([0,s,0])
        rotate([0,0,-45])
        square([2*s, 2*s]);
    }
}

module hohlDreieck() {
    difference(){
        triangle(15);
        translate([2.5, 2.5])
        triangle(10 - sqrt(2) * 2.5);
    }
}

module LEDAusschnitt() {
    rotate([0,0,45])
    translate([sqrt(2) * 7.5 - 1,-5.5,0])
    square([3, 11]);
}

module LEDProfil() {
    difference(){
        hohlDreieck();
        LEDAusschnitt();
    }
}

module led_leiste(length=100){
    translate([0,0,-length/2])
    union() {
        linear_extrude(length)
        LEDProfil();
    }
}

module SensorAusschnitt() {
    translate([2.5, 2.5, 45])
    cube([15, 15, 20]);
}

module led_rohr() {
    difference() {
        translate([4.5,4,0])
        rotate([90,0,0])
        cylinder(d=7.5, h=4, $fn=20);
        led_loch();
    }
}
module led_loch() {
    translate([-2.5,0,0])
    rotate([90,0,0])
    translate([7,0,-15])
    cylinder(d=5.5, h=30, $fn=20);
}
module led_mount() {
    translate([0, 0,-5])
    difference(){
        cube([2.5,25,10]);
        translate([0, 20, 5])
        rotate([0,90,0])
        cylinder(r=1.5, h=10, center=true, $fn=12);
    }
}


module Sensor(negative=false){
    
    if (negative){
        translate([0,0, -5])
        led_loch();
        translate([0,0, 5])
        led_loch();
        
        translate([2.5, 1, -12]) 
        cube([15,15,24]);
    }
    else
    {
        translate([0, 0, -5])
        led_rohr();
        translate([0, 0, 5]) 
        led_rohr();
        
        translate([0, 13, 0])
        difference() {
            translate([0,-5,-12])
            cube([15, 20, 24]);
            
            translate([2.5,-6,-13]) 
            cube([15,6,26]);
            
            translate([2.5,-6,-9]) 
            cube([15,20,18]);
            
            translate([0,-2,5])
            led_loch();
            translate([0,-2, -5]) 
            led_loch();
            
            translate([2.5, 0, -15])
            rotate([0,0,-45])
            cube([25,25,30]);
            
            translate([2.5,0,-9])
            cube([25,25,18]);
            
            translate([5,10,-12])
            sphere(r=2, $fn=20);
            translate([5,10,12])
            sphere(r=2, $fn=20);
        }
    }
}


module test_modul(){
    position= 16;
    difference(){
       led_leiste(32);
       Sensor(negative=true);
    }
    Sensor(negative=false);
}

module doppel_schrank_modul(){
    length=950;
    sensor_distance=300;
    
    difference(){
       led_leiste(length);
       translate([0, 0, (- sensor_distance) / 2 ])
       Sensor(negative=true);
       translate([0, 0, (+ sensor_distance) / 2 ])
       Sensor(negative=true);
    }

    translate([0, 0, (- sensor_distance) / 2 ])
    {
        Sensor(negative=false);
        if (LEDs) LEDs();
    }
    
    translate([0, 0, (+ sensor_distance) / 2 ])
    {
        Sensor(negative=false);
        if (LEDs) LEDs();
    }
    
    for (i = [-length/2+30:(length-60)/5:length/2-30]){
       translate([0,0,i])
       led_mount();
    }
}


module einzel_schrank_modul(){
    length=450;
    sensor_distance=0;
    
    if (LEDStreifen) LEDStreifen(length);
    difference(){
       led_leiste(length);
       translate([0, 0, (- sensor_distance) / 2 ])
       Sensor(negative=true);
    }

    translate([0, 0, (- sensor_distance) / 2 ])
    {
        Sensor(negative=false);
        if (LEDs) LEDs();
    }
    
    for (i = [-length/2+20:(length-40)/3:length/2-20]){
       translate([0,0,i])
       led_mount();
    }
}

module Sensorkappe(){
    translate([-2.5, 10, 0]) 
    union() {
        difference(){
            translate([2.5, 5.5, -15]) 
            cube([18,15,30]);
            translate([-0.5, 1.5, 0]) 
            scale([1.05,1.05,1.05])Sensor(negative=true);

            translate([3.5, 0, -18])
            rotate([0,0,-45])
            cube([25,25,36]);
        }
        translate([8,13,-13.25])
        sphere(r=1.75, $fn=20);
        translate([8,13,13.25])
        sphere(r=1.75, $fn=20);

        difference() {
            translate([8.5, 5.5, -15])
            rotate([0,0,-45])
            cube([2,17,30]);
            translate([20.5, 0, -18])
            cube([25,25,36]);            
            translate([0, -19.5, -18])
            cube([25,25,36]);            
        }
    }
}

module led() {
    rotate([90,0,0])
    translate([4.5,0,-2])
    union() {
        cylinder(d=5,h=5, $fn=60, center=true);
        translate([0,0,-3])
        cylinder(d=6,h=1, $fn=60, center=true);
        translate([0,0,2])
        sphere(d=5, $fn=60);
        
        translate([0,2,-12])
        cylinder(d=1,h=28, center=true);

        translate([0,-2,-12])
        cylinder(d=1,h=28, center=true);
    }
}

module LEDs() {
    color("Black")
    translate([0,0,5])
    led();
    color("White")
    translate([0,0,-5])
    led();
}

module LEDStreifen(length) {
    color("Black")
    translate([0,0,-length/2])
    union() {
        linear_extrude(length)
        scale(0.85)LEDAusschnitt();
    }
}

/*
intersection(){
    
    translate([0,0, part * (length / num_parts)])
    cube([200,200])
}
*/

if (Doppelschrank) doppel_schrank_modul();
if (Einzelschrank) einzel_schrank_modul();
if (Sensorkappe) Sensorkappe();

if (LEDLeiste) led_leiste();
if (LEDProfil) LEDProfil();
if (Sensor) Sensor(negative=false);
if (test_modul) test_modul();

