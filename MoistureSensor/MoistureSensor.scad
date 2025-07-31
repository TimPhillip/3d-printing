// Moisture Sensor

MoistureSensor = true;
MoistureSensorBox = true;
MoistureSensorBoxUnten = true;
MoistureSensorHuelle = true;
Membran = true;

if (MoistureSensor) MoistureSensor();
if (MoistureSensorBox) MoistureSensorBox();
if (MoistureSensorBoxUnten) MoistureSensorBoxUnten();
if (MoistureSensorHuelle) MoistureSensorHuelle();
if (Membran) { 
    Membran();
    translate([0,0,-5])
    Membran();
}

msl = 97.5;     //Sensor Länge
msb = 22.0;     //Sensor Breite
msh = 1.0;      //Sensor Höhe 

module MoistureSensor(negative=false) 

translate([0,-msl/2,0])
union() {
    
    // Kabelanschluss
    if (negative) {
        color("white")
        translate([0,msl/2-2,5.7/2+msh/2])
        cube([10+1,7.4,5.7],center=true);
    } else {
        color("white")
        translate([0,msl/2-2,5.7/2+msh/2])
        cube([10,7.4,5.7],center=true);
    }
    
    // PCB-Sensor
    color("darkgreen")
    difference(){
        if (negative) cube([msb+1,msl+1,msh+1.5],center=true);
        else cube([msb,msl,msh],center=true);
            
        translate([-msb,-msl/2,0])
        rotate([0,0,45])
        cube([30,30,2],center=true);
        
        translate([msb,-msl/2,0])
        rotate([0,0,45])
        cube([30,30,2],center=true);

        translate([-msb/2,-msl/2+77.5,-2])
        cylinder(d=3.0, h=5);

        translate([msb/2,-msl/2+77.5,-2])
        cylinder(d=3.0, h=5);
    }
}

module MoistureSensorBox() {
    
    difference(){
        boxOben();
        translate([0,0,1])
        MoistureSensor(true);
        
        // Kabelloch
        translate([0,5,6])
        cube([8,3,5.7],center=true);
        
        // Schraubloch
        translate([-12,-20,-2])
        cylinder(d=1.5,h=8,$fn=30);
        
        translate([12,-20,-2])
        cylinder(d=1.5,h=8,$fn=30);
        
        translate([0,13.5,-3])
        cylinder(d=1.5,h=8,$fn=30);
        
    }
}

module MoistureSensorBoxUnten() {   
    difference() {
        translate([0,0,-2])
        boxUnten();
        translate([0,0,-1])
        MoistureSensor(true);


        // Schraubloch
        translate([-12,-20,-5])
        cylinder(d=2,h=8,$fn=30);
        
        translate([12,-20,-5])
        cylinder(d=2,h=8,$fn=30);
        
        translate([0,13.5,-5])
        cylinder(d=2,h=8,$fn=30);
    }
}


module boxOben(){
    difference(){
        cylinder(d=30,h=8);
        translate([0,0,-1])
        cylinder(d=24,h=8.3);
    }
    
    translate([-15,-30,0])
    cube([30,30,8]);
 
    
}


module boxUnten() {
    translate([0,0,-2])
    union() {
        cylinder(d=30,h=4);
        translate([-15,-30,0])
        cube([30,30,4]);
    }       
}

module MoistureSensorHuelle() {
    difference() {
        translate([0,-64.5,0])
        cube([30,68,5],center=true);
        MoistureSensor(true);
        translate([0,-64.5,0])
        cube([20,60,10],center=true);
    }
    difference() {
        translate([0,-91,0])
        cube([30,10,10],center=true);
        MoistureSensor(true);
    }    
    translate([0,-96,0])
    cube([30,5,20],center=true);
}

module Membran() {
    color("white")
    translate([0,-58.5,2.5])
    cube([30,56,0.25],center=true);
}