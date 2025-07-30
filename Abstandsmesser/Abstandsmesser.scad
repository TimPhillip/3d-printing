// Abstandsmesser
/*  [Dimensionen] */
L = 230; // 3*54 + 4*17;
B = 65;
H = 4;

/*  [Element-Anzeige] */
Base = true;
House = true;
BaseLayer = true;
Batteriehalter = true;
Batteriedeckel = true;
Deckel = true;


/*  [Kontroll-Anzeige] */
Laengsschnitt = false;
Querschnitt = false;
Sonic = false;
Laser = false;
Platine = false;
Tasten = false;
Digits = false;

/*-----------------------*/
module endglobal() {};
$fn =60;

Ldisplay = 51;
Bdisplay = 20;
Hdisplay = 9.5;

LdisPlatine = 66.9;
BdisPlatine = 28.5;
HdisPlatine = 1.5;

Gap = 17;
dDorn = 6;
hDorn = 7.25;

Abst = 10;
hHouse = 45;

Lsonic = 45.5;
Bsonic = 20.5;
Hsonic = 15.0;
abstSonic = 10;
dSonic = 17;

dStutz = 8;
/*-----------------------*/

module Deckel() {
    color("Orange")
    translate([0,0,44.25])
    difference(){
        cube([L-1.25*H,B-H-0.5,H/2],center=true);
        translate([L/2-6,B/2-6,0])
        cylinder(d=4,h=30,center=true);
        translate([-(L/2-6),B/2-6,0])
        cylinder(d=4,h=30,center=true);
        translate([L/2-6,-(B/2-6),0])
        cylinder(d=4,h=30,center=true);
        translate([-(L/2-6),-(B/2-6),0])
        cylinder(d=4,h=30,center=true);
        
        translate([70,0,0])
        cube([58,51,10],center=true);
    }
    // Platinenhalterung
    translate([0,-25.5,hHouse-3.5])
    union() {
        Nippel(hDorn);
        translate([-89,0,0])
        Nippel(hDorn);
        translate([-89,50,0])
        Nippel(hDorn);
        translate([0,50,0])
        Nippel(hDorn);
    }
}

module Batteriedeckelloecher() {
        translate([26,22,0])
        cylinder(d=2,h=5,center=true);
        translate([-26,22,0])
        cylinder(d=2,h=5,center=true);
        translate([26,-22,0])
        cylinder(d=2,h=5,center=true);
        translate([-26,-22,0])
        cylinder(d=2,h=5,center=true);
}

module Batteriedeckel() {
    color("White")
    translate([70,0,44])
    difference() {
        cube([56,49,2],center=true);
        Batteriedeckelloecher();
    }
}

module Batteriehalter() {
    color("Lightgreen")
    translate([88,0,37])
    difference() {
        union() {
            translate([-78,0,-25])
            import("4xAAA-Batteriehalter.stl",convexity=3);
            translate([8.5,0,0])
            cube([5,60,12.5],center=true);
            translate([-45,0,0])
            cube([5,60,12.5],center=true);
            }
        translate([-18,0,5.5])
        Batteriedeckelloecher();
    }
}

module Digits(){
    translate([-68,0,0])
    Digit();
    translate([0,0,0])
    Digit();
    translate([68,0,0])
    Digit();    
}

module Digit() {
    color("black")
    translate([1.5,10,7])
    difference(){
        cube([66,27.3,2], center=true);
        a=30;
        b=11;
        translate([a,b,0])
        cylinder(d=3,h=4,center=true);
        translate([-a,b,0])
        cylinder(d=3,h=4,center=true);
        translate([a,-b,0])
        cylinder(d=3,h=4,center=true);
        translate([-a,-b,0])
        cylinder(d=3,h=4,center=true);
    }
    
    color("gray")
    translate([0,10,3])
    cube([50.5,19,9.7],center=true);
}

module Display() {
    cube([Ldisplay,Bdisplay,Hdisplay],center=true);
}

module Nippel(hh) {
    difference() {
        cylinder(d=dDorn, h=hh, center=true);
        cylinder(d=3, h=hh+2, center=true);
    }
}

module DiplayLoecher(){
    translate([1.5,0,0])
    union(){
        translate([30,11,H/2])
        Nippel(hDorn);
        translate([-30,11,H/2])
        Nippel(hDorn);
        translate([30,-11,H/2])
        Nippel(hDorn);
        translate([-30,-11,H/2])
        Nippel(hDorn);
    }
}

module Stutz() {
    difference() {
        cube([dStutz,dStutz,hHouse-H],center=true);
        translate([0,0,0])
        cylinder(d=3,h=hHouse+2,center=true);
    }
}

module House() {
    translate([0,0,hHouse/2+H/2])
    difference(){
        cube([L,B,hHouse],center=true);
        cube([L-H,B-H,hHouse+2],center=true);

        SonicLeft();
        SonicRight();
        
        LaserLeft();
        LaserRight();

        Tasten();

    }
    
    
    translate([0,0,hHouse/2])
    {
        translate([(L/2-dStutz/2-2),(B/2-dStutz/2-2),0])
        Stutz();
        translate([(L/2-dStutz/2-2),-(B/2-dStutz/2-2),0])
        rotate([0,0,-90])
        Stutz();
        translate([-(L/2-dStutz/2-2),(B/2-dStutz/2-2),0])
        rotate([0,0,90])
        Stutz();
        translate([-(L/2-dStutz/2-2),-(B/2-dStutz/2-2),0])
        rotate([0,0,180])
        Stutz();
    }
    
}

module Laser() {
    cylinder(d=6, h=10,center=true);
}

module LaserLeft() {
    rotate([0,90,0])
    translate([15,0,L/2])
    Laser();
}

module LaserRight() {
    rotate([0,90,0])
    translate([15,0,-L/2])
    Laser();
}

module Platine() {
    translate([-45,0,26])
    difference() {
        cube([99,58,23],center=true);
        translate([44.5,25,0])
        cylinder(d=3,h=30,center=true);
        translate([-44.5,25,0])
        cylinder(d=3,h=30,center=true);
        translate([-44.5,-25,0])
        cylinder(d=3,h=30,center=true);
        translate([44.5,-25,0])
        cylinder(d=3,h=30,center=true);
    }
}

module Sonic() {
    cube([Bsonic,Lsonic,1.5],center=true);
    
    translate([0,13,Hsonic/2])
    cylinder(d=dSonic,h=Hsonic,center=true);
    
    translate([0,-13,Hsonic/2])
    cylinder(d=dSonic,h=Hsonic,center=true);
}

module SonicLeft() {
        rotate([0,90,0])
        translate([0,0,L/2-Hsonic/2])
        Sonic();
}

module SonicRight() {
        rotate([0,-90,0])
        translate([0,0,L/2-Hsonic/2])
        Sonic();
}

module cm() {
    rotate([180,0,0])
    linear_extrude(2)
    text("mm", size=6);
}
module onoff() {
    rotate([180,0,0])
    linear_extrude(2)
    text("on/off", size=6);
}


module Plus() {
    rotate([180,0,0])
    linear_extrude(2)
    text("+", size=6);
}

module Minus() {
    rotate([180,0,0])
    linear_extrude(2)
    text("-", size=6);
}

module Stern() {
    rotate([180,0,0])
    linear_extrude(2)
    text("*", size=6);
}


module Tasten() {
        KnopfLinks();
        KnopfMitte();
        KnopfRechts();
        translate([25,-14.25,-12])
        difference() {
            color("Gray") cube([64,30.5,3],center=true);
            translate([-29.5,-12.5,0])
            cylinder(d=3,h=6,center=true);
            translate([29.5,12.5,0])
            cylinder(d=3,h=6,center=true);
            translate([-29.5,12.5,0])
            cylinder(d=3,h=6,center=true);
            translate([29.5,-12.5,0])
            cylinder(d=3,h=6,center=true);
        }
}

module KnopfLinks() {
     color("Red") translate([0,0,0]) Knopf();
}

module KnopfMitte() {
     color("Black") color("White") translate([20,0,0]) Knopf();
}

module KnopfRechts() {
     color("White") translate([40,0,0]) Knopf();
}

module Knopf() {
    translate([5,-20,-20])
    cylinder(d=12.75,h=15,center=true);
}
module Base() {
    
    difference(){
        cube([L,B,H],center=true);
        translate([0,+Abst,0])
        Display();
        translate([-Ldisplay-Gap,+Abst,0])
        Display();
        translate([+Ldisplay+Gap,+Abst,0])
        Display();
        
        translate([-Ldisplay/2-Gap+1,+Abst+3,-1])
        cm();
        translate([ Ldisplay/2+1,+Abst+3,-1])
        cm();
        translate([ 2*Ldisplay-Gap/2+1,+Abst+3,-1])
        cm();
        
        translate([80,-20,0])
        cube([20.5,14.5,50],center=true);
        
        translate([ 2*Ldisplay-Gap/2-2,-14,-1])
        onoff();
        
        translate([0,0,20])
        Tasten();        
    }
    
    translate([0,+Abst,0])
    DiplayLoecher();
    translate([-Ldisplay-Gap,+Abst,0])
    DiplayLoecher();
    translate([+Ldisplay+Gap,+Abst,0])
    DiplayLoecher();
    
    translate([-4,-27,5.5])
    Nippel(hDorn+1);
    
    translate([54,-27,5.5])
    Nippel(hDorn+1);
    

}

module BaseLayer() {
    LL = L-26;
    BB = B -8;
    color("Lightgray")
    translate([0,0,16])
    {
        difference(){
            union() {
                translate([0,0,-3])
                cube([LL,BB,H/2],center=true);
                translate([0,26,-8])
                cube([LL,2,12],center=true);
                translate([0,-26,-8])
                cube([LL,2,12],center=true);
            }
            translate([0,0,0])
            cube([40,40,60],center=true);
            translate([70,0,0])
            cube([40,40,60],center=true);
            translate([-70,0,0])
            cube([40,40,60],center=true);
            
            translate([-2,0,8])
            scale([1.1,1.1,1.1])Tasten();
        }
        
        
    }
}

module Abstandsmesser() {
    difference() {
        union() {
            if (Base) Base();
                
            if (House) {
                difference(){
                    House();
                }
            }

            if (BaseLayer) BaseLayer();
                
            if (Batteriehalter) Batteriehalter();
                
            if (Batteriedeckel) Batteriedeckel();
            
            if (Deckel) Deckel();
                
            if (Platine) color("Pink") Platine();
                
            if (Laser) { 
                color("Red") translate([-4,0,24])LaserLeft();
                color("Red") translate([ 4,0,24])LaserRight();
            }
            
            if (Sonic) { 
                color("LightBlue") translate([-4,0,24])SonicLeft();
                color("LightBlue") translate([ 4,0,24])SonicRight();
            }
            
            if (Tasten){
                translate([0,0,23])Tasten();
            }
            
            if (Digits) Digits();
        }
        if (Laengsschnitt) translate([0,B/2,hHouse/2]) cube([L+10,B,hHouse+10],center=true);

        if (Querschnitt) translate([L/4,0,hHouse/2]) cube([L/2,B+10,hHouse+10],center=true);
    }
}

Abstandsmesser();