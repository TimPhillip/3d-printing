// Wingspan / Flügelschlag

Fisch = false;
Wurm = false;
Maus = false;
Beere = false;
Korn = false;

Fischbox = false;
Wurmbox = false;
Mausbox = false;
Beerebox = false;
Kornbox = false;

Fischhalter = false;
Wurmhalter = false;
Maushalter = false;
Beerehalter = false;
Kornhalter = false;



HH = 8;
$fn = 50;

if (Fisch)  translate([00,0,0]) Fisch();
if (Wurm)   translate([0,0,0]) Wurm();
if (Maus)   translate([0,0,0]) Maus();
if (Beere)  translate([0,0,0]) Beere();
if (Korn)   translate([0,0,0]) Korn();
    
if (Fischbox)  translate([00,0,0]) Fischbox();
if (Wurmbox)   translate([20,0,0]) Wurmbox();
if (Mausbox)   translate([40,0,0]) Mausbox();
if (Beerebox)  translate([60,0,0]) Beerebox();
if (Kornbox)   translate([80,0,0]) Kornbox();
    
if (Fischhalter)  translate([00,0,0]) Fischhalter();
if (Wurmhalter)   translate([20,0,0]) Wurmhalter();
if (Maushalter)   translate([40,0,0]) Maushalter();
if (Beerehalter)  translate([60,0,0]) Beerehalter();
if (Kornhalter)   translate([80,0,0]) Kornhalter();
  
//BlaueFischBox();
//GrueneWurmBox();

module Fisch() {
    hf = 13.3;  // Höhe Fischrumpf
    hs = 12.7;  // Höhe Schwanz
    lf = 18.4;  // Länge Fischrumpf
    gl = 23.2;  // Länge Fisch
    ls = gl-lf; // Länge Schwanz
    
//    scale([0.85,0.95,1.0]) 
    color ("Blue") 
    minkowski() {
    
        union() {
            scale([1.0,lf/hf,1.0]) cylinder(d=hf, h=HH);
            
            difference() {
                translate([0,gl/2+2,0]) cylinder(d=hs, h=HH);
                translate([0,gl/2+2+5.5,-0.5]) cylinder(d=hs+4, h=HH+1);
                
            }
        }
        cylinder(r=1,h=5);
    }
    //translate([0,2.4,0]) cube([hf,gl,HH], center=true);
}


module Wurm() {
    
    hw = 22.7;  // Höhe Wurmrumpf
    hk = 16.5;  // Höhe Kopf
    gl = 37.2;  // Länge Wurm

    
//    scale([0.85,0.95,1.0]) 
    color ("Green") 
    minkowski() {
    
        union() {
            
            difference() {
                translate([hw/3,0,0]) cylinder(d=gl/3, h=HH);
                translate([hw/3+7,0,-0.5]) cylinder(d=gl/3, h=HH+1);
            }
            
            rotate([0,0,180])
            translate([-17,8,0])
            difference() {
                translate([hw/2,0,0]) cylinder(d=gl/3, h=HH);
                translate([hw/2+7,0,-0.5]) cylinder(d=gl/3, h=HH+1);
            }

            translate([-5,-18,0])
            difference() {
                translate([hw/2,0,0]) cylinder(d=gl/3, h=HH);
                translate([hw/2+7,0,-0.5]) cylinder(d=gl/3, h=HH+1);
            }
            translate([10,5,0]) cylinder(d=8,h=HH);    // Kopf
            translate([13,8,0]) cylinder(d=3,h=HH);    // Fühler
            translate([13,2,0]) cylinder(d=3,h=HH);    // Fühler
            
        }
        cylinder(r=1,h=5);    }
        
    //translate([12,-6,0]) cube([hw,gl,HH], center=true);
    }


module Maus() {
    
    }


module Beere() {
    
    }


module Korn() {
    
    }

module Fischbox() {
    difference() {
        Box();
        scale([1.1,1.1,1.1])Fisch();
    }    
}

module Wurmbox() {
    
    difference() {
        translate([11,-8,HH/2]) cube([25,45,HH], center=true);
        scale([1.1,1.1,1.1])Wurm();
    }    
}


module Mausbox() {
    
    }


module Beerebox() {
    
    }


module Kornbox() {
    
    }

module Box() {
    
    translate([0,2.4,HH/2])
    cube([20,30,HH], center=true);
    }

module Fischhalter() {
    
    Anzahl = 6;

    difference() {
        for (i=[0:1:Anzahl-1]){
            translate([0,0,HH*i]) Fischbox();
        }
        translate([8,2.5,(Anzahl+1)*HH/2]) cube([6,30-6,(Anzahl+1)*HH+1], center=true);
    }
    
    translate([0,2.4,-1]) cube([20,30,2], center=true);
}

module Wurmhalter() {
    
    Anzahl = 2;

    difference() {
        for (i=[0:1:Anzahl-1]){
            translate([0,0,HH*i]) Wurmbox();
        }
        translate([2,-10,(Anzahl+1)*HH/2]) cube([8,50-16,(Anzahl+1)*HH+1], center=true);
    }
    
    translate([11,-8,-1]) cube([25,45,2], center=true);
    }


module Maushalter() {
    
    }


module Beerehalter() {
    
    }


module Kornhalter() {
    
    }

module BlaueFischBox() {

    translate([0,0,0]) Fischhalter();
    translate([0,30,0]) Fischhalter();
    translate([0,60,0]) Fischhalter();
    translate([-60,0+4.8,0])rotate([0,0,180]) Fischhalter();
    translate([-60,30+4.8,0]) rotate([0,0,180]) Fischhalter();
    translate([-60,60+4.8,0]) rotate([0,0,180]) Fischhalter();
    
    translate([-50,-20+7.4,0]) difference() {
        cube([40,90,6*HH]);
        translate([2,2,-0.5]) cube([36,86,6*HH+1]);
    } 
    
    translate([-50,-20+7.4,-2]) cube([40,90,2]);
}

module GrueneWurmBox() {

    translate([1.5,30.5,0]) Wurmhalter();
    translate([1.5,75.5,0]) Wurmhalter();
    translate([88.5,14.5,0])rotate([0,0,180]) Wurmhalter();
    translate([88.5,59.5,0]) rotate([0,0,180]) Wurmhalter();
    
    translate([25,0,0]) difference() {
        cube([40,90,6*HH]);
        translate([2,2,-0.5]) cube([36,86,6*HH+1]);
    } 
    
    translate([25,0,-2]) cube([40,90,2]);
}
