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

module stuetze (hoehe) {
    difference() {
        translate ([0,0,0])
        cube([hoehe,20,3], false);
        translate ([hoehe*0.8,10,0])
        cylinder(21,r=1.5, center=true);
        translate ([hoehe*0.7,10,0])
        cylinder(21,r=1.5, center=true);
        translate ([hoehe*0.6,10,0])
        cylinder(21,r=1.5, center=true);
        translate ([hoehe*0.5,10,0])
        cylinder(21,r=1.5, center=true);
    }
}

module balken (laenge) {
        translate ([0,-10,0])
        cube([5,laenge,3], false);
    
}

module boden(laenge, breite) {
    difference() {
        cube([5,laenge,breite], false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.1,0])
        cylinder(6,r=1.5, center=false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.5,0])
        cylinder(6,r=1.5, center=false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.9,0])
        cylinder(6,r=1.5, center=false);
    }
}

module wand(hoehe, anzahl, abstand) {
    for (a =[0:abstand:anzahl*abstand])
        translate ([0,a,0])
        stuetze(hoehe);
    translate ([0,10,0])
    balken(anzahl*abstand);
    translate ([hoehe-5,10,0])
    balken(anzahl*abstand);
}
union() {
    translate ([0,0,0])
    wand(45,2,51);
    translate ([0,0,3])
    boden(122,30);
    translate ([0,0,33])
    wand(45,2,51);
}
translate ([25,130,11])
9g_motor();