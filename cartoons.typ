#import "@preview/cetz:0.3.4": canvas, draw

#let slateblue = rgb(106, 90, 205)

#let cartoon-paaaaa-real(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_2 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 34cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 18cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 24cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 30cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
    },
  )
}
#let cartoon-paaaaa-pm1(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_2 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 34cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 18cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 24cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 30cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.line(
        (x0 + 27cm * scale, y0 + 3cm * scale),
        (x0 + 27cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-paaaaa-pm2(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_2 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 34cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 18cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 24cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 30cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.line(
        (x0 + 27cm * scale, y0 + 3cm * scale),
        (x0 + 27cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-paaaaa-fm(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_2 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 34cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 18cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 24cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 30cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.line(
        (x0 + 3cm * scale, y0 + 3cm * scale),
        (x0 + 3cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.line(
        (x0 + 15cm * scale, y0 + 3cm * scale),
        (x0 + 15cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.line(
        (x0 + 21cm * scale, y0 + 3cm * scale),
        (x0 + 21cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.line(
        (x0 + 27cm * scale, y0 + 3cm * scale),
        (x0 + 27cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-pta-real(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_1 = orange.lighten(50%)
      let fill_2 = blue.lighten(50%)
      let fill_3 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_3,
      )
    },
  )
}
#let cartoon-pta-pm1(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_1 = orange.lighten(50%)
      let fill_2 = blue.lighten(50%)
      let fill_3 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        fill:white.transparentize(50%),
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_3,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-pta-pm2(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_1 = orange.lighten(50%)
      let fill_3 = blue.lighten(50%)
      let fill_2 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        fill:white.transparentize(50%),
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_3,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-pta-pm3(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_3 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let fill_2 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        fill:white.transparentize(50%),
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_3,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-ddd-pm(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_3 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let fill_2 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        fill:white.transparentize(50%),
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-ddd-fm(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_3 = orange.lighten(50%)
      let fill_1 = blue.lighten(50%)
      let fill_2 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        fill:white.transparentize(50%),
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.line(
        (x0 + 3cm * scale, y0 + 3cm * scale),
        (x0 + 3cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-pta-fm(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let fill_0 = black.lighten(80%)
      let fill_1 = orange.lighten(50%)
      let fill_2 = blue.lighten(50%)
      let fill_3 = red.lighten(50%)
      let border_color = black
      let radius = 2cm * scale
      let x0 = 0cm
      let y0 = 0cm

      draw.rect(
        (x0 - 4cm * scale, y0 + 3cm * scale),
        (x0 + 16cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        fill : white.transparentize(50%),
        radius: 0.1,
      )
      draw.circle(
        (x0, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_1,
      )
      draw.circle(
        (x0 + 6cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_2,
      )
      draw.circle(
        (x0 + 12cm * scale, y0),
        radius: radius,
        stroke: (paint: border_color, thickness: 10pt * scale),
        fill: fill_3,
      )
      draw.line(
        (x0 + 3cm * scale, y0 + 3cm * scale),
        (x0 + 3cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
      draw.line(
        (x0 + 9cm * scale, y0 + 3cm * scale),
        (x0 + 9cm * scale, y0 - 3cm * scale),
        stroke: black + 2pt,
        radius: 0.1,
      )
    },
  )
}
#let cartoon-fm-three(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let border_color = slateblue
      let fill_color = orange.lighten(60%)
      let center = (6, 4)
      let radius = 5 * scale
      let circle-distance = 3.5 * scale
      let circle-radius = 1 * scale
      let line-thickness = 8pt * scale

      // Draw circle background
      draw.circle(
        center,
        radius: radius,
        stroke: (paint: border_color, thickness: 2pt),
        fill: rgb(white),
      )

      // Draw lines from edge to center, segregating circles
      // Evenly spaced at 120° intervals, rotated by 60°
      // Line 1: 150° (top-left)
      let angle1 = 150deg
      let point1 = (center.at(0) + radius * calc.cos(angle1), center.at(1) + radius * calc.sin(angle1))
      draw.line(
        point1,
        center,
        stroke: (paint: border_color, thickness: 2pt),
      )

      // // Line 2: 270° (bottom)
      let angle2 = 270deg
      let point2 = (center.at(0) + radius * calc.cos(angle2), center.at(1) + radius * calc.sin(angle2))
      draw.line(
        point2,
        center,
        stroke: (paint: border_color, thickness: 2pt),
      )

      // Line 3: 30° (top-right)
      let angle3 = 30deg
      let point3 = (center.at(0) + radius * calc.cos(angle3), center.at(1) + radius * calc.sin(angle3))
      draw.line(
        point3,
        center,
        stroke: (paint: border_color, thickness: 2pt),
      )

      // Position 3 circles evenly around center
      let c1 = (center.at(0), center.at(1) + circle-distance)
      let c2 = (center.at(0) - circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))
      let c3 = (center.at(0) + circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))

      // Draw lines between circles (black and bold)
      // draw.line(
      //   c1,
      //   c2,
      //   stroke: (paint: black, thickness: line-thickness),
      // )
      // draw.line(
      //   c1,
      //   c3,
      //   stroke: (paint: black, thickness: line-thickness),
      // )
      // draw.line(
      //   c2,
      //   c3,
      //   stroke: (paint: black, thickness: line-thickness),
      // )

      // Draw lines from center to each circle
      // draw.line(
      //   center,
      //   c1,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )
      // draw.line(
      //   center,
      //   c2,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )
      // draw.line(
      //   center,
      //   c3,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )

      // Draw 3 circles evenly distributed
      draw.circle(
        c1,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c2,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c3,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )
    },
  )
}
#let cartoon-pm-three(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let border_color = slateblue
      let fill_color = orange.lighten(60%)
      let center = (6, 4)
      let radius = 5 * scale
      let circle-distance = 3.5 * scale
      let circle-radius = 1 * scale
      let line-thickness = 8pt * scale

      // Draw circle background
      draw.circle(
        center,
        radius: radius,
        stroke: (paint: border_color, dash: "dashed", thickness: 2pt),
        fill: rgb(white),
      )

      // Draw lines from edge to center, segregating circles
      // Evenly spaced at 120° intervals, rotated by 60°
      // Line 1: 150° (top-left)
      let angle1 = 150deg
      let point1 = (center.at(0) + radius * calc.cos(angle1), center.at(1) + radius * calc.sin(angle1))
      draw.line(
        point1,
        center,
        stroke: (paint: border_color, dash: "dashed", thickness: 2pt),
      )

      // // Line 2: 270° (bottom)
      // let angle2 = 270deg
      // let point2 = (center.at(0) + radius * calc.cos(angle2), center.at(1) + radius * calc.sin(angle2))
      // draw.line(
      //   point2,
      //   center,
      //   stroke: border_color,
      // )

      // Line 3: 30° (top-right)
      let angle3 = 30deg
      let point3 = (center.at(0) + radius * calc.cos(angle3), center.at(1) + radius * calc.sin(angle3))
      draw.line(
        point3,
        center,
        stroke: (paint: border_color, dash: "dashed", thickness: 2pt),
      )

      // Position 3 circles evenly around center
      let c1 = (center.at(0), center.at(1) + circle-distance)
      let c2 = (center.at(0) - circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))
      let c3 = (center.at(0) + circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))

      // Draw lines between circles (black and bold)
      // draw.line(
      //   c1,
      //   c2,
      //   stroke: (paint: black, thickness: line-thickness),
      // )
      // draw.line(
      //   c1,
      //   c3,
      //   stroke: (paint: black, thickness: line-thickness),
      // )
      draw.line(
        c2,
        c3,
        stroke: (paint: black, thickness: line-thickness),
      )

      // Draw lines from center to each circle
      // draw.line(
      //   center,
      //   c1,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )
      // draw.line(
      //   center,
      //   c2,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )
      // draw.line(
      //   center,
      //   c3,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )

      // Draw 3 circles evenly distributed
      draw.circle(
        c1,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c2,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c3,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )
    },
  )
}
#let cartoon-real-three(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let border_color = luma(20%)
      let fill_color = orange.lighten(60%)
      let center = (6, 4)
      let radius = 5 * scale
      let circle-distance = 3.5 * scale
      let circle-radius = 1 * scale
      let line-thickness = 8pt * scale

      // Draw circle background
      draw.circle(
        center,
        radius: radius,
        stroke: (paint: border_color, thickness: 2pt),
        fill: white,
      )

      // Draw lines from edge to center, segregating circles
      // Evenly spaced at 120° intervals, rotated by 60°
      // Line 1: 150° (top-left)
      // let angle1 = 150deg
      // let point1 = (center.at(0) + radius * calc.cos(angle1), center.at(1) + radius * calc.sin(angle1))
      // draw.line(
      //   point1,
      //   center,
      //   stroke: border_color,
      // )

      // // Line 2: 270° (bottom)
      // let angle2 = 270deg
      // let point2 = (center.at(0) + radius * calc.cos(angle2), center.at(1) + radius * calc.sin(angle2))
      // draw.line(
      //   point2,
      //   center,
      //   stroke: border_color,
      // )

      // // Line 3: 30° (top-right)
      // let angle3 = 30deg
      // let point3 = (center.at(0) + radius * calc.cos(angle3), center.at(1) + radius * calc.sin(angle3))
      // draw.line(
      //   point3,
      //   center,
      //   stroke: border_color,
      // )

      // Position 3 circles evenly around center
      let c1 = (center.at(0), center.at(1) + circle-distance)
      let c2 = (center.at(0) - circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))
      let c3 = (center.at(0) + circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))

      // Draw lines between circles (black and bold)
      draw.line(
        c1,
        c2,
        stroke: (paint: black, thickness: line-thickness),
      )
      draw.line(
        c1,
        c3,
        stroke: (paint: black, thickness: line-thickness),
      )
      draw.line(
        c2,
        c3,
        stroke: (paint: black, thickness: line-thickness),
      )

      // Draw lines from center to each circle
      // draw.line(
      //   center,
      //   c1,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )
      // draw.line(
      //   center,
      //   c2,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )
      // draw.line(
      //   center,
      //   c3,
      //   stroke: (paint: border_color, dash: "dashed"),
      // )

      // Draw 3 circles evenly distributed
      draw.circle(
        c1,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c2,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c3,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )
    },
  )
}
#let cartoon-grey(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let border_color = luma(20%)
      let fill_color = luma(60%)
      let center = (6, 4)
      let radius = 5 * scale
      let circle-distance = 3.5 * scale
      let circle-radius = 1 * scale
      let line-thickness = 8pt * scale

      // Draw circle background
      draw.circle(
        center,
        radius: radius,
        stroke: (paint: border_color, thickness: 2pt),
        fill: rgb("#f0f0f0"),
      )

      // Draw lines from edge to center, segregating circles
      // Evenly spaced at 120° intervals, rotated by 60°
      // Line 1: 150° (top-left)
      // let angle1 = 150deg
      // let point1 = (center.at(0) + radius * calc.cos(angle1), center.at(1) + radius * calc.sin(angle1))
      // draw.line(
      //   point1,
      //   center,
      //   stroke: border_color,
      // )

      // // Line 2: 270° (bottom)
      // let angle2 = 270deg
      // let point2 = (center.at(0) + radius * calc.cos(angle2), center.at(1) + radius * calc.sin(angle2))
      // draw.line(
      //   point2,
      //   center,
      //   stroke: border_color,
      // )

      // // Line 3: 30° (top-right)
      // let angle3 = 30deg
      // let point3 = (center.at(0) + radius * calc.cos(angle3), center.at(1) + radius * calc.sin(angle3))
      // draw.line(
      //   point3,
      //   center,
      //   stroke: border_color,
      // )

      // Position 3 circles evenly around center
      let c1 = (center.at(0), center.at(1) + circle-distance)
      let c2 = (center.at(0) - circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))
      let c3 = (center.at(0) + circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))

      // Draw lines between circles (black and bold)
      draw.line(
        c1,
        c2,
        stroke: (paint: black, thickness: line-thickness),
      )
      draw.line(
        c1,
        c3,
        stroke: (paint: black, thickness: line-thickness),
      )
      draw.line(
        c2,
        c3,
        stroke: (paint: black, thickness: line-thickness),
      )

      // Draw lines from center to each circle
      draw.line(
        center,
        c1,
        stroke: (paint: border_color, dash: "dashed"),
      )
      draw.line(
        center,
        c2,
        stroke: (paint: border_color, dash: "dashed"),
      )
      draw.line(
        center,
        c3,
        stroke: (paint: border_color, dash: "dashed"),
      )

      // Draw 3 circles evenly distributed
      draw.circle(
        c1,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c2,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c3,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )
    },
  )
}

#let cartoon-red(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let border_color = red.darken(80%)
      let fill_color = red
      let center = (6, 4)
      let radius = 5 * scale
      let circle-distance = 3.5 * scale
      let circle-radius = 1 * scale

      // Draw circle background
      draw.circle(
        center,
        radius: radius,
        stroke: (paint: border_color, thickness: 2pt),
        fill: red.lighten(90%),
      )

      // Draw lines from edge to center, segregating circles
      // Evenly spaced at 120° intervals, rotated by 60°
      // Line 1: 150° (top-left)
      let angle1 = 150deg
      let point1 = (center.at(0) + radius * calc.cos(angle1), center.at(1) + radius * calc.sin(angle1))
      draw.line(
        point1,
        center,
        stroke: (paint: border_color, thickness: 10pt, cap: "round"),
      )
      draw.line(
        point1,
        center,
        stroke: (paint: border_color, thickness: 6pt, cap: "round"),
      )

      // Line 2: 270° (bottom)
      let angle2 = 270deg
      let point2 = (center.at(0) + radius * calc.cos(angle2), center.at(1) + radius * calc.sin(angle2))
      draw.line(
        point2,
        center,
        stroke: (paint: border_color, thickness: 10pt, cap: "round"),
      )

      // Line 3: 30° (top-right)
      let angle3 = 30deg
      let point3 = (center.at(0) + radius * calc.cos(angle3), center.at(1) + radius * calc.sin(angle3))
      draw.line(
        point3,
        center,
        stroke: (paint: border_color, thickness: 10pt, cap: "round", dash: "dotted"),
      )

      // Position 3 circles evenly around center
      let c1 = (center.at(0), center.at(1) + circle-distance)
      let c2 = (center.at(0) - circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))
      let c3 = (center.at(0) + circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))

      // Draw lines between circles (black and bold)
      // draw.line(
      //   c1,
      //   c2,
      //   stroke: (paint: black, thickness: 4pt),
      // )
      // draw.line(
      //   c1,
      //   c3,
      //   stroke: (paint: black, thickness: 4pt),
      // )
      // draw.line(
      //   c2,
      //   c3,
      //   stroke: (paint: black, thickness: 4pt),
      // )

      // Draw 3 circles evenly distributed
      draw.circle(
        c1,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c2,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c3,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )
    },
  )
}

#let cartoon-blue(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let border_color = blue.darken(80%)
      let fill_color = blue
      let center = (6, 4)
      let radius = 5 * scale
      let circle-distance = 3.5 * scale
      let circle-radius = 1 * scale

      // Draw circle background
      draw.circle(
        center,
        radius: radius,
        stroke: (paint: border_color, thickness: 2pt),
        fill: blue.lighten(90%),
      )

      // Draw lines from edge to center, segregating circles
      // Evenly spaced at 120° intervals, rotated by 60°
      // Line 1: 150° (top-left)
      let angle1 = 150deg
      let point1 = (center.at(0) + radius * calc.cos(angle1), center.at(1) + radius * calc.sin(angle1))
      draw.line(
        point1,
        center,
        stroke: (paint: border_color, thickness: 10pt, cap: "round", dash: "dotted"),
      )

      // Line 2: 270° (bottom)
      // let angle2 = 270deg
      // let point2 = (center.at(0) + radius * calc.cos(angle2), center.at(1) + radius * calc.sin(angle2))
      // draw.line(
      //   point2,
      //   center,
      //   stroke: border_color,
      // )

      // Line 3: 30° (top-right)
      let angle3 = 30deg
      let point3 = (center.at(0) + radius * calc.cos(angle3), center.at(1) + radius * calc.sin(angle3))
      draw.line(
        point3,
        center,
        stroke: (paint: border_color, thickness: 10pt, cap: "round", dash: "dotted"),
      )

      // Position 3 circles evenly around center
      let c1 = (center.at(0), center.at(1) + circle-distance)
      let c2 = (center.at(0) - circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))
      let c3 = (center.at(0) + circle-distance * calc.cos(30deg), center.at(1) - circle-distance * calc.sin(30deg))

      // Draw lines between circles (black and bold)
      // draw.line(
      //   c1,
      //   c2,
      //   stroke: (paint: black, thickness: 4pt),
      // )
      // draw.line(
      //   c1,
      //   c3,
      //   stroke: (paint: black, thickness: 4pt),
      // )
      draw.line(
        c2,
        c3,
        stroke: (paint: black, thickness: 4pt),
      )

      // Draw 3 circles evenly distributed
      draw.circle(
        c1,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c2,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )

      draw.circle(
        c3,
        radius: circle-radius,
        stroke: border_color,
        fill: fill_color,
      )
    },
  )
}

// Illustrates the general concept of event mixing: each source is a
// full "real" event (grey) with 3 correlated particles, one of which
// (highlighted in red) is selected and pulled out. The selected
// particles are combined into a single artificial mixed event (red)
// with no preserved correlations between them.
#let cartoon-mixing(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let source_border = luma(20%)
      let source_fill = luma(60%)
      let select_border = red.darken(80%)
      let select_fill = red
      let target_border = red.darken(80%)
      let target_fill = red

      let source_radius = 1.5 * scale
      let particle_radius = 0.45 * scale
      let particle_distance = 0.75 * scale
      let target_radius = 3.2 * scale
      let target_particle_radius = 0.9 * scale

      // Vertical stack of 5 source ("real") events
      let source_x = 2.2 * scale
      let spacing = 3.4 * scale
      let target = (8.4 * scale, 9 * scale)

      let s0 = (source_x, target.at(1) + 2 * spacing)
      let s1 = (source_x, target.at(1) + spacing)
      let s2 = (source_x, target.at(1))
      let s3 = (source_x, target.at(1) - spacing)
      let s4 = (source_x, target.at(1) - 2 * spacing)

      // Only the 2nd, 3rd, and 5th events contribute a particle to the
      // mixed event. The 1st and 4th are drawn but not sampled from.
      let sources = (
        (center: s0, sel: none),
        (center: s1, sel: 0),
        (center: s2, sel: 1),
        (center: s3, sel: none),
        (center: s4, sel: 2),
      )

      for src in sources {
        let c = src.center
        // Particle triangle rotated 180° relative to the mixed event's
        // arrangement (one particle on bottom, two on top)
        let p0 = (c.at(0), c.at(1) - particle_distance)
        let p1 = (c.at(0) + particle_distance * calc.cos(30deg), c.at(1) + particle_distance * calc.sin(30deg))
        let p2 = (c.at(0) - particle_distance * calc.cos(30deg), c.at(1) + particle_distance * calc.sin(30deg))
        let particles = (p0, p1, p2)

        // Source event boundary
        draw.circle(
          c,
          radius: source_radius,
          stroke: (paint: source_border, thickness: 2pt),
          fill: rgb("#f0f0f0"),
        )

        // Correlation lines between all 3 particles (real event)
        // draw.line(p0, p1, stroke: (paint: black, thickness: 1.5pt))
        // draw.line(p0, p2, stroke: (paint: black, thickness: 1.5pt))
        // draw.line(p1, p2, stroke: (paint: black, thickness: 1.5pt))

        // Arrow from the *selected* particle towards the mixed event
        // (only for events that contribute a particle)
        if src.sel != none {
          let selected = particles.at(src.sel)
          let dx = target.at(0) - selected.at(0)
          let dy = target.at(1) - selected.at(1)
          let dist = calc.sqrt(dx * dx + dy * dy)
          let ux = dx / dist
          let uy = dy / dist
          let start = (selected.at(0) + ux * particle_radius, selected.at(1) + uy * particle_radius)
          let end = (target.at(0) - ux * target_radius, target.at(1) - uy * target_radius)
          draw.line(
            start,
            end,
            stroke: (paint: select_border, thickness: 2pt),
            mark: (end: ">"),
          )
        }

        // Draw the 3 particles, highlighting the selected one (if any)
        for (i, p) in particles.enumerate() {
          if src.sel != none and i == src.sel {
            draw.circle(
              p,
              radius: particle_radius,
              stroke: (paint: select_border, thickness: 2.5pt),
              fill: select_fill,
            )
          } else {
            draw.circle(
              p,
              radius: particle_radius,
              stroke: source_border,
              fill: source_fill,
            )
          }
        }
      }

      // Draw the resulting mixed event
      draw.circle(
        target,
        radius: target_radius,
        stroke: (paint: target_border, thickness: 2pt),
        fill: red.lighten(90%),
      )

      // 3 particles inside target, arranged in a triangle, with no
      // correlation lines between them (uncorrelated, since they come
      // from independent events)
      let c1 = (target.at(0), target.at(1) + target_radius * 0.5)
      let c2 = (target.at(0) - target_radius * 0.45, target.at(1) - target_radius * 0.4)
      let c3 = (target.at(0) + target_radius * 0.45, target.at(1) - target_radius * 0.4)

      for c in (c1, c2, c3) {
        draw.circle(
          c,
          radius: target_particle_radius,
          stroke: target_border,
          fill: target_fill,
        )
      }
    },
  )
}

// Illustrates the general concept of partial event mixing: one source
// event (grey) contributes a correlated pair of particles (highlighted
// in blue, with their shared correlation preserved), while a different
// source event contributes a single, uncorrelated particle. These are
// combined into a partially mixed event (blue) where only the pair's
// correlation survives.
#let cartoon-partial-mixing(scale: 1) = {
  canvas(
    length: 1cm,
    {
      let source_border = luma(20%)
      let source_fill = luma(60%)
      let select_border = blue.darken(80%)
      let select_fill = blue
      let target_border = blue.darken(80%)
      let target_fill = blue

      let source_radius = 1.5 * scale
      let particle_radius = 0.45 * scale
      let particle_distance = 0.75 * scale
      let target_radius = 3.2 * scale
      let target_particle_radius = 0.9 * scale

      // Vertical stack of 5 source ("real") events
      let source_x = 2.2 * scale
      let spacing = 3.4 * scale
      let target = (8.4 * scale, 9 * scale)

      let s0 = (source_x, target.at(1) + 2 * spacing)
      let s1 = (source_x, target.at(1) + spacing)
      let s2 = (source_x, target.at(1))
      let s3 = (source_x, target.at(1) - spacing)
      let s4 = (source_x, target.at(1) - 2 * spacing)

      // Only the 3rd event contributes 2 particles (a correlated pair,
      // preserved into the mixed event), and the 5th event contributes
      // a single, uncorrelated particle. The rest are drawn but unused.
      let sources = (
        (center: s0, sel: ()),
        (center: s1, sel: ()),
        (center: s2, sel: (0, 1)),
        (center: s3, sel: ()),
        (center: s4, sel: (2,)),
      )

      for src in sources {
        let c = src.center
        // Particle triangle rotated 180° relative to the mixed event's
        // arrangement (one particle on bottom, two on top)
        let p0 = (c.at(0), c.at(1) - particle_distance)
        let p1 = (c.at(0) + particle_distance * calc.cos(30deg), c.at(1) + particle_distance * calc.sin(30deg))
        let p2 = (c.at(0) - particle_distance * calc.cos(30deg), c.at(1) + particle_distance * calc.sin(30deg))
        let particles = (p0, p1, p2)

        // Source event boundary
        draw.circle(
          c,
          radius: source_radius,
          stroke: (paint: source_border, thickness: 2pt),
          fill: rgb("#f0f0f0"),
        )

        // Correlation lines between all 3 particles (real event).
        // If exactly 2 particles are selected, the correlation between
        // them is preserved into the mixed event, so highlight that
        // specific line in blue.
        let preserved = src.sel.len() == 2
        let sel-set = src.sel
        let line-style(i, j) = {
          if preserved and i in sel-set and j in sel-set {
            (paint: select_border, thickness: 2.5pt)
          } else {
            (paint: black, thickness: 1.5pt)
          }
        }
        // draw.line(p0, p1, stroke: line-style(0, 1))
        // draw.line(p0, p2, stroke: line-style(0, 2))
        // draw.line(p1, p2, stroke: line-style(1, 2))

        // Arrows from each selected particle towards the mixed event
        for i in src.sel {
          let selected = particles.at(i)
          let dx = target.at(0) - selected.at(0)
          let dy = target.at(1) - selected.at(1)
          let dist = calc.sqrt(dx * dx + dy * dy)
          let ux = dx / dist
          let uy = dy / dist
          let start = (selected.at(0) + ux * particle_radius, selected.at(1) + uy * particle_radius)
          let end = (target.at(0) - ux * target_radius, target.at(1) - uy * target_radius)
          draw.line(
            start,
            end,
            stroke: (paint: select_border, thickness: 2pt),
            mark: (end: ">"),
          )
        }

        // Draw the 3 particles, highlighting any selected ones
        for (i, p) in particles.enumerate() {
          if i in src.sel {
            draw.circle(
              p,
              radius: particle_radius,
              stroke: (paint: select_border, thickness: 2.5pt),
              fill: select_fill,
            )
          } else {
            draw.circle(
              p,
              radius: particle_radius,
              stroke: source_border,
              fill: source_fill,
            )
          }
        }
      }

      // Draw the resulting partially mixed event
      draw.circle(
        target,
        radius: target_radius,
        stroke: (paint: target_border, thickness: 2pt),
        fill: blue.lighten(90%),
      )

      // 3 particles inside target: c1 is the lone uncorrelated particle,
      // c2/c3 are the preserved pair (connected by a bold correlation line)
      let c1 = (target.at(0), target.at(1) + target_radius * 0.5)
      let c2 = (target.at(0) - target_radius * 0.45, target.at(1) - target_radius * 0.4)
      let c3 = (target.at(0) + target_radius * 0.45, target.at(1) - target_radius * 0.4)

      // draw.line(c2, c3, stroke: (paint: black, thickness: 4pt))

      for c in (c1, c2, c3) {
        draw.circle(
          c,
          radius: target_particle_radius,
          stroke: target_border,
          fill: target_fill,
        )
      }
    },
  )
}

cartoon-paaaaa-real()
cartoon-paaaaa-fm()
cartoon-paaaaa-pm1()
cartoon-paaaaa-pm2()

cartoon-pta-real()
cartoon-pta-fm()
cartoon-pta-pm()

cartoon-real-three()
cartoon-pm-three()
cartoon-fm-three()
cartoon-grey()
cartoon-red()
cartoon-blue()
cartoon-mixing()
cartoon-partial-mixing()
