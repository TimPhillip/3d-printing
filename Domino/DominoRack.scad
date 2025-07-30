// Domino Rack
// Copyright (c) 2017 Courtney and Chris Sammis

// Imports a basic domino rack model designed in Tinkercad and modifies it
// with decorative pips. The pip arrangement is based on random_seed which
// can be changed for different designs.
base_model  = "DominoRack_base.stl";
random_seed = 1985;

pip_diameter = 6;
domino_depth = 6;
domino_face = 15;
rack_back_angle = 22.5;

// Arranges a domino face with 1 - 9 pips
module pips(count)
{
    module pip()
    {
        cylinder(r = pip_diameter / 2, h = domino_depth, $fn=pip_diameter * 4);
    }
    
    s0 = 0;
    s1 = domino_face / 2;
    s2 = domino_face;
    
    for (i = [1 : count])
    {
        if (i >= 2) { translate([s0, s0, s0]) { pip(); } }
        if (i >= 8) { translate([s1, s0, s0]) { pip(); } }
        if (i >= 4) { translate([s2, s0, s0]) { pip(); } }
        
        if (i >= 6) { translate([s0, s1, s0]) { pip(); } }
        if (count % 2 == 1)
        {
            translate([s1, s1, s0]) { pip(); }
        }
        if (i >= 6) { translate([s2, s1, s0]) { pip(); } }
        
        if (i >= 4) { translate([s0, s2, s0]) { pip(); } }
        if (i >= 8) { translate([s1, s2, s0]) { pip(); } }
        if (i >= 2) { translate([s2, s2, s0]) { pip(); } }
    }
}

// Creates a set of domino features faced on the X-Y plane
module domino(first, second)
{
    pips(first);
    translate([(pip_diameter / 2) * -1, domino_face + pip_diameter, 0])
    {
        cube([domino_face + pip_diameter, pip_diameter / 2, domino_depth]);
    }
    translate([0, domino_face + (pip_diameter * 3) - 2, 0])
    pips(second);
}

// The original base model was created at 160 units in length but the final model should end up at 200
scale([1.25, 1.25, 1.25])
{
    // When testing, comment out the `difference()`. OpenSCAD's preview of this model is wonky
    // and the actual render takes a lot of time.
    difference()
    {
        import(base_model);
        translate([52, 58, 8])
        {
            rotate([rack_back_angle + 90, 0, 0])
            {
                random_faces = rands(2, 9, 12, random_seed);
                for (i = [0 : 5])
                {
                    scale([0.85, 0.85, 0.85])
                    {
                        translate([i * domino_face * -2, 0, 0])
                        {
                            domino(floor(random_faces[i * 2]), floor(random_faces[(i * 2) + 1]));
                        }
                    }
                }
            }
        }
    }
}