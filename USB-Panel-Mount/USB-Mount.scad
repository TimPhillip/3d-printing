// USB A Panel Mount
/*[Komponenten]*/
USBPanel = true;
USBPanel_Oben = true;
USBPanel_Unten = true;

USBStecker = false;


module USB_A_innen()
{
    difference()
    {
        cube([27,13,2.5],center=true);
        cube([28,11,1.9],center=true);
    }
}

module USB_A_Gehause()
{

    translate([7,0,0])
    cube([14,15.5,8.0],center=true);
    USB_A_innen();

}


module USB_A_Halb_oben()
{
    difference()
    {
        USB_A_Gehause();
        translate([0,0,3.5])
        cube([30,15,7],center=true);
    }
}

module USB_A_Halb_unten()
{
    difference()
    {
        USB_A_Gehause();
        translate([0,0,-3.5])
        cube([30,15,7],center=true);
    }
}

module USB_A()
{
    USB_A_Halb_oben();
    USB_A_Halb_unten();
}

module PanelMountA()
{
    difference()
    {
        union()
        {
            translate([0,0,0])
            cube([30,30,20],center=true);
            translate([-12.5,0,0])
            cube([5,50,20],center=true);
        }
        translate([0,0,0])
        cube([30.5,15.6,8.1],center=true);
        
        rotate([0,90,0])
        translate([5,18.5,0])
        cylinder(d=3,h=40,center=true,$fn=30);
        
        rotate([0,90,0])
        translate([5,-18.5,0])
        cylinder(d=3,h=40,center=true,$fn=30);
        
        rotate([0,90,0])
        translate([-5,18.5,0])
        cylinder(d=3,h=40,center=true,$fn=30);
        
        rotate([0,90,0])
        translate([-5,-18.5,0])
        cylinder(d=3,h=40,center=true,$fn=30);
        
        // Zusammenbaulöcher
        translate([5,11.5,0])
        cylinder(d=3,h=40,center=true,$fn=30);
        translate([5,-11.5,0])
        cylinder(d=3,h=40,center=true,$fn=30);
        
    }
}

if (USBStecker) translate([-2,0,0])
color ("lightgray")USB_A();

module PanelMountA_oben()
{
    difference()
    {
        PanelMountA();
        translate([0,0,10])
        cube([60,60,20],center=true);
    }
}

module PanelMountA_unten()
{
    difference()
    {
        PanelMountA();
        translate([0,0,-10])
        cube([60,60,20],center=true);
    }
}

module USB_A_PanelMount()
{
    if (USBPanel_Oben) PanelMountA_oben();
    if (USBPanel_Unten) PanelMountA_unten();
}

if (USBPanel) USB_A_PanelMount();
