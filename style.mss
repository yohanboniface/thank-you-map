/* ******* */
/* Palette */
/* ******* */
@water:             #bed9e0;
@land:              #fefefd;
@water:             #90cccb;
@grass:             #d3e0be;
@admin:             #c7a28a;
@building:          #ABB7B7;

@rail_line:         #999;
@rail_fill:         #efefef;
@rail_case:         #444;

@city_text:         #222;
@city_halo:         @land;
@town_text:         #444;
@town_halo:         @land;
@village_text:      #444;
@village_halo:      @land;

@sans:              'Fira Sans Regular','DejaVu Sans Book','unifont Medium';
@sans_bold:         'Fira Sans Bold','unifont Medium';
@sans_bold_italic:  'Fira Sans Bold Italic','unifont Medium';
@sans_light:        'Fira Sans Light','unifont Medium';
@sans_book:         'Fira Sans Book','unifont Medium';


/* *********** */
/* backgrounds */
/* *********** */

Map {
  background-color: @water;
  background-image: url('texture.png');
  buffer-size: 512;
}
#earth {
  polygon-fill: @land;
  comp-op: multiply;
}
#landuse {
  comp-op: multiply;
  [kind='park']          { polygon-fill: @grass; }
  [kind='garden']        { polygon-fill: @grass; }
  [kind='forest']        { polygon-fill: @grass;}
  [kind='wood']          { polygon-fill: @grass; }
  // [zoom<15][kind='residential']   {
  //   line-color: @building;
  //   line-clip: false;
  // }
}

#water[area!=null] {
  polygon-fill: #81CFE0;
  comp-op: multiply;
}

/* ************************* */
/* ADMINISTRATIVE BOUNDARIES */
/* ************************* */
// #places[admin_level='4'],
// #places[admin_level='6'],
// #places[admin_level='8'][zoom>=12],
// #places[admin_level='9'][zoom>=12] {
//   eraser/line-color: white;
//   eraser/line-width: 0.5;
//   eraser/comp-op: darken;
//   line-color: @admin;
//   line-width: 0.5;
//   line-smooth: 0.2;
//   [zoom<12] {
//     line-simplify: 10;
//   }
//   [admin_level=8],
//   [admin_level=9] {
//     line-dasharray: 1,3;
//     line-cap: round;
//     line-color: darken(@admin, 10%);
//   }
//   [admin_level=4] {
//     line-color: darken(@admin, 10%);
//     line-cap: butt;
//     line-color: @admin;
//     line-width: 1;
//     line-dasharray: 10,4,2,4;
//     [zoom>=12] {
//       line-width: 2;
//     }
//   }
// }
#places[kind='administrative'] {
  line-color: @building;
}


/* ****** */
/* LABELS */
/* ****** */
#places[kind='city'],
#places[kind='town'],
#places[kind='village'][zoom>=12],
#places[kind='neighbourhood'][zoom>=12],
#places[kind='suburb'][zoom>=12] {
  text-name: "'Merci'";
  [id=~'.*0$'] {
    text-name: "'Grazie'";
  }
  [id=~'.*1$'] {
    text-name: "'спасибо'";
  }
  [id=~'.*2$'] {
    text-name: "'Danke Schön'";
  }
  [id=~'.*3$'] {
    text-name: "'Dankon'";
  }
  [id=~'.*3$'] {
    text-name: "'Thank You'";
  }
  [id=~'.*4$'] {
    text-name: "'Murakomeye'";  // Kirundi.
  }
  [id=~'.*5$'] {
    text-name: "'Gracias'";
  }
  text-fill: @city_text;
  text-halo-fill: @city_halo;
  text-face-name: @sans_bold;
  text-placement: point;
  text-fill: @village_text;
  text-size: 10;
  text-halo-fill: @village_halo;
  text-halo-radius: 2;
  // text-repeat-wrap-character: true;  // mapnik 3.x only
  [kind='town'],
  [kind='neighbourhood'][zoom>=15],
  [kind='city'] {
    text-size: 14;
    text-face-name: @sans_bold_italic;
    text-transform: uppercase;    
  }
  [zoom<12] {
    text-min-distance: 10;
  }
  [zoom>=13] {
    text-size: 11;
    [kind='city'],
    [kind='neighbourhood'],
    [kind='town'] {
      text-size: 13;
    }
    [zoom>=15] {
      text-size: 30;
    }
  }
}
#roads.geo[kind='major_road'][is_bridge='no'][zoom>=12]::surface {
  line-width: 3;
  line-color: @land;
  [zoom=15] { line-width: 4;}
  [zoom=16] { line-width: 5;}
  [zoom=17] { line-width: 10;}
  [zoom=18] { line-width: 12;}
  [zoom=19] { line-width: 15;}
}
#buildings[zoom>=15] {
  polygon-fill: @building;
  polygon-opacity: 0.8;
  [id=~'.*1$'] {
    polygon-fill: lighten(@building, 3%);
  }
  [id=~'.*2$'] {
    polygon-fill: #E08283;
  }
  [id=~'.*3$'] {
    polygon-fill: lighten(@building, 5%);
  }
  [id=~'.*4$'] {
    polygon-fill: darken(@building, 7%);
  }
  [id=~'.*5$'] {
    polygon-fill: darken(@building, 2%);
  }
  [id=~'.*6$'] {
    polygon-fill: darken(@building, 5%);
  }
  [id=~'.*7$'] {
    polygon-fill: #F1A9A0;
  }
  [id=~'.*8$'] {
    polygon-fill: #FDE3A7;
  }
  [id=~'.*9$'] {
    polygon-fill: lighten(@building, 7%);
  }
  comp-op: multiply;
}
#roads.label[kind='minor_road'][is_bridge='no'][name!=null][zoom>=15],
#roads.label[kind='major_road'][is_bridge='no'][zoom>=15] {
  text-name: "'Thank You St.'";
  text-size: 10;
  [zoom>=16] {
    text-size: 11;
  }
  [zoom>=17] {
    text-size: 12;
  }
  text-fill: #444;
  text-spacing: 300;
  text-placement: line;
  text-halo-radius: 1;
  text-face-name: @sans;
  text-avoid-edges: true;
  text-min-padding: 3;
  [id=~'.*0.$'] {
    text-name: "'Viale Grazie'";
  }
  [id=~'.*1.$'] {
    text-name: "'Rue des Mille Mercis'";
  }
  [id=~'.*2.$'] {
    text-name: "'Danke Strato'";
  }
  [id=~'.*3.$'] {
    text-name: "'Dankestraße'";
    [id=~'.*30$'] {
      text-name: "'Bedanktstraat'";  // Dutch, thanks to IIVQ
    }
    [id=~'.*31$'] {
      text-name: "'Bedanktweg'";  // Dutch too, thanks to IIVQ
    }
  }
  [id=~'.*4.$'] {
    text-name: "'Calle Muchas Gracias'";
  }
  [id=~'.*5.$'] {
    text-name: "'谢谢街道'";  // Chinese.
  }
  [id=~'.*6.$'] {
    text-name: "'Благодарственная улица'";  // Russian, thanks to Zverik.
  }
  [id=~'.*7.$'] {
    text-name: "'الشارع شكرا'";
  }
  [id=~'.*8.$'] {
    text-name: "'Takgade'"; // Danish, thanks to hjart
  }
  [kind='major_road'] {
    [id=~'.*0.$'] {
      text-name: "'Via Grazie Mille'";
    }
    [id=~'.*1.$'] {
      text-name: "'Bd des Remerciements'";
    }
    [id=~'.*2.$'] {
      text-name: "'Thank You Av.'";
    }
    [id=~'.*3.$'] {
      text-name: "'Hartelijk bedankt'";  // Dutch, thanks to IIVQ
    }
    [id=~'.*4.$'] {
      text-name: "'Mange tak'";  // Dutch, thanks to hjart
    }
  }
}

#water[kind='river']::label {
  text-name: "'Rio Gracias'";
  text-size: 13;
  text-fill: #fff;
  text-spacing: 500;
  text-min-distance: 500;
  text-halo-radius: 1;
  text-halo-fill: darken(@water, 25%);
  text-face-name: @sans;
  text-avoid-edges: true;
  text-min-padding: 3;
  text-placement: line;
}
