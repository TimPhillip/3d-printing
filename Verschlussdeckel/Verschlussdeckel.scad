// Verschlussdeckel

D = 145;
Dd = 0.5;
r = 1;
deckel = true;
halter = false;

if (deckel) deckel();
if (halter) halter();
    

module deckel() {
    $fn = 60;
    difference() {
        cylinder(d=D, h=3, center=true);
        translate([0,0,Dd])
        cylinder(d=D-2*r, h=3, center=true);
    }
    
    halter();
    rotate([0,0,120])
    halter();
    rotate([0,0,-120])
    halter();

}

module halter() {
    $fn = 60;
    difference() {
        translate([0,0,Dd+7.5])
        cylinder(d=D, h = 13, center = true);
        translate([0,0,2*Dd+7.5])
        cylinder(d=D-2*r, h = 17, center = true);
        translate([0,D/2,2*Dd+7.5])
        cube([D,D,15], center=true);
        translate([-D/2-12.5,0,2*Dd+7.5])
        cube([D,D,25], center=true);
        translate([D/2+12.5,0,2*Dd+7.5])
        cube([D,D,25], center=true);
    }
    
    nase();
}

module nase() {
    $fn = 60;
    difference() {
        translate([0,0,Dd+7.5])
        cylinder(d=D-2, h = 5, center = true);
        translate([0,0,2*Dd+7.5])
        cylinder(d=D-3-2*r, h = 10, center = true);

        translate([D/2+2,0,Dd+7.5])
        cube([D,D,15], center = true);
        translate([-D/2-2,0,Dd+7.5])
        cube([D,D,15], center = true);
        translate([0,D/2,Dd+7.5])
        cube([D,D,15], center = true);        
    }
    
}