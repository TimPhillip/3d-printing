// Bundelliga-Marker

dia = 9.5;
dii = 5.6;
daa = 25;
dai = 22.5;
dra = 25;
dri = 24;

bmhi = 3.0;
bmha = 3.0;
bmh = 4;
$fn = 60;

innenTeil();
aussenTeil();
rand();

module innenTeil() {
    difference() {
        cylinder(d=dia, h=bmhi, center=true);
        translate([0,0,0.5])
        cylinder(d=dii, h=bmhi, center=true);
    }
}

module aussenTeil() {
    difference() {
        cylinder(d=daa, h=bmha, center=true);
        translate([0,0,0.5])
        cylinder(d=dai, h=bmha, center=true);
    }
}
module rand() {
    difference() {
        cylinder(d=dra, h=bmh, center=true);
        translate([0,0,0.5])
        cylinder(d=dri, h=bmh, center=true);
    }
}