// Trennwand


Metallkasten = true;
Plastikkasten = false;
Querstrebe = false;


L = 116.25;
H = 40;

if (Metallkasten) {
    cube([L,3.0,H],center=true);

    translate([L/2+0.75,1.25/2,0])
    cube([1.5,1.75,H],center=true);

    translate([-(L/2+0.75),1.25/2,0])
    cube([1.5,1.75,H],center=true);

    translate([0,1.25/2,-(H/2+0.75)])
    cube([L+3,1.75,1.5],center=true);

}if (Plastikkasten) {
    LO = 109;
    LU = 100;
    
    hull(){
        translate([0,0,H-1])
        #cube([LO,3.0,1],center=true);
        cube([LU,3.0,1],center=true);
    }
    
    translate([LU/2+2.0,1.25/2,H/2-0.5])
    rotate([0,6,0])
    cube([1.5,20,H],center=true);
    
    translate([-LU/2-2.0,1.25/2,H/2-0.5])
    rotate([0,-6,0])
    cube([1.5,20,H],center=true);
}

if (Querstrebe) {
    cube([L,3.0,H],center=true);
}