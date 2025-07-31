// ILI9341

ili_negative = true;
ili_positive = false;
ili_halterung_negative = true;
ili_halterung_positive = false;


if (ili_negative) {
    difference() { 
        translate([0,0,-2.5])
        cube([100,50,5],center=true);
        ili9341(true);
        
    }
}

if (ili_positive) ili9341();
if (ili_halterung_positive) ili_halterung();
if (ili_halterung_negative) ili_halterung(true);

module ili9341(negative = false) {
    l=77;
    h=42.5;
    t=2;
    $fn=60;
    
    translate([-((l/2-5.5/2)-3.5-30),0,0])
    union() {
        difference() {
            if (!negative) {
                color("red")
                cube([l,h,t],center=true);
            }
            if (negative) {
                color("red")
                cube([l+1,h+1,t],center=true);
            }
            if(!negative) {
                translate([l/2-5.5/2,37/2,0])
                cylinder(d=3,h=5, center=true);
                
                translate([l/2-5.5/2,-37/2,0])
                cylinder(d=3,h=5, center=true);
             
                translate([l/2-5.5/2-67,37/2,0])
                cylinder(d=3,h=5, center=true);
                
                translate([l/2-5.5/2-67,-37/2,0])
                cylinder(d=3,h=5, center=true);
            } 
      
        }
        
        if (negative) {
            translate([0,0,-2])
            union() {
                translate([l/2-5.5/2,37/2,0])
                cylinder(d=6,h=5, center=true);
                
                translate([l/2-5.5/2,-37/2,0])
                cylinder(d=6,h=5, center=true);
             
                translate([l/2-5.5/2-67,37/2,0])
                cylinder(d=6,h=5, center=true);
                
                translate([l/2-5.5/2-67,-37/2,0])
                cylinder(d=6,h=5, center=true);
            }
            translate([0,0,3])
            union() {
                translate([l/2-5.5/2,37/2,0])
                cylinder(d=2.5,h=5, center=true);
                
                translate([l/2-5.5/2,-37/2,0])
                cylinder(d=2.5,h=5, center=true);
             
                translate([l/2-5.5/2-67,37/2,0])
                cylinder(d=2.5,h=5, center=true);
                
                translate([l/2-5.5/2-67,-37/2,0])
                cylinder(d=2.5,h=5, center=true);
            }
        }
        

        if(!negative) {
            color("black")
            translate([(l/2-5.5/2)-3.5-30,0,-3])
            cube([60,42.5,4],center=true);
        }
        
        if(negative) {
            color("black")
            translate([(l/2-5.5/2)-3.5-30,0,-3])
            cube([61,43.5,4],center=true);
        }
        
        
        //Displayausschnitt
        if(negative) {
            color("gray")
            translate([(l/2-5.5/2)+.5-30,0,-20])
            cube([50,40,40],center=true);
        }
        
        // Stiftleiste
        color("silver")
        translate([-l/2,-36/2,-3])
        cube([3.5,36,15]);

        // Kabel
        color("brown")
        translate([-l/2+8.8,-28.5/2,-3])
        cube([2,28.5,2]);
        
        // SD Slot
        color("silver")
        translate([l/2-14-15,-12.5,2.5])
        cube([28,18,3],center=true);
        
        // ICs
        color("black")
        translate([-l/2+10+12,6.3,1.8])
        cube([20,30,2.0],center=true);
        
        // 3 Widerstände
        color("brown")
        translate([14-5,7,1.8])
        cube([10,5,2.0],center=true);

    }    
}


module ili_halterung(negative=false) {
    $fn=60;
    
    if (!negative) {
        difference() {
            translate([0,0,2.5])
            cube([100,50,3],center=true);
            ili9341(true);
            
            // Befestigung
            
            translate([45,20,3])
            cylinder(d=3,h=7, center=true);
            
            translate([45,-20,3])
            cylinder(d=3,h=7, center=true);

            translate([-45,20,3])
            cylinder(d=3,h=7, center=true);
            
            translate([-45,-20,3])
            cylinder(d=3,h=7, center=true);
        }
    }
    
    if (negative) {
            translate([0,0,2.5])
            cube([102,52,3],center=true);
        
            // Befestigung
            
            translate([45,20,6])
            cylinder(d=3,h=4, center=true);
            
            translate([45,-20,6])
            cylinder(d=3,h=4, center=true);

            translate([-45,20,6])
            cylinder(d=3,h=4, center=true);
            
            translate([-45,-20,6])
            cylinder(d=3,h=4, center=true);
    }
}