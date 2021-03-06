include <flap.scad>;
include <Antrieb.scad>


// Flap Einstellungen

flapBreite  = 145;
flapHoehe   = 156;
flapStaerke = 11;       // Dicke der Klappe
flapFrame   = 15;       // Randstärke der Klappe
flapHub     = 5;        // Tiefe der Klappeneinprägung (beidseitig)

// Fronteinstellungen

frontDicke   = 40;
frontRahmen  = 27.5;
frontWandstaerke = 3.0;  // Dicke des Gehäuse
frontboxHoehe       = 55;
frontBreite         = flapBreite+frontRahmen*2;            // echte frontBreite
frontHoehe          = flapHoehe+frontRahmen+frontboxHoehe;  // echte frontHoehe
frontboxBreite      = frontBreite;


echo("frontBreite = ",frontBreite);
echo("frontHöhe = ",frontHoehe);

module vollFront() {
    //Ecke links oben
    translate([frontRahmen/2,frontRahmen/2,0])
    cylinder(frontDicke,r=frontRahmen/2, false);
    //Ecke rechts oben
    translate([(frontRahmen/2),frontBreite-frontRahmen/2,0])
    cylinder(frontDicke,r=frontRahmen/2, false);
    //Seite oben
    translate([0,frontRahmen/2,0])
    cube([frontRahmen,frontBreite-frontRahmen,frontDicke]);
    //Seite links
    translate([frontRahmen/2,0,0])
    cube([flapHoehe+frontRahmen/2,frontRahmen,frontDicke]);
    //Seite rechts
    translate([frontRahmen/2,frontBreite-frontRahmen,0])
    cube([flapHoehe+frontRahmen/2,frontRahmen,frontDicke]);
    //Seite unten
    translate([flapHoehe,frontRahmen,0])
    cube([frontRahmen,flapBreite,frontDicke]);

}

module hohlFront() {

    LEDradius       =   3.9;
    Tasterradius    =   3.5;

    // Seite oben
    translate([0,frontRahmen/2,0])
    cube([frontRahmen-frontWandstaerke*2,frontBreite-frontRahmen-frontWandstaerke*2,frontDicke-frontWandstaerke]);
    // Seite links
    translate([frontWandstaerke*2,0,0])
    cube([flapHoehe+frontRahmen,frontRahmen-frontWandstaerke*2,frontDicke-frontWandstaerke]);
    // Seite rechts
    translate([frontWandstaerke*2,frontBreite-frontRahmen,0])
    cube([flapHoehe+frontRahmen,frontRahmen-frontWandstaerke*2,frontDicke-frontWandstaerke]);
   
    // LED Löcher
    rotate([0,0,90])
    translate([60,-frontRahmen/2+LEDradius,frontDicke-frontWandstaerke])
    cylinder(frontWandstaerke*2,r=LEDradius,false);
    rotate([0,0,90])
    translate([80,-frontRahmen/2+LEDradius,frontDicke-frontWandstaerke])
    cylinder(frontWandstaerke*2,r=LEDradius,false);
    rotate([0,0,90])
    translate([100,-frontRahmen/2+LEDradius,frontDicke-frontWandstaerke])
    cylinder(frontWandstaerke*2,r=LEDradius,false);

    // Tasten Löcher
    rotate([0,90,0])
    translate([-frontDicke/2,60,-5])
    cylinder(frontWandstaerke*2,r=Tasterradius, false);
    rotate([0,90,0])
    translate([-frontDicke/2,80,-5])
    cylinder(frontWandstaerke*2,r=Tasterradius, false);
    rotate([0,90,0])
    translate([-frontDicke/2,100,-5])
    cylinder(frontWandstaerke*2,r=Tasterradius, false);
}

module vollBox() {
    // Box oberer Teil
    translate([0,0,0])
    cube([frontboxHoehe-frontRahmen/2,frontboxBreite,frontDicke]);
    // Boxboden
    translate([frontboxHoehe-frontWandstaerke*2,frontRahmen/2,0])
    cube([frontWandstaerke*2,frontboxBreite-frontRahmen,frontDicke]);
    // Boxrückwand
    translate([frontboxHoehe-frontRahmen,frontRahmen/2,frontDicke-frontWandstaerke])
    cube([frontRahmen,frontboxBreite-frontRahmen,frontWandstaerke]);
    
    //Ecke links unten
    translate([frontboxHoehe-frontRahmen/2,frontRahmen/2,0])
    cylinder(frontDicke,r=frontRahmen/2, false);
    //Ecke rechts unten
    translate([frontboxHoehe-frontRahmen/2,frontBreite-frontRahmen/2,0])
    cylinder(frontDicke,r=frontRahmen/2, false);
}

module hohlBox() {
    // Boxaushöhlung
    translate([1.5,frontWandstaerke*2])
    cube([frontboxHoehe-frontWandstaerke*3,frontBreite-frontWandstaerke*4,frontDicke-frontWandstaerke]);
    
    // Schlitz Durchbruch links
    translate([-frontWandstaerke,frontWandstaerke+1,5])
    cube([frontWandstaerke*2,frontRahmen-frontWandstaerke*3,frontDicke-frontWandstaerke-10]);

    // Schlitz Durchbruch rechts
    translate([-frontWandstaerke,frontWandstaerke+flapBreite+frontRahmen+1,5])
    cube([frontWandstaerke*2,frontRahmen-frontWandstaerke*3,frontDicke-frontWandstaerke-10]);

    // Schlitz für Verschluss vorne
    translate([-frontWandstaerke,flapBreite/2,28])
    cube([frontWandstaerke*2,60,4]);

    // Schlitz für Verschluss hinten
    translate([-frontWandstaerke,flapBreite/2,4])
    cube([frontWandstaerke*2,60,4]);
}

module frontOben() {
    difference() {
        
        // Front-Oben
        vollFront();
        translate([frontWandstaerke,frontWandstaerke,0])
        hohlFront();
    }
    
}

module frontUnten() {
    // Front-Unten (GearBox)
    difference() {
        vollBox();
        translate([frontWandstaerke,0,0])
        hohlBox();
    } 
}


module connectorLinks () {
    difference () {
        union() {
            // Wände
            translate([0,0,0])
            cube([10,20,frontWandstaerke]);

            translate([0,0,-30])
            cube([10,frontWandstaerke,30]);
        }
        // Frontlöcher für Verbindung
        translate([5,10,0])
        cylinder(frontWandstaerke*3,r=1.6);
        rotate ([90,0,0])
        translate([5,-15,-5])
        cylinder(frontWandstaerke*3,r=1.6);
    }
} 

module connectorRechts () {
    difference () {
        union() {
            // Wände
            translate([0,0,0])
            cube([10,20,frontWandstaerke]);

            translate([0,20-frontWandstaerke,-30])
            cube([10,frontWandstaerke,30]);
        }
        // Frontlöcher für Verbindung
        translate([5,10,0])
        cylinder(frontWandstaerke*3,r=1.6);
        rotate ([90,0,0])
        translate([5,-15,-25])
        cylinder(frontWandstaerke*3,r=1.6);
   }
}       
/*

// Oberer Teil der Front ohne Klappe
difference() {
    
    // Frontoben
    frontOben();
    
    // Klappe vergrößert ausschneiden
    translate([frontRahmen,frontRahmen-1.5,0])
    scale([1.02,1.02,1.0])flapCore(flapBreite,flapHoehe,frontDicke);
    
    // Klappe Original ausschneiden (wg. Aufhängung)
    translate([frontRahmen,frontRahmen-1.5,frontDicke/2-flapStaerke/2])
    flap(flapBreite,flapHoehe,flapStaerke);

}

*/
 
// unterer Teil der Front ohne Klappe
translate([0,0,0])


difference() {
    union () {
        // Front unten
        translate([frontHoehe-frontboxHoehe,0,0])
        frontUnten();
        // Verbindungskante links
        translate([frontHoehe-frontboxHoehe-10,frontWandstaerke,frontDicke-frontWandstaerke*2])
        connectorLinks();
        // Verbindungskante rechts
        translate([frontHoehe-frontboxHoehe-10,frontBreite-20-frontWandstaerke,frontDicke-frontWandstaerke*2])
        connectorRechts();

    }   
    
    // Klappe vergrößert ausschneiden
    translate([frontRahmen-frontWandstaerke+1.5,frontRahmen-1.5,0])
    scale([1.02,1.01,1.0])flapCore(flapBreite,flapHoehe,frontDicke);
   
}

/*
*/

/*
// Flap in Front einpassen
translate([frontRahmen+1,frontRahmen,frontDicke/2-flapStaerke/2])
difference(){
    flap(flapBreite,flapHoehe,flapStaerke);
    translate([flapFrame/2,flapFrame/2,0])
    flapCore(flapBreite-flapFrame,flapHoehe-flapFrame,flapHub);
    translate([flapFrame/2,flapFrame/2,flapStaerke-flapHub])
    flapCore(flapBreite-flapFrame,flapHoehe-flapFrame,flapHub);
}

*/

/*
// Antrieb in Gehäuse einsetzen
translate([flapHoehe+frontRahmen+frontboxHoehe-frontWandstaerke,110,0])
rotate([0,90,0])
rotate([0,90,0])
rotate([180,0,0])
gearBox();

*/