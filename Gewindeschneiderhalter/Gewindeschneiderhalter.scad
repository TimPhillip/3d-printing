// Gewindeschneiderhalter

ghx = 16.0;
ghy = 18.5;
ghz = 9.9;
w =2.4;

mittelteil = true;
endteil = true;

halter();



module halter() {
    difference() {
        union(){
            if (mittelteil)mittelteil();
            if (endteil)translate([ghx/2,0,0]) endteil();
            if (endteil)rotate([0,0,180]) translate([ghx/2,0,0]) endteil();
        }
        translate([0,0,w])
        cube([100,10,ghz],center=true);
    }
    translate([0,ghy/2,ghz/2+1.2])
    steg();
    translate([0,-ghy/2,ghz/2+1.2])
    steg();
}

module mittelteil() {
    
    difference(){
        cube([ghx+w,ghy+w,ghz+w],center=true);
        translate([0,0,w])
        cube([ghx+2*w,ghy,ghz],center=true);
    }
}

module endteil() {
    difference() {
        ende();
        translate([-w,0,1.5*w])
        ende();
    }
}

module ende() {

    hull(){
        cube([1,ghy+w,ghz+w],center=true);
        translate([7+w,0,0])
        cube([1,9.5+w,ghz+w],center=true);
    }
}

module steg() {
    cube([ghx,3,0.6],center=true);
}
