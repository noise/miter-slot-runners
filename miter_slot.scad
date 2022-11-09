/* [Part-specific settings] */
// Number of many segments long
segments=2;

// Length of each segment
segment_length = 80;

// Bolt (true) or countersink for wood screw (false)
bolt = true; // [true,false]

// Inset bottom groove to lock into miter slot, `false` for a drop-in runner
groove = true; // [true,false]

// Chain: `true` to cope end for multi-part longer runners
chain = false; // [true,false]

/* [Tool-specific Miter Slot Dimensions] */

// Width of the main miter slot
slot_width = 19.25; 
// Total height of the bar
slot_height = 10.40;

// T Groove dimensions for bottom of miter slot
groove_width = 23;
groove_height = 3.5;

/* [Fastener Holes - Nut + Bolt or Wood Screw] */

// 1/4"-20 Imperial Nut + Bolt
nut_width = 12.75;
nut_height = 6;
bolt_diameter = 6.9;

// #6 Imperial Wood Screw
screw_width = 9;
screw_height = 3.3;
screw_diameter = 4.5;

// =====================================

module tslot_segment(t, slot_length, bolt, groove, chain){
    translate([(-slot_length/2)+(slot_length*(t/1.4)), 0, 0])
    difference(){
    intersection(){
        difference(){
            union(){
                if (groove) {
                  // groove
                  translate([-slot_length/2, -groove_width/2, 0])
                  cube([slot_length, groove_width,groove_height], 0);

                  // slot
                  translate([-slot_length/2, -slot_width/2, groove_height])
                  cube([slot_length,slot_width,slot_height-groove_height], 0);
                }
                else  {
                  // slot
                  translate([-slot_length/2, -slot_width/2, 0])
                  cube([slot_length,slot_width,slot_height], 0);
                }

            }
            // bolt/screw cutout
            cylinder(h=slot_height + groove_height, d=screw_width, $fn=20);

            if (bolt) {
                // nut cutout
                cylinder(h=nut_height, d=nut_width, $fn=6);
            }
            else {
                // countersink screw head space
                cylinder(h=nut_height, d1=nut_width, d2=screw_width, $fn=20);
            }
        }

        // Round corner edges
        scale([1,.55,1])
        cylinder(h=slot_height, d=slot_length, $fn=60);
    }
    // end cutout for extensions
    if (chain) {
        scale([1,.55,1]) translate([slot_length*.96,0,0])
        cylinder(h=slot_height, d=slot_length, $fn=60);
    }
    }
}

module tslot(segments=1, slot_length=80, bolt=true, groove=true, chain=false) {
    for (i =[1:segments]){
        tslot_segment(i, slot_length, bolt, groove, chain);
    }
}

tslot(segments, segment_length, bolt, groove, chain);
