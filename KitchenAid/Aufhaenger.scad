// KitchenAid-Aufhänger

md = 6;
mt = 3;

holderheight = 5;
mink = 2;

translate([0,holderheight/5,25])
rotate([90,0,0])
holder();

module holder() {
    holderfront();
    holdermiddle();
    holderback();
}

$fn=60;

module holderfront() {

    linear_extrude(height=holderheight)
    difference() {
        resize([30,25])circle(d=30);
        resize([23,18])circle(d=30);
        translate([-10,2,0])
        square([20,15]);
    }

}

module holdermiddle() {
    translate([-2.5,-20,0])
    cube([5,10,5]);

}

module holderback() {
    translate([-15,-25,-12.5])
    difference() {
        cube([30,5,30]);
        
        translate([23,mt-0.1,7])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([15,mt-0.1,7])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([7,mt-0.1,7])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([7,mt-0.1,14.5])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([23,mt-0.1,14.5])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([23,mt-0.1,22])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([15,mt-0.1,22])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

        translate([7,mt-0.1,22])
        rotate([90,0,0])
        cylinder(d=md,h=mt);

    }

}