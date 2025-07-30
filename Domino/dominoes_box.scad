/*

Dominoes box

Carles Oriol
27/03/2015

*/

use <dominoes.scad>

box_width=17.4;
box_depth=6.52;
box_height=6.59;

box_base_height=.3;
box_cut_height=(box_height - box_base_height) /9;

box_incut_margin=.05;

 dent = (box_height - box_base_height) /9;


 dominoes_box( mode = 1); // 0 = mount closed, 1=mount open, 2 = on floor

// show domino set

//translate([box_incut_margin*6+box_cut_height, box_incut_margin*6+box_cut_height, box_base_height]) fulldomino( 2 );

module dominoes_box( mode )
{
    if( mode == 0 || mode == 1)
    {
    dominoes_box_base();
    translate([0,0,box_base_height])  dominoes_box_side();
    translate([0,box_depth,box_base_height]) mirror([0,1,0])  dominoes_box_side();
    translate([box_cut_height,0,box_base_height]) rotate([0,0,90])   dominoes_box_ends();
    
    translate([box_width,0,box_base_height]) rotate([0,0,90])  dominoes_box_open_end();
    }
    
     if( mode == 0 )
        translate([box_cut_height+box_incut_margin, box_cut_height+box_incut_margin,
                    box_height-(box_cut_height-box_incut_margin) ])  dominoes_box_precover();
    

     if( mode == 2 )
     {
        dominoes_box_base();
        translate([0,box_depth+box_cut_height,0]) dominoes_box_precover();
         translate([0,- box_cut_height,0]) rotate([90,0, 0]) dominoes_box_side();
        
      translate([0,-(box_height*2+box_cut_height),0])  rotate([-90,0, 0]) mirror([0,1,0]) dominoes_box_side();
         
        translate([-box_depth-box_cut_height ,- box_cut_height,0]) rotate([90,0, 0]) dominoes_box_ends();
       translate([-box_depth-box_cut_height,box_height+box_cut_height,0]) rotate([90,0, 0]) dominoes_box_open_end();

     }
}

module  dominoes_box_precover()

{   
    render()
    {
    difference()
    {
    translate([0,box_depth-box_cut_height-box_cut_height*.5-box_incut_margin*2,0]) 
    rotate( [0,0,-90] )
    trapeci(  
     
     box_depth- (box_cut_height/2+box_incut_margin)*2,
    box_depth- (box_cut_height+box_incut_margin)*2,
    
    box_width -(box_cut_height+box_incut_margin),
               
                box_cut_height-box_incut_margin);


      translate([box_width -(box_cut_height+box_incut_margin)-1.1,
                        (box_depth- (box_cut_height+box_incut_margin)*2)/2 , 
                        box_cut_height-box_incut_margin/2])

        
        difference()
     {
     resize([.6*2,3,.3]) sphere( r=2, $fn=16, center=true );
     
     translate([.3,0,0]) cube([.6,4,1], center=true);
     }
 }
 }
}

module  dominoes_box_cover()
{
    cube([  box_width -(box_cut_height+box_incut_margin),
                box_depth- (box_cut_height+box_incut_margin)*2,
                box_cut_height-box_incut_margin]);
}


module trapeci(a1,a2,d,h)
{
    hull()
    {
        cube([a1,d, 0.001]);
        translate([a1/2-a2/2,0,h-0.001]) cube([a2,d, 0.001]);
    }
}

//base
module dominoes_box_base()
    cube([box_width, box_depth,box_base_height]);

// side
module dominoes_box_side()
{
    render()
  difference()  
    {
    difference()
    {
    cube([box_width, box_cut_height, box_height - box_base_height ]);
    
    for( i = [0:3])
    {
        translate([0, -box_cut_height/2, dent*( i)*2+dent-box_incut_margin ])
            cube( [box_cut_height+box_incut_margin, box_cut_height*2, (dent+box_incut_margin*2) ]);
        
        translate([box_width-box_cut_height+box_incut_margin, -box_cut_height/2, dent*( i)*2+dent-box_incut_margin ])
            cube( [box_cut_height+box_incut_margin, box_cut_height*2, (dent+box_incut_margin*2) ]);
    }
    }
    
    
    translate([     box_cut_height+box_incut_margin, 
                    box_cut_height,
                    box_height-box_base_height-(box_cut_height-box_incut_margin) ])
   scale([1.1,1,1])
        dominoes_box_precover();
}
}


module dominoes_box_open_end()
{render()
    difference()
    {
        dominoes_box_ends();
        
        translate([box_cut_height+box_incut_margin,-.1,
        box_height-(box_cut_height+box_base_height+box_incut_margin)])
        
        cube([box_depth-box_incut_margin*2-box_cut_height ,
                    box_cut_height+box_incut_margin+.2,
                    box_cut_height+box_incut_margin]);
    }
}

module dominoes_box_ends()
{
   render()
    {
    itemwidth = box_depth-box_incut_margin;
    
    difference()
    {
    cube([itemwidth, box_cut_height, box_height - box_base_height ]);
    
    for( i = [0:4])
    {
        translate([0, -box_cut_height/2, dent*( i)*2 -box_incut_margin])
            cube( [box_cut_height+box_incut_margin, box_cut_height*2, (dent+box_incut_margin*2) ]);
        
         translate([itemwidth-box_cut_height+box_incut_margin, -box_cut_height/2, dent*( i)*2 -box_incut_margin])
            cube( [box_cut_height+box_incut_margin, box_cut_height*2, (dent+box_incut_margin*2) ]);
    }
    }
}
}






























