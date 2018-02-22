
translate([-50,-50,0]){
    union(){
    
        difference(){
            cube([100,100,5]);
            union(){
                translate([10,10,5]){
                    cylinder(h=15,r=3, center= true);
                }
                translate([90,10,5]){
                    cylinder(h=15,r=3, center= true);
                }
                translate([90,90,5]){
                    cylinder(h=15,r=3, center= true);
                }
                translate([10,90,5]){
                    cylinder(h=15,r=3, center= true);
                }
                }
            }
        difference(){
            translate([50,50,0]){
                color("red")
                cylinder(h=40,r=40, center = false);
            }
            translate([50,50,5]){
                cylinder(h=40,r=35, center = false);
            }
        }
        
        translate([15,45,35]){
            difference(){
                color("green")
                cube([10,10,5]);
                translate([5,5,3]){
                    cylinder(h=10,r=1, center= false);
                }
            }
        }
        
        translate([75,45,35]){
            difference(){
                color("green")
                cube([10,10,5]);
                translate([5,5,3]){
                    cylinder(h=10,r=1, center= false);
                }
            }
        }
    }
}

translate([200,0,0]){
    difference(){
        difference(){
            scale([1,1,0.3]){
                sphere(50);
            }
            translate([-50,-50,-15])
            cube([100,100,15]);
        }
        
    }
}

// neu von Papa

translate([350,0,0]){
    difference(){
        difference(){
            cylinder(10,50,10);
        }
        cylinder(10,5,5);
        
        translate([-40,0,0]){
            cylinder(10,5,5);
        }
        translate([40,0,0]){
            cylinder(10,5,5);
        }
        translate([0,-40,0]){
            cylinder(10,5,5);
        }
        translate([0,40,0]){
            cylinder(10,5,5);
        }
    }
}

    
