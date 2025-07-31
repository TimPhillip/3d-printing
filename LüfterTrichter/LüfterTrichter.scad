// Lüftertrichter

trichter = true;
kuppel = true;
roehre = false;

if (trichter) {
    base();
    if (kuppel) kuppel();
    if (roehre) roehre();
}

module base() {
    difference() {
        cube([49,49,3],center=true);
        cylinder(d=46,h=5,center=true);
        
        translate([20.5,20.5,0])
        cylinder(d=3, h=5, center=true, $fn=30);
        translate([20.5,-20.5,0])
        cylinder(d=3, h=5, center=true, $fn=30);
        translate([-20.5,20.5,0])
        cylinder(d=3, h=5, center=true, $fn=30);
        translate([-20.5,-20.5,0])
        cylinder(d=3, h=5, center=true, $fn=30);
    }
}

module kuppel() {
    difference() {
        sphere(d=49);
        translate([0,0,-25])
        cube([50,50,50], center=true);
        sphere(d=46);
        cylinder(d=10,h=100, center=true);
    }
    
    translate([0,0,28])
    difference() {
        cylinder(d=12,h=10, center=true);
        cylinder(d=10,h=11, center=true);
    }

}

module roehre() {
    difference() {
        cylinder(d1=49, d2= 10, h=49/2, center=false);
        cylinder(d1=46, d2= 7, h=49/2, center=false);
    }    
}