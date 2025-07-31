/*
Trimmer/Potentiometer knob
© 2024 Alexander Hajnal
v1.0

License: CC BY-NC-SA
Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
https://creativecommons.org/licenses/by-nc-sa/4.0/

Generates knobs for trimmers/potentiometers.

To disable any part set its height to 0.

If you want to use this module in your own code, note the parameters to 
the module in the Console log and simply include the Knob module in your 
code along with the "use <KnurledFinishLib_v2_1.scad>" line.  None of the 
initialization code below is needed for that application.
*/


// This module is required for "Hatched" knurling of the knob.  It should 
// be placed either in the OpenSCAD module directory or in the same 
// directory as this script.
use <KnurledFinishLib_v2_1.scad>


/* [ General settings ] */

// Number of sides on a circle
$fn=64;

// Stem outer (d, h); see also "Hide stem outer" under "Actuator"
s_o = [ 11.6, 5.2 ]; // 0.1

// Stem inner (d, h)
s_i = [ 10.0, 5.0 ]; // 0.1

// Flange (d, h)
f = [ 15.0, 2.0 ]; // 0.1

// Through-case cylinder (d, h)
tc = [ 12.0, 2.0 ]; // 0.1

// Knob (lower d, upper d, h)
k = [ 12.0, 10.0, 15.0 ]; // 0.1


/* [ Actuator ] */

// Actuator style
a = "Trimmer"; // [ "Trimmer", "Stem (smooth)", "Stem (knurled)", "Stem (flattend/D)" ]

// Hide stem outer
hide_s_o = false;

// Rotate actuator relative to knob (degrees)
a_r = 0; // 1

// Trimmer actuator primary (l, w, h)
a_p = [ 3.8, 0.8, 2.0 ]; // 0.1

// Trimmer actuator secondary (l, w, h)
a_s = [ 3.8, 0.8, 1.2 ]; // 0.1

// Stem size (d, h)
a_stem = [ 6.0, 15 ]; // 0.1

// Stem flat (inset, h)
a_flat = [ 1.5, 12 ]; // 0.1

// Stem knurling (count, h, inset)
a_knurl = [ 18, 10, 0.5 ]; // 0.1

/* [ Knob knurling ] */

// Knob knurling style (Note; hatched knobs are always cylindrical)
kk_s = "Grooved"; // [ "None", "Grooved", "Hatched" ]


/* [ Knob knurling: Grooved ] */

// Knob grooved knurling number
kk_g_n = 12; // 1

// Knob grooved knurling diameter
kk_g_d = 2.0; // 0.1

// Knob grooved knurling horizontal offset
kk_g_oh = 1.25; // 0.05

// Knob grooved knurling vertical offset
kk_g_ov = 2.5; // 0.1

// Align knob knurling
kk_align = "Groove on axis"; // [ "Groove on axis", "Axis between grooves" ]


/* [ Knob knurling: Hatched ] */

// Knob hatched knurling size
kk_h_s = 2.0; // 0.1

// Knob hatched knurling depth
kk_h_d = 0.4; // 0.1

// Knob hatched knurling smooth section above
kk_h_sa = 0.5; // 0.1

// Knob hatched knurling smooth section below
kk_h_sb = 1.5; // 0.1


/* [ Pointer ] */

// Pointer style
p = "Outset"; // [ "None", "Inset", "Outset", "Inset and Outset", "Dot" ]

// Pointer outset dimensions ( l, w, h, v_offset )
p_o_d = [ 5.0, 1.2, 14.5, 0.0 ]; // 0.1

// Pointer outset extensions ( l, h )
p_o_e = [ 1.25, 0.75 ]; // 0.1

// Pointer inset distances ( l, h, w, d )
p_i = [ 5.0, 10.0, 1.2, 2.0 ]; // 0.1

// Pointer dot (d, h, offset)
p_d = [ 2.5, 1, 2 ]; // 0.1

// --------------------------------------------------------

kk_rotate = ( kk_align == "Groove on axis" ) 
          ? 0
          : // Axis between grooves
            (kk_g_n>0) 
            ? 180/kk_g_n
            : 0;

// Generates a single knob
module Knob( a_p, a_s, a_r, a_stem, a_flat, a_knurl, s_i, s_o, hide_s_o, f, tc, k, kk_s, kk_g_n, kk_g_d, kk_g_oh, kk_g_ov, kk_h_s, kk_h_d, kk_h_sa, kk_h_sb, kk_rotate, p, p_o_d, p_o_e, p_i, p_d ) {
  echo( "Knob: " );
  echo( a_p=a_p );
  echo( a_s=a_s );
  echo( a_r=a_r );
  echo( a_stem=a_stem );
  echo( a_flat=a_flat );
  echo( a_knurl=a_knurl );
  echo( s_i=s_i );
  echo( s_o=s_o );
  echo( hide_s_o=hide_s_o );
  echo( f=f );
  echo( tc=tc );
  echo( k=k );
  echo( kk_s=kk_s );
  echo( kk_g_n=kk_g_n );
  echo( kk_g_d=kk_g_d );
  echo( kk_g_oh=kk_g_oh );
  echo( kk_g_ov=kk_g_ov );
  echo( kk_h_s=kk_h_s );
  echo( kk_h_d=kk_h_d );
  echo( kk_h_sa=kk_h_sa );
  echo( kk_h_sb=kk_h_sb );
  echo( kk_rotate=kk_rotate );
  echo( p=p );
  echo( p_o_d=p_o_d );
  echo( p_o_e=p_o_e );
  echo( p_i=p_i );
  echo( p_d=p_d );
  
  // Actuator (trimmer)
  if ( a == "Trimmer" ) {
    rotate( [ 0, 0, a_r ] ) {
      // Actuator primary
      if (a_p.z > 0)
        translate([0, 0, -a_p.z/2])
          cube(a_p, center=true);
      
      // Actuator secondary
      if (a_s.z > 0)
        rotate([0,0,90])
          translate([0, 0, -a_s.z/2])
            cube(a_s, center=true);
    }
  }
  
  difference() {
    union() {
      // Stem inner
      translate([0, 0, s_i.y/2])
        cylinder( h=s_i.y, d=s_i.x, center=true );
      
      // Stem outer
      if ( ! hide_s_o ) {
        if ( s_o.x>0 && s_o.y>0 ) {
          s_i_h = s_o.y+s_i.y;
          difference() {
            translate([0, 0, -(s_i_h)/2+s_i.y])
              cylinder( h=s_i_h, d=s_o.x, center=true );
            translate([0, 0, -(s_i_h)/2+s_i.y])
              cylinder( h=s_i_h+0.2, d=s_i.x, center=true );
          }
        }
      }
      
      // Flange
      if (f.y > 0)
        translate([0, 0, s_i.y + f.y/2])
          cylinder( h=f.y, d=f.x, center=true );
      
      // Through-case cylinder
      if (tc.y > 0)
        translate([0, 0, s_i.y + f.y + tc.y/2])
          cylinder( h=tc.y, d=tc.x, center=true );
      
      // Knob
      if (k.z > 0)
      translate([0, 0, s_i.y + f.y + tc.y])
      union() {
        difference() {
          
          // Knob
          union() {
            
            if ( ( kk_s == "None" ) || ( kk_s == "Grooved" ) ) {
              // Unadorned knob
              translate([0, 0, k.z/2])
                cylinder( h=k.z, d1=k.x, d2=k.y, center=true );
            }
            
            if ( kk_s == "Hatched" ) {
              // Cross-hatched knurling

              // Lower smooth section
              if (kk_h_sb > 0) {
                cylinder( h=kk_h_sb, d=k.x-2*kk_h_d );
              }
              
              // Knurling
              translate( [0,0,kk_h_sb] )
              knurl(	k_cyl_hg = k.z - kk_h_sa - kk_h_sb,
                      k_cyl_od = k.x - kk_h_d,
                      knurl_wd =  kk_h_s,
                      knurl_hg =  kk_h_s,
                      knurl_dp =  kk_h_d,
                      e_smooth =  1,
                      s_smooth =  0);
              
              // Upper smooth section
              if (kk_h_sa > 0) {
                translate( [0,0,k.z-kk_h_sa] )
                  cylinder( h=kk_h_sa, d=k.x-2*kk_h_d );
              }
            }
          } // END Knob
          
          // Vertical grooved knurling
          if ( kk_s == "Grooved" ) {
            rotate([0,0,kk_rotate]) {
              for ( n = [ 0 : 1: kk_g_n-1 ] ) {
                rotate( [ 0, 0, 360/kk_g_n*n ] )
                  render() difference() {
                    multmatrix( m = [ [ 1, 0, -(k.x-k.y)/(2*k.z), 0 ],
                                      [ 0, 1, 0, 0 ], 
                                      [ 0, 0, 1, 0 ], 
                                      [ 0, 0, 0, 1 ] ] )
                      translate([k.x/2+kk_g_oh-kk_g_d/2, 0, k.z/2 + 0.5])
                          cylinder( h=k.z+1, d=kk_g_d, center=true );
                    translate([0, 0, kk_g_ov/2-0.5])
                      cylinder( h=kk_g_ov+1, d=k.x+2*(kk_g_d+kk_g_oh), center=true );
                  }
              }
            }
          }
          
          if ( 
               ( p == "Inset" ) ||
               ( p == "Inset and Outset" )
             ) {
            // Grooves
            l = p_i[0];
            h = p_i[1];
            w = p_i[2];
            d = p_i[3];
            h_upper = (h < k.z) ? h : k.z;
            h_lower = (h > k.z) ? k.z - h : 0;
            
            if ( kk_s == "Grooved" ) {
              // Side groove
              multmatrix( m = [ [ 1, 0, -(k.x-k.y)/(2*k.z), 0 ],
                                [ 0, 1, 0, 0 ], 
                                [ 0, 0, 1, 0 ], 
                                [ 0, 0, 0, 1 ] ] )
                translate([k.x/2 - d/2 + 0.5, 0, k.z - h_upper/2 + 0.5 ])
                  cube([d+1, w, h_upper+1], center=true );
              
              // Top groove
              multmatrix( m = [ [ 1, 0, -(k.x-k.y)/(2*k.z), 0 ],
                                [ 0, 1, 0, 0 ], 
                                [ 0, 0, 1, 0 ], 
                                [ 0, 0, 0, 1 ] ] )
                translate([k.x/2 - l/2 + 0.5, 0, k.z - d/2 + 0.5 ])
                    cube([l+1, w, d+1], center=true );
            } else {
              // Side groove
              translate([k.x/2 - d/2 + 0.5, 0, k.z - h_upper/2 + 0.5 ])
                cube([d+1, w, h_upper+1], center=true );
              
              // Top groove
              translate([k.x/2 - l/2 + 0.5, 0, k.z - d/2 + 0.5 ])
                cube([l+1, w, d+1], center=true );
            }
          }
          if ( 
               ( p == "Dot" )
             ) {
            // Dot on top surface
            d      = p_d[0];
            h      = p_d[1];
            offset = p_d[2];
            
            kd = ( kk_s == "Hatched" ) ? k.x : k.y;
            translate([kd/2 - offset, 0, k.z - h/2 + 0.5] )
              cylinder( h=h+1, d=d, center=true );
          }
        }
        
        if ( ( p == "Outset" ) || ( p == "Inset and Outset" ) ) {
          // Outset pointer
          l        = p_o_d[0];
          w        = p_o_d[1];
          h        = p_o_d[2];
          v_offset = p_o_d[3];
          l_extend = p_o_e[0];
          h_extend = p_o_e[1];
          translate([k.x/2-l/2+l_extend/2, 0, k.z - h/2 + h_extend/2 - v_offset])
            cube( [ l+l_extend, w, h+h_extend ], center=true );
        }
      }
    }
    
    // Hole in bottom for stemmed potentiometers
    
    if ( a == "Stem (smooth)" ) {
      // Smooth shaft
      translate( [0, 0, a_stem.y/2-0.5] )
       cylinder(d=a_stem.x, h=a_stem.y+1, center=true);
    }
    
    if ( a == "Stem (knurled)" ) {
      // Knurled shaft
      count = a_knurl[0];
      h     = a_knurl[1];
      inset = a_knurl[2];
      d     = a_stem.x;
      sh    = a_stem.y;
      //union() {
      difference() {
        translate( [0, 0, sh/2-0.5] )
         cylinder(d=d, h=sh+1, center=true);
        translate( [0, 0, sh-h] )
          for ( n = [ 0 : 1: count-1 ] ) {
            rotate( [ 0, 0, 360/count*n ] )
              linear_extrude(h+1)
                polygon( [ [0,d/2-inset], [inset,d/2], [-inset,d/2] ] );
        }
      }
    }
    
    if ( a == "Stem (flattend/D)" ) {
      // Smooth shaft with flattened cutout section
      inset = a_flat[0];
      h     = a_flat[1];
      d     = a_stem.x;
      sh    = a_stem.y;
      //union() {
      difference() {
        translate( [0, 0, sh/2-0.5] )
         cylinder(d=d, h=sh+1, center=true);
        translate( [d/2-inset/2+0.5, 0, h/2+(sh-h+0.5)] )
          cube( [inset+1, d, h+1], center=true );
      }
    }
  }
}

Knob(
      a_p, a_s,  // Actuator (trimmer, primary and secondary)
      a_r,       // Actuator rotation relative to knob (degrees)
      // Stemmed actuator:
      a_stem, a_flat, a_knurl, 
      s_i, s_o,  // Stem (inner and outer)
      hide_s_o,  // Set true to hide outer stem
      f,         // Flange
      tc,        // Through-case cylinder
      k,         // Knob
      kk_s,      // Knob knurling style
      // Knob grooved knurling:
      kk_g_n, kk_g_d, kk_g_oh, kk_g_ov, 
      // Knob hatched knurling:
      kk_h_s, kk_h_d, kk_h_sa, kk_h_sb, 
      // Pointer:
      kk_rotate, p, p_o_d, p_o_e, p_i, p_d
    );
