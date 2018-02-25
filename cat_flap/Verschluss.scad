
include <ModuleKatzenklappe.scad>;
//$fn = 40;

// Maße eines L-Arms
lArmBreite  = 10;
lArmLaenge  = 80;
lArmDicke   = 3;

// Maße der Mittelachse
mittelAchseLaenge       = 30;
mittelAchseRadius       = 5;
mittelAchseZapfenBreite = 3;
mittelAchseZapfenLaenge = 3;
mittelAchseRadBreite    = 15;

union() {

// Verschlussriegel unten
lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

// Mittelachse
mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);

// Antrieb in der Mittel
translate([0,0,(mittelAchseLaenge / 2) - (mittelAchseRadius / 2) - (mittelAchseRadBreite / 4)]) rotate(45) mittelRad(mittelAchseRadBreite);
    
// Verschlussriegel oben
translate ([0,0,mittelAchseLaenge])
rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);
}

translate ([200,0,0])
lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

translate ([200,-50,0])
rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

translate ([-200,0,0])
rotate([0,90,0])
rotate([0,0,30])
mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);

translate([-100,100,0])
mittelRad(mittelAchseRadBreite);

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