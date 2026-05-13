//#import "@preview/slydst:0.1.4": *
#import "figures/reaction_cartoon.typ": reaction-cartoon
#import "@preview/cetz:0.5.0": canvas, draw
#import "@preview/cetz:0.5.0"
#import "@preview/larrow:1.1.0": *
#import "@preview/cetz-plot:0.1.2": plot
#import "@preview/grayness:0.6.0": *
#import "@preview/polylux:0.4.0": *
#set page(paper: "presentation-16-9")
#let page-footer = align(center)[
  #toolbox.slide-number
]

#set page(footer: link(<outline-slide>)[#page-footer])

#let lal = arrow-label.with(dx: 0mm, dy: 0mm)

#let grid_default = (
  gutter: 8pt,
  inset: 6pt,
  stroke: none,
)

#let grid_debug = (
  gutter: 8pt,
  inset: 6pt,
  stroke: luma(90%) + 1pt,
)

#import "@preview/physica:0.9.3": isotope
#show math.equation: set text(font: "Fira Math")
#set text(font: "Fira Sans", size: 16pt)
#show heading.where(level: 2): set text(22pt, red.darken(50%))
#show heading.where(level: 3): set text(18pt, red.darken(50%))
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
  ["#emph(text(size: 14pt, body))"]
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

#let b9 = $isotope("B", a: 9)$
#let be9 = $isotope("Be", a: 9)$
#let be8 = $isotope("Be", a: 8)$
#let c12 = $isotope("C", a: 12)$
#let o16 = $isotope("O", a: 16)$
#let li5 = $isotope("Li", a: 5)$
#let li5 = $isotope("Li", a: 5)$
#let si28 = $isotope("Si", a: 28)$
#let s32 = $isotope("S", a: 32)$
#let ar36 = $isotope("Ar", a: 36)$
#let ca40 = $isotope("Ca", a: 40)$

#let today = datetime.today()


#slide[
  #set page(footer: none, header: none)
  #set align(horizon)
  #text(size: 2em, weight: "bold")[
    #toolbox.side-by-side(columns: (auto, 1fr))[
      //#image("../assets/polylux-logo.svg", height: 2em)
    ][
      #text(fill: red.darken(50%))[Expanded Search for Toroidal Isomers]

    ]


  ]
  #line(stroke: black, length: 100%)

  //An overview over all the features

  #text(fill: red.darken(50%))[Bryan M Harvey]

  #text(fill: red.darken(50%))[Preliminary Exam / Masters Defense]

  #today.display()
]

// template
#slide()[
  == Title
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // 2012
    align()[
    ],
    align()[
    ],
  )
]

#slide()[
  == Liquid Drop Model (1970s) - Original Theory
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // 2012
    align()[
      #v(0.5cm)
      === Spherical Nucleus Binding Energy
      #only(1)[$
        E_B = a_V A - a_S A^(2 slash 3) - a_C (Z(Z-1))/A^(1 slash 3) - a_A (N-Z)^2/A plus.minus delta(N, Z)
      $]
      #only("2-")[
        $
          E_B = a_V bright(A) - a_S bright(A^(2 slash 3)) - a_C (Z(Z-1))/bright(A^(1 slash 3)) - a_A (N-Z)^2/bright(A) plus.minus delta(N, Z)
        $

        - $E_B$ depends on #bright([spherical]) assumptions.
        #v(1cm)
        === What happens under deformed *Toroidal* configurations at high angular momentum?

        #align(center)[#image("figures/screenshots/Wong1973_Fig10.png", height: 32%)]
      ]
    ],
    align(center)[
      // #image("figures/screenshots/Wong1973_Fig1_cap.png", height:90%)
      #uncover(3)[
        #image("figures/screenshots/Wong1978_Fig7.png", width: 103%)
      ]
    ],
  )
]

#slide()[
  == Boltzmann-Uehling-Uhlenbeck (BUU)  (1990s) - Dyanamic Formation
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // 2012
    align()[
      #image("figures/screenshots/Xu1994_Fig2.png", width: 95%)
    ],
    align(left)[
      #v(1fr)
      - Direct collisions produced outwardly expanding toroids.
      #v(1fr)
      - Toroids seem to be metastablalized
      #v(1fr)
      - Decay into symmetric particles
        - $r_"particle" approx d_"toroid"$
      #v(1fr)
    ],
  )
]

#slide()[
  == Cranked Skyrme Hartree Fock (cSHF) (2010s) - Specific Energy Predictions
  #grid(
    columns: (.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // rows:(3.0cm),
    // 2012

    [
      #align(left)[
        #image("figures/screenshots/Ichikawa2012_Fig1.png", width: 95%)
        #my_ref(
          journal: "PRL",
          volume: "109",
          id: "232503",
          year: 2012,
          url: "https://journals.aps.org/prl/pdf/10.1103/PhysRevLett.109.232503",
        )
        - Predicted state in #ca40
          - $J_z=60 planck$
          - $E^* approx 175 "MeV"$

        - Angular momentum and mass consistent with Wong's LDM
      ]
    ],
    align(center)[
      #block[
        #uncover(2)[
          #image("figures/screenshots/Wong1978_Fig7.png", width: 85%)
          #place(dx: 75pt, dy: -80pt)[#circle(radius: 6pt, stroke: red.darken(60%) + 3pt)]
        ]
      ]
    ],
  )

]



#slide()[
  == Cranked Skyrme Hartree Fock (cSHF) (2010s) - Specific Energy Predictions
  #grid(
    columns: (.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // rows:(3.0cm),
    // 2012

    [
      #align(center)[
        #my_ref(
          journal: "PLB",
          volume: "738",
          id: "401-404",
          year: 2014,
          url: "https://www.sciencedirect.com/science/article/pii/S0370269314007369",
        )
        #image("figures/screenshots/Wong2018_Fig3.jpg", height: 85%)
      ]
    ],
    align(center)[
      #v(.75cm)
      A. Staszczak and C.-Y. Wong predict 18 Toroidal Isomers
      #table(
        stroke: none,
        columns: (1cm, 3cm, 3cm, 3cm, 3cm),
        gutter: 5pt,
        table.hline(),
        [], [$E^*$ [MeV]], [$I$ [$planck$]], [$d$ [fm]], [$rho_"max" slash rho_0$],
        table.hline(),
        [#si28], [143.18], [44], [1.45], [0.74],
        table.hline(),
        [#s32], [153.87], [48], [1.42], [0.76],
        [], [193.35], [66], [1.40], [0.67],
        table.hline(),
        [], [168.03], [56], [1.40], [0.78],
        [#ar36], [198.63], [72], [1.39], [0.71],
        [], [238.56], [92], [1.37], [0.64],
        table.hline(),
        [#ca40], [178.36], [60], [1.40], [0.79],
        [], [214.23], [82], [1.39], [0.73],
        table.hline(),
        [$dots.v$], [$dots.v$], [$dots.v$], [$dots.v$], [$dots.v$],
        table.hline(),
      )
      #only(2)[
        #place(dx: 46pt, dy: -95pt, box(stroke: red.darken(50%) + 3pt, width: 404pt, height: 30pt, radius: 10pt))
      ]
      #only(3)[
        #place(dx: 285pt, dy: -280pt, box(stroke: red.darken(50%) + 3pt, width: 50pt, height: 270pt, radius: 10pt))
      ]
      #only(4)[
        #place(dx: 367pt, dy: -280pt, box(stroke: red.darken(50%) + 3pt, width: 65pt, height: 270pt, radius: 10pt))
      ]
      #only(5)[
        #place(dx: 95pt, dy: -280pt, box(stroke: red.darken(50%) + 3pt, width: 72pt, height: 270pt, radius: 10pt))
      ]
      #align(center)[
        #only(2)[
          #bright([Ichikawa's $bold(#ca40)$ is reproduced])
        ]
        #only(3)[
          #bright([Minor axis stays about constant ($bold(d approx 1.4 "fm")$)])
        ]
        #only(4)[
          #bright([Low density])
        ]
        #only(5)[
          #bright([Several states to investigate, including $bold(si28 (E^* = 143 "MeV"))$])
        ]
      ]
    ],
  )


]



#slide[
  == First Experimental Evidence (2019)
  // footer
  #place(dx: 0pt, dy: 95.75%)[ #my_ref(
    journal: "PRC",
    volume: "99",
    id: "014606",
    year: 2019,
    url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.99.014606",
  )]

  #grid(
    ..grid_default,
    columns: (2fr, 1fr),

    [#align(center)[
        #reaction-cartoon()
      ]
      #align(center + horizon)[
        // #line()

        #box(
          $
            E^*_si28 = underbrace(sum_(i) T_(alpha_i), E_"rel") - underbrace(( m_si28 - 7m_alpha ), Q) quad #text(fill: luma(30%))[$"if" 7alpha "from" si28^*$]
          $,
          stroke: none,
          // inset: 2pt,
          // outset: 6pt,
          // radius: 5pt,
        )
      ]

    ],
    align(center)[
      #uncover(2)[
        *Neutron Ion Multidetector For Reaction Oritented Dynamics\ (NIMROD)*
        #v(1fr)
        #box(radius: 15pt, clip: true, stroke: black + 3pt, image("figures/nimrod.jpg", width: 85%))
      ]
    ],
  )


]

#slide[
  == First Experimental Evidence (2019)
  // footer
  #place(dx: 0pt, dy: 95.75%)[ #my_ref(
    journal: "PRC",
    volume: "99",
    id: "014606",
    year: 2019,
    url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.99.014606",
  )]

  #grid(
    ..grid_default,
    columns: (1.9fr, 2fr, 1.6fr),
    align(left)[
      #v(1fr)
      - Reaction 
        - $si28 + c12$ @ 35 MeV/u
        - Part of 2009 experimental series
      #v(1fr)
      - Sample Size
        - 6,467 Events w/ 7$alpha$
      #v(1fr)
      - Resolution for $E^*$ from $7alpha$
        - $~9.4$ MeV (FWHM)
        - Position insensitive detectors
      #v(1fr)
    ],
    align(center)[
      #image("figures/cao_2019/7alphaSpectrum.png", height: 92%)
    ],
    align(left)[
      #v(1fr)
      - Nonresonant Background
        - Mixed Events
        - #dim[Shifted AMD distribution]
      #v(1fr)
      - Extracted Peaks
        - $E^* = bold(114), bold(126), bold(138)$ MeV 
        - FWHM dominated by resolution

      #v(1fr)
      #quote[Clearly an experiment with much better angular resolution, allowing better resolution for the excitation energy spectrum, will be very desirable.]

      #v(1fr)
    ],
  )
]






#slide[
  == Followup Measurements

]

#slide[
  == Creating a Mixed Event

  #let box_radius = 8pt
  #v(.5cm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 0pt,
    align(center)[*Real Events*], align(center)[], align(center)[#only("3-")[*Mixed Events*]],
  )
  #grid(
    columns: (1fr, 1fr, 1fr),
    rows: 2.3cm,

    align(center)[
      #only("1-")[
        #box(
          radius: box_radius,
          stroke: black,
          image("faust_renders/real_1.png", width: 80%),
        )
      ]
    ],
    align(center)[
      #only("2-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_hl_1.png", width: 80%))
      ]
    ],
    align(center)[
      #only("3-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/mixed_1.png", width: 80%))
      ]
    ],

    align(center)[
      #only("1-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_2.png", width: 80%))
      ]
    ],
    align(center)[
      #only("2-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_hl_2.png", width: 80%))
      ]
    ],
    align(center + horizon)[
      #only("3-")[
        #box(
          text(size: 34pt)[
            $
              dots.v
            $
          ],
        )
      ]
    ],

    align(center)[
      #only("1-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_4.png", width: 80%))
      ]
    ],
    [],
    [],

    align(center)[
      #only("1-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_3.png", width: 80%))
      ]
    ],
    align(center)[
      #only("2-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_hl_3.png", width: 80%))
      ]
    ],
    [],

    align(center + horizon)[
      #only("1-")[
        #box(
          text(size: 34pt)[
            $
              dots.v
            $
          ],
        )
      ]
    ],
    [],
    [],
  )


  #place(dx: 522pt, dy: -140pt)[#box(stroke: luma(50%) + 5pt, radius: 20pt, width: 9.5cm, height: 5.5cm, inset: 15pt)[
    #v(1fr)
    #one-by-one()[
      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Start w/ events containing all particles][

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Select particles from seperate events][

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Construct new event
    ]
    #v(1fr)
  ]]
]



#slide[
  == Outline
  <outline-slide>
  #outline()
]
