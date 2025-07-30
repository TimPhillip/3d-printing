// Hall Sensor Housing

housing = true;
lid = true;

breit = 9;
lang = 20;

module base() {
    translate([-5,0,0])
    cube([breit,lang,10]);
}

module sensorkopf() {
    translate([-2.5,1.5,8.5]){
       cube([5,5,1.6]); 
       hull() {
        cube([5,1,1.6]); 
        translate([-1,6,0])
        cube([7,1,1.6]); 
       }
    }
}

module bein() {
    translate([0,8,0])
    cylinder(d=1.5,h=12,$fn=60);
}

module beinchen() {
    translate([-2,0,0])
    bein();
    bein();
    translate([+2,0,0])
    bein();
}

module kabelkanal() {
    translate([-4,8,0])
    cube([breit-2,18,8]);
}

module fix() {
    translate([-15,15,0])
    difference() {
        hull() {
            cylinder(d=10,h=2,$fn=60);
            translate([30,0,0])
            cylinder(d=10,h=2,$fn=60);
        }
        
        translate([0,0,-1]) 
        cylinder(d=2.5,h=5,$fn=60);
        translate([30,0,-1]) 
        cylinder(d=2.5,h=5,$fn=60);
        
        translate([11,-8,0])
        cube([8,18,8]);
        
    }
}

module housing () {
    difference() {
        base();
        sensorkopf();
        beinchen();
        kabelkanal();
    }
    fix();
}

module lid() {
    translate([0,0,-3]) {
        fix();
        translate([-5,0,0])
        cube([breit,lang,2]);
    }
}

if (housing) housing();

if (lid) lid();