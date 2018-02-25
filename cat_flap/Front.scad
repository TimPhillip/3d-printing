include <Getriebegehaeuse.scad>;

// Katzenklappen-Front
//

flapBreite  = 148;  // echte Breite= flapBreite + flapRahmen
flapHoehe   = 160;  // echte Hoehe = flapHoehe + flapRahmen
flapDicke   = 40;
flapRahmen  = 26;
flapWandstaerke = 2.5;  // Dicke des Gehäuse
flapStaerke = 11;       // Dicke der Klappe

boxBreite   = flapBreite;
boxHoehe    = 50;

module vollBox() {
    // Box oberer Teil
    translate([0,0,0])
    cube([boxHoehe-flapRahmen/2,boxBreite+flapRahmen*2,flapDicke]);
    // Boxboden
    translate([boxHoehe-flapWandstaerke,flapRahmen/2,0])
    cube([flapWandstaerke,boxBreite+flapRahmen,flapDicke]);
    // Boxrückwand
    translate([boxHoehe-flapRahmen,flapRahmen/2,flapDicke-flapWandstaerke])
    cube([flapRahmen,boxBreite+flapRahmen,flapWandstaerke]);
    
    //Ecke links unten
    translate([boxHoehe-flapRahmen/2,flapRahmen/2,0])
    cylinder(flapDicke,r=flapRahmen/2, false);
    //Ecke rechts unten
    translate([boxHoehe-flapRahmen/2,flapBreite+flapRahmen*1.5,0])
    cylinder(flapDicke,r=flapRahmen/2, false);
}

module hohlBox() {
    // Boxaushöhlung
    translate([0,flapWandstaerke*4])
    cube([boxHoehe-flapWandstaerke*2,flapBreite+flapRahmen*1.4,flapDicke-flapWandstaerke]);
    
    // Schlitz Durchbruch links
    translate([-flapWandstaerke,flapWandstaerke+1,0])
    cube([flapWandstaerke,flapRahmen-flapWandstaerke*3,flapDicke-flapWandstaerke-10]);

    // Schlitz Durchbruch rechts
    translate([-flapWandstaerke,flapWandstaerke+flapBreite+flapRahmen+1,0])
    cube([flapWandstaerke,flapRahmen-flapWandstaerke*3,flapDicke-flapWandstaerke-10]);

    // Schlitz für Verschluss vorne
    translate([-flapWandstaerke,flapWandstaerke+flapBreite-25,28])
    cube([flapWandstaerke,flapRahmen+10,4]);

    // Schlitz für Verschluss hinten
    translate([-flapWandstaerke,flapWandstaerke+flapBreite-35,4])
    cube([flapWandstaerke,flapRahmen+10,4]);
}

module vollFront() {
    //Ecke links oben
    translate([flapRahmen/2,flapRahmen/2,0])
    cylinder(flapDicke,r=flapRahmen/2, false);
    //Ecke rechts oben
    translate([(flapRahmen/2),flapBreite+flapRahmen*1.5,0])
    cylinder(flapDicke,r=flapRahmen/2, false);
    //Seite oben
    translate([0,flapRahmen/2,0])
    cube([flapRahmen,flapBreite+flapRahmen,flapDicke]);
    //Seite links
    translate([flapRahmen/2,0,0])
    cube([flapHoehe+flapRahmen/2,flapRahmen,flapDicke]);
    //Seite rechts
    translate([flapRahmen/2,flapBreite+flapRahmen,0])
    cube([flapHoehe+flapRahmen/2,flapRahmen,flapDicke]);

}

module hohlFront() {
    /*
    Seiten
    */
    // oben
    translate([0,flapRahmen/2,0])
    cube([flapRahmen-flapWandstaerke*2,flapBreite+flapRahmen*0.7,flapDicke-flapWandstaerke]);
    // links
    translate([flapWandstaerke*2,0,0])
    cube([flapHoehe+flapRahmen,flapRahmen-flapWandstaerke*2,flapDicke-flapWandstaerke]);
    // rechts
    translate([flapWandstaerke*2,flapBreite+flapRahmen,0])
    cube([flapHoehe+flapRahmen,flapRahmen-flapWandstaerke*2,flapDicke-flapWandstaerke]);
    // LED Löcher
    rotate([0,0,90])
    translate([60,-10,flapDicke-flapWandstaerke])
    cylinder(flapWandstaerke*2,r=2.5,false);
    rotate([0,0,90])
    translate([80,-10,flapDicke-flapWandstaerke])
    cylinder(flapWandstaerke*2,r=2.5,false);
    rotate([0,0,90])
    translate([100,-10,flapDicke-flapWandstaerke])
    cylinder(flapWandstaerke*2,r=2.5,false);
    // Tasten Löcher
    rotate([0,90,0])
    translate([-30,55,-5])
    cube([10,10,15]);
    rotate([0,90,0])
    translate([-30,75,-5])
    cube([10,10,15]);
    rotate([0,90,0])
    translate([-30,95,-5])
    cube([10,10,15]);
}

module flap() {
    Zapfenlaenge = 10;
    tolleranz = 2.0;
    // Klppe
    translate([tolleranz/2,tolleranz/2,0])
    cube([flapHoehe-tolleranz,flapBreite-tolleranz,flapStaerke]);
    // Aufhängung links
    translate([flapStaerke/2,0+tolleranz/2,flapStaerke/2])
    rotate([90,0,0])
    cylinder(Zapfenlaenge,r=flapStaerke/2, false);
    // Aufhängung rechts
    translate([flapStaerke/2,flapBreite+Zapfenlaenge-tolleranz/2,flapStaerke/2])
    rotate([90,0,0])
    cylinder(Zapfenlaenge,r=flapStaerke/2, false);
}

difference() {
    vollFront();
    translate([flapWandstaerke,flapWandstaerke,0])
    hohlFront();
    translate([flapRahmen,flapRahmen,flapDicke/2-flapStaerke/2])
    flap();
}

translate([flapHoehe+flapRahmen,0,0])
difference() {
    vollBox();
    translate([flapWandstaerke,0,0])
    hohlBox();
}

/*
translate([flapRahmen,flapRahmen,flapDicke/2-flapStaerke/2])
flap();

*/
translate([flapHoehe+flapRahmen+boxHoehe-flapWandstaerke,150,0])
rotate([0,90,0])
rotate([0,90,0])
rotate([180,0,0])
gearBox();