// Tipp Kick Tor

ho = 85.0;                      // Höhe
br = 140.0;                     // Breite
ti = 35.0;                      // Tiefe

ra = 10;                        // Torrahmen
nr = 7;                         // Netzrahmen

module Pfosten() {
    difference() {
        rotate([0,0,0])
        translate([0,0,0])
        cylinder(d=ra,h=ho,$fn=40);
        translate([0,ra/2,0])
        rotate([45,0,0])
        cube([ra+4,ra+4,ra+4],center=true);

        for (i=[15:10:ho-10]){
            translate([0,0,i]) 
            Netzloch();  
        }

        rotate([0,0,0])
        translate([0,ra/2,ho/2])
        Netzrille(ho-35);
    }
}

module Latte() {
    difference() {
        rotate([90,0,0])
        translate([0,ra/2,-br/2-ra/2])
        cylinder(d=ra,h=br+ra,$fn=40);
        translate([0,-br/2-ra/2,ra])
        rotate([45,0,0])
        cube([ra+4,ra+4,ra+4],center=true);
        translate([0,br/2+ra/2,ra])
        rotate([45,0,0])
        cube([ra+4,ra+4,ra+4],center=true);
        
        for (i=[-br/2+10:10:br/2-10]){
            rotate([90,0,0])
            translate([0,0,i]) 
            Netzloch();  
        }
        
        
        rotate([90,0,0])
        translate([0,ra,0])
        Netzrille(br);
    }
}

module Netztraeger() {
    difference() {
        rotate([90,0,0])
        translate([0,ra/2,-br/2])
        cylinder(d=nr,h=br,$fn=40);

        for (i=[-br/2+10:10:br/2-10]){
            rotate([90,0,0])
            translate([0,0,i]) 
            Netzloch();  
        }
    }
}


module Bodenstange(){
    difference() {
        rotate([0,0,0])
        translate([0,0,ho-ra])
        cube([ti,ra,ra]);
    
        for (i=[15:10:ti-15]){
            rotate([90,0,90])
            translate([ra/2,ho,i]) 
            Netzloch();  
        }
        rotate([0,90,0])
        translate([-ho,ra/2,ti/2])
        Netzrille(0);
    }
}


module Bodenlatte(){
    difference() {
        rotate([0,0,0])
        translate([ti-ra,-br/2-ra/2,ho-ra])
        cube([ra,br+ra,ra]);
        
        for (i=[-br/2+10:10:br/2-10]){
            rotate([90,0,0])
            translate([ti-ra/2,ho-ra,i]) 
            Netzloch();  
        }
        rotate([90,0,0])
        translate([ti-ra/2,ho,0])
        Netzrille(br);
   }
}

module Netzloch() {
    rotate([90,0,0])
    cylinder(d=3,h=ra+15,center=true);  
}

module Netzrille(bb) {
    rotate([0,0,0])
    cylinder(d=3,h=bb+15,center=true);  
}

module Netzstange() {
    difference() {
        rotate([0,0,0])
        translate([0,0,0])
        cylinder(d=nr,h=ho-20,$fn=40);
      
        for (i=[5:10:ho-20]){
            translate([0,0,i]) 
            Netzloch();  
        }


        translate([-ra/2,0,0])
        rotate([0,35,0])
        cube([ra+4,ra+4,ra+4],center=true);
    }
}

module Netzlatte() {
    difference() {
        rotate([0,-105,0])
        translate([0,0,0])
        cylinder(d=nr,h=ti-5,$fn=40);

        translate([-ra/2,0,0])
        rotate([0,-40,0])
        cube([ra+4,ra+4,ra+4],center=true);

        for (i=[-ti+5:10:0]){
            rotate([0,75,0])
            translate([0,0,i]) 
            Netzloch();  
        }
    }
}

module Netzstrebe(){
    rotate([0,11,0])
    translate([ti/2,br/2,ra])
    Netzstange();
    
    
    translate([ti-3,br/2,15])
    Netzlatte();
}

module Fix() {
    bb=5;
    translate([0.6,0,-5])
    cube([9,bb,4],center=true);
    translate([4.5,0,1])
    cube([1.5,bb,16],center=true);
}

module Tor() {

    translate([0,-br/2,0])
    Pfosten();

    rotate([0,0,180])
    translate([0,-br/2,0])
    Pfosten();
   
    Latte();
 
    translate([0,-br/2-ra/2,0])
    Bodenstange();
    
    translate([0,br/2-ra/2,0])
    Bodenstange();
   
    translate([0,0,-8])
    Bodenlatte();
    
    Netzstrebe();
    
    translate([0,-br,0])
    Netzstrebe();
    
    translate([20,0,7])
    Netztraeger();
    
    translate([ti+ra/4,90/2,ho-ra])
    Fix();
    
    translate([ti+ra/4,-90/2,ho-ra])
    Fix();
}

rotate([0,90,0])
Tor();
//Netzstange();