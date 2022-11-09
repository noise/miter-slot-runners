echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Rendering STLs <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
mkdir -p stl
openscad files/miter_slot.scad -o stl/miter_3x80_nogroove_chain.stl \
  -D 'segments=3' -D 'segment_length=80' \
  -D 'bolt = false' -D 'groove = false' -D 'chain=true'
openscad files/miter_slot.scad -o stl/miter_2x80_groove.stl \
  -D 'segments=2' -D 'segment_length=80' \
  -D 'bolt = true' -D 'groove = true' -D 'chain=false'
