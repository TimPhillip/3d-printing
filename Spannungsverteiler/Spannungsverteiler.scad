// Spannungsverteilerbox

// Box-Breite/Tiefe/Höhe/Wandstärke
BB = 44;
BT = 54;
BH = 15;
BW = 1;

// Montage-Breite/Tiefe/Höhe/Loch
MB = 33;
MT = 44;
MH = 6;
MD = 3;

// Deckel-Höhe/Loch
DH = 6;
DD = 3.3;

box = true;
montage = true;
deckel = true;


if (box) box();
if (montage) montage();
if (deckel) deckel();
    

module box() {
    difference(){
        cube([BB,BT,BH], center=true);
        translate([0,0,BW])
        cube([BB-BW,BT-BW,BH], center=true);
    }
}

module montage(){
    translate([MB/2,MT/2,-(BH-MH)/2])
    stift();
    translate([-MB/2,MT/2,-(BH-MH)/2])
    stift();
    translate([MB/2,-MT/2,-(BH-MH)/2])
    stift();
    translate([-MB/2,-MT/2,-(BH-MH)/2])
    stift();
}
    
    
module stift() {
    $fn = 60;
    difference() {
        cylinder(d=MD+2,h=MH,center=true);
        cylinder(d=MD,h=MH+1,center=true);
        
    }
}

module deckel() {
    translate([0,0,BH/2])
    difference(){
        cube([BB+3,BT+3,DH], center=true);
        translate([0,0,-BW])
        cube([BB-BW+2,BT-BW+2,DH], center=true);

        translate([MB/2,MT/2,0])
        loch();
        translate([-MB/2,MT/2,0])
        loch();
        translate([MB/2,-MT/2,0])
        loch();
        translate([-MB/2,-MT/2,0])
        loch();
        
        translate([0,0,0])
        schlitz();
        translate([MT/4,0,0])
        schlitz();
        translate([-MT/4,0,0])
        schlitz();
    }
}

module loch() {
    $fn = 60;
    cylinder(d=DD,h=DH+1,center=true);
}

module schlitz() {
    cube ([6,MT-8,8], center=true);
}