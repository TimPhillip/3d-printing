// Ballmaschine
// ===================


use <../MiniMotor\MiniMotor.scad>



/*[ Druck Komponenten ]*/
show_miniMotorGehause = false;
show_Reif = false;
show_Boden = false;
show_Wand = false;
show_Schiene = false;
show_Schussrohr = false;
show_Schussbogen = false;
show_Trichter = false;
show_Spirale = false;
demo_Rutschbahn = false;

/*[ Zusammenbau Komponenten ]*/
show_miniMotorGehausen = false;
show_Reifen = false;
show_Waende = false;
show_Schienen = false;

/*[ Modell Komponenten ]*/
show_miniMotor = false;
show_Teller = false;
show_Ball = false;

/*[ Modell Schnitte ]*/
show_Schnitt = false;
show_LangsSchnitt = false;

/*[ Dimension des Gehäuses ]*/
// Breite
B = 50;                             
// Höhe
H = 50;                             
// Tiefe
T = 80;                             
// Wand
W = 2;    
// Abstand der Motoren
A=19.5;
// Neigung Schussrohr
Neigung = 92;   


module miniMotorGehaeuse() {
    color("Darkgray")
    union() {
        translate([13,0.75,0])
        difference(){
            cube([2,16.5,25.15],center=true);
            rotate([90,0,90])
            translate([-0.75,0,0])
            cylinder(d=3,h=20,$fn=60,center=true);
        }
        gehause();
        translate([-13,0.75,0])
        difference(){
            cube([2,16.5,25.15],center=true);
            rotate([90,0,90])
            translate([-0.75,0,0])
            cylinder(d=3,h=20,$fn=60,center=true);
        }
    }
}

module miniMotorGehaeusen() {
    translate([0,+A,0])
    rotate([90,0,0])
    miniMotorGehaeuse();
    translate([0,-A,0])
    rotate([90,0,180])
    miniMotorGehaeuse();
}

module miniMotoren() {
    translate([0,-A,0])
    rotate([90,0,0])
    miniMotor();
    translate([0,+A,0])
    rotate([90,0,0])
    miniMotor();
}

module miniMotor() {
    motor();
}

module BohrLoch() {
    rotate([90,0,0])
    cylinder(d=2.0,h=40, center=true);
}

module SchraubLoch() {
    rotate([-90,0,0])
    union(){
        rotate([90,0,0])
        translate([0,0,-1])
        cylinder(d=4,h=1.5,$fn=60,center=true);
        BohrLoch();
    }
}

module Teller() {
    color("Gray")
    difference() {
        union() {
            cylinder(d=22,h=2.4,center=true);
            translate([0,0,-5])
            cylinder(d=10,h=10,center=true);
        }
        cylinder(d=1,h=13,center=true);
    }
}

module Ball() {
    color("Black")
    translate([0,0,-19.5])
    sphere(d=15);
}

module Reifen() {
    color("Darkgray")
    difference() {
        rotate_extrude(convexity=20)
        translate([12.5,0,0])
        circle(d=5,$fn=60);
        
        rotate_extrude(convexity=20)
        translate([9,0,0])
        circle(d=4.5,$fn=60);
    }
}

module Reif() {
    color("Darkgray")
    difference() {
        union() {
/*
            rotate_extrude(convexity=10)
            translate([12.5,0,0])
            circle(d=5,$fn=60);
*/
            translate([0,0,3.5])
            cylinder(d=25,h=1,center=true);

            translate([0,0,2])
            cylinder(d=25,h=3.5,$fn=60,center=true);
        }
/*        
        rotate_extrude(convexity=20)
        translate([8,0,0])
        circle(d=4.5,$fn=60);
*/        
        translate([0,0,-2])
        cylinder(d=12,h=15,center=true);
        
        translate([0,0,1])
        cylinder(d=22,h=4,$fn=60,center=true);
    }

    
}

module Kurve() {
    rotate([0,90,90])
    translate([-H/4+W/2,B/2,0])
    difference(){
        cylinder(d=H/2,h=T, center=true);
        cylinder(d=H/2-2*W,h=T+2, center=true);
        
        translate([-B/4-W,-B/2,0])
        cube([B,B,T+2],center=true);
        
        translate([-B/3,0,0])
        cube([B,B,T+2],center=true);
        
    }
}

module Boden() {
    translate([0,0,-27])
    difference() {
        union() {
            cube([B,T,W],center=true);
            Kurve();
        }
        rotate([0,90,0])
        translate([-10,0,15])
        cylinder(d=20,h=T+2,center=true);

        rotate([90,0,0])
        translate([-23.5,17,0])
        Kreisrinne();
        
        for (i=[-1,1])
            for (j=[-1,1])
                translate([i*(B/2-5),j*T/2,0])
                BohrLoch();
    }
}

module Kreisrinne() {
    rotate_extrude(convexity=20)
    translate([10,0,0])
    circle(d=14.5,$fn=60);
}

module Schiene() {
    color("Orange")
    rotate([0,180,0])
    difference() {
        cube([10,T,10],center=true);
        translate([0,0,3])
        cube([3,T+2,5],center=true);
        translate([0,0,0])
        cube([7.5,T+2,2.75],center=true);
        
        for (i=[-1,1])
            for (j=[-1,1])
                translate([i*(3),j*T/2,3])
                BohrLoch();
        
        for (j=[-1,1])
            translate([0,j*T/2,-3])
            BohrLoch();
    }
}

module Waende() {
    rotate([90,0,0])
    translate([0,-W-3,-T/2-W/2])
    Wand();
    
    rotate([90,0,180])
    translate([0,-W-3,-T/2-W/2])
    Wand();
}

module Wand() {
    color("Darkgray")
    difference(){
        cube([H,B,W],center=true);
        for (i=[-1,1])
            for (j=[-1,1])
                translate([i*(B/2-5),j*(B/2-W/2-2),0])
                SchraubLoch();

        for (i=[-1,1])
            for (j=[-1,1])
                translate([i*3+20,j*17,0])
                SchraubLoch();
        
        for (i=[-1,1])
            for (j=[-1,1])
                translate([i*3-20,j*17,0])
                SchraubLoch();
        
        }
}

module Schienen() { 
    translate([20,0,15])
    Schiene();
    
    translate([-20,0,15])
    Schiene();
}


module Schussrohr() {
    translate([0,0,-19])
    rotate([0,90+2,0])
    color("Orange")
    union() {
        difference() {
            union() {
                translate([0,0,-3.5])
                cylinder(d=20,h=B+7,center=true);
                translate([5,0,B/2-5])
                rotate([0,-Neigung+180,0])
                Schiene();
                translate([6.5,0,-B/2+5])
                rotate([0,-Neigung+180,0])
                Schiene();
            }
            
            union() {
                translate([0,0,-3.5])
                cylinder(d=16,h=B+9,center=true);

                translate([0,-16,-0.25])
                rotate([0,-Neigung,0])
                Reifausschnitt();
                translate([0,16,-0.25])
                rotate([0,-Neigung,0])
                Reifausschnitt();

                translate([-15.5,0,30])
                cube([30,30,50],center=true);
                 
            }
        }
        
    }
}

module Reifausschnitt() {
    difference() {
        scale([1.5,1,1])            
        cylinder(d=29,h=B+2,center=true);
        translate([40,0,0])
        cube([50,50,50],center=true);
        translate([-40,0,0])
        cube([50,50,50],center=true);
    }
}
module Schussbogen() {
    color("Orange")
    rotate([90,0,180])
    translate([17,1.5,0])
    difference() {
        rotate_extrude(angle=-90,convexity=20)
        translate([20,0,0])
        circle(d=20);
        rotate_extrude(angle=-90,convexity=20)
        translate([20,0,0])
        circle(d=16);
    }
}


module Trichter() {
    color("Orange")
    translate([-37,0,32])
    union() {
        difference() {
            cylinder(d=20,h=60,center=true);
            cylinder(d=16,h=60+2,center=true);
        }
        translate([0,0,-30])
        difference() {
            cylinder(d=25,h=6,center=true);
            cylinder(d=19,h=6+2,center=true);
            translate([0,0,-6])
            cylinder(d=20.5,h=10+2,center=true);
        }
        
        translate([0,0,62])
        difference(){
            sphere(d=70,$fn=60);
            sphere(d=66,$fn=60);
            translate([0,0,35])
            cube([100,100,100],center=true);
            
            cylinder(d=16,h=80,center=true);
        }
    }
}  


module Rutschbahn(H=150) {
    translate([0,0,-4.0])
    difference() {
        translate([0,0,-12])
        linear_extrude(height=H,twist=720, slices=150)
            translate([25,0])
            scale([1,2])
            circle(10);
        translate([0,0,-3])
        linear_extrude(height=H,twist=720, slices=150)
            rotate([15])
            translate([26,0])
            scale([1,2])
            circle(10);
        translate([0,0,-156])
        cylinder(r=100,h=H,$fn=60);
    }
}

module MontageAnschluss() {
    difference() {
        union() {
            translate([0,0,-10])
            cylinder(r=20,h=150,$fn=60);

            rotate([0,Neigung,0])
            translate([-3.1,-27,13.6])
            cylinder(d=20,h=37.5,center=true);

            Aussenzylinder();
        }
        

        translate([6.9,-25.5,10])
        scale([2,1.2,1])
        cylinder(d=14,h=20,center=true);
    }
}

module Aussenzylinder() {
    translate([0,0,-10])    
    difference() {
        cylinder(d=74,h=150,$fn=60,center=false);
        cylinder(d=70,h=154,$fn=60,center=false);
    }
}

module Spirale() {
    color("Orange")
    translate([-65,27,-20])
    difference() {
        union(){
            rotate([0,0,-40])
            Rutschbahn(150);
            MontageAnschluss();
        }
        rotate([0,Neigung,0])
        translate([-3.6,-27,19])
        cylinder(d=16,h=48.5,center=true);
    }
}

module demo_Rutschbahn() {
    difference() {
        Rutschbahn(150);
        translate([0,0,120])
        cube([200,200,200],center=true);
    }
}

// =========================================================

difference() {
    union() {
        if (show_miniMotorGehause) miniMotorGehaeuse();
        if (show_miniMotorGehausen) miniMotorGehaeusen();
        if (show_miniMotor) miniMotoren();
        if (show_Ball) Ball();
        if (show_Boden) Boden();
        if (show_Wand) Wand();
        if (show_Waende) Waende();
        if (show_Schiene) Schiene();
        if (show_Schienen) Schienen();
        if (show_Schussrohr) Schussrohr();
        if (show_Schussbogen) Schussbogen();
        if (show_Trichter) Trichter();
        if (show_Spirale) Spirale();
        if (demo_Rutschbahn) demo_Rutschbahn();
        if (show_Teller) {
            translate([0,-A,-20])
            rotate([0,180,0])
            Teller();    
            translate([0,A,-20])
            rotate([0,180,0])
            Teller();    
        }
        if (show_Reif) Reif();
            
        if (show_Reifen) {
            translate([0,-A,-20])
            rotate([0,0,0])
            Reif();
            translate([0,A,-20])
            rotate([0,0,0])
            Reif();
        }
    }
    if (show_Schnitt) translate([0,-100,-50]) cube([200,200,200]);
    if (show_LangsSchnitt) translate([-100,0,-50]) cube([200,200,200]);
}
