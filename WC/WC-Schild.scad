// WC Schild

woman =true;
man = false;

womanKlein =false;
manKlein = false;

box = false;

module man() {
    color("white")
    translate([68.5,10,0])
    import("bathroom_symbol_man.stl");
}


module woman() {
    translate([-2.8,-9,0])
    import("bathroom_symbol_woman.stl");
}


module head() {
    translate([0,27,7.5])
    cylinder(d=10,h=15,center=true);
}

module sholder() {
    translate([0,14,7.5])
    cube([22,5,15],center=true);
    translate([11,14,7.5])
    cylinder(d=5,h=15,center=true,$fn=40);
    translate([-11,14,7.5])
    cylinder(d=5,h=15,center=true,$fn=40);
}

module arm() {
    rotate([0,0,90])
    scale([1,0.9,1])
    sholder();
}


module leg() {
    rotate([0,0,90])
    scale([1.4,1.05,1])
    sholder();
}

module body() {
    translate([0,-3,7.5])
    cube([15,29,15],center=true);
}    

module manHohl() {
    difference() {
        man();
        translate([0,0,2])
        head();
        translate([0,0,2])
        sholder();
        translate([-0,0,2])
        arm();
        translate([25.2,0,2])
        arm();
        translate([0,0,2])
        body();
        translate([19.5,-31,2])
        leg();
        translate([10,-31,2])
        leg();
    }
}
module womanHohl() {
    difference() {
        woman();
        translate([0.5,0,2])
        head();
        translate([0.2,1,2])
        scale([0.9,1,1])
        sholder();
        rotate([0,0,-10])
        translate([-0,0,2])
        arm();
        rotate([0,0,10])
        translate([25.9,0,2])
        arm();
        
        translate([0,3,2])
        hull(){ 
           scale([0.64,1,1])
           body();
           translate([0,-24,0])
           scale([1.44,0.05,1])
           body();
        }
        translate([15.7,-31,2])
        scale([0.8,1,1])
        leg();
        translate([8,-31,2])
        scale([0.8,1,1])
        leg();
    }
}

module manKlein() {
    scale([0.8024,0.8024,0.8024])manHohl();
}

module womanKlein() {
    scale([0.8026,0.8026,0.8026])womanHohl();
}

module outerBox() {
    minkowski() {
        cube([80,80,10],center=true);
        cylinder(d=10,h=10);
    }
}

module innerBox() {
    translate([0,0,1])
    scale([0.9,0.9,1]) outerBox();
}

module cableHole() {
    rotate([90,0,0])
    translate([0,6,0])
    cylinder(d=8,h=50);
}

module box(){
    color("White")
    difference() {
        outerBox();
        innerBox();
        translate([20,8,-5])scale([1.05,1.02,1])manKlein();
        translate([-20,8,-5])scale([1.05,1.02,1])womanKlein();
        
        #cableHole();
    }
    //translate([20,8,-10])manKlein();
    //translate([-20,8,-10])womanKlein();
    
}

if (man) manHohl();
if (woman) womanHohl();
if (manKlein) manKlein();
if (womanKlein) womanKlein();
if (box) box();
