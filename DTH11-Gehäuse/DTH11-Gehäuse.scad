// Feuchtesensorgehäuse

kuppel = true;
kuppelboden = true;
bodendeckel = true;
dichtungsring = true;
DTH11 = true;

gd = 39;
gw = 2;

$fn =60;

if (kuppel) kuppel();
if (kuppelboden) kuppelboden();
if (bodendeckel) bodendeckel();
if (DTH11) DTH11();
if (dichtungsring) dichtungsring();


module kuppel() {
    color("white")
    difference() {
        sphere(d=gd);
        sphere(d=gd-2*gw);
        translate([0,0,-gd/2])
        cube([2*gd,2*gd,gd],center=true);
        
        translate([0,0,gd/2])
        bohrung(3);
        
        for (i = [0 : 1 : 12] ){
            rotate([0,0,i*30])
            translate([12,0,gd/2-4])
            rotate([0,30,0])
            bohrung(3);
        }

        for (i = [0 : 1 : 12] ){
            rotate([0,0,i*30])
            translate([18,0,gd/2-12])
            rotate([0,60,0])
            bohrung(3);
        }
    }  

}

module DTH11() {
    color("green")
    difference() {
        translate([0,0,0.5])
        DTH11frame();
        translate([8,0,0])
        bohrung(3);
    }
}

module DTH11frame() {
        cube([30,15,gw+1],center=true);
}

module kuppelboden() {
    color("white")
    difference() {
        cylinder(d=gd,h=gw,center=true);
        scale([1.02,1.03,1.0])
        DTH11frame();
        
        translate([0,gd/3,0])
        bohrung(1.5);
        translate([0,-gd/3,0])
        bohrung(1.5);
        
        translate([gd/2-3,0,0])
        bohrung(1.5);
        translate([-gd/2+3,0,0])
        bohrung(1.5);
    }
}

module dichtungsring() {
    color("red")
    difference() {
        cylinder(d=gd,h=0.5,center=true);
        cylinder(d=gd-10,h=1.5,center=true);
        
        translate([0,gd/3,0])
        bohrung(1.5);
        translate([0,-gd/3,0])
        bohrung(1.5);
        
        translate([gd/2-3,0,0])
        bohrung(1.5);
        translate([-gd/2+3,0,0])
        bohrung(1.5);
    }
}

module bohrung(dd) {
    rotate([0,0,90])
    cylinder(d=dd,h=5,center=true);
}

module senkbohrung(dd) {
    rotate([0,0,90])
    cylinder(d=dd,h=5,center=true);
    translate([0,0,-1.25])
    rotate([0,0,90])
    cylinder(d=dd+1,h=2.5,center=true);
}

module bodendeckel() {
    color("white")
    translate([0,0,-gw])
    difference() {
        cylinder(d=gd,h=2*gw,center=true);
        
        translate([0,0,2])
        DTH11frame();
        
        translate([0,gd/3,0])
        senkbohrung(2);
        translate([0,-gd/3,0])
        senkbohrung(2);
        
        translate([gd/2-3,0,0])
        senkbohrung(2);
        translate([-gd/2+3,0,0])
        senkbohrung(2);

        translate([8,0,2])
        bohrung(1);
    }
    
}