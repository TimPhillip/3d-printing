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
        translate ([0,1*zahnradabstand,10])
        stuetze(gehaeusehoehe-stufe);
        translate ([0,2*zahnradabstand,0])
        stuetze(gehaeusehoehe);
        
        // Boden
        translate ([0,0,3])
        boden(zahnradabstand*2+20,30);
        
        
        // Stützen hinten
        translate ([0,0*zahnradabstand,33])
        stuetze(gehaeusehoehe);
        translate ([0,1*zahnradabstand,20])
        stuetze(gehaeusehoehe-stufe);
        translate ([0,2*zahnradabstand,33])
        stuetze(gehaeusehoehe);
        
        // Motorhalterung
        difference() {
            translate ([0,zahnradabstand*2+20,0])
            halterung(gehaeusehoehe);
            translate ([23,80,0])
            scale(1.01) sg90();
        }
    }
}

module zahnraeder() {
     
    difference() {
        // Zahnrad 0
        translate ([28.5,80,28])
        //rotate([0,0,1/84*360])
        gear (number_of_teeth=37,
                    circular_pitch=109.8,
                    hub_diameter=7,
                    bore_diameter=1.8,
                    rim_width=2,
                    rim_thickness=4,
                    gear_thickness=2,
                    hub_thickness=3,
                    circles=0);
        // Servo
               translate ([25,80,0])
               scale(1.01) sg90();
    }
    // Zahnrad 1.1
    translate ([gehaeusehoehe,60,28])
    rotate([0,0,1/30*360])
    gear (number_of_teeth=30,
                circular_pitch=109.8,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    // Zahnrad 1.2
    translate ([gehaeusehoehe,60,14])
    // rotate([0,0,1/30*360])
    gear (number_of_teeth=30,
                circular_pitch=109.8,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    translate ([gehaeusehoehe,60,4])
    achse(laenge=25, radius_achse=mittelAchseRadius);


    // Zahnrad 2
    translate ([gehaeusehoehe-stufe,35,14])
    //rotate([0,0,1/108*360])
    gear (number_of_teeth=54,
                circular_pitch=109.8,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    translate ([gehaeusehoehe-stufe,35,10])
    achse(laenge=13, radius_achse=mittelAchseRadius);

    // Zahnrad 3
    translate ([gehaeusehoehe,10,14])
    rotate([0,0,1/56*360])
    gear (number_of_teeth=28,
                circular_pitch=109.8,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=2,
                hub_thickness=5,
                circles=6);


    // Maße eines L-Arms
    lArmBreite  = 10;
    lArmLaenge  = 26;
    lArmDicke   = 3;

    // Maße der Mittelachse
    mittelAchseLaenge       = 21;
    mittelAchseRadius       = 4;
    mittelAchseZapfenBreite = 2.5;
    mittelAchseZapfenLaenge = 3;
    mittelAchseRadBreite    = 5;

    // Verschluss
    translate([gehaeusehoehe,10,4.5])
    union() {

            // Verschlussriegel unten
            lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

            translate([0,0,0])
            // Mittelachse
            mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);
                
            // Verschlussriegel oben
            translate ([0,0,mittelAchseLaenge+lArmDicke])
            rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);
    }

// Servo
//translate ([25,80,0])
//scale(1.01) sg90();

}

rotate([0,-90,0])
union () {
    gearBoxUnten();
    zahnraeder();
}