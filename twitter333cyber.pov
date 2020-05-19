// This work is licensed under the Creative Commons Attribution 3.0 Unported License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/
// or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
// California, 94041, USA.

// Persistence Of Vision raytracer sample file.
// By Dan Farmer
// Parabolic arches on the water.  Is this the St. Louis McDonalds?
//
// -w320 -h240
// -w800 -h600 +a0.3

// Modified by Discatte twitter.com/galacticfurball
// from sample scenes: objects/ttf1, pigments/crack1, finishes/arches.pov

#version 3.6;

global_settings {
  assumed_gamma 2.2
  max_trace_level 5
}

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "metals.inc"
#include "skies.inc"

camera {
   location <17.0, 5.0, -27.0>
   angle 40
   right     x*image_width/image_height
   look_at <1.0, -3.0, 0.0>
}

// Light
light_source {<200.0, 200.0, -150.0> colour red 1.3 green 1.3 blue 1.3 }

#declare New_Sky = sky_sphere { S_Cloud2 }
#declare Old_Sky =
sky_sphere {
   pigment {
      gradient y
      colour_map {
         [0.0 0.8  colour red 0.5 green 0.1 blue 0.7
                   colour red 0.1 green 0.1 blue 0.9]
         [0.8 1.0  colour red 0.1 green 0.1 blue 0.9
                   colour red 0.1 green 0.1 blue 0.9]
      }
   }
   pigment {
      bozo
      turbulence 0.7
      colour_map {
         [0.0 0.6  colour red 1.0 green 1.0 blue 1.0 filter 1.0
                   colour red 1.0 green 1.0 blue 1.0 filter 1.0]
         [0.6 0.8  colour red 1.0 green 1.0 blue 1.0 filter 1.0
                   colour red 1.0 green 1.0 blue 1.0]
         [0.8 1.001 colour red 1.0 green 1.0 blue 1.0
                    colour red 0.8 green 0.8 blue 0.8]
      }
      scale <0.5, 0.2, 0.2>
   }
}

sky_sphere { New_Sky }                      // changed by dmf '95

// Define the ocean surface
plane { y, -1.0
   texture {
      T_Chrome_2D
      normal {
         waves 0.05
         frequency 5000.0
         scale 6000.0
      }
   }
}

text { ttf "ArchivoBlack.ttf", "333", 2, 0
   translate <-2, 0, -7>
    pigment {
        crackle
        turbulence 0.5
        colour_map {
            [0.05 colour rgb<0, 0, 0> ]
            [0.08 colour rgb<0, 1, 1> ]
            [0.10 colour rgb<1, 0.2, 1> ]
            [1.00 colour rgb<0.3, 0.3, 1> ]
        }
        scale <0.1, 0.2, 1>
    }
    finish {
      Shiny
      ambient rgb <.2,.2,.1>
      }
   scale <4, 4, 1>
   rotate <0, -60, 0>
   }

text { ttf "ArchivoBlack.ttf", "Thanks!", 2, 0
   translate <-2, 0, -7>
    finish {
      ambient 0.03
      diffuse 1
      reflection 0.5
      phong 1
      phong_size 3
   }
   pigment { color red 0.5 green 0.45 blue 0.35 }

   scale <2, 2, 0.5>
   rotate <0, -60, 0>
   translate <5, -0.5, -5>
}