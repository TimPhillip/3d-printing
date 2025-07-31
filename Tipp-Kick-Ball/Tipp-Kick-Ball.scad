module Dreieck(a=0,w=0) {
    color("White")
    rotate([0,w,0])
    translate([a,0,0])
    circle(r=10,$fn=3);
}

module Quad() {
        rotate([0,65,65])
        circle(r=12,$fn=4);
}

module Quadrat(a=0) {
    rotate([0,0,0])
    translate([-a,-a,0])
    Quad();
}


module Sechseck() {
    rotate([0,0,30])
    translate([0,0,13])
    circle(r=18,$fn=6);
}

Dreieck();                       // Boden
Sechseck();                      // Mitte

for (i=[0,120,240])
rotate([0,0,i])
translate([0,0,0])
Quadrat(9.5);                   // Seitenquadrat

for (i=[180,60,300])
rotate([0,0,i])
translate([-1,0,-18.5])
Dreieck(-30,65);                // Seitendreieck


