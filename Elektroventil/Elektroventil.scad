// Elektroventil

// gesamtes Ventil anzeigen
ventil = true;
// obere Gehäusebox anzeigen
box_oben = true;
// obere Gehäusebox anzeigen
box_unten = true;
// obere Gehäusebox anzeigen
deckel = true;
// Deckel für untere Gehäusebox
stoepsel = true;
// Ventilstöpsel anzeigen
stoepselroehre = true;
// Stöpselroehre anzeigen
//
// Ventil-Gehäusebox x
vx = 15;
// Ventil-Gehäusebox y
vy = 15;
// Ventil-Gehäusebox z
vz = 50;
//
// Waadstärke Ventil-Gehäusebo
w = 2.1;         // Wandstärke = 7*0.3
// Passtolleranz Ventil-Gehäusebox (obere + unter Hälfte)
ww = 0.3;        // Toleranz für Passgenauigkeit
//
// Röhrenlänge
rl = 10;        // Roehrenlänge
// Röhrenaußendurchmesser
rd = 8;        // Roehrendurchmesser
// Stoepselröhrenlänge
srl = 16;        // Roehrenlänge

// Stoepsellänge
sl = 26;        // Stoepsellänge
// Stoepselaußendurchmesser
sd = 2.5;         // Stoepseldurchmesser


if (ventil) ventil();

module ventil() {

    if (box_oben) translate([0,0,vz/2-w]) box_oben();
    if (box_unten) box_unten();
    if (stoepsel) translate([0,0,vz/2]) stoepsel();
    if (stoepselroehre) translate([0,0,(3*vz/4-srl/2)]) stoepselroehre();
}


module box_unten() {
    $fn = 60;
    if (deckel) translate([0,0,vz/4-w/2]) deckel();
    
    
    difference() {
        cube([vx,vy,vz/2],center=true);
        translate([0,0,w])
        cube([vx-2*w,vy-2*w,vz/2],center=true);
        
        rotate([0,90,0])
        translate([0,0,-vx/2])
        cylinder(d=rd,h=rl,center=true);
        
        translate([0,0,vz/5])
        rille();
    }

    translate([-vx/2-rl/2+w/2,0,0])
    rotate([0,90,0])
    roehre();

}

module box_oben() {

    difference() {
        translate([0,0,w])
        cube([vx+2*w,vy+2*w,vz/2],center=true);
        cube([vx+ww,vy+ww,vz/2+ww],center=true);
//        translate([0,0,rl])
//        cylinder(d=rd,h=rl,center=true);
        
        rotate([0,270,0])
        translate([0,0,-vx/2])
        cylinder(d=rd,h=rl,center=true);
    }

    translate([vx/2+rl/2+w/2,0,0])
    rotate([0,90,0])
    roehre();
}


module deckel() {
    $fn = 60;
    difference() {
        cube ([vx,vy,w],center=true);
        cylinder(d=rd,h=w+1,center=true);
    }
}

module stoepselroehre() {
    $fn=60;
    difference() {
        srd=sd+2.7;
        cylinder(d=srd+2,h=srl,center=true);
        cylinder(d=srd,h=srl+1,center=true);
    }
}    

module roehre() {
    $fn=60;
    difference() {
        union() {
            cylinder(d=rd,h=rl,center=true);
            translate([0,0,0])
            cylinder(d=rd+1,h=1,center=true);
            translate([0,0,3])
            cylinder(d=rd+1,h=1,center=true);
            translate([0,0,-3])
            cylinder(d=rd+1,h=1,center=true);
        }
        cylinder(d=rd-w,h=vy,center=true);
    }
}    


module stoepsel() {
    $fn=60;
    cylinder(d=sd,h=sl-5, center=true);
    translate([0,0,-sl/2+5.0])
    cylinder(r1=rd/2-1,r2=rd/2+2,h=5, center=true);
}

module rille() {
    difference() {
        cube([vx+1,vy+1,1.5],center=true);
        cube([vx-1,vy-1,1.5],center=true);
    }
}