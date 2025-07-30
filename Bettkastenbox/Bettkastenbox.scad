// Bettkastenbox

/* [Bodenteil-Anzahl der Muster (40x40)/Dicke:] */
Bodenbreite = 3; //[1:1:3]
// 1 -3 Einheiten
Bodentiefe = 5; //[1:1:5]
// 1 - 5 Einheiten

Bodendicke = 4; // [3:1:10]
// in mm

/* [Lochmuster:] */
Langloch = false;
Quaderloch = false;


/* [Teile:] */
Bodenteil = false;
GanzerBoden = false;
Connector = true;


/* [Bodenart:] */
BodenGeschlossen = false;
BodenOffen = true;

module Langloch() {
    hull() {
        cylinder(d=10,h=Bodendicke+2);
        translate([10,10,0]) cylinder(d=10,h=Bodendicke+2); 
    }
}

module Quaderloch() {
    translate([-5,-5,0])     cube([20,20,Bodendicke+2]);
}

module Bohrloch() {
    $fn = 60;
    translate([0,0,-1])
    cylinder(d=3.2,h=Bodendicke+2);
    translate([0,0,Bodendicke-2])
    cylinder(d=7,h=3);
}
module Lochraster () {
    translate([15,15,-1])
    if (Langloch) Langloch();
    if (Quaderloch) Quaderloch();
}

module Bohrlochraster () {
    translate([MusterX/2,5,0])
    for(i=[0:Bodentiefe-1]){
        for (j=[0:Bodenbreite]) {
            translate([i*MusterX, j*MusterY,0]) Bohrloch();
        }
    }

    translate([5,5+MusterY/2,0])
    for(i=[0:0]){
        for (j=[1:Bodenbreite]) {
            translate([0, (j-1)*MusterY,0]) Bohrloch();
        }
    }

    translate([BodenX-5,5+MusterY/2,0])
    for(i=[0:0]){
        for (j=[1:Bodenbreite]) {
            translate([0,(j-1)*MusterY,0]) Bohrloch();
        }
    }


}
module Bodenteil() {
    cube([40,40,Bodendicke]);
}

module Lochboden() {
    difference() {
        Bodenteil();
        Lochraster();
        #Bohrlochraster();
    }
}

module Boden() {
    for(i=[0:Bodentiefe-1]){
        for (j=[0:Bodenbreite-1]) {
            translate([i*MusterX, j*MusterY,0])
            Lochboden();
        }
    }
} 

module Bettkastenbox() {
    translate([0,0,5])
    for (i=[0:1]) {
        for (j=[0:2]) {
            if (BodenGeschlossen) translate([(i*BodenX),(j*BodenY),0])
            Boden();
            if (BodenOffen)translate([(i*BodenX)+i,(j*BodenY)+j,0])
            Boden();
        }
    }
}

module ConnectorScheibe() {
    translate([0,20,-Bodendicke])
    hull(){
        cylinder(d=18,h=Bodendicke);
        translate([0,0,0])
        cylinder(d=18,h=Bodendicke);
    }
}

module Connector() {
    difference(){
        ConnectorScheibe();
        translate([-5,20,0])
        rotate([180,0,0])
        Bohrloch();
        translate([5,20,0])
        rotate([180,0,0])
        Bohrloch();
    }
}
// Variablen

MusterX = 40;
MusterY = 30;

BodenX = (Bodentiefe * MusterX);
BodenY = 10+(Bodenbreite * MusterY);

// Hauptprogramm

if (GanzerBoden)
    color("gray") Bettkastenbox();

if (Bodenteil)
    Boden();

if (Connector)
    
    color("Lightblue")Connector();