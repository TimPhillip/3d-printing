// USB-Netzteil-Halterung
// ======================

/*[ Dimension des USB-Box ]*/
usb_length = 86;
usb_width = 24;
usb_height = 96;


/*[ Dimension des Halter ]*/
halter_length = 100;
halter_width = 30;
halter_height = 100;

/*[ Druckoptionen ]*/

Oben = true;
Unten= true;

halter();

module usb_box() {
    translate([-(usb_length/2-usb_width/2),0,0])
    ecke();
    body();
    translate([usb_length/2-usb_width/2,0,0])
    ecke();  
}

module body() {

    cube([usb_length-usb_width,usb_width,usb_height], center=true);
}

module ecke() {
    cylinder(d=usb_width, h=usb_height, center=true);
}

module halter_teil() {
    difference() {
        translate([0,halter_width/4,0])
        cube([halter_length, halter_width/2,    halter_height], center=true);
        translate([0,0,(halter_height-usb_height)/2])
        #usb_box();
        
        // Verbindungsköcher
        translate([halter_length/2-4,0,halter_height/2-4])
        rotate([90,0,0])
        {
            cylinder(d=3, h=halter_width+6, center=true, $fn=20);
            translate([0,0,-halter_width/2])
            cylinder(d=6, h=8, center=true, $fn=20);
        }
        translate([-halter_length/2+4,0,halter_height/2-4])
        rotate([90,0,0])
        {
            cylinder(d=3, h=halter_width+6, center=true, $fn=20);
            translate([0,0,-halter_width/2])
            cylinder(d=6, h=8, center=true, $fn=20);
        }
        translate([halter_length/2-4,0,-halter_height/2+4])
        rotate([90,0,0])
        {
            cylinder(d=3, h=halter_width+6, center=true, $fn=20);
            translate([0,0,-halter_width/2])
            cylinder(d=6, h=8, center=true, $fn=20);
        }
        translate([-halter_length/2+4,0,-halter_height/2+4])
        rotate([90,0,0])
        {
            cylinder(d=3, h=halter_width+6, center=true, $fn=20);
            translate([0,0,-halter_width/2])
            cylinder(d=6, h=8, center=true, $fn=20);
        }
        
        // Netzanschluss
        translate([0,0,-halter_height/2])
        cube([20,14,20],center=true);
   }
}

module halter() {
    if (Oben) {
        rotate([0,0,180])
        halter_teil();
    }
   if (Unten) {
        halter_teil();
        translate([0,halter_width/2-1,0])
        boden();
   }
}

module boden() {
    difference() {
        cube([halter_length+20,2, halter_height],center=true);
        translate([(halter_length+20)/2 -6,0, halter_height/2 -6])
        rotate([90,0,0])
        cylinder(d=6, h=10, center=true);
        translate([(-halter_length-20)/2 +6,0, halter_height/2 -6])
        rotate([90,0,0])
        cylinder(d=6, h=10, center=true);
        translate([(halter_length+20)/2 -6,0, -halter_height/2 +6])
        rotate([90,0,0])
        cylinder(d=6, h=10, center=true);
        translate([(-halter_length-20)/2 +6,0, -halter_height/2 +6])
        rotate([90,0,0])
        cylinder(d=6, h=10, center=true);
    }
}
