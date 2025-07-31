// Pflanzenaufzuchthaus

include <Parameter.scad>;

use <Wassertank.scad>;

haus = true;
dach = true;
schale = true;
stuetze = true;
stuetzenverbinder = true;
schalenverbinder = true;
wassertank = true;
dachgaube = true;
blende = true;
seitenfenster = true;
roehre = true;
langrohr = false;
kurzrohr = false;
biegung = false;
rohrverbinder = true;
stutzen = true;
stopfen = true;


if (haus) {
    color("white")
    haus();
    color("white")
    rotate([0,180,0])
    translate([0,0,-2*hauslaenge-hz/2-3*hw])
    haus();
}
    
if (dach) {
    dach();
    translate([0,0,hauslaenge+hz/2+3*hw])
    dach();
}

if (schale) {
    schale();
    rotate([0,180,0])
    translate([0,0,-hauslaenge*2-hz/2-3*hw])
    schale();
}

if (stuetze) {
    stuetze();
    rotate([0,180,0])
    translate([0,0,-hauslaenge*2-hz/2-3*hw])
    stuetze();
}

module haus() {
    dachbalken();
    hauswand();
    giebel();
    fuss();
}

if (stuetzenverbinder) stuetzenverbinder();
if (schalenverbinder) schalenverbinder();
if (wassertank) wassertank();
if (dachgaube) dachgaube();
if (blende) blende();
if (seitenfenster) seitenfenster();
if (roehre) roehre();
if (langrohr) langrohr();
if (kurzrohr) kurzrohr();
if (rohrverbinder) rohrverbinder();
if (biegung) biegung();
if (stutzen) stutzen();
if (stopfen)stopfen();
    
module dachbalken() {
    rotate([0,0,45])
    translate([dachlaenge/2,0,0])
    cube([hd,dachlaenge,hz],center=true);
    rotate([0,0,-45])
    translate([-dachlaenge/2,0,0])
    cube([hd,dachlaenge,hz],center=true);
}


module hauswand() {
    
    translate([-hausbreite/2+hw,-wandhoehe/2,0])
    cube([hd,wandhoehe,hz],center=true);
    
    translate([hausbreite/2-hw,-wandhoehe/2,0])
    cube([hd,wandhoehe,hz],center=true);
    
    rotate([0,90,90])
    translate([hz/2-hd/2,0,-wandhoehe+50])
    cube([hd,hausbreite+hw,hz],center=true); 
    
}


module giebel() {
    
    translate([0,0,-hz/2+1])
    difference() {
        linear_extrude(height = hw, center = true)
        polygon(points=[[-hausbreite/4,dachhoehe/2],
                        [ 0,dachhoehe],
                        [ hausbreite/4,dachhoehe/2]]);
        translate([-10,dachhoehe/2+15,0])
        cylinder(d=3,h=10, center=true);
        translate([10,dachhoehe/2+15,0])
        cylinder(d=3,h=10, center=true);
    }
}   


module fuss() {
    
    difference() {
        rotate([0,0,90])
        translate([-wandhoehe-2*hw,0,0])
        cube([hd,hausbreite/2,hz],center=true);

        translate([0,-wandhoehe-2*hw,0])
        rotate([90,0,0])
        cylinder(d=3, h=9, $fn= 30, center=true);
    }
    translate([hausbreite/2-hw,-wandhoehe-fusshoehe/2,0])
    cube([hd,fusshoehe,hz],center=true);

    translate([-hausbreite/2+hw,-wandhoehe-fusshoehe/2,0])
    cube([hd,fusshoehe,hz],center=true);

    rotate([0,0,90])
    translate([-wandhoehe-fusshoehe,hausbreite/2-hausbreite/8,0])
    cube([hd,hausbreite/4,hz],center=true);

    rotate([0,0,90])
    translate([-wandhoehe-fusshoehe,-hausbreite/2+hausbreite/8,0])
    cube([hd,hausbreite/4,hz],center=true);

    translate([-hausbreite/4,-wandhoehe-fusshoehe/2-hw,0])
    rotate([0,0,-45])
    cube([hd,hausbreite/8,hz],center=true);

    translate([hausbreite/4,-wandhoehe-fusshoehe/2-hw,0])
    rotate([0,0,45])
    cube([hd,hausbreite/8,hz],center=true);

}

module dach() {
    color("white")
    union() {
        translate([2*hw+10,dachhoehe-6*hw-10,hauslaenge/2])
        rotate([0,0,45])
        cube([hd,dachlaenge/3,hauslaenge+hz-hd],center=true);
        translate([-2*hw-10,dachhoehe-6*hw-10,hauslaenge/2])
        rotate([0,0,-45])
        cube([hd,dachlaenge/3,hauslaenge+hz-hd],center=true);
        
        translate([0,0,3])
        innengiebel();
        
        translate([0,0,hauslaenge+hz-3])
        innengiebel();
    }
}


module innengiebel() {
    difference() {
        giebel();
        
        translate([50,dachhoehe-hd-50,-15])
        rotate([0,0,45])
        cube([10,dachlaenge,10]);

        translate([-65,dachhoehe-hd-50,-15])
        rotate([0,0,-45])
        cube([10,dachlaenge,10]);

        translate([-65,dachhoehe-hd-42.7,-15])
        cube([dachlaenge,10,10]);

    }
}

module schale() {
    color("gray")
    union() {
        translate([0,-50+2,hauslaenge/2+hd])
        difference() {
            cube([hausbreite-2*hd-hw,60,hauslaenge+hz/2-3],center=true);
            translate([0,4,4])        
            cube([hausbreite-2*hd-hw-4,60,hauslaenge+hz/2-3],center=true);
        
            for (i=[-3:1:3]) {    
                translate([hausbreite/2-hd-1,0,20*i])
                cube([3,30,10],center=true);
                translate([-hausbreite/2+hd+1,0,20*i])
                cube([3,30,10],center=true);
            }
            for (i=[-3:1:3]) {    
                translate([20*i,0,-hauslaenge/2-hd])
                rotate([0,90,0])
                cube([3,30,10],center=true);
            }
        }

        rotate([0,90,90])
        translate([hz/2-hd/2+6,0,-wandhoehe+50+2])
        cube([hd,hausbreite-2*hd-hw,hz],center=true); 

        rotate([0,0,90])
        translate([-20.5,0,-hd])
        cube([hd,hausbreite-2*hd-hw,hz],center=true); 
    }

}

module schalenverbinder() {
    
    color("lightgrey")
    union() {
        translate([0,-wandhoehe+hw+hd/2,hauslaenge])
        difference() {
            cube([hausbreite-hd,hd+4,6*hd],center=true);
            cube([hausbreite-2*hd,hd,6*hd+4],center=true);
            translate([hausbreite/2-hd-2,hd+hw-0.5,0])
            cube([hd/2+1,2*hd,6*hd+2],center=true);
            translate([-hausbreite/2+hd+2,hd+hw-0.5,0])
            cube([hd/2+1,2*hd,6*hd+2],center=true);
        }
        
        translate([-hausbreite/2+hd+hw,-wandhoehe/2-hw-2.5,hauslaenge])
        difference() {
            translate([0,0,0])
            cube([2*hd,60-2.75,6*hd],center=true);
            translate([0,-2,0])
            cube([hw+1,60-1.5,6*hd+2],center=true);
        }
        translate([hausbreite/2-hd-hw,-wandhoehe/2-hw-2.5,hauslaenge])
        difference() {
            translate([0,0,0])
            cube([2*hd,60-2.75,6*hd],center=true);
            translate([0,-2,0])
            cube([hw+1,60-1.5,6*hd+2],center=true);
        }
    }
    
}



module stuetze() {
    color("white")
    translate([0,-wandhoehe-fusshoehe,0])
    union () {
        translate([0,0,hauslaenge/2+hz/2])
        cube([hz,hd,hauslaenge],center=true);
        
        translate([0,fusshoehe/2,13])
        cube([fusshoehe,hz,hd],center=true);
        
        difference(){
            translate([0,fusshoehe,5.5])
            cube([hz,hw,hz],center=true);

            translate([0,fusshoehe,0])
            rotate([90,0,0])
            cylinder(d=3, h=9, $fn= 30, center=true);
       }
    }
}

module stuetzenverbinder() {
    
    color("white")
    translate([0,-wandhoehe-fusshoehe,hauslaenge])
    difference() {
        cube([hz+6,2*hd,6*hd],center=true);
        cube([hz+1,hd+1,6*hd+4],center=true);
        
    }
}

module dachgaube() {
    color("white")
    translate([-16,dachhoehe-23,80])
    difference() {
        cube([30,35,80],center=true);
        translate([0,1,0])
        cube([33,30,69],center=true);
        
        translate([10,-5,0])
        rotate([0,0,-45])
        cube([25,55,85],center=true);
    }
}

module blende() {
    color("white")
    translate([-35,dachhoehe-20.5,80])
    difference() {
        cube([8,30,80],center=true);
        translate([0,-1,0])
        cube([10,21,51],center=true);
    }

}

module seitenfenster() {
    t=1;
    fensterrahmen = 3;
    fensterbreite = 36;
    fensterhoehe = 40-1.5*fensterrahmen;
    color("white",1.0)
    translate([0,-dachhoehe/2+2.5*fensterrahmen,-hw+(-hz/2+1)])
    difference() {
        linear_extrude(height = hw, center = true)
        polygon(points=[[-hausbreite/2+fensterrahmen+1,dachhoehe/2],
                        [ -hausbreite/4+fensterrahmen,dachhoehe-t],
                        [ hausbreite/4-fensterrahmen,dachhoehe-t],
                        [ hausbreite/2-fensterrahmen-1,dachhoehe/2]]);
        translate([-20,dachhoehe/2+fensterhoehe/2+fensterrahmen,0])
        cube([fensterbreite,fensterhoehe,hw+1],center=true);
        translate([20,dachhoehe/2+fensterhoehe/2+fensterrahmen,0])
        cube([fensterbreite,fensterhoehe,hw+1],center=true);
        translate([0,dachhoehe/2,0])
        linear_extrude(height = hw+1, center = true)
        polygon(points=[[hausbreite/2-4*fensterrahmen,fensterrahmen],
                         [ fensterbreite+2*fensterrahmen,fensterhoehe-fensterrahmen],
                         [ hausbreite/4,fensterrahmen]]);
        translate([0,dachhoehe/2,0])
        rotate([180,0,180])
        linear_extrude(height = hw+1, center = true)
        polygon(points=[[hausbreite/2-4*fensterrahmen,fensterrahmen],
                         [ fensterbreite+2*fensterrahmen,fensterhoehe-fensterrahmen],
                         [ hausbreite/4,fensterrahmen]]);

     }
    
}


module roehre() {
    $fn=60;
    kurzrohr();
    biegung();
    translate([0,0,0])
    rohrverbinder();
    langrohr();
    translate([0,0,130])
    langrohr();
    translate([0,-15,290])
    rotate([90,0,0])
    kurzrohr();
    
    translate([22.5,-23,275])
    rotate([180,0,90])
    biegung();
    
}

module biegung() {
    $fn=60;
    difference() {
        translate([48,5.5,-20])
        rotate([0,90,0])
        rotate_extrude(convexity = 10)
        translate([20, 0, 0])
        circle(r = 5, $fn = 100);
        
        translate([48,5.5,-20])
        rotate([0,90,0])
        rotate_extrude(convexity = 10)
        translate([20, 0, 0])
        circle(r = 2.5, $fn = 100);
        
        translate([40, -19, -20])
        cube([15,50,40]);
        translate([40, -45, -50])
        cube([15,50,40]);
    }
}

module langrohr() {
    $fn=60;
    translate([48,25,40])
    difference() {
        cylinder(d=10, h=130, center=true);
        cylinder(d=5, h=130+2, center=true);
    }
}

module kurzrohr(){
    $fn=60;
    translate([48,-25,-40])
    rotate([90,90,0])
    difference() {
        cylinder(d=10, h=60, center=true);
        cylinder(d=5, h=60+2, center=true);
        
    }
}

module rohrverbinder() {
    $fn=60;
    translate([48,25,130])
    difference() {
        cylinder(d=14, h=20, center=true);
        translate([0,0,5])
        cylinder(d1=10,d2=11, h=10+2, center=true);
        translate([0,0,-5])
        cylinder(d1=11,d2=10, h=10+2, center=true);
    }
}

module stutzen() {
    $fn=60;
    translate([48,25,145])
    difference() {
        cylinder(d1=14, d2=14, h=10, center=true);
        cylinder(d1= 4, d2=8, h=10+2, center=true);
    }
}   

module stopfen() {
    $fn=60;
    translate([48,25,110])
    union() {
        translate([0,0,5])
        cylinder(d1=10, d2=10, h=2, center=true);
        cylinder(d1= 4, d2= 5.5, h=5+2, center=true);
    }

}