// Bubble Machine
// ===================

use <../MiniMotor\MiniMotor.scad>
use <Pustefix.scad>
use <../H-BrueckenHalter\H-Brueckenhalterung.scad>
use <../Lufter\LufterWL5015.scad>


/*[ Dimension des Gehäuse ]*/
box_length = 115;
box_width = 70;
box_height = 120;

/* [ Dimension des Gebläsegehäuses ] */
fan_box_diameter = 40;
fan_box_height = 20;

/*[ Komponenten des Gehäuse ]*/
show_head = false;
show_floor = true;
show_side_left = true;
show_side_right = false;
show_front = false;
show_back = false;
show_rad = false;
show_trog = false;

/*[ Komponenten zusätzlich ]*/
show_achsverlaengerung = false;
show_stepmotor = false;
breakout = false;
show_miniMotorGehause = false;
show_miniMotor = false;
show_h_halter = false;
show_u_halter = false;
show_propeller = false;
show_fan_box_halbe1 = false;
show_fan_box_halbe2 = false;
show_fan = false;
show_back_mount = false;
show_lufter = false;
show_lufterhalter_oben = false;
show_lufterhalter_unten = false;
show_lufter_trichter = false;


if (show_head){
    translate([0,0,box_height])
    head();    
}
if (show_floor){
    difference() {
        rotate([180,0,0])
        translate([0,-box_width,0])
        head(); 
        
        // Platinenhalterungen
        translate([28,38,-10])
        cylinder(d=4,h=40, $fn = 30);
        translate([48.0,38,-10])
        cylinder(d=4,h=40, $fn = 30);
        translate([75,38,-10])
        cylinder(d=4,h=40, $fn = 30);
        translate([90.0,38,-10])
        cylinder(d=4,h=40, $fn = 30);
    }   
}

if (show_side_left){
    translate([0,0,0])
    side();    
}

if (show_side_right){
    difference() {
        rotate([0,0,180])
        translate([-box_length,-box_width,0])
        side();  
        
        // Stromanschluss
        rotate([0,90,0])
        translate([-45,40,80])
        cylinder(d=12,h=40);
    }
}

if (show_front){
    difference() {
        translate([0,0,0])
        front();  
        // Blasenloch
        rotate([90,0,0])
        translate([box_length/2,box_height-27,-10])
        cylinder(d=20,h=40, $fn = 30);
        
        // Achsauslass
        rotate([90,0,0])
        translate([box_length/2,box_height/2-4.5,-10])
        cylinder(d=12,h=40, $fn = 30);
        
        // Motorbefestigung
        rotate([90,0,0])
        translate([box_length/2+17,box_height/2+3,-10])
        cylinder(d=4,h=40, $fn = 30);
        rotate([90,0,0])
        translate([box_length/2-17,box_height/2+3,-10])
        cylinder(d=4,h=40, $fn = 30);
        
    }
}

if (show_back){
    difference() {
        rotate([180,0,0])
        translate([0,-box_width,-box_height])
        front();    

        // Mini-Motor Befestigung
        rotate([90,0,0])
        translate([box_length/2-20,box_height/2+2,-80])
        cylinder(d=4,h=40, $fn=30);
        rotate([90,0,0])
        translate([box_length/2+20,box_height/2+2,-80])
        cylinder(d=4,h=40, $fn=30);
        rotate([90,0,0])
        translate([box_length/2-20,box_height/2+22,-80])
        cylinder(d=4,h=40, $fn=30);
        rotate([90,0,0])
        translate([box_length/2+20,box_height/2+22,-80])
        cylinder(d=4,h=40, $fn=30);
    }

}


if (show_stepmotor) {
    rotate([90,00,00])
    translate([box_length/2,box_height/2+3.5,-11])
    scale([10,10,10])
    import("../28BYJ-48-Stepper/StepMotorModel.stl");
}

if (breakout) {
    color("white")
    rotate([90,90,0])
    translate([-60,5,-77])
    cube([60,105,30]);
}

if (show_rad) {
    color("red")
    rotate([0,0,90])
    translate([-10,-box_length/2,box_height/2-4.5])
    rad($t);
}

if (show_achsverlaengerung) {
    translate([box_length/2,-10,box_height/2-4.5])
    achsverlaengerung();
}

if (show_trog) {
    translate([0,-4,0])
    trog();
}

if (show_miniMotorGehause) {
    rotate([0,0,90])
    translate([-11.5,-98,8])
    translate([box_length/2,box_width-13,box_height/2+10])
    gehause();
}

if (show_miniMotor) {   
    rotate([0,0,90])
    translate([-11.5,-94,-2])
    translate([box_length/2,box_width-13,box_height/2+20])
    motor();
    }

if (show_h_halter) {
    color("lightgray")
    rotate([0,-90,90])
    translate([23,-38,-30])
    Halter();
}


if (show_u_halter) {
    color("lightgray")
    rotate([0,-90,90])
    translate([16,-82,-30])
    import("../H-BrueckenHalter/ULN2003-Halterung.stl");
}

if (show_propeller) {
    color("red")
    rotate([90,0,0])
    translate([box_length/2,box_height/2+10,-box_width+32])
    import("../Propeller/propeller100x10.stl");

}

if (show_fan) {
    color("pink")
    rotate([0,90,0])
    translate([-box_height/2-18,box_width/2+10,box_length/2-6])
    import("../Propeller/RadialVentilator33x12 links.stl");
}

if (show_fan_box_halbe1) {
    translate([box_length/2,box_width/2+11,box_height/2+18])
    union()  {
        difference() {
            fan_box();
            translate([20,-50,70])
            rotate([0,180,0])
            cube([20,100,140]);
        }
    }
}

if (show_fan_box_halbe2) {
    
    translate([box_length/2,box_width/2+11,box_height/2+18])
    union()  {
        difference() {
            fan_box();
            translate([0,-50,70])
            rotate([0,180,0])
            cube([20,100,140]);
        }
    }
}

if (show_back_mount) {
    translate([39,box_width-4,box_height/2+20])
    back_mount();
}

if (show_lufter) {
    rotate([0,0,90])
    translate([38,-box_length/2+12,box_height-15])
    color("lightgray")
    DoppelLufter();
}

if (show_lufterhalter_oben)     
    rotate([0,0,90])
    translate([38,-box_length/2+1,box_height-23])
    color("lightgreen")
    lufterhalter_oben();

if (show_lufterhalter_unten) 
    rotate([0,0,90])
    translate([38,-box_length/2+1,box_height-23])
    color("lightgreen")
    lufterhalter_unten();

if (show_lufter_trichter) 
    rotate([-90,-90,-180])
    translate([box_height-26,-box_length/2+0,-10])
    color("lightblue")
    lufter_trichter();

// ------------------------
// Modules

module box(){
    difference(){
        minkowski(){
            cube([box_length,box_width,box_height]);
            sphere(r = 2);
        }
        cube([box_length,box_width,box_height * 2]);
       
        translate([-50,-50, box_height])
        cube([200,200,100]);
    }

    translate([2,2,0])
    for (i = [0,1,2,3]){
       translate((i % 2) == 0 ? [box_length - 4,0,0] : [0,0,0]){
       translate((i >= 2) ? [0,box_width - 4,0] : [0,0,0])
       screw_mount(outer= 2.5, inner= 1.5);}
    }
}


module screw_mount(outer, inner){

    difference(){
        cylinder(h= box_height, r= outer);
        translate([0,0,box_height / 5])    
        cylinder(h= box_height + 1, r= inner, $fn=8);   
    }    

}


module head(){
  difference(){
    minkowski(){
        translate([0,0,-1])
        cube([box_length,box_width,1]);
        sphere(r = 2);
    }
    
    translate([-50,-50, -100])
    cube([200,200,100]);
    
    translate([0,box_width / 4, -99])
    cube([box_length,box_width / 2,100]);
    
    translate([box_length / 6,box_width / 8,-99])
    cube([box_length * 4 / 6,box_width * 6 / 8,100]);
    
    translate([1,2.5,0])
    for (i = [0,1,2,3]){
       translate((i % 2) == 0 ? [0,box_width - 4,0] : [0,0,0]){
       translate((i >=2) ? [box_length-2,0,0] : [0,0,0]){
           translate([0,0,0.5])
       cylinder(r = 2.5, h = 20, center= false, $fn= 20);
       cylinder(r = 1.5, h = 20, center= true, $fn= 20);
       }  
      }
     }  
     
    translate([10,1.5,0])
    for (i = [0,1,2,3]){
       translate((i % 2) == 0 ? [0,box_width - 3,0] : [0,0,0]){
       translate((i >=2) ? [box_length-22,0,0] : [0,0,0]){
           translate([0,0,0.5])
       cylinder(r = 2.5, h = 20, center= false, $fn= 20);
       cylinder(r = 1.5, h = 20, center= true, $fn= 20);
       }  
      }
     }  
 }
}

module side(){
  difference(){
    minkowski(){
        translate([0,0,-1])
        cube([2,box_width,box_height]);
        sphere(r = 2);
    }
    
    translate([-50,-50, -100])
    cube([200,200,100]);
    
    translate([-50,-50, 0+box_height])
    cube([200,200,100]);
    
    translate([0,box_width / 4, 2])
    cube([box_length,box_width / 2,box_height-4]);
    
    translate([0,2,box_height/4/2-1])
    cube([box_length,box_width-4,box_height*6/8]);
    translate([1,2,-4])
    for (i = [0,1,2,3]){
       translate((i % 2) == 0 ? [0,box_width-4,0] : [0,0,0]){
       translate((i >= 2) ? [0,0,box_height-9] : [0,0,0]){
            translate([0,0,0])
            //rotate([0,90,0])
            cylinder(r = 1.5, h = 20, center= false, $fn= 20);
           }
       }
    }
   

  }  
}

module front() {
    difference() {
        minkowski(){
            translate([6,0,-1])
            cube([box_length-12,2,box_height]);
            sphere(r = 2);
        }
        
        // Materialeinsparung
        translate([-50,-50, -100])
        cube([200,200,100]);
        translate([-50,-50, 0+box_height])
        cube([200,200,100]);
        translate([box_length/8,0, 2])
        cube([box_length*6/8,box_width / 2,box_height-4]);
        translate([0,2,box_height/4/2-1])
        cube([box_length,box_width-4,box_height*6/8]);

        // Schraublöcher 
        translate([10,1,-10])
        for (i = [0,1,2,3]){
           translate((i % 2) == 0 ? [box_length-22,0,0] : [0,0,0]){
           translate((i >= 2) ? [0,0,box_height] : [0,0,0]){
                translate([0,0,0])
                cylinder(r = 1.5, h = 20, center= false, $fn= 20);
               }
           }
        }
     }
}

module rad(t){
    rotate([360*-t,0,0])
    translate([-3,0,0])
    difference(){
    
        for (i= [0,1,2,3,4]) {
            rotate([i*45,0,0])
            cube([2,5,63], center = true, $fn = 30);
            translate([0,0,0])
            rotate([i*45,0,0])
            //ring();
            fix();
            translate([0,0,0])
            rotate([i*-45,0,0])
            //ring();
            fix();
        }
    achse();
    }
 }
 
 module ring() {
     rotate([0,90,0])
     translate([40.5,0,0]){
        difference() {
        cylinder(d=20, h=2,center=true);
        cylinder(d=16, h=6,center=true);
        }
    }
 }
 
 module fix() {
     rotate([0,90,0])
     translate([38.5,0,0]){
     scale([0.2,0.2,0.2])pustefix();
     }
}
 
 module achse(){
      rotate([0,90,0])
     translate([0,0,0]){
        difference() {
            cylinder(d=5.75, h=7,center=true, $fn=30);
            
    translate([10+1.75,0,0])       cube([20,20,20],center=true, $fn=30);
    translate([-10-1.75,0,0])       cube([20,20,20],center=true, $fn=30);
        }
    }
    
 }
 
 module achsverlaengerung() {
      color("lightblue")
      rotate([90,90,0])
      translate([0,0,-3])
      difference() {
            cylinder(d=10, h=12,center=true, $fn=30);

            rotate([90,90,0])
            translate([4,0,0])
            achse();
            rotate([0,90,90])
            translate([3,0,4])
            cylinder(d=3,h=26, center=true, $fn=30);

            translate([0,0,0])
            cylinder(d=2,h=26, center=true, $fn=30);
          
                        translate([6.5,0,5.5])
    cube([10,10,4],center=true);
                        translate([-6.5,0,5.5])
    cube([10,10,4],center=true);
                        translate([0,7.5,5.5])
    cube([10,10,4],center=true);
                        translate([0,-7.5,5.5])
    cube([10,10,4],center=true);
      }
}

module trog() {
    difference(){
        translate([0,-20,0])
        minkowski(){
            cube([box_length,20,40]);
            sphere(r = 2);
        }
        translate([box_length/2,0,box_length/2])
        rotate([90,0,0])
        translate([0,0,10])
        cylinder(d=box_length-5,h=15.5,center=true,$fn=60);
    }
}

module fan_box() {
    color("lightblue")
    difference() {
       rotate([0,90,0]) 
       union() {

        difference() {
            // Gehäusekontur
            union() {
                cylinder(d=fan_box_diameter,h=fan_box_height, center=true, $fn=60);
                // Ohren
                rotate([0,0,-25])
                translate([fan_box_diameter/2+1,0,0])
                cylinder(d=10,h=20, center=true, $fn=60);
                rotate([0,0,-25])
                translate([-fan_box_diameter/2-1,0,0])
                cylinder(d=10,h=20, center=true, $fn=60);
                rotate([0,0,-25])
                translate([0,fan_box_diameter/2+1,0])
                cylinder(d=10,h=20, center=true, $fn=60);
                rotate([0,0,-15])
                translate([0,-fan_box_diameter/2-1,0])
                cylinder(d=10,h=20, center=true, $fn=60);

            }
            
            // Motorachsenloch
            cylinder(d=6,h=44, center=true, $fn=60);
            // Lufteinlass
            translate([0,0,10])
            cylinder(d=14,h=4, center=true, $fn=60);
            
            // Verbinderloch mit Motorgehäuse
            translate([10,10,-10])
            cylinder(d=3,h=4, center=true, $fn=60);
            translate([-10,10,-10])
            cylinder(d=3,h=4, center=true, $fn=60);
            translate([10,-10,-10])
            cylinder(d=3,h=4, center=true, $fn=60);
            translate([-10,-10,-10])
            cylinder(d=3,h=4, center=true, $fn=60);

            // Schraublöcher
            rotate([0,0,-25])
            translate([fan_box_diameter/2+1,0,0])
            {
            cylinder(d=4,h=22, center=true, $fn=60);
            translate([0,0,9])
            cylinder(d=6,h=5,center=true, $fn=30);
            }

            rotate([0,0,-25])
            translate([-fan_box_diameter/2-1,0,0])
            {
            cylinder(d=4,h=22, center=true, $fn=60);
            translate([0,0,9])
            cylinder(d=6,h=5,center=true, $fn=30);
            }

            rotate([0,0,-25])
            translate([0,fan_box_diameter/2+1,0])
            {
            cylinder(d=4,h=22, center=true, $fn=60);
            translate([0,0,9])
            cylinder(d=6,h=5,center=true, $fn=30);
            }

            rotate([0,0,-15])
            translate([0,-fan_box_diameter/2-1,0])
            {
            cylinder(d=4,h=22, center=true, $fn=60);
            translate([0,0,9])
            cylinder(d=6,h=5,center=true, $fn=30);
            }
        }       
       
        // Gebläserohr
        translate([-15,-24,0])
        rohr();
    }
        // Gehäuse aushöhlen
        rotate([0,90,0])
        translate([0,0,0])
        cylinder(d=fan_box_diameter-4,h=18, center=true, $fn=60);

        // Gebläserohr aushöhlen
        rotate([90,0,0])
        translate([0,15,25])
        cylinder(d2=16.5,d1=fan_box_diameter/2-14,h=45,center=true);
    }
}

module rohr() {
    rotate([90,0,0])
    difference() {
        cylinder(d2=19,d1=fan_box_diameter/2-10,h=45,center=true);
    }
}


module back_mount() {
    color("blue")
    difference(){
        cube([10,10,60],center=true);
        // Motorgehäusebefestigung
        rotate([0,90,0])
        translate([-10,0.5,0])
        cylinder(d=4,h=20,center=true,$fn=30);
        rotate([0,90,0])
        translate([10,0.5,0])
        cylinder(d=4,h=20,center=true,$fn=30);
        // Rückwandbefestigiung
        rotate([90,0,0])
        translate([-1,2.5,0])
        cylinder(d=4,h=20,center=true,$fn=30);
        rotate([90,0,0])
        translate([-1,-17.5,0])
        cylinder(d=4,h=20,center=true,$fn=30);
    }
}

module DoppelLufter()
{
    union() {
        rotate([180,0,0])
        translate([0,26,0])
        Lufter();
        rotate([0,0,0])
        translate([0,0,-15])
        Lufter();
    }
}

module lufterhalter() 
{
    difference()
    {
        translate([0,-1,0])
        cube([56,86,34],center=true);
        translate([0,-1,0])
        cube([100,27,31],center=true);
        translate([0,12,7.5])
        scale([1.03,1.03,1.03])DoppelLufter();
        rotate([0,0,0])
        translate([20,38,0])
        cylinder(d=2.5,h=100,center=true, $fn=40);
        translate([-20,-41,0])
        cylinder(d=2.5,h=100,center=true, $fn=40);
    }
}

module lufterhalter_oben()
{
    translate([0,0,2])
    difference()
    {
        lufterhalter();
        translate([0,0,-10.0])
        cube([58,98,20],center=true);
        rotate([0,90,0])
        translate([-10,30,-20])
        cylinder(d=2.5,h=20,center=true, $fn=40);
    }
}

module lufterhalter_unten()
{
    translate([0,0,2])
    difference()
    {
        lufterhalter();
        translate([0,0,10.0])
        cube([58,98,20.5],center=true);
        rotate([0,90,0])
        translate([10,-30,-20])
        cylinder(d=2.5,h=20,center=true, $fn=40);
    }
}

module lufter_trichter_kontour() 
{
    hull() {
        translate([5,0,0])
        cube([35,30,2],center=true);
        rotate([0,0,90])
        translate([0,0,8])
        cylinder(d=20,h=2,center=true);
    }
    translate([5,0,2])
    cube([35,80,6],center=true);
}
module lufter_trichter_innen() 
{
    hull() {
        translate([5,0,0])
        cube([30,28,4],center=true);
        rotate([0,0,90])
        translate([0,0,8])
        cylinder(d=18,h=4,center=true);
    }
}

module lufter_trichter() 
{
    difference()
    {
        lufter_trichter_kontour(); 
        translate([0,0,-1])
        lufter_trichter_innen(); 
        translate([20,35,0])
        cylinder(d=2.5,h=20,center=true, $fn=30);
        translate([-8,35,0])
        cylinder(d=2.5,h=20,center=true, $fn=30);
        translate([20,-35,0])
        cylinder(d=2.5,h=20,center=true, $fn=30);
        translate([-8,-35,0])
        cylinder(d=2.5,h=20,center=true, $fn=30);
    }
}

