include <ModuleAntrieb.scad>;
include <gears.scad>;

zahnradabstand = 25;
gehaeusehoehe = 30;
wandstaerke = 2;
stufe = 9;              // Höhenstufe für Zahnrad 2

module gearBoxUnten() {
    union() {

        // Stützen vorne
        translate ([0,0*zahnradabstand,0])
        stuetze(gehaeusehoehe);
        translate ([0,1*zahnradabstand,11.5])
        stuetze(gehaeusehoehe-stufe);
        translate ([0,2*zahnradabstand,0])
        stuetze(gehaeusehoehe);
        
        // Boden
        translate ([0,0,3])
        boden(zahnradabstand*2+20,30);
        
        
        // Stützen hinten
        translate ([0,0*zahnradabstand,33])
        stuetze(gehaeusehoehe);
        translate ([0,1*zahnradabstand,21.5])
        stuetze(gehaeusehoehe-stufe);
        translate ([0,2*zahnradabstand,33])
        stuetze(gehaeusehoehe);
        
        // Motorhalterung
        difference() {
            translate ([0,zahnradabstand*2+20,0])
            halterung(gehaeusehoehe);
            translate ([23,80,1])
            scale(1.01) sg90();
        }
    }
}

module gearBoxOben() {
    hoeheOben = 9;
    union() {

        // Deckel
        
        // Flanke links
        translate ([39,20,0])
        rotate([0,0,90])
        cube([30,2,3]);
        // Flanke rechts
        translate ([39,20,33])
        rotate([0,0,90])
        cube([30,2,3]);
        
        // Mittelsteg
        translate ([39,42,3])
        rotate([0,0,90])
        cube([3,2,11.5]);
        translate ([39,42,24])
        rotate([0,0,90])
        cube([3,2,11.5]);

        // Stützen vorne
        translate ([gehaeusehoehe,0*zahnradabstand,0])
        stuetzeTop(hoeheOben);
        translate ([gehaeusehoehe-stufe,1*zahnradabstand,11.5])
        stuetzeTop(hoeheOben+stufe);
        translate ([gehaeusehoehe,2*zahnradabstand,0])
        stuetzeTop(hoeheOben);

        // Stützen hinten
        translate ([gehaeusehoehe,0*zahnradabstand,33])
        stuetzeTop(hoeheOben);
        translate ([gehaeusehoehe-stufe,1*zahnradabstand,21.5])
        stuetzeTop(hoeheOben+stufe);
        translate ([gehaeusehoehe,2*zahnradabstand,33])
        stuetzeTop(hoeheOben);

        // Motorhalterung
        difference() {
            translate ([gehaeusehoehe,zahnradabstand*2+20,0])
            halterungOben(hoeheOben);
            translate ([24.5,80,1])
            scale(1.01) sg90();
        }

    }
}

module zahnraeder() {
     
    difference() {
        // Zahnrad 0
        translate ([28.5,80,28])
        //rotate([0,0,1/84*360])
        gear (number_of_teeth=27,
                    circular_pitch=150.0,
                    hub_diameter=7,
                    bore_diameter=1.8,
                    rim_width=2,
                    rim_thickness=4,
                    gear_thickness=2,
                    hub_thickness=3,
                    circles=0);
        // Servo ausschneiden
        translate ([23,80,0])
        scale(1.01) sg90();
    }
    // Zahnrad 1.1
    translate ([gehaeusehoehe,60,28])
    rotate([0,0,1/30*360])
    gear (number_of_teeth=22,
                circular_pitch=150.0,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    // Zahnrad 1.2
    translate ([gehaeusehoehe,60,16.5])
    // rotate([0,0,1/30*360])
    gear (number_of_teeth=22,
                circular_pitch=150.0,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    translate ([gehaeusehoehe,60,4])
    achse(laenge_achse=28,laenge_stift=4.0, radius_stift=2.75, radius_achse=mittelAchseRadius);


    // Zahnrad 2
    translate ([gehaeusehoehe-stufe,35,16.5])
    //rotate([0,0,1/108*360])
    gear (number_of_teeth=42,
                circular_pitch=150.0,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    translate ([gehaeusehoehe-stufe,35,15.5])
    achse(laenge_achse=5,laenge_stift=4.0, radius_stift=2.75, radius_achse=mittelAchseRadius);

    // Zahnrad 3
    translate ([gehaeusehoehe,10,16.5])
    rotate([0,0,1/56*360])
    gear (number_of_teeth=22,
                circular_pitch=150.0,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=2,
                hub_thickness=5,
                circles=6);


    // Maße eines L-Arms
    lArmBreite  = 10;
    lArmLaenge  = 21;
    lArmDicke   = 3;

    // Maße der Mittelachse
    mittelAchseLaenge       = 21;
    mittelAchseRadius       = 4;
    mittelAchseZapfenBreite = 2.5;
    mittelAchseZapfenLaenge = 3;
    mittelAchseRadBreite    = 5;

    // Verschluss
    translate([gehaeusehoehe,10,4.5])
    rotate([0,0,90])
    union() {

            // Verschlussriegel unten
            lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

            translate([0,0,0])
            // Mittelachse
/*            mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);
*/                
    achse(laenge_achse=28,laenge_stift=4.0, radius_stift=2.75, radius_achse=mittelAchseRadius);

            // Verschlussriegel oben
            translate ([0,0,mittelAchseLaenge+lArmDicke])
            rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);
    }

// Servo anzeigen
translate ([23,80,1])
scale(1.01) sg90();

}

rotate([0,-90,0])
union () {
    gearBoxUnten();
    gearBoxOben();
    zahnraeder();
}