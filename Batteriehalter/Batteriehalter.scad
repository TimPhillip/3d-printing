// ++Batteriehalter 4xAA

/* [Auswahl der Batterieart:] */
BatterieArt = "AA"; // [AA,AAA,A23]


/* [Auswahl zur Anzeige der Komponenten:] */
Batterie1 = false;
Batterie2 = false;
Batterie3 = false;
Batterie4 = false;

Halter1 = false;
Halter2 = false;
Halter3 = false;
Halter4 = false;

Gehause = false;

Grundplatte = false;

Deckel = false;

Beschriftung = true;

SchalterLoch = false;


// ----------------------------------------------
// globale Variablen
// ----------------------------------------------

// ----------------------------------------------
// 
module Dummy() {}

Wand = 1;

/* [AA Batterie-Maße:] */
AABatteriedicke = 14;
AABatterielaenge = 50.5;

/* [AAA Batterie-Maße:] */
AAABatteriedicke = 10.5;
AAABatterielaenge = 44.5;

/* [A23 Batterie-Maße:] */
A23Batteriedicke = 10;
A23Batterielaenge = 28;

Kontaktbreite = 6;

/* AA Halter-Maße :] */
AAHalterbreite = AABatteriedicke+4*Wand;
AAHalterlaenge = AABatterielaenge+12;
AAHalterhoehe = AABatteriedicke+2*Wand;

/* AAA Halter-Maße :] */
AAAHalterbreite = AAABatteriedicke+2.5*Wand;
AAAHalterlaenge = AAABatterielaenge+10;
AAAHalterhoehe = AAABatteriedicke+2*Wand;

/* A23 Halter-Maße :] */
A23Halterbreite = A23Batteriedicke+4*Wand;
A23Halterlaenge = A23Batterielaenge+10;
A23Halterhoehe = A23Batteriedicke+2*Wand;


// ----------------------------------------------
// Module

module Show() {    
    // Kontrollausgabe der Größe
    echo("====================================");
    echo("BatterieArt = ", BatterieArt);
    echo("");
    echo("====================================");
}



module Bat(Bd,Bl) {
    $fn=50;
    rotate([90,0,0])
    union(){
        color("Lightgreen")
        cylinder(d=Bd,h=Bl-2,center=true);
        color("Silver")
        translate([0,0,-Bl/2+0.5])
        cylinder(d=9,h=1,center=true);
        color("Silver")
        translate([0,0,Bl/2-0.75])
        cylinder(d=5,h=1.5,center=true);
    }
}

module Box(Hb,Hl,Hh) {
    
    difference() {
        cube([Hb,Hl,Hh], center=true);
        translate([0,0,Wand])
        cube([Hb-2*Wand,Hl-8,Hh], center=true);
        
        translate([0,(Hl/2-2*Wand),Wand])
        cube([Hb-2,0.8,Hh], center=true);
        
        translate([0,-(Hl/2-2*Wand),Wand])
        cube([Hb-2,0.8,Hh], center=true);
       
        translate([0,(Hl/2-3*Wand),Wand])
        cube([Hb-5,3,Hh], center=true);
       
        translate([0,-(Hl/2-3*Wand),Wand])
        cube([Hb-5,3,Hh], center=true);

        rotate([90,0,0])
        cylinder(d=8,h=Hl+2,center=true);
    }
}

module Halter() {
    if (BatterieArt == "AA") Box(AAHalterbreite,AAHalterlaenge,AAHalterhoehe);
    if (BatterieArt == "AAA") Box(AAAHalterbreite,AAAHalterlaenge,AAAHalterhoehe);
    if (BatterieArt == "A23") Box(A23Halterbreite,A23Halterlaenge,A23Halterhoehe);

    if (Beschriftung) Beschriftung();
}


module Gehause() {
    if (BatterieArt == "AA") {
        translate([-Gehausebreite/2+AAHalterbreite/2+3*Wand,0,0])
        difference(){
            cube([Gehausebreite,Gehauselaenge,Gehausehoehe],center=true);
            translate([0,0,Wand])
            cube([Gehausebreite-4*Wand,Gehauselaenge-4*Wand,Gehausehoehe],center=true);
            
            translate([0,2,0])
            rotate([90,0,0])
            cylinder(d=5,h=Gehauselaenge,center=true, $fn=50);
        }
    }
}

module Kontor() {
    difference() {
        cube([8,8,Grundhoehe-Wand],center=true);
        cylinder(d=3,h=Grundhoehe+1,center=true);
    }
}

module Grundplatte(){
    difference() {
        cube([Grundbreite,Grundlaenge,Grundhoehe],center=true);
        translate([0,0,Wand])
        cube([Grundbreite-2*Wand,Grundlaenge-2*Wand,Grundhoehe],center=true);
        
        if (SchalterLoch) SchalterLoch();
    }
    
    translate([Grundbreite/2-4,Grundbreite/2-4,0])
    Kontor();
    
    translate([-Grundbreite/2+4,Grundbreite/2-4,0])
    Kontor();
    
    translate([Grundbreite/2-4,-Grundbreite/2+4,0])
    Kontor();
    
    translate([-Grundbreite/2+4,-Grundbreite/2+4,0])
    Kontor();
    

}

module Deckel() {
    translate([0,0,Gehausehoehe/2])
    union(){
        difference(){
            union() {
                cube([Deckelbreite, Deckellaenge, Deckelhoehe],center=true);
                translate([0,0,1])
                cube([Deckelbreite+2*Wand, Deckellaenge+2*Wand, Deckelhoehe],center=true);
                
            }
            
            translate([Deckelbreite/2-3,Deckellaenge/2-3,0])
            cylinder(d=3,h=Wand+3, center=true, $fn=50);
            
            translate([-Deckelbreite/2+3,Deckellaenge/2-3,0])
            cylinder(d=3,h=Wand+3, center=true, $fn=50);
            
            translate([Deckelbreite/2-3,-Deckellaenge/2+3,0])
            cylinder(d=3,h=Wand+3, center=true, $fn=50);
            
            translate([-Deckelbreite/2+3,-Deckellaenge/2+3,0])
            cylinder(d=3,h=Wand+3, center=true, $fn=50);
        }
    }
}

module Beschriftung() {
    
    if (BatterieArt == "AA") 
    translate([2.5,-22,-AAHalterhoehe/2+0.5])
    rotate([0,0,90])
    linear_extrude(1)
    text("+  AA    1,5 V  -", size=5);
    
    if (BatterieArt == "AAA") 
    translate([2.5,-22,-AAAHalterhoehe/2+0.5])
    rotate([0,0,90])
    linear_extrude(1)
    text("+  AAA   1,5 V  -", size=5);
    
    if (BatterieArt == "A23") 
    translate([2.5,-18,-A23Halterhoehe/2+0.5])
    rotate([0,0,90])
    linear_extrude(1)
    text("+ A23 12V -", size=5);
}

module SchalterLoch() {
    translate([Grundbreite/2-20,-Grundlaenge/2,0])
    rotate([90,0,0])
    cube([20,12.5,4], center=true);
}

// ----------------------------------------------
// Main Code

Show();
// Gehäusebreite = 
// 4 Boxenbreite, 
// 3* überlagert die Wand, 
// 2* Wand des Gehäuse + 2 * Abstand
AAGehausebreite = 4*AAHalterbreite-3*Wand+2*Wand + 4*Wand;      
AAAGehausebreite = 4*AAAHalterbreite-3*Wand+2*Wand + 4*Wand;      
A23Gehausebreite = 4*A23Halterbreite-3*Wand+2*Wand + 4*Wand;      

// Gehäuselänge = 
// Halterlänge +
// genügend Abstand
AAGehauselaenge = AAHalterlaenge+6*Wand+1; 
AAAGehauselaenge = AAAHalterlaenge+6*Wand+1; 
A23Gehauselaenge = A23Halterlaenge+6*Wand+1; 

// Gehäusehöhe = 
// Halterhöhe +
// Boden des Halter + Boden des Gehäuse
AAGehausehoehe = AAHalterhoehe+2*Wand;                          
AAAGehausehoehe = AAAHalterhoehe+2*Wand;                          
A23Gehausehoehe = A23Halterhoehe+2*Wand;                          


Grundbreite = 130;
Grundlaenge = 130;
Grundhoehe  = AAGehausehoehe+2*Wand;

Deckelbreite = Grundbreite - 2*Wand;
Deckellaenge = Grundlaenge - 2*Wand;
Deckelhoehe = Wand;

AAshift = AAHalterbreite-Wand;
AAAshift = AAAHalterbreite-Wand;
A23shift = A23Halterbreite-Wand;

if (BatterieArt == "AA") {
    // Batterien
    if (Batterie1)                  translate([0,0,0])Bat(AABatteriedicke,AABatterielaenge);
    if (Batterie2) rotate([0,0,180])translate([AAshift,0,0])Bat(AABatteriedicke,AABatterielaenge);
    if (Batterie3)                  translate([-AAshift*2,0,0])Bat(AABatteriedicke,AABatterielaenge);
    if (Batterie4) rotate([0,0,180])translate([AAshift*3,0,0])Bat(AABatteriedicke,AABatterielaenge);
}

if (BatterieArt == "AAA") {
    // Batterien
    if (Batterie1)                  translate([0,0,0])Bat(AAABatteriedicke,AAABatterielaenge);
    if (Batterie2) rotate([0,0,180])translate([AAAshift,0,0])Bat(AAABatteriedicke,AAABatterielaenge);
    if (Batterie3)                  translate([-AAAshift*2,0,0])Bat(AAABatteriedicke,AAABatterielaenge);
    if (Batterie4) rotate([0,0,180])translate([AAAshift*3,0,0])Bat(AAABatteriedicke,AAABatterielaenge);
}

if (BatterieArt == "A23") {
    // Batterien
    if (Batterie1)                  translate([0,0,0])Bat(A23Batteriedicke,A23Batterielaenge);
    if (Batterie2) rotate([0,0,180])translate([A23shift,0,0])Bat(A23Batteriedicke,A23Batterielaenge);
    if (Batterie3)                  translate([-A23shift*2,0,0])Bat(A23Batteriedicke,A23Batterielaenge);
    if (Batterie4) rotate([0,0,180])translate([A23shift*3,0,0])Bat(A23Batteriedicke,A23Batterielaenge);

}

// Batteriehalter
if (BatterieArt == "AA"){
    if (Halter1) translate([0,0,0])         Halter();
    if (Halter2) translate([-AAshift,0,0])    rotate([0,0,180]) Halter();
    if (Halter3) translate([-AAshift*2,0,0])  Halter();
    if (Halter4) translate([-AAshift*3,0,0])  rotate([0,0,180]) Halter();
}

if (BatterieArt == "AAA"){
    if (Halter1) translate([0,0,0])         Halter();
    if (Halter2) translate([-AAAshift,0,0])    rotate([0,0,180]) Halter();
    if (Halter3) translate([-AAAshift*2,0,0])  Halter();
    if (Halter4) translate([-AAAshift*3,0,0])  rotate([0,0,180]) Halter();
}

if (BatterieArt == "A23"){
    if (Halter1) translate([0,0,0])         Halter();
    if (Halter2) translate([-A23shift,0,0])    rotate([0,0,180]) Halter();
    if (Halter3) translate([-A23shift*2,0,0])  Halter();
    if (Halter4) translate([-A23shift*3,0,0])  rotate([0,0,180]) Halter();
}



// Gehause

if (Gehause) Gehause();


// Grundplatte

if (Grundplatte) Grundplatte();
    
// Deckel

if (Deckel) Deckel();