// Durchgangsprüfer
Wand = 1;

B9Vx = 27;
B9Vy = 55;
B9Vz = 18;

BLochX = B9Vx+3;
BLochY = B9Vy+3;
BLochZ = B9Vz;

PlatineX = 40;
PlatineY = 60;
PlatineZ = 15;


InX = PlatineX + 10;
InY = PlatineY + 10;
InZ = 40;

OutX = InX + Wand;
OutY = InY + Wand;
OutZ = InZ;


module OuterFrame() {
    minkowski() {
        cube([OutX,OutY,OutZ],center=true);
        sphere(r=3);
    }
} 

module InnerFrame() {
    translate([0,0,2])
    cube([InX,InY,InZ+4],center=true);
}

module Batterie9V(){
    color("Green")
    translate([0,0,-B9Vz/2])
    cube([B9Vx,B9Vy,B9Vz],center=true);
}

module BatterieLoch(){
    translate([0,0,-BLochZ]) {
        cube([BLochX,BLochY,BLochZ+4],center=true);
        translate([0,0,-4.5])
        cube([BLochX+2,BLochY+2,1],center=true);
    }
}

module Fachboden() {
    translate([0,0,2])
    difference() {
        cube([OutX,OutY,Wand],center=true);
        cube([InX-7,InX-7,Wand+1],center=true);
        PlatinenLoch();
    }
}

module BananenLoch() {
    rotate([0,90,0])
    translate([-10,10,OutX/2])
    cylinder(d=6.8,h=10,center=true, $fn=50);
    rotate([0,90,0])
    translate([-10,-10,OutX/2])
    cylinder(d=6.8,h=10,center=true, $fn=50);
}

module ObenPlan(){
    translate([0,0,OutZ/2+5])
    cube([OutX+10,OutY+10,10],center=true);
}

module Sockel() {
    difference(){
        cube([5,5,InZ/2-3],center=true);
        translate([0,0,5])
        cylinder(d=3,h=10,center=true,$fn=30);
    }
}

module Bohrsockel() {
    translate([(InX/2-2),(InY/2-2),InZ/4])
    Sockel();
    translate([-(InX/2-2),(InY/2-2),InZ/4])
    Sockel();
    translate([(InX/2-2),-(InY/2-2),InZ/4])
    Sockel();
    translate([-(InX/2-2),-(InY/2-2),InZ/4])
    Sockel();
}

module PlatinenLoch() {
    translate([18,28,0])
    cylinder(d=2,h=50,center=true,$fn=30);
    translate([-18,28,0])
    cylinder(d=2,h=50,center=true,$fn=30);
    translate([18,-28,0])
    cylinder(d=2,h=50,center=true,$fn=30);
    translate([-18,-28,0])
    cylinder(d=2,h=50,center=true,$fn=30);
}

module Platine() {
    translate([0,0,PlatineZ/2+3])
    color("Green")
    difference(){
        cube([PlatineX,PlatineY,PlatineZ],center=true);  
        PlatinenLoch();
    }
}

module Schnapper() {
    
    translate([0,23.5,4.8])
    union() {
        difference() {
            union() {
                rotate([-45,0,0])
                translate([0,0,-0.5])
                cube([19,19,1],center=true);
                rotate([45,0,0])
                translate([0,-0.75,0])
                cube([19,19,1],center=true);
            }
                translate([0,0,10])
                cube([20,20,20],center=true);           
                translate([0,0,-16.5])
                cube([20,20,20],center=true);           
                translate([0,16,-9])
                cube([20,20,20],center=true);           
        }
        translate([0,7,-4.5])
        difference() {
            cylinder(d=19,h=5,center=true);
            cylinder(d=10,h=6,center=true);
            translate([0,10,0])
            cube([20,20,20],center=true);
            translate([0,9,-9])
            cube([20,20,20],center=true);
            translate([0,-7,2])
            cube([20,5,4],center=true);
            translate([0,0,-0.3])
            cube([20,5,2.2],center=true);
        }
        
        
    }
}

module BatterieDeckel() {
    translate([0,0,-OutZ/2-Wand-3.1])
    difference() {
        union(){
           cube([31.0,58.7,1],center=true);
           translate([0,0,1.5])
           cube([29.5,57.2,2.2],center=true);
        }
       translate([0,25,-4])
       cylinder(d=4,h=10,center=true,$fn=30);
       translate([0,25,0])
       cylinder(d=2,h=10,center=true,$fn=30);
    }
    translate([0,-28,-OutZ/2-Wand+0.45])
    cube([15,6,2],center=true);
    translate([0,-28,-OutZ/2-Wand+0.45])
    cube([29,3,2],center=true);
}

module DeckelLoch() {
    translate([(InX/2-2),(InY/2-2),InZ/2])
    cylinder(d=3,h=10,center=true,$fn=30);
    translate([-(InX/2-2),(InY/2-2),InZ/2])
    cylinder(d=3,h=10,center=true,$fn=30);
    translate([(InX/2-2),-(InY/2-2),InZ/2])
    cylinder(d=3,h=10,center=true,$fn=30);
    translate([-(InX/2-2),-(InY/2-2),InZ/2])
    cylinder(d=3,h=10,center=true,$fn=30);

    translate([(InX/2-2),(InY/2-2),InZ/2+6])
    cylinder(d=5.5,h=10,center=true,$fn=30);
    translate([-(InX/2-2),(InY/2-2),InZ/2+6])
    cylinder(d=5.5,h=10,center=true,$fn=30);
    translate([(InX/2-2),-(InY/2-2),InZ/2+6])
    cylinder(d=5.5,h=10,center=true,$fn=30);
    translate([-(InX/2-2),-(InY/2-2),InZ/2+6])
    cylinder(d=5.5,h=10,center=true,$fn=30);
    
    
    translate([0,0,InZ/2])
    cylinder(d=8,h=10,center=true,$fn=30);
    
    translate([-15,15,InZ/2])
    cube([1,12,10],center=true);
    
    translate([-12,15,InZ/2])
    cube([1,12,10],center=true);
    
    translate([-9,15,InZ/2])
    cube([1,12,10],center=true);
    
}

module Deckel() {
    translate([0,0,4])
    difference() {
        OuterFrame();
        translate([0,0,-3])
        cube([OutX+15,OutY+15,OutZ+6],center=true);
        DeckelLoch();
    }
        
}

module SchalterLoch() {
    rotate([90,0,0])
    translate([0,-8,-20])
    cube([20.5,14.5,50],center=true);
}

module BatterieSchraube() {
    
    translate([0,InY/2-7,-InZ/2+1])
    difference(){
        cube([8,12,3],center=true);
        translate([0,-2.75,0])
        cylinder(d=2,h=10,center=true,$fn=30);
    }
}

module Box() {

    difference() {
        OuterFrame();
        InnerFrame();
        BatterieLoch();
        BananenLoch();
        ObenPlan();
        SchalterLoch();
    }
    Fachboden();
    Bohrsockel();
    BatterieSchraube();
    //Batterie9V();
    //Platine();
}

//Box();
//BatterieDeckel();
Deckel();
//BatterieSchraube();