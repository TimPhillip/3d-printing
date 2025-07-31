//Platinenwinkel

Vertikal = true;

Horizontal =false;

if (Vertikal) {
    cube([100,15,3]);
    cube([30,100,3]);

    translate([0,0,-3])
    cube([3,100,6]);

    translate([0,0,-3])
    cube([100,3,6]);
}

if (Horizontal) {
    cube([100,40,3]);
    cube([30,100,3]);

    translate([0,0,-3])
    cube([3,100,6]);

    translate([0,0,-3])
    cube([100,3,6]);
}

