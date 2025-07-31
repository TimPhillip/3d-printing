// Tipp Kick Bande


LA = 140.0;          // Länge
BU = 22.0;          // Breite unten
BO = 10.0;          // Breite oben
HO = 30.0;          // Höhe

WA = 1.0;           // Wandstärke


module roundedCube(v) {
    cube(v, center=true);
    translate([0,0,v[2]/2-1])
    rotate([0,90,0])
    cylinder(d=1,h=v[0], $fn=60, center=true);
    translate([0,0,-v[2]/2+1])
    rotate([0,90,0])
    cylinder(d=1,h=v[0], $fn=60, center=true);
}

module Body(LA=LA) {
    translate([0,-BU/2,0])
    cube([LA,WA,HO-2],center=true);              // Gerade Bandenwand
    translate([0,-BO/2-1.5*WA,HO/2-1.5])
    cube([LA,BO-1*WA,WA],center=true);           // Bande oben
    translate([0,-0.5*WA,-HO/2+1.5])
    cube([LA,BU-2*WA,WA],center=true);           // Bande unten

    translate([0,BU/4-2.0,0])
    rotate([Bandenwinkel(),0,0])
    cube([LA,WA,Bandenhypothenuse()-2.6],center=true);  // schräge Bandenwand
}


function Bandenwinkel() = 180/PI*tan(BU-BO/HO);         // Gegenkathete / Ankathete
function Bandenhypothenuse() = sqrt((HO*HO) + ((BU-BO)*(BU-BO)));    // Phytagoras

module Bande() {
    
    difference() {
        minkowski() {
            Body();

            rotate([0,90,0])
            cylinder(r=1,$fn=60);
        }
        
        translate([LA/2,0,0])
        scale(0.975)
        Body(40+2);
        
        translate([LA/2,0,0])
        scale(0.95)
        Body(40);
        translate([LA/2,0,0])
        scale(0.9)
        Body(40+2);

        translate([LA/2,BU/4-4.0,0])
        rotate([Bandenwinkel(),0,0])
        cube([40+2,2.5,Bandenhypothenuse()-5],center=true);  // schräge Bandenwand

    }

    translate([-LA/2,-WA,0])
    scale(0.9)
    Body(40);
    
}
Bande();