// Tims Display

Gehause = false;
Blende = true;

DisplayA = 174;
DisplayB = 102;
DisplayC = 13;

ScreenA = 166;  //155;
ScreenB = 101;  //87;
ScreenC = 7;

PlatineA = 182;
PlatineB = 109;
PlatineC = 8;
Platine = [PlatineA,PlatineB,PlatineC];

BlendeA = 155;
BlendeB = 87;
BlendeC = 2;

module Noppen() {

    translate([0,0,2])    
    cylinder(d=2.8,h=PlatineC+1,$fn=30);
}

module Bohrloch(Tief) {
    cylinder(d=2,h=5,center=true);
    if (Tief)
        translate([0,0,-1])
        cylinder(d=3,h=1,center=true,$fn=40);
}

module Blende(){
    translate([0,0,DisplayC-15])   
    {
    difference(){
        cube([DisplayA+20,DisplayB+20,3],center=true);
        translate([(PlatineA/2+2.5),(PlatineB/2+2.5),0])
        Bohrloch(true);

        translate([-(PlatineA/2+2.5),(PlatineB/2+2.5),0])
        Bohrloch(true);

        translate([(PlatineA/2+2.5),-(PlatineB/2+2.5),0])
        Bohrloch(true);

        translate([-(PlatineA/2+2.5),-(PlatineB/2+2.5),0])
        Bohrloch(true);
    
        }
    translate([0,0,4])
    cube([100,8,5],center=true);
        
    translate([70,40,4])
    cylinder(d=10,h=5,center=true);
        
    translate([-70,-30,4])
    cylinder(d=10,h=5,center=true);
        
    translate([60,-30,4])
    cylinder(d=10,h=5,center=true);
        
    translate([-50,35,4])
    cylinder(d=10,h=5,center=true);
    }
}

module Housing() {
    a= DisplayA+20;
    b= DisplayB+20;
    c= DisplayC;
    Screen=[ScreenA,ScreenB,ScreenC];
    
    difference(){
        translate([0,0,DisplayC/2])    
        cube([a,b,c],center=true);
        translate([0,0,ScreenC/2+PlatineC])
        cube(Screen,center=true);
//        translate([-3,-10,ScreenC/2+PlatineC])
//        cube(Screen,center=true);
        #translate([0,0,PlatineC/2])
        cube(Platine,center=true);
        
    }
}

module Gehause() {
    difference() {

        Housing();
        translate([0,ScreenB/2+1.5,PlatineC+(ScreenC-3)/2])
        cube([50,6,ScreenC-2],center=true);
        translate([-65,ScreenB/2+1.5,PlatineC+(ScreenC-3)/2])
        cube([25,6,ScreenC-2],center=true);
        color("Black")
        translate([-40,-PlatineB/2-5,PlatineC/2])
        cube([20,13,ScreenC],center=true);
        translate([PlatineA/2,0,PlatineC/2+1])
        cube([20,15,ScreenC+2],center=true);
        
        translate([PlatineA/2+2.5,PlatineB/2+2.5,0])
        Bohrloch(false);

        translate([-PlatineA/2-2.5,PlatineB/2+2.5,0])
        Bohrloch(false);

        translate([PlatineA/2+2.5,-PlatineB/2-2.5,0])
        Bohrloch(false);

        translate([-PlatineA/2-2.5,-PlatineB/2-2.5,0])
        Bohrloch(false);

    }

    translate([-DisplayA/2,-DisplayB/2,0])
    Noppen();
    translate([DisplayA/2,-DisplayB/2,0])
    Noppen();
    translate([DisplayA/2,DisplayB/2,0])
    Noppen();
    translate([-DisplayA/2,DisplayB/2,0])
    Noppen();
}
if (Gehause) Gehause();
if (Blende) Blende();