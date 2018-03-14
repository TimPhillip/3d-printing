include <gears.scad>;
gehaeusehoehe = 30;
stufe = 9;

    // Achse 1
    
    translate ([-20,00,gehaeusehoehe])
    // rotate([0,0,1/30*360])
    rotate([0,90,0])
    gear (number_of_teeth=22,
                circular_pitch=150.0,
                hub_diameter=4,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

    translate ([00,00,gehaeusehoehe])
    // rotate([0,0,1/30*360])
    rotate([0,90,0])
    gear (number_of_teeth=22,
                circular_pitch=150.0,
                hub_diameter=4,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

   // Achse 2
    translate ([00,25,gehaeusehoehe-stufe])
    rotate([0,90,0])
    //rotate([0,0,0.5/35*360])
    gear (number_of_teeth=42,
                circular_pitch=150.0,
                hub_diameter=4,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);

   // Achse 3
    translate ([00,50,gehaeusehoehe])
    rotate([0,90,0])
    //rotate([0,0,0.5/30*360])
    gear (number_of_teeth=22,
                circular_pitch=150.0,
                hub_diameter=4,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);
