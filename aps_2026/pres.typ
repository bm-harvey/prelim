
#import "@preview/polylux:0.4.0": *
#set page(paper: "presentation-16-9")

#import "@preview/physica:0.9.3": isotope
#show math.equation: set text(font: "Fira Math")
#set text(font: "Fira Sans", size: 16pt)
#show heading.where(level: 2): set text(22pt, red.darken(40%))
#show heading.where(level: 3): set text(18pt, red.darken(40%))
#set page(margin: 0.5in)
//#show


#let focus-slide(name) = slide[
  #set align(horizon)
  //#set text(size: 2em)
  //#toolbox.register-section(name)

  #align(center)[#strong(text(30pt, fill: red.darken(40%), name))]
]
#let good(body) = {
  set text(green.darken(30%))
  [#body]
}

#let quote(body) = {
  set text(gray.darken(60%))
  [#emph(text(size: 14pt, body))]
}

#let bad(body) = {
  set text(red.darken(30%))
  [_ #body _]
}

#let my_ref(journal: "", volume: "", id: "", year: "", url: "") = {
  link(url)[#text(size: 12pt)[_ #journal _ *#volume*, #id (#year)]]
}

#let dim(body) = {
  set text(gray.darken(30%))
  [_ #body _]
}

#let bright(body) = {
  set text(blue.darken(30%))
  [*#body*]
}

#let b9 = $isotope("B", a:9)$
#let be9 = $isotope("Be", a:9)$
#let be8 = $isotope("Be", a:8)$
#let c12 = $isotope("C", a:12)$
#let o16 = $isotope("O", a:16)$
#let li5 = $isotope("Li", a:5)$
#let li5 = $isotope("Li", a:5)$
#let si28 = $isotope("Si", a:28)$

#let today = datetime.today()

#set page(numbering: "1")

#slide[
  #set page(footer: none, header: none)
  #set align(horizon)
  #text(size: 2em, weight: "bold")[
    #toolbox.side-by-side(columns: (auto, 1fr))[
      //#image("../assets/polylux-logo.svg", height: 2em)
    ][
      #text(fill: red.darken(40%))[The Texas Automated Particle Identification Routine (TAPIR)]

    ]


  ]
  #line(stroke: black, length: 100%)

  //An overview over all the features

  Bryan M Harvey, Spring APS 2026
]

//
//
//
//
//
#slide[
  == Telescoped Multidetector Array Experiments
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      //#strong[F]orward #strong[A]rray #linebreak() #strong[U]sing #strong[S]ilicon #strong[T]echnology
      FAUST

      //#box([FAUST telescope with $E$ and $Delta E$ labeled], stroke: black, inset: 5pt, height: 80%, width: 90%)
      #image( "faust.png",)
      //#image( height: 90%,"fig_1_faust_det_34_full_raw_xcsi_ysi_h11.2_w8.4.png",)

    ],
    align(center)[
      NIMROD
      #image( "nimrod.jpg")
    ],
    align(center)[
      FAZIA

      #box([], stroke: black, inset: 5pt, height: 80%, width: 90%)
    ],
  )
]



#slide[
  == Particle Identification via Energy Loss
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      //#image( height: 90%,"fig_1_faust_det_34_full_raw_xcsi_ysi_h11.2_w8.4.png",)
      #box([FAUST telescope with $E$ and $Delta E$ labeled], stroke: black, inset: 5pt, height: 90%, width: 90%)
    ],
    align(center)[
      #v(1fr)
      //$
      //- (d E) / (d x) = (4pi n Z^2)/(m_e v^2)(e^2/(4 pi epsilon_0))^2 ln((2m_e v^2)/I)
      //$
      Bethe-Bloche
      $
        - (d E) / (d x) prop (A Z^2) / E
      $
      #v(1fr)

    ],
    align(center)[
      #image(height: 90%, "fig_1_faust_det_34_full_raw_xcsi_ysi_h11.2_w8.4.png")
    ],
  )
]

#slide[
  == By-Hand Linearizations
  #grid(
    columns: (1fr, 2fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #box([$Delta E$ versus $E$ plot with Travis's by-hand curves], stroke: black, inset: 5pt, height: 90%, width: 90%)
    ],
    align(center)[
      #box([By-hand linearization result], stroke: black, inset: 5pt, height: 90%, width: 90%)
    ],
  )
]
#slide[
  == TAPIR
  #grid(
    columns: (1fr, .5fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center + horizon)[
      //FAZIA
      #v(1fr)
      #box(
        image(width: 90%, "TAPIR_listing.png"),
        stroke: black + 3pt,
        inset: 3pt,
      )
      #v(1fr)
    ],
    align()[
      //FAZIA
      #v(1fr)
      Complete Linearization Method:
      #v(1fr)
      - Find curves which describe the 'flow' of data
        - #dim[#strike([by-hand point picking])]
        - Data Equalization
        - Ridge Detection
        - By-hand curve selection
        - Curve Extrapolations
      #v(1fr)
      - Straighten the data based on the curves
        - #dim[#strike([use labelled curves to guide])]
        - Use the natural spacigng of the data
      #v(1fr)
    ],
  )
]


#slide[
  == Equalizing Data
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #image(height: 90%, "fig_1_faust_det_34_full_raw_xcsi_ysi_h11.2_w8.4.png")
    ],
    align(center)[
      #v(1fr)
      $
        - (d E) / (d x) prop Z^2
      $

      #v(1fr)
      Taking square root of both axes makes the data easier to work with
      #v(1fr)
    ],
    align(center)[
      #image(height: 90%, "fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
    ],
  )
]

#slide[
  == Ridge Detection
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #image(height: 90%, "fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
    ],
    align(center)[
      #v(1fr)
      Core idea to replace by-hand curves
      #v(1fr)
      Image based analysis
      #v(1fr)
      Ridge-Like
      \ \= \
      Pixels which are maxima in exactly one direction
      #v(1fr)

    ],
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (right: -93%, bottom: -109%),
        stroke: none,
      )
    ],
  )
]

#slide[
  == Apply Noise Threshold
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (right: -93%, bottom: -109%),
        stroke: none,
      )
    ],
    align(center)[
      #v(1fr)
      First step in isolating describing curves 
      #v(1fr)
    ],
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (left: -107%, bottom: -109%),
        stroke: none,
      )
    ],
  )
]

#slide[
  == Non-Maximum Suppression
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (left: -107%, bottom: -109%),
        stroke: none,
      )
    ],
    align(center)[
      #v(1fr)
      If a pixel is the maximum of its neighbors in any direction, keep it

      Otherwise, drop it
      #box([Probably a \ diagram here], stroke: black, inset: 5pt, height: 20%, width: 80%)
      #v(1fr)
      Has  the effect of narrowing the curves
      #v(1fr)


    ],
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (right: -88%, top: -109%),
        stroke: none,
      )
    ],
  )
]

#slide[
  == Gate on Ridge-Points
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (right: -88%, top: -109%),
        stroke: none,
      )
    ],
    align(center)[
      #v(1fr)
      Only by-hand step
      #v(1fr)
      Similar in essence to older methods, but MUCH faster 
      #v(1fr)
      Required precision is much lower 
      #v(1fr)
    ],
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (left: -112%, top: -109%),
        stroke: none,
      )
    ],
  )
]

#slide[
  == Extrapolate to Edges of Data
  #grid(
    columns: (1fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #box(
        image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
        clip: true,
        inset: (left: -112%, top: -109%),
        stroke: none,
      )
    ],
    align(center)[
      #v(1fr)
      Curves cannot be allowed to cross

      #v(1fr)
      Curves get extrapolated based off of their curvature and their neighbors' curvatures
      #v(1fr)




    ],
    align(center)[
      #image(height: 92%, "fig_4_faust_det_34_full_extensions_xcsi_sqrt_ysi_sqrt_h8_w6.png")
    ],
  )
]

#slide[
  == Linearized Result
  #grid(
    columns: (.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align()[
      #v(2fr)
      === TAPIR Linearization
      - *\~ 6 minutes* per detector
      - Very *linear* bands
      #v(1fr)
      #line(length: 100%)
      #v(1fr)
      === By-Hand Linearization
      - Limited to *45 minutes*
      - *Wiggly* bands
        - Especially at low $E$
      - Even more time would need to be invested in production
      //#image(height: 85%, "fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
      #v(1fr)
    ],
    align(center)[
      #image(height: 92%, "fig_7_final_result_comp.png")
    ],
  )
]

#slide[
  == Linearized Result
  #grid(
    columns: (.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      #image(height: 85%, "fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
    ],
    align(center)[
      #image(height: 92%, "fig_6_final_result.png")
    ],
  )
]


#slide[
  == Acknowledgments and Questions Slides
  #grid(
    columns: (.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[
      //#image(height: 90%, "fig_3_faust_det_34_full_ridges_xcsi_sqrt_ysi_sqrt_h8_w6.png"),
    ],
    align(center)[
      //#image(height: 92%, "fig_7_final_result_comp.png")
    ],
  )
]
