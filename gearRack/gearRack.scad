include <D:\Dokumente\GitHub\3d-printing\sg90\sg90.scad>;

module stange(laenge = 50,breite=15, dicke = 4, rand = 2){
    difference(){
        hull(){
            translate([0,- laenge/2 + breite /2,0])
            cylinder(d=breite,h= dicke);
            translate([0, laenge/2 - breite /2,0])
            cylinder(d=breite,h= dicke);
        };
        hull(){
        translate([0,- laenge/2 + breite/2,0])
        cylinder(d=breite - 2 * rand,h= dicke / 2);
        translate([0, laenge/2 - breite/2,0])
        cylinder(d=breite - 2* rand,h= dicke / 2);
    };
    };
}

module gear_rack(circular_pitch = 110,
            number_teeth = 20,
            width = 5){
    cube([width,number_teeth * circular_pitch,width]);
};

gear_rack();