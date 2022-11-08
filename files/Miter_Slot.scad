// -------------------------------------
// Miter slot dimensions - Tool specific
slot_width = 19.65;
slot_height = 10.40; // total height

// T Groove dimensions for bottom of miter slot
groove_width = 23;
groove_height = 3.5;

// -------------------------------------
// Fastener holes - Nut + Bolt or Wood Screw

// 1/4"-20 Imperial Nut + Bolt
nut_width = 12.75;
nut_height = 6;
bolt_diameter = 6.9;

// #6 Imperial Wood Screw
screw_width = 9;
screw_height = 3.3;
screw_diameter = 4.5;

// -------------------------------------
// Piece-specific options

// Length of each segment
slot_length = 40;
// Number of segments to create
slot_segments = 1;


// =====================================

module tslot_segment(t){
    translate([(-slot_length/2)+(slot_length*(t/1.4)), 0, 0])
    intersection(){
        difference(){
            union(){
                // groove
                translate([-slot_length/2, -groove_width/2, 0])
                cube([slot_length,groove_width,groove_height], 0);

                // slot
                translate([-slot_length/2, -slot_width/2, groove_height])
                cube([slot_length,slot_width,slot_height], 0);

            }
            // bolt cutout
            cylinder(h=slot_height + groove_height, d=bolt_diameter);

            // nut cutout
            cylinder(h=nut_height, d=nut_width, $fn=6);
        }

        // Round corner edges
        scale([1,.85,1])
        cylinder(h=slot_height, d=slot_length);
    }
}

module tslot() {
    echo("tslot, segments: ", slot_segments)
    for (i =[1:slot_segments]){
        tslot_segment(i);
    }
}

tslot();
