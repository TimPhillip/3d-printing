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
    translate ([laenge*1.0,0,0])
    loch(radius=2,tiefe= dicke + 1);
/*    translate ([laenge*0.6,0,dicke-1])
    letter("Achim");
    translate ([laenge*0.6,0,1])
    rotate([0,180,0])
    letter("Tim");
    translate ([laenge*0.2,0,0])
    loch(radius=2,tiefe= dicke + 1);
*/    }
};

module mittelRad (breite) {
    difference() {
        cylinder(breite,r=12.5, false);
        cylinder(breite,r=2.0, false);
        
/*        translate([0,0,breite])
        gear (
            toothNo = 100, 
            toothWidth = 1, 
            toothHeight  = 2, 
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
*/        } 
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
    difference() {
        union() {
            translate ([0,0,zapfen_laenge /2])
            zapfen(breite= zapfen_breite, tiefe=zapfen_laenge);   
            translate ([0,0,zapfen_laenge])
            cylinder(laenge,r = radius_achse, false, $fn=6);
            translate ([0,0,laenge+(1.5*zapfen_laenge)])
            zapfen(breite= zapfen_breite, tiefe=zapfen_laenge);   
        }
        cylinder (laenge+6,r=0.9, false);
    }
};

module achse(laenge, radius_achse) {
    difference() {
        cylinder(laenge,r = radius_achse, false, $fn=6);
        cylinder (laenge+6,r=0.9, false);
    }
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


module 9g_motor(){
	difference(){			
		union(){
			color("SteelBlue") cube([23,12.5,22], center=true);
			color("SteelBlue") translate([0,0,5]) cube([32,12,2], center=true);
			color("SteelBlue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("SteelBlue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("SteelBlue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [14,-14] ){
			translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}

module sg90() {
	color("blue") difference() {
		union() {
			translate([0,0,22.5/2]) cube([22.5,12.2,22.5], center=true);
			translate([0,0,16.75]) cube([32.2,12.2,2], center=true);

			translate([0,0,22.5-1]) {
				hull() {
					translate([-1,0,0]) cylinder(d=5.5, h=4+1);
					translate([1,0,0]) cylinder(d=5.5, h=4+1);
				}

				translate([5.5,0,0]) cylinder(d=11.6, h=4+1);
			}

		}	

		translate([-32.5/2+2,0,16.75-2]) {
			cylinder(d=2, h=2+2);
			translate([-2,0,2]) cube([4,1,2+2], center=true);
		}
		translate([32.5/2-2,0,16.75-2]) {
			cylinder(d=2, h=2+2);
			translate([2,0,2]) cube([4,1,2+2], center=true);
		}
	}
	color("white") translate([5.5,0,22.5-1+4]) {
		difference() {
			cylinder(d=4.8, h=3+1);
			translate([0,0,1]) cylinder(d=2, h=4);
		}
	}
}

module stuetze (hoehe) {
    difference() {
        translate ([0,0,0])
        cube([hoehe,20,3], false);
        translate ([hoehe,10,0])
        cylinder(21,r=3, center=true);
    }
}

module balken (laenge) {
    difference() {
        translate ([0,-10,0])
        cube([5,laenge,3], false);
    }
/*    translate ([2.5,25,2.5])
        rotate(-90,90,0)
        letter("Design by Achim & Tim 2018");    
*/
}

module boden(laenge, breite) {
    difference() {
        Bodendicke = 3;
        cube([Bodendicke,laenge,breite], false);

        // Löcher in Bodenplatte
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.1,0])
        cylinder(Bodendicke+1,r=1.5, center=false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.5,0])
        cylinder(Bodendicke+1,r=1.5, center=false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.9,0])
        cylinder(Bodendicke+1,r=1.5, center=false);
    }
}

module wand(hoehe, anzahl, abstand) {
    for (a =[0:abstand:anzahl*abstand])
        translate ([0,a,0])
        stuetze(hoehe);
}

module halterung(hoehe) {
    // Bodenplatte
    Bodendicke = 3;
    cube([Bodendicke,22,36],false);
    difference(){
        // Motorhalterung
        cube([hoehe,22,15.5],false);
        translate ([hoehe-5,10,11])
        cylinder(6,r=0.5, center=false);
        translate ([10,10,11])
        cylinder(6,r=0.5, center=false);
    }
}