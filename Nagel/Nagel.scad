// Nagel

$fn=30;
dreh = $t*360;
w=90-acos(sqrt(2/3)); // Winkel der Raumdiagonale

cylinder(d=6,h=2,center=true);

difference() {

    translate([0,0,-1])
    rotate([0, w, 0]) {
     translate([-sqrt(2)/2, 0, 0.5])
     rotate([0, 0, 45]) cube([3,3,3], center=true);
    };
    translate([0,0,2])
    cylinder(d=6,h=2,center=true);

};


