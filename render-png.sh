echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Rendering PNG images <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
mkdir -p images
openscad --imgsize=1600,1600 --projection=p --viewall --colorscheme=DeepOcean \
  files/miter_slot.scad -o images/miter_3x40_bolt.png \
  -D 'segments=3' -D 'segment_length=40' \
  -D 'bolt = true' -D 'groove=true' -D 'chain=false'

openscad --imgsize=1600,1600 --projection=p --viewall --colorscheme=DeepOcean \
  files/miter_slot.scad -o images/miter_2x80_screw_nogroove.png \
  -D 'segments=2' -D 'segment_length=80' \
  -D 'bolt = false' -D 'groove=false' -D 'chain=true'

