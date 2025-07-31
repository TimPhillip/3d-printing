// optimierter Radialventilator
use <../MiniMotor\MiniMotor.scad>

/* [Dimensionen des Gehäuses ] */
//Gehäuse Durchmesser
Gd = 45;
//Gehäuse Höhe
Gh = 20;
//Gehäuse Breite
Gb = 60;
//Gehäuse Wandstärke
Gw = 2;

/* [Dimensionen des Venilators ] */
//Ventilator Durchmesser
Vd = 34;
//Ventilator Höhe
Vh = 13;

/* [Komponenten Drucksteuerung ] */
show_Gehause_unten = true;
show_Gehause_oben = true;
show_Ventilator = true;
show_Motor = true;
show_Kreuz = false;

if (show_Gehause_unten) Gehause_unten();
if (show_Gehause_oben) Gehause_oben();
    
if (show_Ventilator) Ventilator();
if (show_Motor) Motor();


// Module
// ====================================

module Gehause() {
    difference()
    {
        $fn=90;
        Kontur_aussen();
        Kontur_innen();
    }
    
    // Verschraubung
    rotate([0,0,0])
    translate([Gd/2+3,0,0])
    Verschraubung();
    rotate([0,0,90])
    translate([Gd/2+3,0,0])
    Verschraubung();
    rotate([0,0,-90])
    translate([Gd/2+3,0,0])
    Verschraubung();
    translate([-Gb/2+5,Gd/2+3,0])
    Verschraubung();
    translate([-Gb/2+5,-3,0])
    Verschraubung();
    // Motoradapter
    translate([0,0,Gh/2])
    Adapter();
    // Montageflansch
    translate([-Gb/2,Gd/4,0])
    Flansch();
}
module Kontur_aussen() {
    // runde Kontur
    cylinder(d=Gd,h=Gh, center=true);
    // eckige Kontur
    translate([-Gb/4,Gd/4,0])
    cube([Gb/2,Gd/2,Gh], center=true);
}

module Kontur_innen() {
    // runde Kontur
    cylinder(d=Gd-2*Gw,h=Gh-2*Gw, center=true);
    // eckige Kontur
    translate([-Gb/4-2*Gw,Gd/4,0])
    cube([Gb/2+2*Gw,Gd/2-2*Gw,Gh-2*Gw], center=true);
    // Ansaugloch
    translate([0,0,Gh/2])
    cylinder(d=Gd-10,h=4*Gw, center=true);
    // Achsloch
    translate([0,0,-Gh/2+5])
    cylinder(d=2.3,h=4*Gw, center=true);
    
}

module Gehause_unten() {
    difference()
    {
        Gehause();
        translate([0,0,Gh/2])
        cube([Gd+60,Gd+60,Gh],center=true);
    }
}
module Gehause_oben() {
    difference()
    {
        Gehause();
        translate([0,0,-Gh/2])
        cube([Gd+60,Gd+60,Gh],center=true);
   }
}

module Verschraubung() {
    difference()
    {
        $fn=30;
        cylinder(d=10,h=Gh, center=true);
        //Mittelloch
        cylinder(d=3,h=Gh+2, center=true);
        //Muttereinsatz
        translate([0,0,Gh/2-1.5])
        cylinder(d=6,h=4, center=true, $fn=6);
        //Schraubenkopfloch
        translate([0,0,-Gh/2+1.5])
        cylinder(d=8,h=4, center=true);
    }  
}

module Adapter() {
    difference() 
    {
        Kreuz();
        rotate([90,0,0])
        scale([1.1,1.05,1.05]) motor();
    }
}

module Kreuz() {
    difference()
    {
        union() 
        {
            cube([25,25,3*Gw],center=true);
            if (show_Kreuz)
            for (i=[0,1,2,3])
                rotate([0,0,i*90+45])
                translate([0,15,-Gw/2])
                cube([5,15,Gw], center=true);
        }
        // Motorfixierschraublöcher
        rotate([90,0,0])
        translate([0,1,0])
        cylinder(d=2.5,h=50, center=true, $fn=30);
    }
}

module Flansch() {
    difference()
    {
        $fn=30;
        cube([Gw,Gd/4+40,Gh], center=true);
        cube([Gw*2,Gd/2-2*Gw,Gh-2*Gw], center=true);
        
        // Montagelöcher
        rotate([0,90,0])
        {
            translate([Gh/2-3,Gd/2-3,0])
            cylinder(d=3,h=Gw*2,center=true);
            translate([-Gh/2+3,Gd/2-3,0])
            cylinder(d=3,h=Gw*2,center=true);
            translate([Gh/2-3,-Gd/2+3,0])
            cylinder(d=3,h=Gw*2,center=true);
            translate([-Gh/2+3,-Gd/2+3,0])
            cylinder(d=3,h=Gw*2,center=true);
        }
    }
}

module Ventilator() {
    color("lightyellow")
    union() {
        translate([0,0,-Gh/2+Gw+2])

        difference()
        {
            cylinder(d=Vd,h=Gw,center=true);
            cylinder(d=2, h=5,center=true);
        }
        for (i=[0,1,2,3,4,5,6,7,8,9])
            rotate([0,0,i*36])
            translate([-5,Vd/2-3.5,0])
            cube([Gw,5,Vh],center=true);
        }
}


module Motor() {
        color("lightblue")
        rotate([90,0,0])
        translate([0,7,0])
        motor();

}