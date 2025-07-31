// Schrankbeleuchtung
/* [Maße:]*/
pX = 42;
// Sensorplatine x
pY = 26;
// Sensorplatine y
pZ = 1;
// Sensorplatine z
cX = 90;
// Sensorplatine x
cY = 70;
// Sensorplatine y
cZ = 1;
// Sensorplatine z

/* [Teile:]*/
BoxUnten = true;
BoxOben = true;
ControllerUnten = false;
ControllerOben = false;


module Platinenhalt() {
    difference() {
        cylinder(d=8,h=4,$fn=60, center=true);
        cylinder(d=3,h=6,center=true);
    }
}

module Rastnase(rX, rY) {
    translate([(rX/2+1),0,0])
    rotate([90,0,0])
    cylinder(d=2,h=20,center=true);
    translate([-(rX/2+1),0,0])
    rotate([90,0,0])
    cylinder(d=2,h=20,center=true);
    translate([0,(rY/2+1),0])
    rotate([0,90,0])
    cylinder(d=2,h=20,center=true);
    translate([0,-(rY/2+1),0])
    rotate([0,90,0])
    cylinder(d=2,h=20,center=true);
}


module Rastrillen(rX, rY) {
    translate([(rX/2+1.5),0,0])
    rotate([90,0,0])
    cylinder(d=2,h=22,center=true);
    translate([-(rX/2+1.5),0,0])
    rotate([90,0,0])
    cylinder(d=2,h=22,center=true);
    translate([0,(rY/2+1.5),0])
    rotate([0,90,0])
    cylinder(d=2,h=22,center=true);
    translate([0,-(rY/2+1.5),0])
    rotate([0,90,0])
    cylinder(d=2,h=22,center=true);
}

module BoxUnten() {
    union() {
        cube([pX+2,pY+2,3],center=true); 
        Rastnase(pX,pY);
        translate([pX/2-4.5,pY/2-4.5,3]) Platinenhalt();
        translate([pX/2-4.5,-(pY/2-4.5),3]) Platinenhalt();
        }

}
module BoxOben() {
    translate([0,0,23/2-1.5])
    union() {
        difference() {
            cube([pX+5,pY+5, 23],center=true);
            translate([0,0,-3])
            cube([pX+3,pY+3, 23], center=true);
            
            translate([0,5,0])
            cylinder(d=5.5,h=50,$fn=60,center=true);
            
            translate([10,5,0])
            cylinder(d=5.5,h=50,$fn=60,center=true);
            
            translate([-25,-3,4])
            cube([5,12,3],center=true);
            
            translate([0,0,-10])
            Rastrillen(pX,pY);
        }
    }
}

module ControllerUnten() {
    union() {
        cube([cX+4,cY+4,3],center=true); 
        Rastnase(cX+3, cY+3);
        a=2.5;
        translate([cX/2-a,cY/2-a,3]) Platinenhalt();
        translate([cX/2-a,-(cY/2-a),3]) Platinenhalt();
        translate([-cX/2+a,cY/2-a,3]) Platinenhalt();
        translate([-cX/2+a,-(cY/2-a),3]) Platinenhalt();
        }

}

module ControllerOben() {
    translate([0,0,35/2-1.5])
    union() {
        difference() {
            roundedCube(cX+7,cY+7, 35);
            translate([0,0,-3])
            cube([cX+5,cY+5, 35], center=true);
            
            rotate([90,0,0])
            translate([-35,5,cY/2])
            cylinder(d=8,h=50,$fn=60,center=true);
            
            translate([-25,-3,4])
            cube([5,12,3],center=true);
            
            translate([0,0,-15.5])
            Rastrillen(cX+3,cY+3);
            
            translate([-cX/2,0,0])
            Kabelschlitz();

            translate([-cX/2,-20,0])
            Kabelschlitz();

            translate([-cX/2,20,0])
            Kabelschlitz();
            
            translate([cX/2,-5,0])
            Kabelschlitz();

            translate([cX/2,-25,0])
            Kabelschlitz();

            translate([cX/2,15,0])
            Kabelschlitz();
            
            
            
            
        }
    }
}

module roundedCube(x,y,z) {
    hull() {
        for (i=[-1,1])
        for (j=[-1,1])
        translate([i*(x/2-3),j*(y/2-3),0])
        cylinder(d=8,h=z, $fn=60, center=true);
    }
}

module Kabelschlitz(){
    cube([10,10,2],center=true);
}

if (BoxUnten) BoxUnten();
if (BoxOben) BoxOben();
if (ControllerUnten) ControllerUnten();
if (ControllerOben) ControllerOben();
    