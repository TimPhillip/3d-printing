// Bohrständer-Adapter

use <D:\Programme\OpenSCAD\Things\28BY-48-Stepper\adapter_28BYJ-48_28_2.scad>

adapter = true;
adp28by = true;

ad = 38;
ah = 10.5;

bd = 10;
$fn = 60;

if (adapter) adapter();
if (adp28by) translate([0,0,-5.5]) adp28by();

module adapter() {
    
    kern();
    translate([ad/2+2,0,0])
    bogen();
    translate([-ad/2-2,0,0])
    bogen();
    
    translate([-ad/2-2,0,4.25])
    spanner();
    
    translate([ad/2+2,0,4.25])
    spanner();
    
}

module kern() {
    difference() {
        cylinder(d=ad,h=ah,center=true);
        cylinder(d=ad-10,h=ah+1,center=true);
    }
    
}

module bogen() {
    difference() {
        cylinder(d=bd,h=ah,center=true);
        cylinder(d=bd-5,h=ah+1,center=true);
    }
}

module adp28by() {
    
    difference() {
        union() {
            difference() {
                adp();
                translate([ad/2+2,0,-5.25])
                cylinder(d=bd,h=ah+1,center=true);
                translate([ad/2+2,0,0])
                cylinder(d=bd-5,h=60,center=true);

                translate([-ad/2-2,0,-0])
                cylinder(d=bd,h=ah,center=true);
                translate([-ad/2-2,0,-0])
                cylinder(d=bd-5,h=60,center=true);
            }
            translate([ad/2+2,0,-5.25])
            bogen();

            translate([-ad/2-2,0,-5.25])
            bogen();
        }
    
            
            translate([0,0,-25-9.5])
            cube([52,52,52],center=true);

    }
    
}

module spanner() {
    difference() {
        cube([1.4*bd,1.5*bd,2],center=true);
        cylinder(d=bd-5,h=ah+1,center=true);
    }
}