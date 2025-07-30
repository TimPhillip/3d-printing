//==================================
//  Double Twelves Domino Generator
//	
//  Written by Andrew Moore, May 2016
//      http://www.thingiverse.com/TacPar
//      For questions, suggestions, or whatever, 
//      please PM me through thingiverse.
//
//  This program will generate numbered Domino Tiles
//
//==================================

//Global Constants
//==================================
$fn=30;
inch = 25.4;

//User-selectable Global Variables
//==================================
//double six = 28 tiles
//double nine = 55 tiles
//double twelve = 91 tiles

max_number = 12; //highest domino tile number
first_number = 9;
second_number = 11;
tile_width = 1*inch;
tile_thickness = 3/8*inch;

//this rounds the edges of the tiles.  Smaller number = sharper edges
corner_radius = 1/16*inch;

//Dot size for 1-9
dot_radius = 2;

//Dot size for numbers larger than 9
small_dot_rad = 1.5;

//set to true if you want to wait a really long time for a huge part
print_all = false;

//Calculated Global Values... don't change these
tile_height = 2*tile_width;

module main()
{  
    if (print_all)
    {
        for(i=[0:1:max_number])
        {
            for(j=[0:1:max_number])
            {
                if (j>=i)
                {
                    translate([i*1.5*tile_width,j*1.5*tile_height,0]) domino(number1=i, number2=j);
                }
            }
        }
    }else
    {
        domino(number1=first_number, number2=second_number);
    }
}

module domino(number1 = 0, number2 = 0)
{
	difference()
	{
		positives();
		negatives();
	}

	module positives()
	{
		translate([corner_radius,corner_radius,corner_radius]) minkowski()
		{
			cube([tile_width-2*corner_radius,tile_height-2*corner_radius,tile_thickness-2*corner_radius]);
			sphere(r=corner_radius);
		}
		
	}
	module negatives()
	{
		//cut the center line on the domino
		translate([corner_radius,tile_height/2, tile_thickness]) 
            rotate([0,90,0]) 
            cylinder(r=0.5, h=tile_width-2*corner_radius);
        
		//Place the numbered dots centered on top tile half
		translate([tile_width/2,3/4*tile_height,tile_thickness]) 
            number_dots(count = number1);

		//Place numbered dots centered on bottom half
		translate([tile_width/2,1/4*tile_height,tile_thickness]) 
            number_dots(count = number2);
		
	}

	module number_dots(count = 0)
	{
		//set up margins for dot field
        dot_field_width = tile_width-6*corner_radius;
		dot_field_height = dot_field_width;
		
		if (count == 1)
		{
			sphere(r=dot_radius);
		}
		if (count == 2)
		{
			translate([-1/3*dot_field_width,1/3*dot_field_width,0]) sphere(r=dot_radius);
			translate([1/3*dot_field_width,-1/3*dot_field_width,0]) sphere(r=dot_radius);
		}
		if (count == 3)
		{
			sphere(r=dot_radius);
			translate([-dot_field_width/2,dot_field_width/2,0]) sphere(r=dot_radius);
			translate([dot_field_width/2,-dot_field_width/2,0]) sphere(r=dot_radius);
		}
		if (count ==4)
		{
			translate([-1/3*dot_field_width,1/3*dot_field_width,0]) sphere(r=dot_radius);
			translate([1/3*dot_field_width,-1/3*dot_field_width,0]) sphere(r=dot_radius);
			translate([-1/3*dot_field_width,-1/3*dot_field_width,0]) sphere(r=dot_radius);
			translate([1/3*dot_field_width,1/3*dot_field_width,0]) sphere(r=dot_radius);
		}
		if (count ==5)
		{
			sphere(r=dot_radius);
			translate([-1/2*dot_field_width,1/2*dot_field_width,0]) sphere(r=dot_radius);
			translate([1/2*dot_field_width,-1/2*dot_field_width,0]) sphere(r=dot_radius);
			translate([-1/2*dot_field_width,-1/2*dot_field_width,0]) sphere(r=dot_radius);
			translate([1/2*dot_field_width,1/2*dot_field_width,0]) sphere(r=dot_radius);
		}
		if (count == 6)
		{
			translate([dot_field_width/2,0,0])sphere(r=dot_radius);
			translate([-dot_field_width/2,0,0])sphere(r=dot_radius);
			translate([dot_field_width/2,dot_field_width/2,0])sphere(r=dot_radius);
			translate([-dot_field_width/2,-dot_field_width/2,0])sphere(r=dot_radius);
			translate([-dot_field_width/2,dot_field_width/2,0]) sphere(r=dot_radius);
			translate([dot_field_width/2,-dot_field_width/2,0]) sphere(r=dot_radius);
		}
		if (count == 7)
		{
			sphere(r=dot_radius);
			translate([dot_field_width/2,0,0])sphere(r=dot_radius);
			translate([-dot_field_width/2,0,0])sphere(r=dot_radius);
			translate([dot_field_width/2,dot_field_width/2,0])sphere(r=dot_radius);
			translate([-dot_field_width/2,-dot_field_width/2,0])sphere(r=dot_radius);
			translate([-dot_field_width/2,dot_field_width/2,0]) sphere(r=dot_radius);
			translate([dot_field_width/2,-dot_field_width/2,0]) sphere(r=dot_radius);
		}
		if (count == 8)
		{
			translate([0,1/3*dot_field_width,0]) 
                sphere(r=dot_radius);
			translate([0,-1/3*dot_field_width,0]) 
                sphere(r=dot_radius);
			translate([dot_field_width/2,0,0])
                sphere(r=dot_radius);
			translate([-dot_field_width/2,0,0])
                sphere(r=dot_radius);
			translate([dot_field_width/2,dot_field_width/2,0])
                sphere(r=dot_radius);
			translate([-dot_field_width/2,-dot_field_width/2,0])
                sphere(r=dot_radius);
			translate([-dot_field_width/2,dot_field_width/2,0]) 
                sphere(r=dot_radius);
			translate([dot_field_width/2,-dot_field_width/2,0]) 
                sphere(r=dot_radius);
		}
        if (count == 9)
		{
			sphere(r=dot_radius);
			translate([0,-dot_field_width/2,0])
                sphere(r=dot_radius);
			translate([0,dot_field_width/2,0])
                sphere(r=dot_radius);
			translate([dot_field_width/2,0,0])
                sphere(r=dot_radius);
			translate([-dot_field_width/2,0,0])
                sphere(r=dot_radius);
			translate([dot_field_width/2,dot_field_width/2,0])
                sphere(r=dot_radius);
			translate([-dot_field_width/2,-dot_field_width/2,0])
                sphere(r=dot_radius);
			translate([-dot_field_width/2,dot_field_width/2,0]) 
                sphere(r=dot_radius);
			translate([dot_field_width/2,-dot_field_width/2,0]) 
                sphere(r=dot_radius);
		}
        if (count == 10)
		{
            translate([dot_field_width/2,0,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,0,0])
                sphere(r=small_dot_rad);
            translate([dot_field_width*3/16,0,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width*3/16,0,0])
                sphere(r=small_dot_rad);
            
			translate([0,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([0,dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([dot_field_width/2,dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,dot_field_width/2,0]) 
                sphere(r=small_dot_rad);
			translate([dot_field_width/2,-dot_field_width/2,0]) 
                sphere(r=small_dot_rad);
		}
        if (count == 11)
		{
            translate([dot_field_width/2,dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,dot_field_width/2,0])
                sphere(r=small_dot_rad);
            translate([dot_field_width*3/16,dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width*3/16,dot_field_width/2,0])
                sphere(r=small_dot_rad);
            
            sphere(r=small_dot_rad);
			translate([-dot_field_width/2,0,0])
                sphere(r=small_dot_rad);
			translate([dot_field_width/2,0,0])
                sphere(r=small_dot_rad);
            
            translate([dot_field_width/2,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
            translate([dot_field_width*3/16,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width*3/16,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
		}
        if (count == 12)
		{
            translate([dot_field_width/2,dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,dot_field_width/2,0])
                sphere(r=small_dot_rad);
            translate([dot_field_width*3/16,dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width*3/16,dot_field_width/2,0])
                sphere(r=small_dot_rad);
            
            translate([dot_field_width/2,0,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,0,0])
                sphere(r=small_dot_rad);
            translate([dot_field_width*3/16,0,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width*3/16,0,0])
                sphere(r=small_dot_rad);
            
            translate([dot_field_width/2,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width/2,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
            translate([dot_field_width*3/16,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
			translate([-dot_field_width*3/16,-dot_field_width/2,0])
                sphere(r=small_dot_rad);
		}
	}
}

main();
