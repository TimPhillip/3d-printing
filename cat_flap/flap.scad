/*
flapBreite  = 145;      // Breite der Klappe
flapHoehe   = 155;      // Höhe der Klapppe

flapStaerke = 9;       // Dicke der Klappe
flapFrame   = 15;       // Randstärke der Klappe
flapHub     = 5;        // Tiefe der Klappensenkung (beidseitig)
*/

module flap(flapBreite,flapHoehe,flapStaerke) {
    Zapfenlaenge = 10;      // Länge der Aufhängezapfen
    Zapfenradius = 5;       // Radius der Aufhängezapfen
    Zapfenoffset = 1;       // von Oberkante versetzt

    flapCore(flapBreite,flapHoehe,flapStaerke);

    // Aufhängung links
    translate([flapStaerke/2+Zapfenoffset,0,flapStaerke/2])
    rotate([90,0,0])
    cylinder(Zapfenlaenge,r=Zapfenradius, false);

    // Aufhängung rechts
    translate([flapStaerke/2+Zapfenoffset,flapBreite+Zapfenlaenge,flapStaerke/2])
    rotate([90,0,0])
    cylinder(Zapfenlaenge,r=Zapfenradius, false);

}


module flapCore(flapBreite,flapHoehe,flapStaerke) {
    Rundung = 20;

    // Klappe
    translate([0,0,0])
    cube([flapHoehe-Rundung,flapBreite-Rundung,flapStaerke]);
    // Klappe Ergänzung unten
    translate([flapHoehe-Rundung,Rundung,0])
    cube([Rundung,flapBreite-2*Rundung,flapStaerke]);

    // Klappe Ergänzung rechts
    translate([0,flapBreite-Rundung,0])
    cube([flapHoehe-Rundung,Rundung,flapStaerke]);
    
    // Rundung unten links
    translate([flapHoehe-Rundung,Rundung,0])
    cylinder(flapStaerke,r=Rundung, false);
    
    // Rundung unten rechts
    translate([flapHoehe-Rundung,flapBreite-Rundung,0])
    cylinder(flapStaerke,r=Rundung, false);

}
/*
difference(){
    flap(flapBreite,flapHoehe,flapStaerke);
    translate([flapFrame/2,flapFrame/2,0])
    flapCore(flapBreite-flapFrame,flapHoehe-flapFrame,flapHub);
    translate([flapFrame/2,flapFrame/2,flapStaerke-flapHub])
    flapCore(flapBreite-flapFrame,flapHoehe-flapFrame,flapHub);
}
*/