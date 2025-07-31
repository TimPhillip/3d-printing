#Trimmer/Potentiometer knob
© 2024 Alexander Hajnal
v1.0

Licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-nc-sa/4.0/) (CC BY-NC-SA 4.0),

---

Generates knobs for trimmers/potentiometers.  Both board-mount trimmers (screwdriver-adjusted) and stemmed potentiometers are supported.

To generate knobs with hatched knurling on the knob then the `knurledFinishLib_v2_1.scad` file must either be installed in your OpenSCAD library directory or be in the same directory as `TrimmerPotentiometerKnob.scad`.

A number of examples are included.  To use them place the `TrimmerPotentiometerKnob.json`. file in the same directory as `TrimmerPotentiometerKnob.scad`.

If you want to use this module in your own code, note the parameters to the module in the Console log and simply include the Knob module in your code along with the "`use <KnurledFinishLib_v2_1.scad>`" line.  None of the initialization code is needed for that application.


---

# Parameters

To disable any part set its height to 0.

## General settings

* **`$fn` → Number of segments in a circle**

Knob parts are listed from lowest (closest to trimmer/potentiometer) to highest.

* **`s_o` → Stem outer (d, h)**
    An outer sheath surrounding and dropping below the inner stem.  This is designed to act as a guide, support, and strain relief for board-mounted trimmers.
    This part will not be shown if `hide_s_o` (**Hide stem outer** under **Actuator**) is selected.
    * **d** → Outer diameter (inner diameter is `s_i`→`d`)
    * **h** → Height below inner stem's lower surface; overall height of outer stem is `s_i`→`h` + `s_o`→`h`.

* **`s_i` → Stem inner (d, h)**
    The lowest (non-sheath) part of the knob.
    For trimmers the actuator is placed below this part's lower surface.  For stemmed potentiometers the bottom of the stem hole is at this part's lower surface.
    * **d** → Diameter
    * **h** → Height

* **`f` → Flange (d, h)**
    Retaining flange meant to contact the case's inner surface.
    * **d** → Diameter
    * **h** → Height

* **`tc` → Through-case cylinder (d, h)**
    Section of stem that penetrates the case.
    * **d** → Diameter
    * **h** → Height

* **`k` → Knob (lower d, upper d, h)**
    The section of the knob that is manipulated by the user.
    * **lower d** → Diameter of lower surface (closest to trimmer/potentiometer)
    * **upper d** → Diameter of upper surface (ignored when hatched knurling is selected)
    * **h** → Height


## Actuator

This script supports both board-mount trimmers and shafted potentiometers.  The specific dimensions needed vary from device to device.  Check the part's datasheet and/or physically measure the part to determine the appropriate values.

* **`a` → Actuator style**
    Four actuator styles are supported:
    * **Trimmer** → Board mounted trimmer with inset cross-shaped actuator designed to be adjusted with a screwdriver.
    * **Stem (smooth)** → Smooth shaft actuator
    * **Stem (knurled)** → Shaft actuator with knurling
    * **Stem (flattend/D)** → Shaft actuator with a flat cutout along its side at its tip

* **`hide_s_o` → Hide stem outer**
    If selected the the stem outer sheath (**Stem outer**) will not be displayed.

* **`a_r` → Rotate actuator relative to knob (degrees)**
    Use this to correctly align the actuator with the knob's pointer.  The pointer is always aligned with the X-axis.

#### For board-mount trimmers:

Board-mounted trimmers are manipulated using a cross-shaped actuator.

* **`a_p` → Trimmer actuator primary (l, w, h)**
    The "primary" line of the cross.
    * **l** → Length of line from end to end
    * **w** → Width of line between long faces
    * **h** → Height below the inner stem's lower surface
    

* **`a_s` → Trimmer actuator secondary (l, w, h)**
    The "secondary" line of the cross, perpendicular to the "primary" line.
    * **l** → Length of line from end to end
    * **w** → Width of line between long faces
    * **h** → Height below the inner stem's lower surface

#### For stemmed potentiometers:

* **`a_stem` → Stem size (d, h)**
    * **d** → Diameter of the shaft
    * **h** → Distance to penetrate knob above the inner stem's lower surface

* **`a_flat` → Stem flat (inset, h)**
    For flattened/D-shaped shafts this defines the flat's shape.
    * **inset** → Distance from nominal outer edge of shaft to the surface of the flat.
    * **h** → Height of flat below the tip of the shaft

* **`a_knurl` → Stem knurling (count, h, inset)**
    For knurled shafts this defines the knurling's shape.
    * **count** → Number of knurls around the shaft.
    * **h** → Height that knurling extends below the tip of the shaft
    * **inset** → How deep the knurling extends towards the centerline of the shaft.


## Knob knurling

* **`kk_s` → Knob knurling style**
    Note: Hatched knobs are always cylindrical.
    * **None** → Smooth sides
    * **Grooved** → Vertical grooves
    * **Hatched** → Cross-hatched surface


#### For grooved knob knurling:

Grooves are cylindrical cuts into the knob's surface.

* **`kk_g_n` → Knob grooved knurling number**
    Number of grooves

* **`kk_g_d` → Knob grooved knurling diameter**
    Diameter of each groove's cylinder

* **`kk_g_oh` → Knob grooved knurling horizontal offset**
    Distance to offset each cylinder from the knob's outer surface

* **`kk_g_ov` → Knob grooved knurling vertical offset**
    Offset of grooves' lower edge from the bottom of knob's manipulatable portion.

* **`kk_align` → Align knob knurling**
    Controls the orientation of the grooves with the X-axis.
    * **Groove on axis** → One groove's centerline lies on the X-axis.
    * **Axis between grooves** → X-axis runs halfway between the two adjacent grooves.


#### For hatched knob knurling:

* **`kk_h_s` → Knob hatched knurling size**
    Size of each bump.

* **`kk_h_d` → Knob hatched knurling depth**
    Radial depth from knob's outer edge to deepest point of knurling

* **`kk_h_sa` → Knob hatched knurling smooth section above**
    Height of smooth section above the knurling (away from potentiometer).  The smooth section's surface is aligned with the knurling's innermost points.

* **`kk_h_sb` → Knob hatched knurling smooth section below**
    Height of smooth section below the knurling (towards the potentiometer).  The smooth section's surface is aligned with the knurling's innermost points.

## Pointer

Optional pointer mark to add to the knob.  To adjust its orientation relative to the actuator use the `a_r` parameter (**Actuator**→**Rotate actuator relative to knob**).

* **`p` → Pointer style**
    * **None** → No pointer is generated.
    * **Inset** → A groove is place on the outer and/or upper face of the knob.
    * **Outset** → A rectilinear shape is outset from the outer and/or upper face of the knob.
    * **Inset and Outset** → Both inset and outset pointers are generated.
    * **Dot** → An inset circular dot in placed on the knob's top surface.

* **`p_o_d` → Pointer outset dimensions ( l, w, h, v_offset )**
    * **`l`** → Length of top marking radially inwards from knob's lower outer surface (`k`→`lower d`).
    * **`w`** → Width of marking perpendicular to the radial direction.
    * **`h`** → Height of side marking vertically down from knob's top surface.
    * **`v_offset`** → Distance to vertically shift the entire marker (both top and side).

* **`p_o_e` → Pointer outset extensions ( l, h )**
    * **`l`** → Length to marking's outer edge radially outwards from knob's lower outer surface (`k`→`lower d`).
    * **`h`** → Height of pointer's top above knob's top surface.

* **`p_i` → Pointer inset distances ( l, h, w, d )**
    * **`l`** → Length of top marking radially inwards from knob's lower outer surface (`k`→`lower d`).
    * **`h`** → Height of side marking vertically down from knob's top surface.
    * **`w`** → Width of marking perpendicular to the radial direction.
    * **`d`** → Depth of marking relative to knob's outer surface (side and top).

* **`p_d` → Pointer dot (d, h, offset)**
    * **`d`** → Diameter of dot.
    * **`h`** → Depth of dot below knob's top surface.
    * **`offset`** → Offset of dot's center point from knob's top outer edge.


---

# Version history

**1.0**  Initial public release

* Initial version
