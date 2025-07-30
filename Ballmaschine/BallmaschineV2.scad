// Ballmaschine V2
// ===============

use <Ballmaschine.scad>;


/* [Druck Komponenten] */
motor = false;
motorschaft = false;

/* [Zusammenbau Komponenten] */
motoren = true;
motorschaefte = true;
schienen = true;
Waende = false;

tolleranz =1.0;


module schienen() {
    translate([15,0,5])
    rotate([0,180,0])
    Schiene();
    translate([-15,0,5])
    rotate([0,180,0])
    Schiene();
}

module motorschaefte() {
    translate([0,-20,0])
    motorschaft();
    translate([0,20,0])
    motorschaft();
}    

module motorfix() {
    cylinder(d=4,h=50,$fn=60,center=true);
}

module gleitloecher() {
    for (i=[-1,1])
        for (j=[-1,1])
            translate([i*15,j*5,0])
            gleitloch();
}

module gleitloch() {
    cylinder(d=3.0,h=30,$fn=60, center=true);
}

module nutloecher() {
    for (i=[-1,1])
        for (j=[-1,1])
            translate([i*7,j*7,0])
            nutloch();
}


module nutloch() {
    cylinder(d=2,h=50,$fn=60, center=true);
}

module motorschaft() {
    difference() {
        union() {
            translate([0,0,10.5])
            cube([40,18,2],center=true);
            cube([18,18,23],center=true);
        }
        motor(true);
        rotate([90,0,0])
        motorfix();
        rotate([0,90,0])
        motorfix();
        
        gleitloecher();
        nutloecher();
    }
}

module motoren() {
    
    translate([0,-20,0])
    motor(false);
    translate([0,20,0])
    motor(false);
}

module motor(negative=false) {
    if (negative) {
        difference() {
            union() {
                translate([0,-1,0])
                cylinder(d=10+tolleranz,h=25,$fn=60,center=true);
                translate([0,1,0])
                cylinder(d=10+tolleranz,h=25,$fn=60,center=true);
            }
            translate([9.5+tolleranz,0,0])
            cube([10,10,26],center=true);
            translate([-9.5-tolleranz,0,0])
            cube([10,10,26],center=true);

        }
        translate([0,0,-12])
        cylinder(d=3,h=11,$fn=60,center=true);
    }
    if (!negative) {
        difference() {
            union() {
                translate([0,-1,0])
                cylinder(d=10,h=25,$fn=60,center=true);
                translate([0,1,0])
                cylinder(d=10,h=25,$fn=60,center=true);
            }
            translate([9.5,0,0])
            cube([10,10,26],center=true);
            translate([-9.5,0,0])
            cube([10,10,26],center=true);

        }
        translate([0,0,-12])
        cylinder(d=3,h=11,$fn=60,center=true);
    }
}

if (motoren) motoren();
if (motorschaefte) motorschaefte();
    
if (motor) motor();
if (motorschaft) motorschaft();
if (schienen) schienen();
if (Waende) Waende();
    
    

