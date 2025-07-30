// Wagon

/* [Eisenbahnwagon Komponentenauswahl] */
Wagon = true;
Dach = true;
Raeder = false;

/* [Eisenbahnwagon Konstruktionsparameter] */
// [Wagonbreite in mm]
Wagonbreite = 60;
// [Wagonlaenge in mm]
Wagonlaenge = 200;
// [Wagonhoehe in mm]
Wagonhoehe = 40;


if (Dach) Dach();
if (Wagon) color("LimeGreen") Wagon();
if (Raeder) color("darkgray") Raeder();

   
 color("black") translate([0,110,40-22]) cube([8,8,80], center = true);
    
module Wagon() {
    wbh = Wagonbreite/2;
    wlh = Wagonlaenge/2;

    difference() {
        Wagonkoerper();
        translate([0,0,3])
        resize([Wagonbreite - 4, Wagonlaenge - 4, Wagonhoehe]) Wagonkoerper();
        
        // Fenster
        for (a =[(Wagonlaenge/2) - 33:-30:(-Wagonlaenge/2) + 35]){
            translate([0,a,0])
            Fenster();
        }  
        
        // Türen
        translate([0,wlh-20,0])
        tuer();
        translate([0,-wlh+15,0])
        tuer();
        
        //Seitentüren
        translate([0,-wlh,Wagonhoehe/3+4.66])
        cube([Wagonbreite-30,30, Wagonhoehe-10], center = true);
        translate([0,wlh,Wagonhoehe/3+4.66])
        cube([Wagonbreite-30,30, Wagonhoehe-10], center = true);
        
        
        // Bodenlöcher
        for (a =[-Wagonlaenge/2+10:15:Wagonlaenge/2]){
            translate([0,a,0])
            Bodenloch();
            translate([20,a,0])
            Bodenloch();
            translate([-20,a,0])
            Bodenloch();
        }  
        
    }
}

module Dach() {
    wbh = Wagonbreite/2;
    wlh = Wagonlaenge/2;
    color("white")
    translate([0,0,0])
    translate([0,0,Wagonhoehe])
    difference() {
        Dachkoerper();
        translate([-wbh-10,-wlh-10,-45])
        cube([Wagonbreite+20,Wagonlaenge+20,45]);

        translate([0,0,-6])
        resize([Wagonbreite - 4, Wagonlaenge - 4, Wagonhoehe - 4]) Dachkoerper();
       
    }
}
 
module Wagonkoerper() {
    
    
    wbh = (Wagonbreite - 10) /2;
    wlh = (Wagonlaenge - 10) /2;
    
    hull() {
        translate([wbh,-wlh,0])
        cylinder(d=10, h=Wagonhoehe);
        translate([-wbh,-wlh,0])
        cylinder(d=10, h=Wagonhoehe);
        
        translate([wbh,wlh,0])
        cylinder(d=10, h=Wagonhoehe);
        translate([-wbh,wlh,0])
        cylinder(d=10, h=Wagonhoehe);
    }
}


module Dachkoerper() {
    
    wbh = (Wagonbreite - 10) /2;
    wlh = (Wagonlaenge - 10) /2;
    
    hull() {
        translate([wbh,-wlh,0])
        cylinder(d=10, h=2);
        translate([-wbh,-wlh,0])
        cylinder(d=10, h=2);
        
        translate([wbh,wlh,0])
        cylinder(d=10, h=2);
        translate([-wbh,wlh,0])
        cylinder(d=10, h=2);
        
        rotate([90,0,0])
        translate([0,-13,0])
        cylinder(d=Wagonbreite, h=Wagonlaenge-10, center = true);
        
    }
}

module Fenster() {
        fb = 22;
        fbh = fb/2;
        fo = 26;
        fh = 15;
        fhh = fh/2;
        translate([0,3,fo])
        hull() {
            rotate([0,90,0])
            translate([-fhh,0,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
            rotate([0,90,0])
            translate([-fhh,-fb,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
            rotate([0,90,0])
            translate([fhh,0,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
            rotate([0,90,0])
            translate([fhh,-fb,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
        }
}
   
module tuer () {
        tb = 20-8;
        tbh = tb/2;
        th = Wagonhoehe/3*2-15;
        translate([0,3,th])
        hull() {
            rotate([0,90,0])
            translate([tbh,0,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
            rotate([0,90,0])
            translate([-22,0,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
            rotate([0,90,0])
            translate([tbh,-tbh,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
            rotate([0,90,0])
            translate([-22,-tbh,0])
            cylinder(d=4, h= Wagonbreite+20, center = true);
        }
    
}


module Bodenloch() {
    cylinder(d=3, h=Wagonhoehe, center=true);
}



module rad() {

    $fn = 60;
    rh = 4;         
    sh = 1;
    rd = 20.0;
    sd = 24.0;

    
    // Radreifen
    translate([0,0,-sd/2-1])
    rotate([0,90,0])
    union() {
        difference() {
            union() {
                cylinder(h=rh, d=rd);
                cylinder(h=sh, d=sd);
            }
            translate([0,0,-0.5])
            cylinder(h=rh+1, d=rd-5);
        }
        
        // Speichen
        difference() {
            union() {
                cylinder(h=rh, d=12);
            
                for (i = [0:45:360]) {
                    rotate([i,90,0])
                    translate([-rh,-1,0])
                    cube([rh,2,rd/2]);
                }
            
            }
            translate([0,0,-0.5])
            cylinder(h=rh+1, d=2.5);
                   
            
            translate([0,0,-2])
            translate([0,0,-0.5])
            cylinder(h=rh+1, d=6.5);
                   
        }
        translate([2.25,-4,0])
        cube([3,7,rh]);
        
        translate([-5.25,-4,0])
        cube([3,7,rh]);
    }
}

module Raeder() {
    
    // Spurbreitehälfte
    sbh=38/2;
/*     
    translate([sbh,80,0])
    rad();
    translate([-sbh,80,0])
    rotate([0,0,180])
    rad();
*/   
    translate([sbh,55,0])
    rad();
    translate([-sbh,55,0])
    rotate([0,0,180])
    rad();
/*     
    translate([sbh,-80,0])
    rad();
    translate([-sbh,-80,0])
    rotate([0,0,180])
    rad();
*/    
    translate([sbh,-55,0])
    rad();
    translate([-sbh,-55,0])
    rotate([0,0,180])
    rad();
   
    
} 


