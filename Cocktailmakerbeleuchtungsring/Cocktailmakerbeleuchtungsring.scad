// Cocktailmaker Beleuchtungsring

$fn = 80;

ad = 50;
id = 30;
fh = 5;
dh = 7;
fw = 1.2;
pt = 0.3;

ringfuss = true;
ringdeckel = true;
ledring= false;

if (ringfuss) ringfuss();
if (ringdeckel) ringdeckel();
    
if (ledring) ledring();

module ringfuss() {
    
    color("gray")
    difference() {
        cylinder(d=ad, h=fh, center = true);
        cylinder(d=id, h=fh+1, center = true);
        ringholraum(ad,id,fw,fh);
        translate([ad/2,0,fw])
        kabelauslass(fh);
    }
}  

module ringholraum(ad,id,fw,fh) {
    translate([0,0,fw])
    difference() {
        cylinder(d=ad-fw, h=fh, center = true);
        cylinder(d=id+fw, h=fh+1, center = true);
    }
}    

module loch3m() {
    cylinder(d=3, h=fh+1, center = true); 
}

module kabelauslass(h) {
    cube([3,8,h],center=true);
}

module ringdeckel() {
    
    translate([0,0,fw])
    rotate([0,180,180])
    difference() {
        cylinder(d=ad+fw*2+pt, h=dh, center = true);
        cylinder(d=id-fw*2-pt, h=dh+1, center = true);
        ringholraum(ad+fw*2+pt,id-fw*2-pt,fw,dh);
        translate([(ad+fw)/2,0,fw])
        kabelauslass(dh);
    }
}  

module ledring() {
    color("white")
    rotate([0,180,0])
    ringfuss();
    color("white")
    rotate([0,180,0])
    ringdeckel();
}
