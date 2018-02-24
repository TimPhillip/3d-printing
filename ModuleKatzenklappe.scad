// //////////////////////////////////
// Module für Katzenklappenverschluss
// //////////////////////////////////

module armHorn (laenge, breite, dicke) {
    difference() {
    union() {
    translate ([0,-breite/2,0])
    cube([laenge,breite,dicke], false);
    translate ([laenge,0,0])
    cylinder(dicke,r=breite/2, false); 
    }
    translate ([laenge*0.8,0,0])
    loch(radius=2,tiefe= dicke + 1);
    translate ([laenge*0.6,0,dicke-1])
    letter("Achim");
    translate ([laenge*0.6,0,1])
    rotate([0,180,0])
    letter("Tim");
    translate ([laenge*0.4,0,0])
    loch(radius=2,tiefe= dicke + 1);
    }
};

module mittelRad (breite) {
    difference() {
        //cylinder(breite,r=40, false);
        translate([0,0,breite])
        gear (
            toothNo = 25, 
            toothWidth = 5, 
            toothHeight  = 10, 
            thickness = breite,
            holeRadius = 5,
            holeSides = 6
        );
        translate ([-25,0,0])
        loch(radius=5,tiefe=breite + 1);
        translate ([25,0,0])
        loch(radius=5,tiefe=breite + 1);
        translate ([0,-25,0])
        loch(radius=5,tiefe=breite + 1);
        translate ([0,25,0])
        loch(radius=5,tiefe=breite + 1);
        } 
};

module loch (radius, tiefe) {
        cylinder(tiefe,r=radius, false);   
};

module zapfen (breite,tiefe) {
        cube([breite,breite,tiefe], true);   
};

module lArm(laenge, breite, dicke) {
    difference() {
        union() {
            armHorn(laenge=laenge, breite=breite, dicke=dicke);
            rotate(90) armHorn(laenge=laenge, breite=breite, dicke=dicke);
            cylinder(dicke,r=breite/2, false); 
           }
            translate ([0,0,0])
            zapfen(breite= 3, tiefe = dicke * 2);
        }
};

module mittelAchse(laenge, radius_achse, zapfen_breite, zapfen_laenge, breite) {
    translate ([0,0,zapfen_laenge /2])
    zapfen(breite= zapfen_breite, tiefe=zapfen_laenge);   
    translate ([0,0,zapfen_laenge/2])
    cylinder(laenge,r = radius_achse, false, $fn=6);
    translate ([0,0,laenge+zapfen_laenge / 2])
    zapfen(breite= zapfen_breite, tiefe=zapfen_laenge);   
};


module tooth(width, thickness, height){
  scale([width/5,thickness/5,height/10]){
    difference(){
      translate([-2.5,0,0])
      cube([5,5,10]);
      translate([5+1.25-2.5,0-1,0])
      rotate([0,-14.0362434,0])
        cube([5,5+2,12]);
      translate([0-1.25-2.5,0+5+1,0])
      rotate([0,-14.0362434,180])
        cube([5,5+2,12]);
    }
  }
}
module gear(toothNo, toothWidth, toothHeight, thickness,holeRadius,holeSides){
  radius = (toothWidth*1.7*toothNo)/3.141592653589793238/2;
  rotate([-90,0,0])
  difference(){
    union(){
      for(i=[0:toothNo]){
        rotate([0,(360/toothNo)*i,0])
        translate([0,0,radius-0.5])
          tooth(toothWidth,thickness,toothHeight);
      }
      translate([0,thickness,0])
      rotate([90,0,0])
        cylinder(r=radius, h=thickness);
    }
  translate([0,thickness+1,0])
  rotate([90,0,0])
    cylinder(r=holeRadius,h=thickness+2,$fn=holeSides);
  }
}

font = "Liberation Sans";


letter_size = 5;
letter_height = 3;


module letter(l) {
  // Use linear_extrude() to make the letters 3D objects as they
  // are only 2D shapes when only using text()
  linear_extrude(height = letter_height) {
    text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}