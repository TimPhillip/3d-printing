// Tauchpumpenhalterung

$fn = 60;

tauchpumpe = true;
box = true;
deckel = true;

if (tauchpumpe) tauchpumpe();
if (box) box();
if (deckel) deckel();
   

module tauchpumpe() {
    l=45;
    b=25;
    a=7;
    al=12;
    p=20;
    pl=26;
    pd=2.5;
    
    color("lightyellow")
    union() {
        rotate([90,0,0])
        cylinder(d=b,h=l,center=true);
        
        translate([0,l/2+al/2,0])
        rotate([90,0,0])
        cylinder(d=a,h=al,center=true);
        
        translate([b/2-a,l/2-5,b/2-al/2+9])
        cylinder(d=a,h=al,center=true);
        
        translate([-p/2,-pl/2,-b/2])
        cube([p,pl,pd]);
    }
}

module box() {
    l=50;
    b=28;
    h=b;
    w=2;
    s=10;

    a=9;
    al=12;

    difference() {
        cube([b,l,h],center=true);
        translate([0,0,w/2])
        cube([b-w,l-w,h+w*2],center=true);

        translate([0,l/2+al/2-5,0])
        rotate([90,0,0])
        cylinder(d=a,h=al,center=true);

        translate([0,-l/2,-b/2])
        rotate([90,0,0])
        cylinder(d=a,h=al,center=true);

    }
    
    translate([b/2,-l/2,-b/2])
    cube([s,l,w]);
    
    translate([-b/2-s,-l/2,-b/2])
    cube([s,l,w]);
    
}

module deckel(){
    l=50;
    b=28;
    h=b;
    w=2;
    s=10;

    a=9;
    al=12;
    difference() {
        translate([0,0,b/2+w])
        cube([b+w+1,l+w+1,3*w],center=true);
        translate([0,0,b/2])
        cube([b+w-1,l+w-1,3*w],center=true);
        translate([b/2-a,l/2-w-6,b/2-al/2+2+2*w])
        cylinder(d=14.5,h=al,center=true);

    }
}
