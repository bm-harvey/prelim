#import "@preview/slydst:0.1.4": *
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

// #let #place_ref(body) = #place(dx: 0pt, dy: 95.75%)[body]
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
        #image("figures/screenshots/Wong1978_Fig7.png", width: 97%)
      ]
    ],
  )
]

#slide()[
  == Boltzmann-Uehling-Uhlenbeck (BUU)  (1990s) - Dyanamic Formation
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
          #place(dx: 79pt, dy: -93pt)[#circle(radius: 6pt, stroke: red.darken(60%) + 3pt)]
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
          - Many predicitons $=>$ trends
            - Large low density states
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
        #place(dx: 283pt, dy: -280pt, box(stroke: red.darken(50%) + 3pt, width: 160pt, height: 270pt, radius: 10pt))
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
        - 6,467 Events w/ 7$alpha$
      #v(1fr)
      - Resolution for $E^*$ from $7alpha$
        - $~9.4$ MeV (FWHM) in ROI
        - Position insensitive detectors
      #v(1fr)
    ],
    align(center)[
      #image("figures/cao_2019/7alphaSpectrum.png", height: 92%)
    ],
    align(left)[
      #v(.5cm)
      - Nonresonant Background
        - Mixed Events
        - #dim[Shifted AMD distribution]
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
        - Excellent Forward Coverage #dim[($1.7 degree$-- $~40 degree$)]
        - Lab Energy #dim[(Thick CsI stops particles)]
        - Isotopic Particle Identification #dim[($E$--$Delta E$ technique)]
        - Lab Angle #dim[(Dual-Axis Duo-Lateral detectors)]
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
  == Second Experimental Result (2023)
  // footer
  #place(dx: 0pt, dy: 95.75%)[ #my_ref(
    journal: "Phys. Rev. C",
    volume: "109",
    id: "054615",
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
        - Despite being more sensitve measurement

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
       *A physically motivated, well benchmarked, and data driven background estimate is required for confident interpretation of the $bold(N alpha)$ $bold(E*)$ spectra*
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
        High energy excitation, deexciting by unlikely channel twice
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

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Select particles from seperate events][

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
      $
        #text(fill: slateblue, weight:"bold")[Mixed] != "Total"
      $

      #v(1fr)
      - Mixed Events removes particle-particle correlations including
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

      #text(size: 20pt, weight: "bold")[$bold(dot)$]#h(.25cm) Select particles from seperate events][

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
    ],
  )
]
#slide[
  == Incorporating one of the $bold(d)$--$bold(d)$ correlations

  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [
      #v(1fr)


      - Quantile Mapping: Horizontal shifts in the CDF
        - Used a lot in climate change studies
      #v(2fr)
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
      #v(1fr)
    ],
    [
      #box(
        [
          #image("figures/3d/cdf.png", height: 85%)
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
  == Novel Estimation of the Nonresonant Background

  #grid(
    ..grid_default,
    columns: (1fr, 2fr),
    [
      #v(1fr)

      #box(
        [
          + Measure systematic change by adding a 2-particle correlation through the change from FM to PM.

          + Propogate that systematic change an additional 2 times to account for all three 2-particle correlations
        ],
        stroke: black,
        radius: 5pt,
        inset: 5pt,
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
        - Resample the model, and assess how often a more extreme $chi^2 slash"dof"$ is observed

      
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
      - Real resonances of $be8$ are present around 23 MeV.

      #v(1fr)
      #box(
        [The data is inconsistent with a description of the data that excludes signals.],
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
      - Approximate double-Gaussian model leads to reasonable total spectrum fit.

      #v(1fr)
      #box(
        [The data is consistent with a description of the data that includes a double Gaussian signal.],
        stroke: black,
        radius: 5pt,
        inset: 5pt,
      )

      #v(1fr)


    ],
  )
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

      #v(1fr)
      - Visually, very good description

      // - Imperfect fit
      //   - $bold(chi^2 slash "dof" = 1.35)$  (1 is ideal)
      //   - $bold(P = 0.005)$ (0.5 is ideal)

      #v(1fr)
      - Minor deviation at low energy
        - Detector hit pattern bias
      #v(1fr)
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
      - No percievable systematic deviations
        - *Measured $bold(7alpha)$ distribution is statistically consistent with no resonances*
        - Further work needed to set upper limits of detection
      #v(1fr)
    ],
  )
]

#slide[
  // == Conclusions (so far)
  //

  #grid(
    ..grid_default,
    columns: (1fr),
    [
      == Conclusions
      #v(1fr)
      Toroidal nuclei are exciting nuclear structures with decades of theoretical support.

      #v(1fr)
      Experimental investigations in 2018 motivated a series higher precision measurements of $N alpha$ $E^*$ spectra, searching for toroidal isomers in $si28$, $s32$, and $ar36$.



      #v(1fr)
      Deeper investigation of the biases of mixed events led to a much more accurate description of the background.

      #v(1fr)
      No evidence for toroidal states was observed in the $7alpha$ $E^*$ distribution of $si28 + c12$ @ 35 MeV/u.
        - Upper limits studies are to follow
        - The $N alpha$ systems of the $s32$ and $ar36$ data are slated to be analyzed shortly
      #v(1fr)
    ],
  )
]

#slide[
== Acklowledgments
]




#slide[
  == Outline
  <outline-slide>
  #outline()
]
