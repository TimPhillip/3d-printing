
include <ModuleKatzenklappe.scad>;
//$fn = 40;

// Maße eines L-Arms
lArmBreite  = 10;
lArmLaenge  = 18;
lArmDicke   = 3;

// Maße der Mittelachse
mittelAchseLaenge       = 21;
mittelAchseRadius       = 4;
mittelAchseZapfenBreite = 2.5;
mittelAchseZapfenLaenge = 3;
mittelAchseRadBreite    = 5;

union() {

        // Verschlussriegel unten
        lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

        translate([0,0,lArmDicke/2])
        // Mittelachse
        mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);

        // Antrieb in der Mitte
        translate([0,0,(mittelAchseLaenge / 2)]) 
        rotate(45) mittelRad(mittelAchseRadBreite);
            
        // Verschlussriegel oben
        translate ([0,0,mittelAchseLaenge++lArmDicke/2])
        rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);
}

// Arm links
translate ([100,0,0])
lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

// Arm rechts
translate ([100,-50,0])
rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

// Achse
translate ([-100,0,mittelAchseRadius])
rotate([0,90,0])
rotate([0,0,30])
mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);




// Mittelrad
//translate([0,100,0])
//mittelRad(mittelAchseRadBreite);

/*
translate ([-200,200,0])
gear (
	toothNo = 25, 
    toothWidth = 5, 
    toothHeight  = 10, 
    thickness = 20,
    holeRadius = 5,
    holeSides = 6
);
*/