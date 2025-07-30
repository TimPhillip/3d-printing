// Fronthalterung

fronthalterung = false;

if (fronthalterung) fronthalterung();
    
module fronthalterung() {
    
    color("lightgray")
    steg();
}


module steg() {
    
    difference() {
        union() {
            cube([20,18.5,90]);
            translate([0,18.5,0])
            cube([24,1.5,90]);
        }
        translate([-1,10,10])
        stegloch();

        translate([-1,10,80])
        stegloch();
    }
}


module stegloch() {

        rotate([90,0,90])
        cylinder(d=3.2,h=22,$fn=60);

        rotate([90,0,90])
        cylinder(d=10,h=10,$fn=60);
}