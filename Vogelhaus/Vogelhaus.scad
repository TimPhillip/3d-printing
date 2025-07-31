// Vogelhaus


Futter = false;
Boden = false;
Dach = false;
Daecher = false;
Ecke = false;
Wand = false;
Steg = false;
Veranda = false;
Deckel = false;
Leiste = false;
Leisten = false;
Schindeldach = false;

module Brett()
{
    minkowski()
    {
        cube([BB,TT,HH],true);
        sphere(r=2);
    }

}

module HalbesBrett()
{
    minkowski()
    {
        cube([BB/2,TT,HH],true);
        sphere(r=2);
    }

}


module Wand()
{
    
    for (i=[0:7])
    {
        if (i%2)
        {
            translate([-BB/2-3,0,i*(HH+3)])
            Brett();
            translate([(BB/4),0,i*(HH+3)])
            HalbesBrett();
        }
        else
        {
            translate([0,0,i*(HH+3)])
            Brett();
            translate([(-BB/4-13),0,i*(HH+3)])
            HalbesBrett();
        }
    }
}

module Ecke()
{
    translate([90,-150,0])
    union(){
        translate([-10,0,0])
        Wand();
        rotate([0,180,60])
        translate([-10,0,-91])
        Wand();
    }
}

module Ecken()
{
    for (i=[0:5])
    {   
        rotate([0,0,i*60])
        Ecke();
    }
}

 module Bodenplatte()
 {
    translate([0,0,-HH-2])
    cylinder(d=400, h=TT, $fn=6); 
 }
 
 module Futterspender()
 {
    fd = 140;
    fh = 150;
     
    Spender(); 
    difference()
    {
        translate([0,0,-7])
        cylinder(d=fd, h=fh, $fn=6); 
        translate([0,0,-7])
        cylinder(d=fd-16, h=fh+5, $fn=6); 
        for (i=[0:2])
        rotate([0,0,i*60])
        cube([50,135,50],true);
    } 
 }
 
 module Spender()
 {
    fd = 140;
    fh = 140;
     
    difference()
    {
        translate([0,0,-7])
        cylinder(d=fd, h=fh, $fn=6); 
        for (i=[0:5])
            rotate([-30,0,i*60])
            translate([0,00,125])
            cube([50,140,200],true);
       
    }
 }
 
 module Dach()
 {
    fd = 230;
    fh = 5;
     
    difference()
    {
        translate([-98,56,105])
        rotate([0,-15,-30])
        cylinder(d=fd, h=fh, $fn=3); 
        translate([-10,-40,0])
        rotate([0,0,60])
        cube([86,72,150]);
    } 
 }
 
 module Daecher()
 {
     for (i=[0:5])
        rotate([0,0,i*60])
        Dach();
 }
 
 
 module Gelaender()
 {
     translate([200,0,-7])
     rotate([0,0,-120])
     for(i=[0:19])
         translate([i*10+5,-10,0])
         cylinder(d=5,h=20, $fn=20);
     translate([200,0,-7])
     rotate([0,0,-120])
     translate([0,-15,0])
     cube([200,10,5]);
     translate([200,0,10])
     rotate([0,0,-120])
     translate([0,-15,0])
     cube([200,10,5]);
 }
 
 module Steg()
 {
     difference()
     {
        Gelaender();
        translate([187,5,-5])
        cube([20,10.5,50],true); 
        rotate([0,0,-60])
        translate([187,-5,-5])
        cube([20,10.5,50],true); 
     }
}
 
 module Veranda()
 {
     for (i=[0:5])
        rotate([0,0,i*60])
        Steg();
 }
 
 module Deckel()
 {
    fd = 160;
    fh = 20;
    translate([0,0,141])
    cylinder(d=fd, h=fh, $fn=6); 
    translate([0,0,132])
    cylinder(d=fd-44, h=fh+8, $fn=6); 
     
    translate([0,0,161])
    sphere(d=30,$fn=120);
     
    translate([0,0,161])
    cylinder(d=10,h=30);
     
    translate([0,0,211])
    sphere(d=60,$fn=120);
 }
 
module Leiste()
 {
    translate([0,0,142])
    rotate([13,0,30])
    translate([0,-145,0])
    cube([10,150,5],true);
 }

module Leisten()
 {
    if (Schindeldach)
    translate([0,0,2])
    for (i=[0:5])
        rotate([0,0,i*60])
        Leiste();
 } 
 
module Schindel()
{
    cylinder(d=8,h=0.5,$fn=30);
    translate([10,0,0.25])
    cube([20,8,0.5],true);
}

module Schindelreihe()
{
    for (i=[0:25])
        translate([0,i*8.5,0])
        Schindel();
}

module Schindeldach()
{
    for (k=[0:5])
    rotate([0,0,k*60])
    {
        translate([-88,58,120])
        rotate([0,0,-30])
        intersection()
        {
            translate([-60,-110,-20])
            rotate([0,-10,0])
            for (i=[0:20])
            {
                if (i%2)
                    translate([5*i,00,i*0.5])
                    Schindelreihe();
                else
                    translate([5*i,5,i*0.5])
                    Schindelreihe();
            }

            rotate([0,0,30])
            translate([85,-56,-115])
            Dach();
        }
    }
}

// ----------------------
// Main

BB = 20;        // Steinbreite
HH = 10;        // Steinhöhe
TT = 5;         // Steintiefe
 
if (Futter) color("lightgray") Futterspender(); 
if (Boden) color("darkgray") Bodenplatte();
if (Dach) Dach();
if (Daecher) color("black") Daecher();
if (Ecke) Ecke();
if (Wand) color("gray") Ecken();
if (Steg) Steg();
if (Veranda) color("black") Veranda();
if (Deckel) color("darkgray") Deckel();
if (Leiste) Leiste();
if (Leisten) color("gray") Leisten();
if (Schindeldach) color("darkred")Schindeldach();

// ----------------------