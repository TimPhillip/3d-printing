//Cocktailmakerfront

use <../Cocktailtrichter/Cocktailtrichter.scad>
use <../Tropfschale/Tropfschale.scad>
use <../Cocktailmakerbeleuchtungsring/Cocktailmakerbeleuchtungsring.scad>
use <../CocktailLogo/Cocktailmaker.scad>
use <../ILIDisplay/ILIDisplay.scad>
use <Fronthalterung.scad>


//Cocktailmakermaße
cb=208;
ct=210;
ch=304;

//Frontmaße
fl=200;
fh=120;
fb=4;

// Schalenfrontmaße
sl=fl;
sh=25;
sb=fb;

front = true;

fronthalterung = true;

cocktailmaker=true;
schalenfront=true;
display=false;

if (front) front();

if (cocktailmaker) cocktailmaker();
if (schalenfront) schalenfront();
    
if (fronthalterung) {
    
    translate([cb-fb-20,20+fb,ch-90-fb])
    rotate([0,0,-90])
    fronthalterung();

    rotate([0,180,90])
    translate([-20-fb,-20-fb,-cb-90-2])
    fronthalterung();
}

module front() {
    color("gray")
    translate([fb,0.1,ch-fh-fb])
    
    difference(){
      hull(){
        cube([fl,fb,fh],center=false);
        translate([fl/4 +10,-10,fh/4 +10])
        minkowski(){
            cube([fl/2 -20,fb,fh/2 -20],center=false);
            rotate([90,0,0])
            cylinder(r=10, h=1, center=true);
        }
      }
 //     translate([fl/2,0,fh/2])
 //     cube([50,100,40], center= true);
      
      
      translate([fl/2,0,0])
      rotate([90,0,0])
      scale([3.5,1.2,1]) //0.3
      cylinder(r = 20, h=100,center=true);
      
      // Displayausschnitt
      translate([fl/2,0,fh/2])
      translate([0,-5,0])
      rotate([-90,0,0])
      ili9341(true);
      
      
      translate([fl/2,0,fh/2])
      translate([0,-5,0])
      rotate([-90,0,0])
      ili_halterung(true);

    }
    // Display
    if (display)
    translate([fb,0.1,ch-fh-fb])
    translate([fl/2,0,fh/2])
    translate([0,-5,0])
    rotate([-90,0,0])
    ili9341();   
    
    // Display-Halterung
//    translate([fb,0.1,ch-fh-fb])
//    translate([fl/2,0,fh/2])
//    translate([0,-5,0])
//    rotate([-90,0,0])
//  ili_halterung();   
    
}

module cocktailmaker() {
    color("gray")
    union() {
        difference(){

            cube([cb,ct,ch],center=false);
            translate([fb,-fb,fb])
            cube([cb-2*fb,ct,ch-2*fb],center=false);
        }
        translate([0,90,0])
        cube ([cb,fb,ch]);
    } 
    translate([cb/2,50,200])
    color("darkgray")
    cocktailtrichter();
    
    translate([cb/2,45,15.5+fb])
    color("lightgray")
    tropfschale();
    
    translate([cb/2,50,195])
    ledring();
    
    // Display
//    color("black")
//    translate([cb/2,-5,ch-fh/2-fb])
//    cube([50,10,40], center= true);
    
    translate([cb/2,-5,ch-fh/2-fb])
    rotate([-90,0,0])
    ili9341();
}

module schalenfront() {
    color("gray")
    translate([sb,0.1,sb])
    difference(){
        hull(){
            cube([sl,sb,sh],center=false);
            translate([sl / 6,-5,sh/3])
            cube([2 * sl / 3,sb,2 * sh / 3],center=false);
        };
        translate([-1,0,sh -3])
        cube([sl +2,sb +1,5]);
        
        /*translate([0,-sb,0])
        cube([15,sb,15]);
        
        translate([sl - 15,-sb,0])
        cube([15,sb,15]);*/
    }
    
    translate([cb/2-104/2,-5,sh / 2 + 1.5])
    rotate([90,0,0])
    logo();
}