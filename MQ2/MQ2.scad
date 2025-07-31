q=4;

module rcube(siz, rad) {
    xi = max(0,siz[0]/2-rad);
    yi = max(0,siz[1]/2-rad);
    hi =  siz[2];

    hull() {
        translate([ xi, yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
        translate([-xi, yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
        translate([ xi,-yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
        translate([-xi,-yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
  }
}

module MQ2Fix(di) {
    translate([-7.5, 14.0,0]) cylinder(d=di,h=6, center=true, $fn=5*q);
    translate([ 7.5, 14.0,0]) cylinder(d=di,h=6, center=true, $fn=5*q);
    translate([-7.5,-14.0,0]) cylinder(d=di,h=6, center=true, $fn=5*q);
    translate([ 7.5,-14.0,0]) cylinder(d=di,h=6, center=true, $fn=5*q);
}

module MQ2() {
    difference() {
        color("DarkBlue") translate([0,0,0.8]) rcube([19.5,33.5,1.6], 1.5);
        MQ2Fix(3);
    }
    color("Silver"     ) translate([0  ,15-(19.0+1.25)/2,    1.6]) cylinder(d =19.5       ,h=5.8,$fn=20*q);
    color("Grey"       ) translate([0  ,15-(19.0+1.25)/2,5.8+1.6]) cylinder(d1=15.25,d2=13,h=9.0,$fn=20*q);
    color("Blue"       ) translate([3.2,-10             ,-5.3   ]) cube([6.9,6.9,5.3]);
    color([0.1,0.1,0.1]) translate([0  ,-14             ,-1.25  ]) cube([10.3,2.5,2.5], center=true);
    color("Goldenrod"     ) for(i = [1:4]) {
        translate([ 6-2.5*i  ,-14,-4.5]) cube([0.7,0.7,4.5]);
        translate([ 6-2.5*i  ,-22,-4.5]) cube([0.7,8  ,0.7]);
    }
}

MQ2();