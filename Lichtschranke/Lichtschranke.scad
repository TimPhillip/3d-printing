// Lichtschranke

Lichtschranke = true;
if (Lichtschranke) Lichtschranke();
Gewinde = true;
if (Gewinde) Gewinde();
    
led = 5.1;

h = 100;
b = 30;
t = 20;
w = 2;
    
module Lichtschranke() {
    $fn =30;
    
    difference() {
        union() {
            difference() {
                cube ([t,b,h], center=true);
                
                translate([-w,0,0])
                cube ([t,b-2*w,h-2*w], center=true);
                
                
                translate([0,-b/6,5])
                cylinder(r=3,h=h,center=true);
            
                translate([0,b/6,5])
                cylinder(r=3,h=h,center=true);

            }
            rotate([0,90,0])
            translate([h/3,0,t/2-5])
            cylinder(d=2*led,h=5,center=false);
            
            rotate([0,90,0])
            translate([0,0,t/2-5])
            cylinder(d=2*led,h=5,center=false);

            rotate([0,90,0])
            translate([-h/3,0,t/2-5])
            cylinder(d=2*led,h=5,center=false);
        
        }

        rotate([0,90,0])
        translate([h/3,0,0])
        cylinder(d=led,h=50,center=true);
        
        rotate([0,90,0])
        translate([0,0,0])
        cylinder(d=led,h=50,center=true);
    
        rotate([0,90,0])
        translate([-h/3,0,0])
        cylinder(d=led,h=50,center=true);
    
    }
  
}


module Gewinde() {
    $fn =30;
    difference() {
        union() {
            rotate([0,90,0])
            translate([-h/6,0,0])
            cylinder(d=6,h=t,center=true);
    
            rotate([0,90,0])
            translate([h/6,0,0])
            cylinder(d=6,h=t,center=true);
        }
        rotate([0,90,0])
        translate([-h/6,0,t/2-5])
        cylinder(d=3,h=58,center=true);

        rotate([0,90,0])
        translate([h/6,0,t/2-5])
        cylinder(d=3,h=58,center=true);
       
    }
}
