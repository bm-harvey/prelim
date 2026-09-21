#import "@preview/slydst:0.1.4": *
#import "figures/reaction_cartoon.typ": reaction-cartoon
#import "pir_2025/cartoons.typ": three_alpha, kin_diagram_1, kin_diagram_2
#import "@preview/cetz:0.5.0": canvas, draw
#import "@preview/cetz:0.5.0"
#import "@preview/larrow:1.1.0": *
#import "@preview/cetz-plot:0.1.2": plot
#import "@preview/grayness:0.6.0": *
#import "@preview/polylux:0.4.0": *
#set page(paper: "presentation-16-9")
// Set to true to include backup slides, false to exclude them
#let show-backup-slides = true

#let page-footer = align(center)[
  #toolbox.slide-number
]

#set page(footer: if show-backup-slides { link(<outline-slide>)[#page-footer] } else { page-footer })

#let lal = arrow-label.with(dx: 0mm, dy: 0mm)

#let slateblue = rgb(106, 90, 205)

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
// #show heading.where(level: 3): set text(18pt, red.darken(50%))
#show heading.where(level: 3): set text(18pt, black)
#set page(margin: 0.5in)

// Show logical slide numbers in the outline instead of physical page numbers
#show outline.entry: it => context {
  let slide-num = counter("logical-slide").at(it.element.location()).first()
  link(
    it.element.location(),
    it.indented(it.prefix(), [
      #it.body()
      #if it.fill != none { box(width: 1fr)[#it.fill] } else { box(width: 1fr) }
      #slide-num
    ])
  )
}
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
  set text(fill: gray.darken(30%))
  [ #body ]
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
#let ne20 = $isotope("Ne", a: 20)$
#let mg24 = $isotope("Mg", a: 24)$
#let li5 = $isotope("Li", a: 5)$
#let li5 = $isotope("Li", a: 5)$
#let si28 = $isotope("Si", a: 28)$
#let s32 = $isotope("S", a: 32)$
#let ar36 = $isotope("Ar", a: 36)$
#let ca40 = $isotope("Ca", a: 40)$
#let cnat = $isotope("C", a:"nat")$

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

  #text(fill: red.darken(50%))[Bryan M. Harvey]

  #text(fill: red.darken(50%))[Preliminary Exam / Master's Defense]

  #today.display()
]

// template
// #slide()[
//   == Title
//   #grid(
//     columns: (1fr, 1fr),
//     gutter: 8pt,
//     inset: 6pt,
//     stroke: none,
//     // 2012
//     align()[
//     ],
//     align()[
//     ],
//   )
// ]

#slide()[
  == Liquid Drop Model (1970s) - Original Theory
  #only("2-")[
    #place(dx: 0%, dy: 95.75%)[
      #my_ref(
        journal: "Ann. Phys.",
        volume: "77(1-2)",
        id: "279-353",
        year: 1973,
        url: "https://www.sciencedirect.com/science/article/pii/000349167390420X",
      )
    ]
  ]
  #only("3-")[
    #place(dx: 25%, dy: 95.75%)[
      #my_ref(
        journal: "Phys. Rev. C",
        volume: "17",
        id: "331",
        year: 1978,
        url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.17.331",
      )
    ]
  ]
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // 2012
    align()[
      #v(0.5cm)
      === Semi-Empirical Mass Formula
      #only(1)[$
        E_B = a_V A - a_S A^(2 slash 3) - a_C (Z(Z-1))/A^(1 slash 3) - a_A (N-Z)^2/A plus.minus delta(N, Z)
      $]
      #only("2-")[
        $
          E_B = a_V bright(A) - a_S bright(A^(2 slash 3)) - a_C (Z(Z-1))/bright(A^(1 slash 3)) - a_A (N-Z)^2/bright(A) plus.minus delta(N, Z)
        $

        - $E_B$ depends on #bright([spherical]) assumptions.
        #v(1cm)
        === What happens under deformed *toroidal* configurations at high angular momentum?

        #align(center)[#image("figures/screenshots/Wong1973_Fig10.png", height: 32%)]
      ]
    ],
    align(center)[
      // #image("figures/screenshots/Wong1973_Fig1_cap.png", height:90%)
      #uncover(3)[
        #image("figures/screenshots/Wong1978_Fig7.png", width: 97%)
      ]
    ],
  )
]

#slide()[
  == Boltzmann-Uehling-Uhlenbeck (BUU)  (1990s) - Dynamic Formation
  #place(dx: 0%, dy: 95.75%)[
    #my_ref(
      journal: "Nuc. Phys. A",
      volume: "569(3)",
      id: "575-602",
      year: 1994,
      url: "https://www.sciencedirect.com/science/article/pii/0375947494903204",
    )
  ]
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
      - Direct collisions produced outwardly expanding rings.
      #v(1fr)
      - Ring expansions temporarily slowed
      #v(1fr)
      - Eventual decay into symmetric particles
        - $r_"particle" approx d_"toroid"$
      #v(1fr)
    ],
  )
]

#slide()[
  == Cranked Skyrme Hartree Fock (cSHF) (2010s) - Specific State Predictions
  #place(dx: 0pt, dy: 95.75%)[
    #my_ref(
      journal: "Phys. Rev. Lett.",
      volume: "109",
      id: "232503",
      year: 2012,
      url: "https://journals.aps.org/prl/pdf/10.1103/PhysRevLett.109.232503",
    )
  ]
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
        - Predicted state in #ca40
          - $J_z=60 planck$
          - $E^* approx 175 "MeV"$

        #v(1fr)
        #uncover(2)[
          Angular momentum and mass consistent with Wong's LDM
        ]
        #v(1fr)
      ]
    ],
    align(center)[
      #block[
        #uncover(2)[
          #image("figures/screenshots/Wong1978_Fig7.png", width: 94%)
          #place(dx: 79pt, dy: -101pt)[#circle(radius: 6pt, stroke: red.darken(60%) + 3pt)]
        ]
      ]
    ],
  )

]



#slide()[
  == Cranked Skyrme Hartree Fock (cSHF) (2010s) - Specific State Predictions
  #place(dx: 0pt, dy: 95.75%)[
    #my_ref(
      journal: "Phys. Lett. B",
      volume: "738",
      id: "401-404",
      year: 2014,
      url: "https://www.sciencedirect.com/science/article/pii/S0370269314007369",
    )
  ]
  #place(dx: 25%, dy: 95.75%)[ #my_ref(
    journal: "Phys. Rev. C",
    volume: "99",
    id: "014606",
    year: 2019,
    url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.99.014606",
  )]
  #grid(
    columns: (.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    // rows:(3.0cm),
    // 2012

    [
      #align(left)[
        #only(1)[#align(center)[#image("figures/screenshots/Wong2018_Fig3.jpg", height: 85%)]]
        #only("2-")[
          #v(1fr)
          - Ichikawa's state is reproduced
          #v(1fr)
          - Many predictions $=>$ trends
            - Low-density states
            - Minor axis radius $~$ $alpha$ radius

          #box(
            radius: 10pt,
            stroke: black,
            inset: 10pt,
            [Toroidal states, should they exist, might decay through several $alpha$ particles],
          )

          #v(1fr)
          - Many states to look for


          #v(1fr)
        ]
      ]
    ],
    align(center)[
      #v(.75cm)
      A. Staszczak and C.-Y. Wong predict 18 toroidal isomers
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
        #place(dx: 283pt, dy: -280pt, box(stroke: red.darken(50%) + 3pt, width: 160pt, height: 270pt, radius: 10pt))
      ]
      #only(5)[
        #place(dx: 36pt, dy: -280pt, box(stroke: red.darken(50%) + 3pt, width: 150pt, height: 270pt, radius: 10pt))
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
    journal: "Phys. Rev. C",
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
        *Neutron Ion Multidetector for Reaction Oriented Dynamics\ (NIMROD)*
        #v(1fr)
        #box(radius: 15pt, clip: true, stroke: black + 3pt, image("figures/nimrod.jpg", width: 85%))
        $si28 + c12$ @ 35 MeV/u
      ]
    ],
  )


]

#slide[
  == First Experimental Evidence (2019) - Cao _et al._, JBN Group
  // footer
  #place(dx: 0pt, dy: 95.75%)[ #my_ref(
    journal: "Phys. Rev. C",
    volume: "99",
    id: "014606",
    year: 2019,
    url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.99.014606",
  )]

  #grid(
    ..grid_default,
    columns: (1.9fr, 2fr, 1.6fr),
    align(left)[
      #v(.5cm)
      - Reaction
        - $si28 + c12$ @ 35 MeV/u
        - Part of 2009 experimental series
      #v(1fr)
      - Sample Size
        - 6,467 events w/ 7$alpha$
      #v(1fr)
      - Resolution for $E^*$ from $7alpha$
        - $~9.4$ MeV (FWHM) in ROI
        - Position-insensitive detectors
      #v(1fr)
    ],
    align(center)[
      #image("figures/cao_2019/7alphaSpectrum.png", height: 92%)
    ],
    align(left)[
      #v(.5cm)
      - Nonresonant Background
        - Mixed Events
        - #dim[Shifted AMD Distribution]
      #v(1fr)
      - Extracted Peaks
        - $E^* = bold(114), bold(126), "&" bold(138)$ MeV
        - FWHM dominated by resolution

      #v(1fr)
      #quote[Clearly an experiment with much better angular resolution, allowing better resolution for the excitation energy spectrum, will be very desirable.]

      #v(1fr)
    ],
  )
]






#slide[
  == Forward Array Using Silicon Technology (FAUST)
  #grid(
    ..grid_default,
    // ..grid_debug,
    columns: (1fr, 1.5fr),
    align(center + horizon)[
      // *Forward Array Using Silicon Technology (FAUST)*
      // #v(0.5em)
      #grid(
        ..grid_default,
        columns: (2fr, 1.5fr),
        rows: 188pt,

        [

          #box(
            radius: 15pt,
            clip: true,
            stroke: black + 3pt,
            image(
              "figures/faust.png",
              width: 110%,
              height: 110%,
            ),
            width: 100%,
            height: 100%,
          )
        ],

        [
          #box(
            radius: 15pt,
            clip: true,
            stroke: black + 3pt,
            image(
              "figures/dadl.png",

              width: 110%,
              height: 110%,
            ),
            // width: 100%,
            height: 100%,
          )

        ],
      )
      #box(stroke: black, radius: 5pt, clip: true, image("faust_renders/detectors_only.png", height: 30%))
    ],
    align(left)[
      *Forward Array Using Silicon Technology (FAUST)*
      - 68 Si-CsI(Tl) telescopes
        - Excellent forward coverage #dim[($1.7 degree$-- $~40 degree$)]
        - Lab energy #dim[(Thick CsI stops particles)]
        - Isotopic particle identification #dim[($E$--$Delta E$ technique)]
        - Lab angle #dim[(Dual-Axis Duo-Lateral detectors)]
      #v(1fr)
      #only(1)[
        #align(center)[
          #image("figures/FAUST_3D_2.png", height: 60%)
        ]
      ]
      #only(2)[
        *Measured Reactions*
        - Target: #c12
        - Beam Energy: 35 MeV/u
        - Projectiles
          - #o16, #ne20, #mg24 #dim[(Develop analytical techniques + future cluster studies)]
          - #si28 #dim[(Andy Hannaman's thesis work -- confirm and characterize states from Cao _et al_)]
          - #s32, #ar36 #dim[(Search for new states predicted by Wong)]
      ]
      #v(1fr)

    ],
  )
  #v(1fr)
]

#slide[
  == Second Experimental Result (2024)
  // footer
  #place(dx: 0pt, dy: 95.75%)[ #my_ref(
    journal: "Phys. Rev. C",
    volume: "109",
    id: "054615",
    year: 2024,
    url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.109.054615",
  )]

  #grid(
    ..grid_default,
    columns: (1.9fr, 2fr, 1.6fr),
    align(left)[
      #v(.5cm)
      - Reaction
        - $si28 + c12$ @ 35 MeV/u
        - Dedicated measurement for toroidal search
      #v(1fr)
      - Sample Size
        - 187,067 Events w/ 7$alpha$ ($"x"29arrow.t$)
      #v(1fr)
      - Resolution for $E^*$ from $7alpha$
        - $~2.5$ MeV (FWHM) in ROI ($"x"3.5arrow.b$)
      #v(1fr)
    ],
    align(center + horizon)[
      #image("figures/hannaman_2023/7alphaSpectrum.png", width: 100%)
    ],
    // align(left)[
    //   #v(.5cm)
    //   - No obvious peaks in the raw spectrum.
    //
    //
    //   #v(1fr)
    //   - Need Background
    //     // - AMD
    //     - Simulations
    //       - Systematics  hard to constrain
    //     - Mixed Events
    //       - Known bias (see next slides)
    //   #v(1fr)
    //   *A physically motivated, well benchmarked, and data driven background estimate is required for confident interpretation*
    // ],
    align(left)[
      #v(.5cm)
      - *No obvious peaks in the raw spectrum.*
        - Despite being more sensitive measurement

      #only(2)[
      #v(1fr)
      - Simulated Background
        - Systematics  hard to constrain
      #v(1fr)
      - Mixed Events Background
        - Known bias (see next slides)
      #v(1fr)

      - Original analysis suggests peaks must be smaller or broader than originally suggested.
    ]

      // *A physically motivated, well benchmarked, and data driven background estimate is required for confident interpretation*
    ],
  )
]

#focus-slide[
       *A physically-motivated, validated, and data-driven background estimate is required for confident interpretation of the $bold(N alpha)$ $bold(E^*)$ spectra*.
]

#slide[
  == One way we know mixed events are imperfect (for this purpose)
  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [
      === A Case Study on $d$-$d$-$d$
      // #text(size:10pt)[taken from $isotope("O", a:16) + isotope("C", a:"nat")$ data.]

      Any signals should be *rare to nonexistent*


      #text(size: 12pt)[
        High-energy excitation, de-exciting by unlikely channel twice
      ]
      #text(size: 12pt, fill: luma(50%))[
        - $Q(isotope("Li", a: 6)->3d) = -25.32 "MeV"$
        - $Q(alpha->2d) = -23.84 "MeV"$
        - $Q(d->p n) = -2.22 "MeV"$
      ]
      #box(
        [$
          & isotope("Li", a: 6)(E^* > 25.32 "MeV") \
          \
          & #h(1.5cm)->alpha^*(E^*>23.8 "MeV") \
          & #h(2cm) + #h(.5em)d(E^*<2.2 "MeV") \
          \
          & #h(1.5cm)->3d(E^*< 2.2 "MeV") \
        $],
        stroke: black,
        inset: 5pt,
        radius: 5pt,
      )

      $
        "Total" = "Background"+#strike("Signal")
      $


      #v(1fr)
    ],
    [
      #image("figures/3d/3d_summary_1_real.png", height: 85%)
    ],
  )
]


#slide[
  == Creating a Mixed Event


  #let box_radius = 8pt
  #v(.5cm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 0pt,
    align(center)[*Real Events*],
    align(center)[#only("2-")[*Selected Events*]],
    align(center)[#only("3-")[*Mixed Events*]],
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

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Select particles from separate events][

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Construct new event
    ]
    #v(1fr)
  ]]
]

#slide[
  == One way we know mixed events are imperfect (for this purpose)

  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [

      #v(1fr)
     
      #text(fill: slateblue, weight:"bold")[Mixed] $bold(!=)$ *Total*
      

      #v(1fr)
      - Mixing events removes particle-particle correlations, including:
        - 3-particle resonances (good)
        - Coulomb repulsion (bad)
        - 2-particle resonances (bad)

      #v(1fr)
      - Need a way to #text(fill: black)[*remove 3-particle*] correlations while *preserving 2-particle* correlations


      #v(1fr)
    ],
    [
      #image("figures/3d/3d_summary_2_real_mixed.png", height: 85%)
    ],
  )
]

#slide[
  == Creating a _Partially_ Mixed Event


  #let box_radius = 8pt
  #v(.5cm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 0pt,
    align(center)[*Real Events*],
    align(center)[#only("2-")[*Selected Events*]],
    align(center)[#only("3-")[*Partially Mixed Events*]],
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
        #box(stroke: black, radius: box_radius, image("faust_renders/real_hl_1_2.png", width: 80%))
      ]
    ],
    align(center)[
      #only("3-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/partial_mixed_1.png", width: 80%))
      ]
    ],

    align(center)[
      #only("1-")[
        #box(stroke: black, radius: box_radius, image("faust_renders/real_2.png", width: 80%))
      ]
    ],
    align(center)[
      #only("2-")[
        // #box(stroke: black, radius: box_radius, image("faust_renders/real_hl_2.png", width: 80%))
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

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Select particles from separate events][

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Construct new event
    ]
    #v(1fr)
  ]]
]
#slide[
  == Incorporating one of the $bold(d)$--$bold(d)$ correlations

  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [
      #v(1fr)

      - Partial mixing (PM) provides a minor improvement over full mixing (FM).

      #v(1fr)

      - PM is $~1/3$ of the way between FM and Real in the inverse CDF
      #v(1fr)
    ],
    [
      #image("figures/3d/3d_summary_3_real_mixed_partial.png", height: 85%)
      #only(2)[
        #place(dx:158pt, dy:-218pt)[
        #box(stroke:red+5pt, width:48pt, height:55pt, radius:5pt)
      ]
    ]
    ],
  )
]
#slide[
  #only(1)[== Measure the impact of one $bold(d)$--$bold(d)$ correlation]
  #only(2)[== Extrapolate the impact to three $bold(d)$--$bold(d)$ correlations]

  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [
      #v(1fr)
      *Number of $bold(d)$--$bold(d)$ correlations*
      #box(
        [
          *Real:* $binom(3, 2) = 3$
          #v(0.5cm)
          #place(dx: 0pt, dy: -31pt, line(stroke: black + 3pt, length: 2.3em))
          #text(fill: slateblue)[*Partially Mixed:*] $binom(2, 2) + binom(1, 2)= 1$
          #place(dx: 0pt, dy: -17pt, line(stroke: (paint: slateblue, thickness: 3pt, dash: "dashed"), length: 7em))
          #v(0.5cm)
          #text(fill: slateblue)[*Mixed:*] 3$binom(1, 2) = 0$
          #place(dx: 0pt, dy: 2pt, line(stroke: slateblue + 3pt, length: 3em))
        ],
        stroke: black,
        inset: 15pt,
        radius: 5pt,
      )

      #v(2fr)
      - Quantile mapping: Horizontal shifts in the CDF
        - Frequently used in climate change studies
      #v(1fr)
    ],
    [
      #box(
        [
          #only(1)[#image("figures/3d/cdf_no_red_points.png", height: 85%)]
          #only(2)[#image("figures/3d/cdf_only_red_8p0.png", height: 85%)]
          #only(1)[
          #place(dx: 240pt, dy: -135pt)[
              Quantify impact of adding \
              single $d$-$d$ correlation through\
              inverse CDF of FM and PM
            ]
          ]
          #only(2)[
          #place(dx: 240pt, dy: -135pt)[
              Extrapolate that effect to\ 
              correct FM for the proper\
              number of $d$-$d$ correlations
            ]
          ]
          #place(dx: 205pt, dy: -223pt)[
            #cetz.canvas({
              import cetz.draw: line

              line(
                (0, 0),
                (1.3, 0),
                mark: (end: "stealth", fill: black),
                stroke: black + 4pt,
              )
            })]
          #only("2-")[
          #place(dx: 240pt, dy: -223pt)[
            #cetz.canvas({
              import cetz.draw: line

              line(
                (0, -1),
                (1.3, -1),
                mark: (end: "stealth", fill: black),
                stroke: black + 4pt,
              )
            })]
          #place(dx: 275pt, dy: -223pt)[
            #cetz.canvas({
              import cetz.draw: line

              line(
                (0, -1),
                (1.3, -1),
                mark: (end: "stealth", fill: black),
                stroke: black + 4pt,
              )
            })]
          ]
        ],
      )

    ],
  )
]

#slide[
  == Derive new background through CDF

  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [
      #v(1fr)
      === Novel Estimation of the Nonresonant Background

      #box(
        [
          + Measure the systematic impact of introducing a single 2-particle correlation, via the transformation from FM to PM

          + Propagate that systematic change an additional 2 times to account for all three 2-particle correlations
        ],
        stroke: black,
        radius: 10pt,
        inset: 10pt,
      )


      #v(1fr)
    ],
    [
      #image("figures/3d/3d_summary_4_real_mixed_partial_bg.png", height: 85%)
    ],
  )
]
#slide[
  == Statistical Check

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #image("figures/3d/3d.png", height: 92%)
    ],
    [
      Does the *#text(fill: red)[Background]* match the *Total Real*?
      - 'Zero Parameter Fit'

      - $bold(chi^2 slash "dof" = 0.96)$  (1 is ideal)

      - $bold(P = 0.4998)$ (0.5 is ideal)
        - Resample the model and assess how often a more extreme $chi^2 slash"dof"$ is observed

      
      #v(.5fr)
      - Residuals and ratios show no systematic issues
      #v(1fr)
      #box(
        [The background spectrum is statistically consistent with the measured spectrum.],
        stroke: black,
        radius: 5pt,
        inset: 5pt,
      )
      #v(1fr)

    //   #only(2)[
    //   *Real:* Allowed to have 3-particle correlations, but physically shouldn't
    //
    //   #text(fill: red)[*Background:*] Constructed in the absence of 3-particle correlations.
    // ]

    ],
  )
]

#slide[
  == Another Case Study: $bold(be8->p+t+alpha)$

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #v(1cm)
      #image("figures/pta/pta_figure4_no_signal_mcmc.png", height: 85%)



      #v(1fr)
    ],
    [

      
      #v(1fr)
      - Real resonances of $be8$ are present around $E^* = 23 "MeV"$ .
      #v(1fr)
      - 2-particle correlations are nonidentical
        - More partially mixed events

      #v(1fr)
      #box(
        [The data are visually inconsistent with a description of the data that excludes signals.],
        stroke: black,
        radius: 5pt,
        inset: 5pt,
      )

      #v(1fr)
      - A modified model which includes 3-particle correlations is required.
      #v(1fr)


    ],
  )
]

#slide[
  == Another Case Study: $bold(be8->p+t+alpha)$

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #v(1cm)
      #image("figures/pta/pta_figure4_signal_bands_mcmc.png", height: 85%)


      #v(1fr)
    ],
    [
      #v(1fr)
      - Approximate double-Gaussian model leads to a reasonable total spectrum fit.

      #v(1fr)
      #box(
        [The data are visually consistent with a description of the data that includes a double-Gaussian signal.],
        stroke: black,
        radius: 5pt,
        inset: 5pt,
      )

      #v(1fr)
      - Real states are recovered within fitting error
      #v(1fr)


    ],
  )
]

#slide[
  == Quick Recap
  #v(1fr)
  === Mixed Events do NOT provide a reasonable description for the non-resonant background.
  #v(1fr)
  === For systems with 3 or more particles, [Fully] Mixed Events can be corrected through the Partially Mixed Events.
  #v(1fr)
  === In systems with physically no resonances, no signal needs to be added to describe the experimental data.
  #v(1fr)
  === In systems with resonances, peaks must be incorporated into a total spectrum fit.
  #v(1fr)
]

#slide[
  == $bold(7alpha)$ $bold(E^*)$ spectrum (no signal model)

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #v(1cm)
      #image("figures/7a/7a.png", height: 85%)


      #v(1fr)
    ],
    [
      *Number of $bold(alpha)$--$bold(alpha)$ correlations*
      #box(
        [
          *Real:* $binom(7, 2) = 21$
          #v(0.5cm)
          #place(dx: 0pt, dy: -31pt, line(stroke: black + 3pt, length: 2.3em))
          #text(fill: slateblue)[*Partially Mixed:*] $binom(6, 2) + binom(1, 2)= 15$
          #place(dx: 0pt, dy: -17pt, line(stroke: (paint: slateblue, thickness: 3pt, dash: "dashed"), length: 7em))
          #v(0.5cm)
          #text(fill: slateblue)[*Mixed:*] 7$binom(1, 2) = 0$
          #place(dx: 0pt, dy: 2pt, line(stroke: slateblue + 3pt, length: 3em))
        ],
        stroke: black,
        inset: 15pt,
        radius: 5pt,
      )

      - Partial mixing incorporates $15 slash 21$ of the two-particle correlations

      #only(2)[
      #v(1fr)
      - Visually, pretty good description

      // - Imperfect fit
      //   - $bold(chi^2 slash "dof" = 1.35)$  (1 is ideal)
      //   - $bold(P = 0.005)$ (0.5 is ideal)

      #v(1fr)
      - Minor deviation at low energy
        - Detector hit pattern bias
      #v(1fr)
    ]
    ],
  )
]

#slide[
  == $bold(7alpha)$ $bold(E^*)$ spectrum (no signal model; hit pattern corrected)

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #v(1cm)
      #image("figures/7a/7a_preserve_mix.png", height: 85%)


      #v(1fr)
    ],
    [

      #v(1fr)
      - Modify mixing procedure so FM and PM result in same per-event hit pattern as the real data

      #v(1fr)
      - Great description of the data
        - $bold(chi^2 slash "dof" = 1.09)$  (1 is ideal)
        - $bold(P = 0.52)$ (0.5 is ideal)

      #v(1fr)
      - No perceivable systematic deviations
        - *Measured $bold(7alpha)$ distribution is statistically consistent with no resonances*
        - Further work needed to set upper limits of detection
      #v(1fr)
    ],
  )
]

#slide[
  #grid(
    ..grid_default,
    columns: (1fr),
    [
      == Summary
      #v(1fr)
      Toroidal nuclei are exciting nuclear structures with decades of theoretical support.

      #v(1fr)
      Experimental investigations in 2018 motivated a series of higher-precision measurements of $N alpha$ $E^*$ spectra, searching for toroidal isomers in $si28$, $s32$, and $ar36$.



      #v(1fr)
      Deeper investigation of the biases of mixed events led to a much more accurate description of the background.

      #v(1fr)
      No statistically significant evidence for toroidal states was observed in the $7alpha$ $E^*$ distribution of $si28 + c12$ @ 35 MeV/u.
        - Upper limits studies are to follow (Liklihood ratio + MCMC).
        - The $N alpha$ systems of the $s32$ and $ar36$ data are slated to be analyzed shortly.
      #v(1fr)
    ],
  )
]

#slide[
  == Acknowledgments
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
    image(height: 90%, "pir_2025/seminar/fig/pics/group.jpg"),
    [
      #v(1fr)
      - *Committee*
        - Cody Folden
        - Jeremy Holt
        - Dan Melconian
        - _Sherry Yennello_
      - *SJY Group*
        - Andy Hannaman
        - Travis Hankins
        - Alan McIntosh
        - Kris Hagel
      #v(1fr)
        #box(stroke: black, clip: true, inset: (top: -100%, bottom: -100%))[#image(width: 100%, "pir_2025/seminar/fig/pics/doe.png")]
      - Department of Energy: DE-FG02-93ER40773
      #v(1fr)
    ],
  )
]
#slide[
  #align(center)[== Questions and Comments Welcome]

#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/screenshots/Wong1978_Fig7.png", height: 40%)]
#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/screenshots/Wong2018_Fig3.jpg", height: 40%)]
#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/cao_2019/7alphaSpectrum.png", height: 40%)]
#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/hannaman_2023/7alphaSpectrum.png", height: 40%)]
#h(1fr)

#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/3d/3d.png", height: 40%)]
#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/pta/pta_figure4_signal_bands_mcmc.png", height: 40%)]
#h(1fr)
#box(stroke:black, radius :10pt, inset :5pt )[#image("figures/7a/7a_preserve_mix.png", height: 40%)]
#h(1fr)


]




#if show-backup-slides [
#focus-slide[= Backup Slides]
#slide[
  == Outline
  <outline-slide>
  #outline()
]

#slide[
  = $bold(E_(3alpha, "rel"))$ versus $bold(E_(2alpha, "rel"))$
  #grid(
    columns: (3fr, 3fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #image("pir_2025/fig/3a_v_2a.png", height: 92%)
      #v(1fr)
    ],
    align(center)[
      $E_(3alpha, "rel") = 2.5 "MeV" plus.minus 80 "keV"$
      #image("pir_2025/fig/2a_gated.png", width: 76%)
      $E_(3alpha, "rel") = 6.5 "MeV" plus.minus 80 "keV"$
      #image("pir_2025/fig/2a_gated_2.png", width: 76%)
    ],
  )
]








#slide[
  = $bold(E_(3alpha, "rel"))$ versus $bold(E_(2alpha, "rel"))$ Decomposition
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align(horizon)[
      #v(1fr)
      #image("pir_2025/fig/tot.png", width: 100%)
      #v(1fr)
    ],
    align(horizon)[
      #v(1fr)
      #image("pir_2025/fig/sig.png", width: 100%)
      #v(1fr)
    ],
    align(horizon)[
      #v(1fr)
      #image("pir_2025/fig/kin.png", width: 100%)
      #v(1fr)
    ],
  )
]





//
//
//
//
//
#slide[
  == #text(size: 12pt)[An Incomplete] Theoretical Background (Pre Cao _et al._)
  //
  //
  //
  //
  //
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: black,
    //
    align()[
      #grid(
        columns: (1fr, 1.75fr),
        gutter: 8pt,
        inset: 2pt,
        stroke: none,
        image(height: 110pt, "pir_2025/seminar/fig/wong_1978_fig7.png"),
        [
          #my_ref(
            journal: "Phys. Rev. C",
            volume: "17",
            year: "1978",
            id: "331",
            url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.17.331",
          )

          - Bulk regions of $l$-$A$ space give theoretical toroidal stability
        ],
      )
    ],

    // 2012
    align()[
      #grid(
        columns: (1.5fr, 1fr),
        gutter: 8pt,
        inset: 2pt,
        stroke: none,
        image(height: 110pt, "pir_2025/seminar/fig/ichikawa_2012_fig1.png"),
        [
          // T. Ichikawa
          #my_ref(
            journal: "Phys. Rev. Lett.",
            volume: "109",
            year: "2012",
            id: "1103",
            url: "https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.109.232503",
          )

          - HF suggests $isotope("Ca", a:40)^*$ state at $170 "MeV"$
        ],
      )
    ],
    // 2018
    align()[
      #grid(
        columns: (1fr, 0.5fr),
        gutter: 8pt,
        inset: 2pt,
        stroke: none,
        image(height: 190pt, "pir_2025/seminar/fig/wong_2018_fig3.png"),
        [
          #my_ref(
            journal: "Phys. Rev. C",
            volume: "98",
            year: "2018",
            id: "034316",
            url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.98.034316",
          )

          - Single particle excitation energies explored as a function of deformation
        ],
      )
    ],
    // 2014
    align()[
      #box(
        grid(
          columns: (1fr, 1.75fr),
          gutter: 8pt,
          inset: 2pt,
          stroke: none,
          image(height: 190pt, "pir_2025/seminar/fig/wong_2014_fig3.jpg"),
          [
            // Cheuk-Yin Wong
            #my_ref(
              journal: "Phys. Lett. B",
              volume: "738",
              year: "2014",
              id: "401",
              url: "https://www.sciencedirect.com/science/article/pii/S0370269314007369?via%3Dihub",
            )

            - Cranked Skyrme-HFB
            - *Specific $bold(E^*)$ and $bold(I)$ predictions*

            - For $si28$:

              #h(0.5cm) $E^* = 143.18 "MeV"$

              #h(0.5cm) $I = 44 planck.reduce$
          ],
        ),
      )

    ],
  )
]

//
//
//
//
//

//
//
//
//
//


//
//
//
//
//
#slide[
  == Experimental Background - FAUST (Hannaman _et al._)
  //
  //
  //
  //
  //
  #grid(
    columns: (0.8fr, 0.8fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    stroke: none,
    align(center)[

      #strong[F]orward #strong[A]rray #linebreak() #strong[U]sing #strong[S]ilicon #strong[T]echnology

      #image(width: 100%, "pir_2025/seminar/fig/pics/faust.png")

    ],
    align(center)[
      #align(center + horizon)[ #box(image(width: 100%, "pir_2025/seminar/fig/hannaman_5_8_mixed.png"))]

      #my_ref(
        journal: "Phys. Rev. C",
        volume: "109",
        year: "2024",
        id: "054615",
        url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.109.054615",
      )
    ],
    align()[
      #v(1fr)
      - Targetted search for high $E^*$ states in #si28
      #v(1fr)
      #line()
      #v(1fr)

      - \~2.5 MeV FWHM at 138 MeV ($arrow.b 3.75"x" $)
      #v(1fr)
      - \~186k $7alpha$ events ($arrow.t 29"x" $)
      #v(1fr)
      #line()
      #v(1fr)
      No strong narrow structure at 114, 126, or 138 MeV

      #v(1fr)
      #line()
      #v(1fr)
      - No accurate background estimate #linebreak()
        #h(0.5cm) #emoji.crossmark Mixed Events#linebreak()
        #h(0.5cm) #emoji.crossmark MD Sims

      #v(1fr)
    ],
  )
]

//
//
//
//
//
#slide[
  == Polynomial Fit
  //
  //
  //
  //
  //
  #grid(
    columns: (1fr, 1.3fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(height: 90%, "pir_2025/seminar/fig/hannaman_poly_fit.png"), stroke: none)
    ],
    [
      #v(1fr)
      - The _only_ purpose of this fit is to demonstrate the entire spectrum is consistent with some broad, 'featureless' description.
        - 'featureless' - no prominent oscillations on scales below 10 MeV

      #v(1fr)
      - The fit is good:
        - Residuals shown
        - $chi_nu^2 = 1.01$
      #v(1fr)
      - Only claim that #quote(["no strong evidence was found for statistically significant resonant state yield in the seven $alpha$-particle channel"]).
      #v(1fr)
    ],
  )
]

#slide[
  == Common Themes when Discussing Peaks
  //
  //
  //
  //
  //
  #v(1cm)
  #grid(
    columns: (1.5fr, 1fr, 1.5fr),
    gutter: 10pt,
    align(horizon)[

      === When is a feature consistent with another?
      Absolute difference?

      Statistical significance?

      Measurement Error?

      'Close to', 'reproduces', etc.

      #v(1fr)

      === What is the background?
      Shape

      Size

      Confidence

      Importance
      #v(1cm)
    ],
    align(horizon + right)[],
    align(horizon + right)[

      === Use of Polynomial
      What does the fit represent?

      What conclusions can be drawn from the fit?
      #v(1fr)
      === Quality of Calibration
      Accuracy

      Stability
      #v(1fr)
      === General Statistics
      Independence of samples

      Signficance of deviations in spectra

      Systematics of comparisons to experiment
      #v(1cm)
    ],
  )
]

#focus-slide[= Discussion of the Polynomial Fit]




#slide[
  == Polynomial Roots

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #v(1fr)

      #quote(["First, any peak can be fit with a non-linear polynomial, given enough terms. This in turn leads to a loss of possible real peaks in the subtraction" --- $section 2 "par" 1$])

      #v(1fr)
      - Note, any broad distribution can also be fit with a linear combination of Gaussians, given enough terms.
      #v(1fr)
      - We explicitly allow for the possibility of very rare and wide features hiding in the statistical noise and background uncertainty
        - They would just need to be more prominent than the NIMROD analysis suggests
      #v(1fr)
    ],
    [
      #box(image(height: 90%, "pir_2025/seminar/fig/hannaman_poly_fit.png"), stroke: none)
    ],
  )
]







#slide[
  == Polynomial Roots

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #v(1fr)
      #quote(["Second, a polynomial function possesses several 'special' points of maxima, minima and inflections that are given by the roots of each derivative of the polynomial. Since a polynomial of order N, can in principle have at most N roots, a subtractive analysis yields additional structure that is not present in the data. In our analysis, we obtain the “special” points numerically for each dataset, by fitting a 9th order polynomial and accept the roots on each derivative if they are real and their value of the next derivative is negative (2nd Derivative Criterion)." --- $section 2 "par" 1$])
      #v(1fr)

      - There are not prominent fluctuations in the polynomial on the few MeV scale

      - Checked derivatives and integral
      - Also no structure in the std. residuals
      #v(1fr)

    ],
    [
      #box(image(height: 90%, "pir_2025/seminar/fig/hannaman_poly_fit.png"), stroke: none)
    ],
  )
]

#focus-slide[= There is not statistically significant evidence for gain drifts in the time-ordered $bold(E^*_(7alpha))$ spectrum]






#slide[
  == Looking for Gain Drifts
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #quote(["We note that the excitation energies of each partition
        fluctuate around the full statistics value, with only variation of $approx 2.6%$. Their common tendencies might correspond to
        minor experimental shifts, which in our method are mostly compensated by the larger fluctuation of the widths."])

      #v(1fr)
      - No matter how you partition the time-ordered data, you always end up with statistically consistent spectra

      #v(1fr)
      - Right: a \~50-50 split for example

      #v(1fr)

      - Disclaimer: Treating Poisson as simple $sqrt(N)$ due to timing constraints
        - (Careful looking too hard at the high $E^*$ tail)
      #v(1fr)

    ],
    [
      #box(image(height: 90%, "pir_2025/seminar/fig/calib/calib_natowitz_split.png"), stroke: none)

    ],
  )
]








#slide[
  == 8-fold split
  #grid(
    columns: (2fr, 1fr),
    align(horizon)[
      #box(figure(image(height: 90%, "pir_2025/seminar/fig/calib/monster_std_res.png")), stroke: none)
    ],
    [
      #v(1fr)
      - *BLACK:* Time ordered
      - #text(stroke: none, fill: red.darken(20%), [*RED:* Time shuffled])
      #v(1fr)

      - Variances of standardized residuals range from \~0.78 - \~1.4 for both
        - Typically between 0.85 and 1.15 for both


      #v(1fr)

    ],
  )
]








#slide[
  == $bold(3alpha)$ Spectra
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 20pt,
    align(center)[
      #box(image(height: 85%, "pir_2025/seminar/fig/calib/3a_full.png"))
    ],
    align(center)[
      #box(image(height: 85%, "pir_2025/seminar/fig/calib/3a_zoom.png"))
    ],
    align()[
      #v(1fr)
      - Time ordered event index versus $3alpha$-$E_"rel"$
      #v(1fr)
      - $c12(3^-)$ accurately reproduced
      #v(1fr)
      //- There is no statistically unexcpected difference between the time ordered partition
      - #box([There is no evidence for gain drifts], stroke: black, inset: 3pt)
      #v(1fr)
    ],
  )
]






















#slide[
  == With Shuffle
  #box(image(height: 90%, "pir_2025/seminar/fig/calib/calib_natowitz_split_with_shuffle.png"), stroke: none)
]



#slide[
  == Comparison of Theory to Experiment w/o Experimental Response
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[

      #box(image(width: 100%, "pir_2025/seminar/fig/theory_to_exp.png"), clip: true, inset: (top: -5%), stroke: none)

    ],
    [
      "We observe that the new cH$alpha$C calculation results converge to the experimental data in the high $E^∗$ tail, while they are generally higher at lower $E^∗$ values. ...
      //This is consistent with the trend of the toroid silicon calculations [21]. This implies a high degree of clusterization for the

      //most energetic fragments in the experimental data.
      #h(1cm)... On the contrary, for lower excitation energies, there are many open non-α-conjugate exit channels not available in our model." --- $section 3 "par" 7$

      #v(1fr)

      - Simulations of FAUST and NIMROD responses were not used for this comparison.
      #v(1fr)
      - The (complex) effects of efficiency and resolution make direct comparisons dubious.
      #v(1fr)
      //- There are also more open non-$alpha$-conjugate exit channels available at high energy
      //- The lack of experimental data at low $E^*$ is consistent with granularity and resolution effects
    ],
  )
]

#slide[
  == We Would See Prominent, Narrow Resonances
  #box(image(height: 79%, "pir_2025/seminar/fig/sample_demo.png"), stroke: none)

]


#slide[
  == State of the Search as of 2023
  #box(image("pir_2025/seminar/fig/hannaman_thesis_5_9_forest.png"), height: 90%, clip: true, inset: (bottom: -27%))
]


//
//
//
//
//
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
        image(width: 90%, "aps_2026/TAPIR_listing.png"),
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
      //#image(height: 85%, "aps_2026/fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
      #v(1fr)
    ],
    align(center)[
      #image(height: 92%, "aps_2026/fig_7_final_result_comp.png")
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
      #image(height: 85%, "aps_2026/fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
    ],
    align(center)[
      #image(height: 92%, "aps_2026/fig_6_final_result.png")
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
      #image(height: 85%, "aps_2026/fig_2_faust_det_34_full_sqrt_xcsi_ysi_h11.2_w8.4.png")
    ],
    align(center)[
      #image(height: 92%, "aps_2026/fig_6_final_result.png")
    ],
  )
]

#slide[
  = FAUST Resolution / Efficiency
  #grid(
    columns: (3fr, 3fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #image("misc/FaustResolution.png")
      #v(1fr)
    ],
    align(left)[
      #v(1fr)
      - Mixed Events ran through FAUST Filter.
      #v(1fr)
      - Select thin gates of true energy
      #v(1fr)
      - Evaluate width of distribution after FAUST Filter
      #v(1fr)
    ],
  )
]
#slide[
  = FAUST Coverage
  #grid(
    columns: (3fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #image("misc/FaustCoverage.png", height:80%)
    ],
  )
  Photo Cred.: Travis Hankins
]
#slide[
  = DADL
  #grid(
    columns: (3fr,1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #image("misc/DadlDiagram.png", height:80%)
    ],
    align()[
      - Holes collected on Front ($p$-side)
      - Electrons collected on Back ($n$-side)
      - Reverse biased at \~40V
    ],
  )
]

#slide[
  == $bold(7alpha)$ $bold(E^*)$ spectrum (no signal model; hit pattern corrected)

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #v(1cm)
      #image("figures/7a/7a_preserve_mix.png", height: 85%)


      #v(1fr)
    ],
    [

      #v(1fr)
      - Modify mixing procedure so FM and PM result in same per-event hit pattern as the real data
      #v(1fr)

      - New Mixing:
        - Filter your events
        - Create a list of particles (tagged with event index) for each detector 
          - Hashmap from `(Z, A, Det.)->([Particle], [Ev. Idx])`
        - Select a real event
        - Select particles to preserve (1 for FM, $N-1$ for PM)
        - For the rest of the particles, swap them with a particle of the same type that hit the same detector

      - Preserves multidimensional hit pattern of real data.
      #v(1fr)

    ],
  )
]
#focus-slide[== PTA fit]
#slide[

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #image("figures/pta/pt_2d_before_mcmc.png", height: 85%)
    ],
    [
      #image("figures/pta/pt_2d_after_mcmc.png", height: 85%)
    ],
  )
]
#slide[

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #image("figures/pta/pa_2d_before_mcmc.png", height: 85%)
    ],
    [
      #image("figures/pta/pa_2d_after_mcmc.png", height: 85%)
    ],
  )
]
#slide[

  #grid(
    ..grid_default,
    columns: (1fr, 1fr),
    [
      #image("figures/pta/ta_2d_before_mcmc.png", height: 85%)
    ],
    [
      #image("figures/pta/ta_2d_after_mcmc.png", height: 85%)
    ],
  )
]

] // end show-backup-slides
