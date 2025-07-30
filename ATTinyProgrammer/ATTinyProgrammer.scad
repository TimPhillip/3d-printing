////////////////////////////
// **** **** *  * * *   *
// *  * *    *  * * * * *
// **** *    **** * *   *
// *  * *    *  * * *   *
// *  * **** *  * * *   *
////////////////////////////

// ATTinyProgrammer

////////////////////////////
// externe Parameter
////////////////////////////

/*[ Modellteile ] */
Deckel = true;
Base = true;

/*[ Hilfsteile ] */
Platine = false;
USB = true;
LED = true;
Sockel = true;

/* [Schnitte] */
Quer = false;

////////////////////////////
// Interne Konstanten
////////////////////////////
module intern() {};
PlatinX = 48.5; 
PlatinY = 79.0;
PlatinZ = 20.2;


BaseInnenX = PlatinX + 6;
BaseInnenY = PlatinY + 6;
BaseInnenZ = PlatinZ + 2;

BaseOutX = BaseInnenX + 4;
BaseOutY = BaseInnenY + 4;
BaseOutZ = BaseInnenZ + 2;


LEDZ = 24.0;

////////////////////////////
// Module
////////////////////////////
module Platine() {
    $fn=60;
    color("pink") 
    difference() {
        translate([0,0,PlatinZ/2])    
        cube([PlatinX, PlatinY, PlatinZ],center=true);
        
        a=14.5;
        b=5;
        translate([0,PlatinY/2-a/2+0.5,PlatinZ/2+b/2+0.5])    
        cube([PlatinX+2,a, PlatinZ-b],center=true);
        
        c=7.5;
        d=5;
        translate([0,-PlatinY/2+c/2-0.5,PlatinZ/2+d/2+0.5])    
        cube([PlatinX+2,c, PlatinZ-d],center=true);
        
        Platinenloecher(2,200);
    }
    
    if (LED) LED();
    
    if (Sockel) Sockel();
    
    if (USB) USB();
    
}


module Base() {
    translate([0,0,BaseOutZ/2-2])    
    difference () {
        translate([0,0,0])
        cube([BaseOutX,BaseOutY,BaseOutZ],center=true);
        translate([0,0,2])
        cube([BaseInnenX,BaseInnenY,BaseInnenZ+4],center=true);
        
        Absatz();
    }
    
    difference() {
        Platinenloecher(5,3);
        Platinenloecher(1.5,7);
    }        
    
    difference() {
        Deckelfixierung(4.5,6);
        Deckelfixierung(2,70);
    }
}


module Platinenloecher(dd,hh) {
    translate([(PlatinX/2-3),(PlatinY/2-3),0])
    Platinenloch(dd,hh);
    translate([-(PlatinX/2-3),(PlatinY/2-3),0])
    Platinenloch(dd,hh);
    translate([(PlatinX/2-3),-(PlatinY/2-3),0])
    Platinenloch(dd,hh);
    translate([-(PlatinX/2-3),-(PlatinY/2-3),0])
    Platinenloch(dd,hh);
}


module Platinenloch(dd,hh) {
    cylinder(d=dd,h=hh,$fn=60,center=true);
}

module Absatz() {
    translate([0,BaseOutY/2-8,5])
    cube([BaseOutX+2,18,BaseOutZ-6],center=true);
    
    translate([0,-BaseOutY/2+2,5])
    cube([BaseOutX+2,18,BaseOutZ-6],center=true);
    
}

module Deckelfixierung(dd,hh) {
    translate([(BaseOutX/2-3),(BaseOutY/2-3),hh/2])
    Deckelfix(dd,hh);
    translate([-(BaseOutX/2-3),(BaseOutY/2-3),hh/2])
    Deckelfix(dd,hh);
    translate([(BaseOutX/2-3),-(BaseOutY/2-3),hh/2])
    Deckelfix(dd,hh);
    translate([-(BaseOutX/2-3),-(BaseOutY/2-3),hh/2])
    Deckelfix(dd,hh);
}

module Deckelfix(dd,hh) {
    cylinder(d=dd,h=hh,$fn=60,center=true);
}


module Deckel() {
    translate([0,-3,0])
    difference() {
        union() {
            Top();
            Front();
            Back();
            
            FrontTop();
            BackTop();
        }
        translate([0,0,5])
        LED();
        
        translate([-2,-4,2])
        scale([1.1,1,1.1])Sockel();
        translate([-2,1,2])
        scale([1.1,1,1.1])Sockel();
        
        translate([0.5,-2,0])
        scale([1.2,1,1])USB();
        translate([0.5,-2,1])
        scale([1.2,1,1])USB();
        translate([0.5,-2,2])
        scale([1.2,1,1])USB();
        
        
        translate([0,3,0])
        Deckelfixierung(2.5,20);
    }
}

module Top() {
    translate([0,-2.75,BaseOutZ-0.5])
    cube([BaseOutX,BaseOutY-28.5,2], center=true);
}

module FrontTop() {
    translate([0,-37,7+0.5])
    cube([BaseOutX,BaseOutY-80,2], center=true);
}

module BackTop() {
    translate([0,36.5,8-0.5])
    difference() {
        cube([BaseOutX,BaseOutY-67,2], center=true);
        translate([(-BaseOutX/2+0.5),-8.5,0])
        cube([3,7,50],center=true);
        translate([(BaseOutX/2-0.5),-8.5,0])
        cube([3,7,50],center=true);
    }
}

module Front() {
    translate([0,-32,BaseOutZ/2+3.5])
    cube([BaseOutX,2,BaseOutZ-6], center=true);
}

module Back() {
    translate([0,26.5,BaseOutZ/2+3.5])
    cube([BaseOutX-4,2,BaseOutZ-6], center=true);
}


module LED() {
    color("green")
    translate([PlatinX/2-17,PlatinY/2-18,LEDZ/2])
    cylinder(d=6, h=LEDZ, $fn=60, center=true);
}

module Sockel() {
    color("black")
    translate([2,PlatinY/2-6.5,4.2])
    cube([10,10,8.2],center=true);
}

module USB() {
    color("silver")
    translate([-2,-PlatinY/2+9.2,17.5])
    cube([7.8,9.2,3.7],center=true);   
}

////////////////////////////
//Hauptprogramm
////////////////////////////

    difference() {
        union() {
            if (Platine) Platine();
            if (Base) Base();
            if (Deckel) Deckel();
        }

        if (Quer) {
            translate([0,-100,-100])
            cube([200,200,200]);
        }
    }
    
    