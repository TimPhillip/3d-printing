// Mini Motor DC 3V - 6V 130

show_motor = true;
show_gehause = false;

if (show_motor) {
    motor();
}

if (show_gehause) {
    gehause();
}


// =========================
module motor() {
    rotate([90,0,0])
    difference() {
    
        cylinder(d=19, h=20, center=true, $fn=60);
        translate([0,5+8,0])
        cube([20,10,50], center=true);
        translate([0,-5-8,0])
        cube([20,10,50], center=true);
    }
        
    rotate([90,0,0])
    translate([0,0,13])
    cylinder(d=1.5, h=7, center=true, $fn=20);
}

module gehause() {
  color("lightgreen") {
    
    difference() {
        // Gehäuse Rumpf
        union() {
            cube([25,15,25], center=true);
            rotate([90,0,0])
            translate([0,-5,3])
            translate([0,7.5,-11.5])
            cube([50,30,2], center=true);
        }
        // mini-Motor Loch
        scale([1.1,1.05,1.05]) motor();

        // Motorbefestigungslöcher
        rotate([0,90,0])
        translate([0,0,0])
        cylinder(d=3, h=50, center= true, $fn=20);
        
        // Fan-Befestigungslöcher
        rotate([90,0,0])
        union() {
            translate([10,10,0])
            cylinder(d=3, h=50, center= true, $fn=20);
            translate([-10,10,0])
            cylinder(d=3, h=50, center= true, $fn=20);
            translate([10,-10,0])
            cylinder(d=3, h=50, center= true, $fn=20);
            translate([-10,-10,0])
            cylinder(d=3, h=50, center= true, $fn=20);
        }
        //Gehäusebefestigungslöcher
        rotate([90,0,0])
        translate([0,-5,3])
        union() {
            translate([20,-2,-10])
            cylinder(d=3, h=20, center=true, $fn = 20);
            translate([-20,-2,-10])
            cylinder(d=3, h=20, center=true, $fn = 20);
            translate([20,17.5,-10])
            cylinder(d=3, h=20, center=true, $fn = 20);
            translate([-20,17.5,-10])
            cylinder(d=3, h=20, center=true, $fn = 20);
        }
    }
  }
}