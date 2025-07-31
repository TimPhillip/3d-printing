
// Platineneinschub

platine = true;
halterung = true;
steg_unten = true;
steg_oben = true;
befestigung_unten = true;
befestigung_oben = true;
huelle = true;

anzahl = 8;
abstand = 12;

halterbreite = 4;
platinendicke = 2.5;

px = 35;
py = 50;

if (platine) platine(0);
if (befestigung_unten) befestigung_unten();
if (befestigung_oben) befestigung_oben();

if (anzahl > 0) {
    i=0;
    for ( i = [0:1:anzahl-1] ) {
        if (steg_unten && i+1 < anzahl) steg_unten(i);
        if (halterung) halterung(i);
        if (steg_oben && i+1 < anzahl) steg_oben(i);
        if (huelle) huelle(i);
    }
}


module platine(i) {
    color("Goldenrod",0.40)
    translate([abstand*i,-2,-2])
    cube([platinendicke,px,py],center=true);
}

module halterung(i) {
    difference() {
        halter(i);
        platine(i);
    }
}


module halter(i) {
    
    color("lightblue")
    translate([abstand*i,0,-py/2-1])
    cube([halterbreite,px+5,3], center=true);
    color("lightblue")
    translate([abstand*i,-px/2-1,0])
    cube([halterbreite,3,py+5], center=true);
}

module steg_unten(i) {
    
    translate([abstand/2+i*abstand,px/2,-py/2-1])
    cube([abstand-halterbreite,3,3],center=true);
    translate([abstand/2+i*abstand,-px/2-1,-py/2-1])
    cube([abstand-halterbreite,3,3],center=true);
    translate([abstand/2+i*abstand,-px/2-1,py/2-1])
    cube([abstand-halterbreite,3,3],center=true);
}

module steg_oben(i) {
    
    translate([abstand/2+i*abstand,0,py/2-1])
    cube([abstand-halterbreite,3,3],center=true);
}

module befestigung_unten() {
    $fn=60;
    difference() {
        translate([-halterbreite*2+1,0,-py/2-1])
        cube([10,10,3], center=true);
        translate([-halterbreite*2+1,0,-py/2-1])
        cylinder(d=3,h=6, center=true);
    }
        
    difference() {       
        translate([halterbreite*2-1+abstand*(anzahl-1),0,-py/2-1])
        cube([10,10,3], center=true);
        translate([halterbreite*2-1+abstand*(anzahl-1),0,-py/2-1])
        cylinder(d=3,h=6, center=true);
    }
        
}

module befestigung_oben() {
    $fn=60;
    rotate([90,0,0])
    difference() {
        translate([-7,py/2-4.5,px/2])
        cube([10,10,6], center=true);
        translate([-7,py/2-4.5,px/2])
        cylinder(d=3,h=10, center=true);
    }
        
    rotate([90,0,0])
    difference() {       
        translate([halterbreite*2-1+abstand*(anzahl-1),px/2+3,py/2-7])
        cube([10,10,6], center=true);
        translate([halterbreite*2-1+abstand*(anzahl-1),px/2+3,py/2-7])
        cylinder(d=3,h=10, center=true);
    }
        
}

module huelle(i) {
    difference() {
        huell(i);
        translate([0,2,2])
        platine(i);
    }
}

module huell(i) {
    color("lightgreen")
    translate([abstand*i,0.5,py/2-1])
    cube([halterbreite,px,3], center=true);
   
}