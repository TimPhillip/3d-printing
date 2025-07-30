// Bohrfutteradapter

td = 12;
th = 10;

msd = 5.2;
msh = 11;



$fn = 160;

top();
middle();

module top() {
    difference() {
        cylinder(d=td,h=th,center=true);
        translate([0,0,1])
        motorstift();
        
        rotate([90,0,0])
        translate([0,0,th/2])
        cylinder(d=2.5,h=3*th,center=true);
        
        rotate([90,0,90])
        translate([0,0,th/2])
        cylinder(d=2.5,h=3*th,center=true);
    }
    
}

module motorstift() {
    difference() {
        cylinder(d=msd, h=msh,center=true);
        translate([0,4.5,0])
        cube([msd,msd,msh],center=true);
        translate([0,-4.5,0])
        cube([msd,msd,msh],center=true);
    }
}

module middle() {
    translate([0,0,-th])
    difference() {
        union(){
            cylinder(d=20,h=10,center=true);
            bottom();
            }
        rotate([90,0,0])
        translate([0,0,5])
        cylinder(d=4.8,h=3*th,center=true);
    }
}

module bottom() {

    translate([0,0,0])
    rotate([180,0,0])
    import ("..//SchraubenUndMuttern/m10x16.stl");

    translate([0,0,-12])
    cylinder(d=8.26, h = 15, center=true);
    /*  
    */      
}