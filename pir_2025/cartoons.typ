#import "@preview/cetz:0.5.0"
#import "@preview/physica:0.9.3": isotope


#let real_event(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)
    let line_stroke = scale / 10

    rect((0, 0), (scale, scale), radius: scale / 10, stroke: scale / 10)

    line((scale / 2, scale / 2 + dy + shift), (scale / 2 + dx, scale / 2 + shift), stroke: line_stroke)

    line((scale / 2, scale / 2 + dy + shift), (scale / 2 - dx, scale / 2 + shift), stroke: line_stroke)
    line((scale / 2 - dx, scale / 2 + shift), (scale / 2 + dx, scale / 2 + shift), stroke: line_stroke)

    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}
#let real_event_no_box(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)
    let line_stroke = scale / 10

    rect((0, 0), (scale, scale), radius: scale / 10, stroke: 0pt)

    line((scale / 2, scale / 2 + dy + shift), (scale / 2 + dx, scale / 2 + shift), stroke: line_stroke)

    line((scale / 2, scale / 2 + dy + shift), (scale / 2 - dx, scale / 2 + shift), stroke: line_stroke)
    line((scale / 2 - dx, scale / 2 + shift), (scale / 2 + dx, scale / 2 + shift), stroke: line_stroke)

    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}

#let real_event_no2a(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)
    let line_stroke = scale / 10

    rect((0, 0), (scale, scale), radius: scale / 10, stroke: scale / 10)

    // line((scale/2, scale/2 + dy+shift) , (scale/2+dx, scale/2+shift), stroke: line_stroke)

    // line((scale/2, scale/2 + dy+shift) , (scale/2-dx, scale/2+shift), stroke: line_stroke)
    // line((scale/2-dx, scale/2+shift) , (scale/2+dx, scale/2+shift), stroke: line_stroke)

    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}

#let fully_mixed_event(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)
    let uncorr_fill = rgb(80%, 20%, 80%)
    let line_stroke = scale / 10


    line((scale / 2, scale / 2 + dy + shift), (scale / 2 + dx, scale / 2 + shift), stroke: line_stroke + uncorr_fill)

    line((scale / 2, scale / 2 + dy + shift), (scale / 2 - dx, scale / 2 + shift), stroke: line_stroke + uncorr_fill)
    line((scale / 2 - dx, scale / 2 + shift), (scale / 2 + dx, scale / 2 + shift), stroke: line_stroke + uncorr_fill)
    line((scale / 2, scale / 2 + shift + dy / calc.sqrt(3) / 2), (scale / 2, 0), stroke: line_stroke / 3)

    line(
      (scale / 2, scale / 2 + shift + dy / calc.sqrt(3) / 2),
      (scale, scale / 2 + shift + dy / calc.sqrt(3) / 2 + 1 / calc.sqrt(3) * (scale / 2)),
      stroke: line_stroke / 3,
    )

    line(
      (scale / 2, scale / 2 + shift + dy / calc.sqrt(3) / 2),
      (0, scale / 2 + shift + dy / calc.sqrt(3) / 2 + 1 / calc.sqrt(3) * (scale / 2)),
      stroke: line_stroke / 3,
    )

    rect((0, 0), (scale, scale), radius: scale / 10, stroke: scale / 10 + uncorr_fill)
    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}
#let partially_mixed_event(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)
    let direct_corr_fill = rgb(20%, 20%, 100%)
    let indirect_corr_fill = rgb(20%, 100%, 20%).darken(30%)

    let outer_box = rgb(20%, 60%, 60%).darken(15%)
    let line_stroke = scale / 10


    line(
      (scale / 2, scale / 2 + dy + shift),
      (scale / 2 + dx, scale / 2 + shift),
      stroke: indirect_corr_fill + line_stroke,
    )

    line(
      (scale / 2, scale / 2 + dy + shift),
      (scale / 2 - dx, scale / 2 + shift),
      stroke: indirect_corr_fill + line_stroke,
    )
    line(
      (scale / 2 - dx, scale / 2 + shift),
      (scale / 2 + dx, scale / 2 + shift),
      stroke: direct_corr_fill + line_stroke,
    )

    line((0, scale / 2), (scale, scale / 2), stroke: line_stroke / 3)
    rect((0, 0), (scale, scale), radius: scale / 10, stroke: scale / 10 + outer_box)

    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}


#let partially_mixed_event_direct(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)
    let direct_corr_fill = rgb(20%, 20%, 100%)

    let outer_box = rgb(20%, 60%, 60%).darken(15%)
    let line_stroke = scale / 10


    line(
      (scale / 2 - dx, scale / 2 + shift),
      (scale / 2 + dx, scale / 2 + shift),
      stroke: direct_corr_fill + line_stroke,
    )

    line((0, scale / 2), (scale, scale / 2), stroke: line_stroke / 3)
    rect((0, 0), (scale, scale), radius: scale / 10, stroke: scale / 10 + outer_box)

    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}
#let partially_mixed_event_indirect(size: 100pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.14

    let grey = rgb(50%, 50%, 50%)

    let outer_box = rgb(20%, 60%, 60%).darken(15%)
    let line_stroke = scale / 10

    let indirect_corr_fill = rgb(20%, 100%, 20%).darken(30%)


    line(
      (scale / 2, scale / 2 + dy + shift),
      (scale / 2 + dx, scale / 2 + shift),
      stroke: indirect_corr_fill + line_stroke,
    )

    line(
      (scale / 2, scale / 2 + dy + shift),
      (scale / 2 - dx, scale / 2 + shift),
      stroke: indirect_corr_fill + line_stroke,
    )

    line((0, scale / 2), (scale, scale / 2), stroke: line_stroke / 3)
    rect((0, 0), (scale, scale), radius: scale / 10, stroke: scale / 10 + outer_box)

    circle((scale / 2, scale / 2 + dy + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 + dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
    circle((scale / 2 - dx, scale / 2 + shift), radius: radius, stroke: scale / 15, fill: grey)
  })
}

#let seq_three_alpha(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.12

    let grey = rgb(50%, 50%, 50%)

    let outer_box = rgb(20%, 60%, 60%).darken(15%)
    let line_stroke = scale / 10

    let indirect_corr_fill = rgb(20%, 100%, 20%).darken(30%)

    let row_spacing = 10pt
    let col_spacing = 30pt

    let row_y(row) = {
      row * (scale + row_spacing)
    }
    let col_x(col) = {
      col * (scale + col_spacing)
    }
    let center_y(row) = {
      row_y(row) + scale / 2
    }
    let center_x(col) = {
      col_x(col) + scale / 2
    }

    let coords = (
      (0, 0),
      (0, 1),
      (0, 2),
    )

    for (row, col) in coords {
      rect(
        (col_x(col), row_y(row)),
        (col_x(col) + scale, scale + row_y(row)),
        radius: scale / 10,
        stroke: scale / 10 + black,
      )
    }

    // carbon sequential row
    let row = 0
    //
    let col = 0
    circle((center_x(col) + 1pt, center_y(row) - 4pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 0pt, center_y(row) + 3pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 2pt, center_y(row) - 4pt), radius: radius, stroke: scale / 15, fill: black)
    //
    let col = 1
    circle((center_x(col) - 2pt, center_y(row) + 7pt), radius: radius, stroke: scale / 15, fill: green)
    circle((center_x(col) + 3pt, center_y(row) - 7pt), radius: radius, stroke: scale / 15, fill: blue)
    circle((center_x(col) - 2pt, center_y(row) - 8pt), radius: radius, stroke: scale / 15, fill: blue)
    //
    let col = 2
    circle((center_x(col) - 2pt, center_y(row) + 7pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) + 8pt, center_y(row) - 8pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) - 3pt, center_y(row) - 7pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))


    set-style(mark: (end: ">"))
    line((center_x(0) + scale / 2, center_y(0)), (center_x(1) - scale / 2, center_y(0.)), stroke: scale / 10)
    line((center_x(1) + scale / 2, center_y(0)), (center_x(2) - scale / 2, center_y(0.)), stroke: scale / 10)
  })
}
#let three_alpha(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.12

    let grey = rgb(50%, 50%, 50%)

    let outer_box = rgb(20%, 60%, 60%).darken(15%)
    let line_stroke = scale / 10

    let indirect_corr_fill = rgb(20%, 100%, 20%).darken(30%)

    let row_spacing = 10pt
    let col_spacing = 50pt

    let row_y(row) = {
      row * (scale + row_spacing)
    }
    let col_x(col) = {
      col * (scale + col_spacing)
    }
    let center_y(row) = {
      row_y(row) + scale / 2
    }
    let center_x(col) = {
      col_x(col) + scale / 2
    }

    let coords = (
      (-0.2, 0),
      (-0.2, 1),
      (-0.2, 2),
      (1, 0),
      (1, 2),
      (2, 0),
      (2, 2),
      (3, 0),
      (3, 2),
    )

    for (row, col) in coords {
      rect(
        (col_x(col), row_y(row)),
        (col_x(col) + scale, scale + row_y(row)),
        radius: scale / 10,
        stroke: scale / 10 + black,
      )
    }

    // carbon sequential row
    let row = -0.2
    //
    let col = 0
    circle((center_x(col) + 7pt, center_y(row) - 2pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 2pt, center_y(row) + 7pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 6pt, center_y(row) - 7pt), radius: radius, stroke: scale / 15, fill: black)
    //
    let col = 1
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: green)
    circle((center_x(col) + 7pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: blue)
    circle((center_x(col) - 6pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: blue)
    //
    let col = 2
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) + 12pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) - 10pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))


    // carbon sequential row
    let row = 1
    let col = 0
    circle((center_x(col) + 7pt, center_y(row) - 2pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 2pt, center_y(row) + 7pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 6pt, center_y(row) - 7pt), radius: radius, stroke: scale / 15, fill: black)
    //
    let col = 2
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) + 12pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) - 10pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))

    //be row
    let row = 2
    //
    let col = 0
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: green)
    circle((center_x(col) + 7pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: blue)
    circle((center_x(col) - 6pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: blue)
    //
    let col = 2
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) + 12pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) - 10pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))


    // no corr row
    let row = 3
    let col = 0

    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: purple)
    circle((center_x(col) + 12pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: purple)
    circle((center_x(col) - 10pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: purple)
    let col = 2
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) + 12pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) - 10pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))

    line(
      (center_x(-0.5), center_y(0.4)),
      (center_x(2.75) - scale / 2, center_y(0.4)),
      stroke: scale / 20 + gray.darken(50%),
    )

    content(
      (center_x(-0.5), center_y(2)),
      angle: (center_x(-0.5), center_y(3)),
      text(gray.darken(50%))[--- Background ---],
    )

    set-style(mark: (end: ">"))
    line((center_x(0) + scale / 2, center_y(-0.2)), (center_x(1) - scale / 2, center_y(-0.2)), stroke: scale / 10)
    line((center_x(1) + scale / 2, center_y(-0.2)), (center_x(2) - scale / 2, center_y(-0.2)), stroke: scale / 10)
    line((center_x(0) + scale / 2, center_y(1)), (center_x(2) - scale / 2, center_y(1)), stroke: scale / 10)
    line((center_x(0) + scale / 2, center_y(2)), (center_x(2) - scale / 2, center_y(2)), stroke: scale / 10)
    line((center_x(0) + scale / 2, center_y(3)), (center_x(2) - scale / 2, center_y(3)), stroke: scale / 10)
  })
}

#let dir_corr_2d_plot(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_partially_mixed_same.png", height: scale))
    content((scale * 0.2, -scale * 0.15), partially_mixed_event_direct(size: scale * 0.35))
  })
}

#let corr_2d_plot(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_partially_mixed.png", height: scale))
    content((scale * 0.2, -scale * 0.15), partially_mixed_event(size: scale * 0.35))
  })
}

#let uncorr_2d_plot(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_full_mixed.png", height: scale))
    content((scale * 0.2, -scale * 0.15), fully_mixed_event(size: scale * 0.35))
  })
}

#let indir_corr_2d_plot(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_partially_mixed_cross.png", height: scale))
    content((scale * 0.2, -scale * 0.15), partially_mixed_event_indirect(size: scale * 0.35))
  })
}

#let real_2d_plot2(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_real.png", height: scale))
    content((scale * 0.2, -scale * 0.15), real_event(size: scale * 0.35))
  })
}

#let real_2d_plot_blank(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_real_blank.png", height: scale))
    circle((scale * (-0.42), scale * (-0.2)), radius: scale / 30, stroke: scale / 50 + red.darken(50%))
    circle((scale * (-0.42), scale * (-0.36)), radius: scale / 30, stroke: scale / 50 + red.darken(50%))
    circle((scale * (-0.42), scale * (-0.1)), radius: scale / 30, stroke: scale / 50 + red.darken(50%))
    circle((scale * (-0.28), scale * (-0.)), radius: scale / 30, stroke: scale / 50 + red.darken(50%))
    circle((scale * (-0.28), scale * 0.12), radius: scale / 30, stroke: scale / 50 + red.darken(50%))
    circle((scale * (-0.28), scale * 0.1), radius: scale / 30, stroke: scale / 50 + red.darken(50%))
  })
}

#let real_2d_plot2_old(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("twod/real_2d.png", height: scale))
    content((scale * 0.15, -scale * 0.15), real_event(size: scale * 0.35))
  })
}

#let c12_decay_thru_be8(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    let shift = -scale * 0.23
    let s = scale * 0.53
    let dx = s / 2
    let dy = s * calc.sqrt(3.0) / 2
    let radius = scale * 0.12

    let grey = rgb(50%, 50%, 50%)

    let outer_box = rgb(20%, 60%, 60%).darken(15%)
    let line_stroke = scale / 10

    let indirect_corr_fill = rgb(20%, 100%, 20%).darken(30%)

    let row_spacing = 10pt
    let col_spacing = 50pt

    let row_y(row) = {
      row * (scale + row_spacing)
    }
    let col_x(col) = {
      col * (scale + col_spacing)
    }
    let center_y(row) = {
      row_y(row) + scale / 2
    }
    let center_x(col) = {
      col_x(col) + scale / 2
    }

    let coords = (
      (0, 0),
      (0, 1),
      (0, 2),
    )

    for (row, col) in coords {
      rect(
        (col_x(col), row_y(row)),
        (col_x(col) + scale, scale + row_y(row)),
        radius: scale / 10,
        stroke: scale / 10 + black,
      )
    }

    //
    let row = 0
    //
    let col = 0
    circle((center_x(col) + 7pt, center_y(row) - 2pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 2pt, center_y(row) + 7pt), radius: radius, stroke: scale / 15, fill: black)
    circle((center_x(col) - 6pt, center_y(row) - 7pt), radius: radius, stroke: scale / 15, fill: black)
    //
    let col = 1
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: green)
    circle((center_x(col) + 7pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: blue)
    circle((center_x(col) - 6pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: blue)
    //
    let col = 2
    circle((center_x(col) - 2pt, center_y(row) + 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) + 12pt, center_y(row) - 10pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))
    circle((center_x(col) - 10pt, center_y(row) - 13pt), radius: radius, stroke: scale / 15, fill: gray.darken(30%))

    //let row


    set-style(mark: (end: ">"))
    line((center_x(0) + scale / 2, center_y(0)), (center_x(1) - scale / 2, center_y(0)), stroke: scale / 10)
    line((center_x(1) + scale / 2, center_y(0)), (center_x(2) - scale / 2, center_y(0)), stroke: scale / 10)
  })
}

#let e_rel_def(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    set-style(mark: (end: ">"))

    let x1 = scale * 2
    let y1 = scale / 2
    let x2 = scale * 1.2
    let y2 = -scale / 1.5
    let x3 = scale * 1.5
    let y3 = -scale / 1.7

    let x_mean = (x1 + x2 + x3) / 3
    let y_mean = (y1 + y2 + y3) / 3

    let experiment_stroke = scale / 50 + rgb(0%, 0%, 0%, 50%)
    let com = scale / 100 + rgb(0%, 0%, 0%, 100%)
    let rel = scale / 50 + rgb(0%, 0%, 0%, 100%)
    line((0, 0), (x1, y1), stroke: experiment_stroke, name: "line_1")
    line((0, 0), (x2, y2), stroke: experiment_stroke, name: "line_2")
    line((0, 0), (x3, y3), stroke: experiment_stroke, name: "line_3")
    content(
      ("line_1.start", 50%, "line_1.end"),
      angle: "line_1.end",
      padding: 0.2,
      anchor: "south",
      [$arrow(p)_(1,"lab")$],
    )
    content(
      ("line_2.start", 50%, "line_2.end"),
      angle: "line_2.end",
      padding: 0.2,
      anchor: "north",
      [$arrow(p)_(2,"lab")$],
    )
    content(
      ("line_3.start", 50%, "line_3.end"),
      angle: "line_3.end",
      padding: 0.2,
      anchor: "south",
      [$arrow(p)_(3,"lab")$],
    )

    line((0, 0), (x_mean, y_mean), stroke: com, name: "line_com")
    content(
      ("line_com.start", 80%, "line_com.end"),
      angle: "line_com.end",
      padding: 0.2,
      anchor: "south",
      [$arrow(p)_"cm"$],
    )


    line((x_mean, y_mean), (x1, y1), stroke: rel, name: "line_rel_1")
    line((x_mean, y_mean), (x2, y2), stroke: rel, name: "line_rel_2")
    line((x_mean, y_mean), (x3, y3), stroke: rel, name: "line_rel_3")

    content(
      ("line_rel_1.start", 50%, "line_rel_1.end"),
      // angle:"line_rel_1.end",
      padding: 0.5,
      anchor: "west",
      [$arrow(p)_(1,"cm")$],
    )
    content(
      ("line_rel_2.start", 100%, "line_rel_2.end"),
      // angle:"line_rel_2.end",
      padding: 0.5,
      anchor: "west",
      [$arrow(p)_(2,"cm")$],
    )
    content(
      ("line_rel_3.start", 50%, "line_rel_3.end"),
      // angle:"line_rel_3.end",
      padding: 0.3,
      anchor: "west",
      [$arrow(p)_(3,"cm")$],
    )


    // line((center_x(1)+scale/2, center_y(0)), (center_x(2)-scale/2, center_y(0)), stroke: scale/10)
  })
}



#let labeled_3a(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    set-style(mark: (end: ">"))
    content((0, 0), image("assets/c12_wide.svg", height: scale))


    let x_0p = -scale * 0.778
    let y1_0p = scale * 0.28
    let y2_0p = -scale * 0.27
    line((x_0p, y1_0p), (x_0p, y2_0p), name: "hoyle")
    content(
      ("hoyle.start", 0%, "hoyle.end"),
      padding: 0.3,
      anchor: "south",
      box($#h(0.5em)0^+$, stroke: 0pt, inset: 2pt),
    )

    let x_3m = -scale * 0.72
    let y1_3m = scale * 0.2
    let y2_3m = scale * 0.01
    line((x_3m, y1_3m), (x_3m, y2_3m), name: "c12_3m")
    content(
      ("c12_3m.start", 0%, "c12_3m.end"),
      padding: 0.3,
      anchor: "south",
      box($#h(0.5em)3^-$, stroke: 0pt, inset: 2pt),
    )
    let x_1m = -scale * 0.68
    let y1_1m = -scale * 0.3
    let y2_1m = -scale * 0.15
    line((x_1m, y1_1m), (x_1m, y2_1m), name: "c12_1m")
    content(
      ("c12_1m.start", 0%, "c12_1m.end"),
      padding: 0.3,
      anchor: "north",
      box($#h(0.5em)1^-$, stroke: 0pt, inset: 2pt),
    )

    let x_4p = -scale * 0.6
    let y1_4p = +scale * 0.1
    let y2_4p = scale * 0.25
    line((x_4p, y1_4p), (x_4p, y2_4p), name: "c12_4p")
    content(
      ("c12_4p.start", 0%, "c12_4p.end"),
      padding: 0.3,
      anchor: "north",
      box([$#h(2em)4^+,1^+$], stroke: 0pt, inset: 2pt),
    )

    set-style(mark: (end: none))

    let x_brace_1 = -scale * 0.62
    let x_brace_2 = -scale * 0.25
    let y_brace_1 = scale * 0
    let y_brace_2 = -scale * 0.05
    let x_range = x_brace_2 - x_brace_1
    let y_range = y_brace_2 - y_brace_1
    let omega = 1

    stroke = 1pt
    let (a, b, c, d) = (
      (x_brace_1, y_brace_1),
      (x_brace_1 + x_range / 6, y_brace_1 + y_range / 4),
      (x_brace_1 + x_range * 2 / 6, y_brace_1 + y_range / 4),
      (x_brace_1 + x_range * 3 / 6, y_brace_2),
    )
    hobby(a, b, c, d, omega: omega, stroke: stroke)
    let (a, b, c, d) = (
      (x_brace_1 + 3 / 6 * x_range, y_brace_2),
      (x_brace_1 + x_range * 4 / 6, y_brace_1 + y_range / 4),
      (x_brace_1 + x_range * 5 / 6, y_brace_1 + y_range / 4),
      (x_brace_1 + x_range * 6 / 6, y_brace_1),
    )
    hobby(a, b, c, d, omega: omega, stroke: stroke, name: "brace_leg")
    content((-scale * 0.4, -scale * 0.15), "Overlapping\nStates")
    content(
      (scale * 0.2, scale * 0.35),
      anchor: "north",
      [
        - Events with $N_alpha >= 3$
          - Events with $N_alpha>3$ have 3 $alpha$'s chosen at random
      ],
    )

    content((scale * 0.7, -scale * 0.2), real_event_no2a(size: 100pt))
  })
}


#let labeled_2a(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    set-style(mark: (end: ">"))
    content((0, 0), image("assets/c12_2a_wide.svg", height: scale))


    let x1_0p = -scale * 0.6
    let x2_0p = -scale * 0.7
    let y_0p = scale * 0.28
    line((x1_0p, y_0p), (x2_0p, y_0p), name: "be8_0p")
    content(
      ("be8_0p.start", 0%, "be8_0p.end"),
      padding: 0.3,
      anchor: "west",
      box($0^+$, stroke: 0pt, inset: 2pt),
    )

    let x_2p = -scale * 0.57
    let y1_2p = scale * 0.1
    let y2_2p = -scale * 0.15
    line((x_2p, y1_2p), (x_2p, y2_2p), name: "be8_2p")
    content(
      ("be8_2p.start", 0%, "be8_2p.end"),
      padding: 0.3,
      anchor: "south",
      box($#h(0.5em)2^+$, stroke: 0pt, inset: 2pt),
    )

    let x_be9 = -scale * 0.7
    let y1_be9 = -scale * 0.2
    let y2_be9 = -scale * 0.3
    let be9 = $isotope("Be", a:9)$
    line((x_be9, y1_be9), (x_be9, y2_be9), name: "be9", stroke: gray)
    content(
      ("be9.start", 0%, "be9.end"),
      padding: 0.3,
      anchor: "base",
      box(text(gray.darken(50%), size: 14pt)[$#h(1em)be9^*$], stroke: 0pt, inset: 2pt),
      // box(text(gray.darken(50%), size:14pt)[$#h(3em)be9(attach(5/2, tr:-))$], stroke: 0pt, inset: 2pt),
    )

    let x_4p = -scale * 0.12
    let y1_4p = -scale * 0.15
    let y2_4p = -scale * 0.3
    line((x_4p, y1_4p), (x_4p, y2_4p), name: "be8_4p")
    content(
      ("be8_4p.start", 0%, "be8_4p.end"),
      padding: 0.3,
      anchor: "south",
      box($#h(0.5em)4^+$, stroke: 0pt, inset: 2pt),
    )

    set-style(mark: (end: none))

    content(
      (scale * 0.2, scale * 0.35),
      anchor: "north",
      [
        - Events with $N_alpha >= 3$
          - Events with $N_alpha > 3$ have 3 $alpha$'s chosen at random
        - All three pairs of two $alpha$'s are used
      ],
    )

    content((scale * 0.7, -scale * 0.2), real_event_no_box(size: 100pt))
  })
}




#let stacked_3a_and_2a(size: 50pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((scale / 2, scale / 2), image("assets/c12_2a_ultra_wide.svg", width: scale * 4.4))

    content((scale * 2., +scale * 1.), real_event_no2a(size: 75pt))
    content((scale * 2, -scale * 0.), real_event_no_box(size: 75pt))

    let x_3a_1 = (-1.08) * scale
    let y_3a_1 = 0.8 * scale

    let x_3a_2 = (-0.8) * scale
    let y_3a_2 = 1.3 * scale

    let x_2a_1 = (-1.1) * scale
    let y_2a_1 = 0 * scale

    let x_2a_2 = (-0.75) * scale
    let y_2a_2 = (-0.08) * scale

    let x_2a_3 = (+0.3) * scale
    let y_2a_3 = (-0.2) * scale

    set-style(mark: (end: ">"))
    line((x_3a_1, y_3a_1), (x_2a_1, y_2a_1), stroke: 2pt + rgb(50%, 0%, 0%, 50%))
    line((x_3a_1, y_3a_1), (x_2a_2, y_2a_2), stroke: 2pt + rgb(50%, 0%, 0%, 50%))
    line((x_3a_1, y_3a_1), (x_2a_3, y_2a_3), stroke: 2pt + rgb(50%, 0%, 0%, 50%))
    line((x_3a_2, y_3a_2), (x_2a_1, y_2a_1), stroke: 2pt + rgb(50%, 0%, 0%, 50%))
    line((x_3a_2, y_3a_2), (x_2a_2, y_2a_2), stroke: 2pt + rgb(50%, 0%, 0%, 50%))
    line((x_3a_2, y_3a_2), (x_2a_3, y_2a_3), stroke: 2pt + rgb(50%, 0%, 0%, 50%))
  })
}

#let mixed_event_slide() = {
  import cetz.draw: *
  cetz.canvas({
    content((0, 0), [#uncorr_2d_plot(size: 340pt)])
    content(
      (377pt, 104pt),
      [
        + Find three events
        + From each, pick one $alpha$ particle
        + Create an artificial event with those $alpha$'s
        + Analyze as normal
      ],
    )
    content((484pt, -63pt), [#real_2d_plot2(size: 180pt)])
    content(
      (307pt, -75pt),
      box(
        width: 140pt,
        [- Only the very broad features of the real data are described],
      ),
    )
  })
}
#let partially_mixed_event_slide() = {
  import cetz.draw: *
  cetz.canvas({
    content((0, 0), [#corr_2d_plot(size: 340pt)])
    content(
      (377pt, 104pt),
      [
        + Find #text(weight: "bold")[two] events
        + From one, pick one $alpha$ particle
        + From the other, pick two $alpha$ particles
        + Create an artificial event with those $alpha$'s
        + Analyze as normal
      ],
    )
    content((484pt, -63pt), [#real_2d_plot2(size: 180pt)])
    content(
      (307pt, -75pt),
      box(
        width: 140pt,
        [- The vertical and diagonal components are described by the $2alpha$ correlations],
      ),
    )
  })
}

#let gated_three_v_two_6_7(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_real_gated_6_7.png", height: scale))
    content((scale * 0.2, -scale * 0.15), real_event(size: scale * 0.35))
  })
}

#let gated_twoa_6_7(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_6_7.png", height: scale))
    set-style(mark: (end: ">"))
    let x_2p = scale * 0.
    let y1_2p = -scale * 0.2
    let y2_2p = -scale * 0.25
    line((x_2p, y1_2p), (x_2p, y2_2p), name: "be8_2p")
    content(
      ("be8_2p.start", 0%, "be8_2p.end"),
      padding: 0.3,
      anchor: "base",
      box($#h(0.5em)2^+$, stroke: 0pt, inset: 2pt),
    )
  })
}

#let gated_three_v_two_2_3(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/three_v_two_real_gated_2_3.png", height: scale))
    content((scale * 0.2, -scale * 0.15), real_event(size: scale * 0.35))
  })
}

#let gated_twoa_2_3(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_2_3.png", height: scale))
    set-style(mark: (end: ">"))
    let x1 = (-0.2) * scale
    let x2 = (-0.27) * scale
    let y = 0.2 * scale
    line((x1, y), (x2, y), name: "arrow")
    content(
      ("arrow.start", 0%, "arrow.end"),
      padding: 0.3,
      anchor: "west",
      box($0^+$, stroke: 0pt, inset: 2pt),
    )

    let y1 = (-0.1) * scale
    let y2 = (-0.18) * scale
    let x = 0.18 * scale
    line((x, y1), (x, y2), name: "arrow")

    content(
      ("arrow.start", 0%, "arrow.end"),
      padding: 0.3,
      anchor: "base",
      box(
        [
          #text(size: 15pt)[Kinematically constrained non-$isotope("Be", a:8) $ contribution]
        ],
        stroke: 0pt,
        inset: 2pt,
        width: 70pt,
      ),
    )
  })
}

#let gated_twoa_2_3_build_1(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_2_3_real_only.png", height: scale))
    content((-scale * 0.2, scale * .35), real_event(size: scale / 8))
  })
}

#let gated_twoa_2_3_build_2(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_2_3_real_and_mixed.png", height: scale))
    content((scale * 0.1, scale * .35), fully_mixed_event(size: scale / 8))
    content((-scale * 0.05, scale * .35), partially_mixed_event(size: scale / 8))
    content((-scale * 0.2, scale * .35), real_event(size: scale / 8))
  })
}

#let gated_twoa_2_3_build_3(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_2_3_real_and_bg.png", height: scale))
    content((scale * 0.1, scale * .35), fully_mixed_event(size: scale / 8))
    content((-scale * 0.05, scale * .35), partially_mixed_event(size: scale / 8))
    content((-scale * 0.2, scale * .35), real_event(size: scale / 8))
  })
}
#let gated_twoa_2_3_build_4(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_2_3_real_and_sub.png", height: scale))
    set-style(mark: (end: ">"))
    let x1 = (-0.2) * scale
    let x2 = (-0.27) * scale
    let y = 0.1 * scale
    line((x1, y), (x2, y), name: "arrow")
    content(
      ("arrow.start", 0%, "arrow.end"),
      padding: 0.3,
      anchor: "west",
      box(
        text(blue.darken(30%), weight: "bold")[$isotope("Be", a:8)(0^+)$],
        stroke: 0pt,
        inset: 2pt,
        fill: rgb(100%, 100%, 100%, 50%),
      ),
    )

    let y1 = (-0.13) * scale
    let y2 = (-0.18) * scale
    let x = 0.18 * scale
    line((x, y1), (x, y2), name: "arrow")

    content(
      ("arrow.start", 0%, "arrow.end"),
      padding: 0.3,
      anchor: "base",
      box(
        [
          #text(size: 15pt, green.darken(50%))[Kinematically constrained non-$isotope("Be", a:8) $ contribution]
        ],
        stroke: 1pt,
        inset: 2pt,
        width: 140pt,
        fill: rgb(100%, 100%, 100%, 50%),
      ),
    )
    content(
      (00pt, 80pt),
      padding: 0.3,
      seq_three_alpha(size: 30pt),
    )
  })
}
#let gated_twoa_6_7_build_1(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_6_7_real_only.png", height: scale))
    content((-scale * 0.2, scale * .35), real_event(size: scale / 8))
  })
}

#let gated_twoa_6_7_build_2(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_6_7_real_and_mixed.png", height: scale))
    content((scale * 0.1, scale * .35), fully_mixed_event(size: scale / 8))
    content((-scale * 0.05, scale * .35), partially_mixed_event(size: scale / 8))
    content((-scale * 0.2, scale * .35), real_event(size: scale / 8))
  })
}

#let gated_twoa_6_7_build_3(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_6_7_real_and_bg.png", height: scale))
    content((scale * 0.1, scale * .35), fully_mixed_event(size: scale / 8))
    content((-scale * 0.05, scale * .35), partially_mixed_event(size: scale / 8))
    content((-scale * 0.2, scale * .35), real_event(size: scale / 8))
  })
}
#let gated_twoa_6_7_build_4(size: 300pt) = {
  import cetz.draw: *
  let scale = size
  cetz.canvas({
    content((0, 0), image("assets/thin_slice_subtraction_6_7_real_and_sub.png", height: scale))
    set-style(mark: (end: ">"))
    let x_2p = scale * 0.
    let y1_2p = -scale * 0.2
    let y2_2p = -scale * 0.25
    line((x_2p, y1_2p), (x_2p, y2_2p), name: "be8_2p")
    content(
      ("be8_2p.start", 0%, "be8_2p.end"),
      padding: 0.3,
      anchor: "base",
      box(text(blue.darken(30%))[$isotope("Be",a: 8)(2^+)$], stroke: 0pt, inset: 2pt),
    )

    content(
      (00pt, 100pt),
      padding: 0.3,
      seq_three_alpha(size: 30pt),
    )
  })
}



#let kin_diagram_1(size: 300pt) = {
  import cetz.draw: *
  scale = size
  cetz.canvas(
    length: 3cm,
    {
      import cetz.draw: *
      let be_radius = 1
      let be_radius_modifier = 1
      let be_x = 0
      let be_y = 0

      let alpha1_x = -3.5
      let alpha1_y = 0
      let alpha2_x = be_radius_modifier * be_radius * 1 / 2
      let alpha2_y = be_radius_modifier * be_radius * calc.sqrt(3) / 2
      let alpha3_x = -alpha2_x
      let alpha3_y = -alpha2_y

      let mark = (end: "stealth", fill: black)
      let mark_purple = (end: "stealth", fill: purple)
      let mark_blue = (end: "stealth", fill: blue)
      let mark_light = (end: "stealth", fill: luma(70%))
      let angle_scale = 0.15
      line(
        (-(be_x - alpha1_x) / 3, be_y),
        (alpha1_x, alpha1_y),
        stroke: purple,
        fill: purple,
        name: "be_alpha_1",
        mark: mark_purple,
      )
      line((be_x, be_y), (alpha2_x, alpha2_y), name: "be_alpha_2", mark: mark)
      line((be_x, be_y), (alpha3_x, alpha3_y), name: "be_alpha_3", stroke: black, fill:black, mark: mark)
      //circle((be_x, be_y), radius: 0.025, fill: black)
      //circle((-(be_x - alpha1_x) / 3, be_y), radius: 0.025, fill: black)

      line((-(be_x - alpha1_x) / 3, be_y), (alpha3_x, alpha3_y), stroke: purple, fill:black, mark: mark_purple)
      line((-(be_x - alpha1_x) / 3, be_y), (alpha2_x, alpha2_y), stroke: purple, fill: purple, mark: mark_purple)

      line(
        (alpha1_x, alpha1_y),
        (alpha2_x, alpha2_y),
        name: "be_alpha_1",
        stroke: (dash: "dashed", paint: blue),
        mark: mark_blue,
      )

      content(
        ((alpha1_x + alpha2_x) / 2, (alpha1_y + alpha2_y) / 2),
        text(fill: blue)[$E_(1,2,"rel")$],
        anchor: "south",
        padding: 0.2cm,
      )
      content((alpha1_x, alpha1_y), text(fill: purple)[$alpha_1$], anchor: "east", padding: 0.2cm)
      content(
        (alpha2_x, alpha2_y),
        text(fill: black)[$alpha_2$],
        anchor: "west",
        padding: 0.2cm,
      )
      content(
        (alpha3_x, alpha3_y),
        text(fill: black)[$alpha_3$],
        anchor: "west",
        padding: 0.4cm,
      )
      content((.1, -0.1), $E_(2alpha,"rel")$, anchor: "west", padding: 0.4cm)
      content(
        ((alpha1_x + alpha2_x) / 2, -(alpha1_y + alpha2_y) / 2),
        text(fill: purple)[$E_(3alpha,"rel")$],
        anchor: "south",
        padding: 0.2cm,
      )

      //cetz.angle.angle(
      //(0, 0),
      //(angle_scale * alpha2_x, angle_scale * alpha2_y),
      //(-angle_scale, 0),
      //label: text($theta$),
      //radius: angle_scale,
      //)
    },
  )
}
#let kin_diagram_2(size: 300pt) = {
  import cetz.draw: *
  scale = size
  cetz.canvas(
    length: 3cm,
    {
      import cetz.draw: *
      let be_radius = 1
      let be_radius_modifier = 1
      let be_x = 0
      let be_y = 0
      circle((be_x, be_y), radius: be_radius, stroke: (dash: "dashed", paint: luma(70%)))

      circle((be_x, be_y), radius: (be_radius, be_radius / 3), stroke: (dash: "dotted", paint: luma(70%)))
      circle((be_x, be_y), radius: (be_radius / 3, be_radius), stroke: (dash: "dotted", paint: luma(70%)))

      let alpha1_x = -3.5
      let alpha1_y = 0
      //let alpha2_x = be_radius_modifier * be_radius * calc.sqrt(2) / 2 / calc.sqrt(5)
      //let alpha2_y = be_radius_modifier * be_radius * calc.sqrt(2) / 2 / calc.sqrt(5)
      let alpha2_x = be_radius_modifier * be_radius * 1 / 2
      let alpha2_y = be_radius_modifier * be_radius * calc.sqrt(3) / 2
      let alpha3_x = -alpha2_x
      let alpha3_y = -alpha2_y

      let mark = (end: "stealth", fill: black)
      let mark_light = (end: "stealth", fill: luma(70%))
      let angle_scale = 0.15
      line((be_x, be_y), (alpha1_x, alpha1_y), name: "be_alpha_1", mark: mark)
      line((be_x, be_y), (alpha2_x, alpha2_y), name: "be_alpha_2", mark: mark)
      line((be_x, be_y), (alpha3_x, alpha3_y), name: "be_alpha_3", stroke: luma(70%), fill: luma(70%), mark: mark_light)
      circle((be_x, be_y), radius: 0.025, fill: black)
      circle((-(be_x - alpha1_x) / 3, be_y), radius: 0.025, fill: black)

      line((-(be_x - alpha1_x) / 3, be_y), (alpha3_x, alpha3_y), stroke: luma(70%), fill: luma(70%), mark: mark_light)
      line((-(be_x - alpha1_x) / 3, be_y), (alpha2_x, alpha2_y), stroke: luma(70%), fill: luma(70%), mark: mark_light)

      line((alpha1_x, alpha1_y), (alpha2_x, alpha2_y), name: "be_alpha_1", stroke: (dash: "dashed"), mark: mark)

      content(
        ((alpha1_x + alpha2_x) / 2, (alpha1_y + alpha2_y) / 2),
        $bold(v)_(1, 2,"rel")$,
        anchor: "south",
        padding: 0.2cm,
      )
      content((alpha1_x, alpha1_y), $bold(v)_1$, anchor: "east", padding: 0.2cm)
      content((alpha2_x, alpha2_y), $bold(v)_2$, anchor: "west", padding: 0.2cm)
      content(
        (alpha3_x, alpha3_y),
        text(fill: luma(70%))[$bold(v)_3$],
        anchor: "west",
        padding: 0.4cm,
      )
      //content((-0.1, -0.1), $bold(0)$, anchor: "west", padding: 0.4cm)

      cetz.angle.angle(
        (0, 0),
        (angle_scale * alpha2_x, angle_scale * alpha2_y),
        (-angle_scale, 0),
        label: text($theta$),
        radius: angle_scale,
      )
    },
  )
}
#let kin_diagram(size: 300pt) = {
  import cetz.draw: *
  scale = size
  cetz.canvas(
    length: 3cm,
    {
      import cetz.draw: *
      let be_radius = 1
      let be_radius_modifier = 1
      let be_x = 0
      let be_y = 0
      circle((be_x, be_y), radius: be_radius, stroke: (dash: "dashed", paint: luma(70%)))

      circle((be_x, be_y), radius: (be_radius, be_radius / 3), stroke: (dash: "dotted", paint: luma(70%)))
      circle((be_x, be_y), radius: (be_radius / 3, be_radius), stroke: (dash: "dotted", paint: luma(70%)))

      let alpha1_x = -3.5
      let alpha1_y = 0
      //let alpha2_x = be_radius_modifier * be_radius * calc.sqrt(2) / 2 / calc.sqrt(5)
      //let alpha2_y = be_radius_modifier * be_radius * calc.sqrt(2) / 2 / calc.sqrt(5)
      let alpha2_x = be_radius_modifier * be_radius * 1 / 2
      let alpha2_y = be_radius_modifier * be_radius * calc.sqrt(3) / 2
      let alpha3_x = -alpha2_x
      let alpha3_y = -alpha2_y

      let mark = (end: "stealth", fill: black)
      let mark_light = (end: "stealth", fill: luma(70%))
      let angle_scale = 0.15
      line((be_x, be_y), (alpha1_x, alpha1_y), name: "be_alpha_1", mark: mark)
      line((be_x, be_y), (alpha2_x, alpha2_y), name: "be_alpha_2", mark: mark)
      line((be_x, be_y), (alpha3_x, alpha3_y), name: "be_alpha_3", stroke: luma(70%), fill: luma(70%), mark: mark_light)
      circle((be_x, be_y), radius: 0.025, fill: black)
      circle((-(be_x - alpha1_x) / 3, be_y), radius: 0.025, fill: black)

      line((-(be_x - alpha1_x) / 3, be_y), (alpha3_x, alpha3_y), stroke: luma(70%), fill: luma(70%), mark: mark_light)
      line((-(be_x - alpha1_x) / 3, be_y), (alpha2_x, alpha2_y), stroke: luma(70%), fill: luma(70%), mark: mark_light)

      line((alpha1_x, alpha1_y), (alpha2_x, alpha2_y), name: "be_alpha_1", stroke: (dash: "dashed"), mark: mark)

      content(
        ((alpha1_x + alpha2_x) / 2, (alpha1_y + alpha2_y) / 2),
        $bold(v)_(alpha_1, alpha_2,"rel")$,
        anchor: "south",
        padding: 0.2cm,
      )
      content((alpha1_x, alpha1_y), $bold(v)_1$, anchor: "east", padding: 0.2cm)
      content((alpha2_x, alpha2_y), $bold(v)_2$, anchor: "west", padding: 0.2cm)
      content(
        (alpha3_x, alpha3_y),
        text(fill: luma(70%))[$bold(v)_(alpha_3)$],
        anchor: "west",
        padding: 0.4cm,
      )
      content((-0.1, -0.1), $bold(0)$, anchor: "west", padding: 0.4cm)

      cetz.angle.angle(
        (0, 0),
        (angle_scale * alpha2_x, angle_scale * alpha2_y),
        (-angle_scale, 0),
        label: text($theta$),
        radius: angle_scale,
      )
    },
  )
}
