// Magnetventil


rid = 8;
vid = 16;
rl =40;
w = 2;

ventil = true;
trenner = true;
reduzierstueck = true;

if (ventil) ventil();
if (trenner) trenner();
if (reduzierstueck) {
    translate([-rl/2,0,0])
    reduzierstueck();
    
    translate([rl/2,0,0])
    rotate([0,0,180])
    reduzierstueck();
}
module ventil() {
    $fn = 60;
    rotate([0,90,0])
    difference() {
        union() {
            cylinder(d=vid+2*w,h=rl,center=true);
            rotate([0,90,0])
            translate([0,0,-(vid+2)/2])
            cylinder(d=vid+2*w,h=vid+1,center=true);
        }
        cylinder(d=vid,h=rl+1,center=true);
        rotate([0,90,0])
        translate([0,0,-(vid+2)/2])
        cylinder(d=vid,h=vid+2,center=true);
    }
    
    translate([0,0,vid+1])
    rotate([0,0,45])
    montagering();
}


module trenner() {
    difference() {
        cylinder(d=vid+2*w,h=vid+2*w,center=true);
        translate([0,0,w/2])
        cylinder(d=vid,h=vid+2*w+1,center=true);

        translate([0,-vid/2,0])
        cube([vid,vid,vid/2+1]);
        translate([-vid,-vid/2,-vid/2+w])
        cube([vid,vid,vid/2-w]);
    }
    difference() {
        cylinder(d=vid+2*w,h=w,center=true);
        cylinder(d=vid-2*w,h=vid,center=true);
    }
}

module montagering() {
    difference() {
        cylinder(d=vid+10*w,h=w,center=true);
        cylinder(d=vid,h=vid,center=true);

        rotate([0,0,90])
        translate([15,0,0])
        cylinder(d=3.2,h=w+1,center=true);

        rotate([0,0,90])
        translate([-15,0,0])
        cylinder(d=3.2,h=w+1,center=true);

        rotate([0,0,90])
        translate([0,15,0])
        cylinder(d=3.2,h=w+1,center=true);

        rotate([0,0,90])
        translate([0,-15,0])
        cylinder(d=3.2,h=w+1,center=true);
    }
}

module reduzierstueck() {
    $fn = 60;
    rotate([0,90,0])
    difference() {
        cylinder(d1=8+2*w,d2=vid+2*w,h=20,center=true);
        cylinder(d1=8,d2=vid,h=20+1,center=true);
    }

    rotate([0,90,0])
    translate([0,0,-14.5])
    difference() {
        union() {
            cylinder(d=8,h=15,center=true);
            cylinder(d=9,h=1.5,center=true);
            translate([0,0,-4])
            cylinder(d=9,h=1.5,center=true);
            translate([0,0,4])
            cylinder(d=9,h=1.5,center=true);
        }
        cylinder(d=6,h=15+1,center=true);
    }

}    