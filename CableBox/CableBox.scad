// CableBox


box = true;
cover = true;
boden = true;

xx = 50;
yy = xx;
zz = 20;
ww = 2;

sx = (xx-ww)/xx;
sy = (yy-2*ww)/yy;
tolleranz = 5;

module oval()
{
    cube([xx,yy,zz], center= true);
    translate([xx/2,0,0])
    cylinder(d=xx, h=zz, center=true);
    translate([-xx/2,0,0])
    cylinder(d=xx, h=zz, center=true);
}

module oval_innen()
{
    cube([xx,yy-2*ww,zz], center= true);
    translate([xx/2,0,0])
    cylinder(d=xx-2*ww, h=zz, center=true);
    translate([-xx/2,0,0])
    cylinder(d=xx-2*ww, h=zz, center=true);
}

module oval_aussen()
{
    cube([xx,yy+2*ww,zz], center= true);
    translate([xx/2,0,0])
    cylinder(d=xx+2*ww, h=zz, center=true);
    translate([-xx/2,0,0])
    cylinder(d=xx+2*ww, h=zz, center=true);
}

module oval_boden()
{
    cube([xx,yy+2*ww,ww], center= true);
    translate([xx/2,0,0])
    cylinder(d=xx+2*ww, h=ww, center=true);
    translate([-xx/2,0,0])
    cylinder(d=xx+2*ww, h=ww, center=true);
}


module dose()
{

    difference() {
        oval();
        translate([0,0,ww])
        oval_innen();
        translate([-xx+ww/2,0,ww])
        kerbe();
        translate([xx-ww/2,0,ww])
        kerbe();
   }
   if (boden) translate([0,0,-zz/2+ww/2])
   oval_boden();
}

module deckel()
{

   translate([0,0,ww])
   difference() {
        oval_aussen();
        scale([1+schlupf/2,1.+schlupf,1])
        translate([0,0,-ww])
        oval();
        translate([-xx,0,-ww])
        kerbe();
        translate([xx,0,-ww])
        kerbe();

    }
}

module kerbe()
{

    cube([ww+2,ww+2,zz],center=true);
}

// ============================================
$fn = 60;
schlupf = tolleranz / 100;
if (box)   dose();
if (cover) deckel();
// ============================================
