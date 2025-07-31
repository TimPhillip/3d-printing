// Der Kartograph - Universal Tokens

x = 9;      // Token Länge
y = 9;      // Token Breite
z = 5;      // Token Höhe
t = 28;     // Token Abstand

Wald = "Green";
Dorf = "Red";
Acker = "Yellow";
Wasser = "Blue";
Monster = "Violet";
Gebirge = "Black";
Ruine = "Gray";
Berg = "Black";

/* [Kartograph] */
Board = true;
Einer_Teil = true;
U_Teil = true;
T_Teil = true;
L_Teil = true;
l_Teil = true;
i_Teil = true;
I_Teil = true;
Eck_Teil = true;
Balken_Teil = true;
Hand_Teil = true;
Treppe_Teil = true;
t_Teil = true;
Arm_Teil = true;
Kreuz_Teil = true;
Wurm_Teil = true;
Ruin_Teil = true;
Mountain_Teil = true;
Monster1_Teil = true;

// U-Token
module U_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([-1*x,1*y,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
}

// T-Token
module T_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
    translate([00,2*y,00]) Atom(c);
}

// L-Token
module L_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
    translate([1*x,2*y,00]) Atom(c);
}
// l-Token
module l_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
}

// i-Token
module i_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
}

// Eck-Token
module Eck_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
}

// Hand-Token
module Hand_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
    translate([00,2*y,00]) Atom(c);
}

// I-Token
module I_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
}

// Treppe-Token
module Treppe_Token(c) {
    translate([1*x,00,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
    translate([00,2*y,00]) Atom(c);
    translate([-1*x,2*y,00]) Atom(c);
}

// t-Token
module t_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
}

// Arm-Token
module Arm_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
    translate([1*x,1*y,00]) Atom(c);
}

// Balken-Token
module Balken_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([-2*x,00,00]) Atom(c);
}

// Kreuz-Token
module Kreuz_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,00,00]) Atom(c);
    translate([1*x,00,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
    translate([00,-1*y,00]) Atom(c);
}

// Wurm-Token
module Wurm_Token(c) {
    translate([00,00,00]) Atom(c);
    translate([-1*x,1*y,00]) Atom(c);
    translate([-1*x,2*y,00]) Atom(c);
    translate([00,1*y,00]) Atom(c);
    translate([00,-1*y,00]) Atom(c);
}

// Ruin-Token
module Ruin_Token(c) {
    translate([00,00,00]) color(Ruine) Atom(c);
    translate([00,00,1*z]) color(Ruine)Atom(c);

}

// Mountain-Token
module Mountain_Token(c) {
    translate([00,00,00]) color(Berg) Atom(c);
    translate([00,00,1*z]) scale ([0.5,0.5,1])color(Berg)Atom(c);

}

// Monster1-Token
module Monster1_Token(c) {
    translate([00,00,00]) color(Monster) Atom(c);
    translate([1*x,1*y,00]) color(Monster) Atom(c);
    translate([2*x,2*y,00]) color(Monster) Atom(c);


}


// Atomares Element
module Atom(c) {
    translate([0.25,0,00])union() {
        cube([x-0.15,y-0.15,z-2],center=true);
        translate([00,00,z/2-0.25])color(c) cube([x-1.25,y-1.25,1.5],center=true);
        translate([00,00,-z/2+0.25])color(c) cube([x-1.25,y-1.25,1.5],center=true);
    }
}

// Mat-Element
module Mat() {
    translate([0.25,0.25,-3])
    difference(){
        cube([x+1,y+1,3],center=true);
        translate([0,0,3])cube([x,y,z+1],center=true);
    }
}

// Board-Element
module Board(){
    for (j=[0:10]) {
        for (k=[0:10]) {
            translate([j*x,k*y,0])Mat();
        }
    }
    difference() {
        translate([45+0.25,45+0.25,-3]) cube([110,110,3],center=true);
        translate([45+0.25,45+0.25,-2]) cube([100,100,3],center=true);
    }
    
    difference() {
        translate([10*x/2+0.25,-14,-3]) cube([12*x+2,2*y,3],center=true);
        
        for (j=[1:10]) {

             translate([j*x,-12.5,-3])cylinder(r=2,h=3,$fn=30);
             translate([j*x,-18.5,-3])cylinder(r=2,h=3,$fn=30);
        }
    }
}

///////////////////////////////////////////////
// Alle Elements

CC = Dorf;                        // gewünschte Farbe

if (Einer_Teil) translate([0*x,0*y,0])  Atom(CC); 
if (U_Teil) translate([3*x,0*y,0])  U_Token(CC); 
if (T_Teil) translate([1*x,3*y,0])  T_Token(CC); 
if (L_Teil) translate([1*x,7*y,0])  L_Token(CC); 
if (l_Teil) translate([7*x,0*y,0])  l_Token(CC); 
if (i_Teil) translate([4*x,3*y,0])  i_Token(CC); 
if (I_Teil) translate([4*x,5*y,0])  I_Token(CC); 
if (Eck_Teil) translate([4*x,7*y,0])  Eck_Token(CC); 
if (Balken_Teil) translate([6*x,10*y,0]) Balken_Token(CC); 
if (Hand_Teil) translate([7*x,3*y,0])  Hand_Token(CC); 
if (Treppe_Teil) translate([8*x,6*y,0])  Treppe_Token(CC); 
if (t_Teil) translate([11*x,0*y,0]) t_Token(CC); 
if (Arm_Teil) translate([11*x,3*y,0]) Arm_Token(CC); 
if (Kreuz_Teil) translate([11*x,9*y,0]) Kreuz_Token(CC); 
if (Wurm_Teil) translate([14*x,5*y,0]) Wurm_Token(CC); 
if (Ruin_Teil) translate([14*x,0*y,0]) Ruin_Token(CC); 
if (Mountain_Teil) translate([14*x,2*y,0]) Mountain_Token(CC); 
if (Monster1_Teil) translate([16*x,2*y,0]) Monster1_Token(CC); 

if (Board) translate([0,0,0])   color("Gray")Board(); 


/*
*/
///////////////////////////////////////////////