
//#import "@preview/slydst:0.1.4": *
#import "@preview/polylux:0.4.0": *
#set page(paper: "presentation-16-9")
#import "cartoons.typ": *

#import "@preview/physica:0.9.3": isotope
#show math.equation: set text(font: "Fira Math")
#set text(font: "Fira Sans", size: 16pt)
#show heading.where(level: 1): set text(22pt, red.darken(40%))
#show heading.where(level: 2): set text(22pt, red.darken(40%))
#show heading.where(level: 3): set text(18pt, black)
#set page(margin: 0.5in)

//
// SLIDE TEMPLATE
//

//#slide[
//== Title
//#grid(
//columns: (1fr, 1fr),
//gutter: 8pt,
//inset: 6pt,

//align()[#lorem(30)], align()[#lorem(30)],
//)
//]

//
//
//


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
#let cnat = $isotope("C", a:"nat")$
#let o16 = $isotope("O", a:16)$
#let ne20 = $isotope("Ne", a:20)$
#let mg24 = $isotope("Mg", a:24)$
#let s32 = $isotope("S", a:32)$
#let ar36 = $isotope("Ar", a:36)$
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
      #text(fill: red.darken(40%))[Exploration of $bold(alpha)$-conjugate Decays Pathways]

    ]


  ]
  #line(stroke: black, length: 100%)

  //An overview over all the features

  Bryan M Harvey, December 3, 2025
]





//#slide[
//== Title
//#grid(
//columns: (1fr, 1fr),
//gutter: 8pt,
//inset: 6pt,

//align()[#lorem(30)], align()[#lorem(30)],
//)
//]

#slide[
  = Interplay of Structure and Reaction Rates
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      Structurally:
      - $be8(0^+)$ is very similar to two connected $alpha$s
      - $c12(0^+_2)$ is very similar to an $alpha$ connected to $be8(0^+)$

      #v(1fr)
      #align(center)[Triple-$alpha$ Process]
      $
        alpha + alpha + alpha -> be8(0^+) + alpha -> c12(0^+_2)
      $
      #align(center)[Studied via]
      $
        c12(0^+_2) -> be8(0^+) + alpha -> alpha + alpha + alpha
      $

      #v(1fr)
      Models now predict $alpha$-clusterization in nuclei as large as calcium
      #v(1fr)

    ],
    align()[

      - Can we see evidence of previously unexplored $alpha$-conjugate decay pathways in excited light-medium sized nuclei?
      //- Can we see evidence of previously unexplored $alpha$-conjugate decay pathways in excited light-medium sized nuclei?
      #v(1fr)

      $
        c12^* -> be8 + alpha &->3alpha\
        o16^* -> be8^(*?)+ be8^(*?) &-> 4alpha\
        o16^* -> alpha + c12^* &-> 4alpha\
        &#h(.4em) dots.v\
        mg24^* -> c12^*+c12^*&-> 6alpha\
      $
      #v(1fr)

      //- What analytical techniques need to be developed to

    ],
  )
]

#slide[
  = Experimental Design
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      === System
      - #o16 + #cnat \@ 35 MeV/u

        - Also have #ne20, #mg24, #si28, #s32, #ar36 projectiles
      //=== #underline([F])orward #underline([A])rray #underline([U])sing #underline([S])ilicon #underline([T])echnology (FAUST)
      === Forward Array Using Silicon Technology\ (FAUST)
      #grid(
        columns: (2fr, 1fr),
        gutter: 8pt,
        inset: 6pt,
        align()[
          - Charged Particle Identification
            - ($Delta E, E$) -> (Z, A)

          - Total Kinetic Energy
            - Particles stop in the thick CsI(Tl)
          - Postion Sensitivity
            //- Resistive pads on the faces of the Dual Axis Duo-Lateral Detectors
            - Achieve sub-mm position uncertainty
        ],
        align()[#box(image("fig/pics/dadl.png"), stroke: black + 8pt)
        ],
      )


    ],
    align(center)[#image(height: 78%, "fig/pics/faust.png")
      $
        E_"rel" = sum_i T_(i,"c.m")= E^* +Q_"rxn"
      $
      //$W^2 = sum_i E_i^2 - (sum_i bold(p)_i)^2$ #h(1fr)$E_"rel" = sum_i p_(i,"c.m.")^2/(2m)$
    ],
  )
]

#slide[
  = $bold(E_(3alpha, "rel"))$ (FIXME: ADD LABEL ASSETS FROM WPCF)
  #grid(
    columns: 1fr,
    gutter: 8pt,
    inset: 6pt,
    align(center)[
      #image("fig/3a.png", height: 80%)
    ]
  )
]
#slide[
  = $bold(E_(2alpha, "rel"))$ (FIXME: ADD LABEL ASSETS FROM WPCF)
  #grid(
    columns: 1fr,
    gutter: 8pt,
    inset: 6pt,
    align(center)[
      #image("fig/2a.png", height: 80%)
    ]
  )
]

#slide[
  = $bold(E_(3alpha, "rel"))$ versus $bold(E_(2alpha, "rel"))$
  #grid(
    columns: (3fr, 3fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #image("fig/3a_v_2a.png", height: 92%)
      #v(1fr)
    ],
    align(center)[
      $E_(3alpha, "rel") = 2.5 "MeV" plus.minus 80 "keV"$
      #image("fig/2a_gated.png", width: 76%)
      $E_(3alpha, "rel") = 6.5 "MeV" plus.minus 80 "keV"$
      #image("fig/2a_gated_2.png", width: 76%)
    ],
  )
]





#slide[

  == Kinematics (AUDIENCE, HELP WITH FLOW PLEASE)

  #grid(
    columns: (1.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align(center)[
      #v(1fr)
      $E_(3alpha, "rel") = 2.5 "MeV" plus.minus 80 "keV"$
      #image("fig/2a_gated.png", width: 68%)
      #v(1fr)
      #kin_diagram_1(size: 20pt)
      #v(1fr)
    ],
    align()[
      - Total Spectrum (Measured):
        $
          T(E_(2 alpha,"rel")) = U(E_(2 alpha,"rel")) + S(E_(2 alpha,"rel"))+ hat(K)[S(E_(2 alpha,"rel"))]
        $
      #v(1fr)
      - $U$ -- Uncorrelated (no $be8$)
      - $S$ -- Signal ($be8$)
      #v(1fr)
      - $hat(K)[S]$ -- Kinematically constrained contribution due to $S$.
        - Given a #text(fill:purple)[$bold(3alpha)$ $bold(E_"rel")$] and a real $bold(be8)$ $bold(2alpha)$ $bold(E_"rel")$, what is the distribution of #text(fill:blue, weight: "bold")[non-$bold(be8)$ $bold(2alpha)$ $bold(E_"rel")$]?
      #v(1fr)


    ],
  )
]

#slide[

  == Solution without proof

  #grid(
    columns: 1fr,
    gutter: 8pt,
    inset: 6pt,
    align(center)[
      $
        hat(K)[S(E_(2alpha, "rel"))] = 2 integral_(E_-)^(E_+) (S(x) d x) / (E_+ - E_-)
      $
      where
      $
        E_plus.minus (E_(2alpha,"rel");E_(3alpha,"rel")) = 3 / 4E_(3alpha,"rel") - 1 / 2E_(2alpha,"rel")plus.minus 1 / 2 sqrt(3E_(2alpha,"rel")(E_(3alpha,"rel") - E_(2alpha,"rel")))
      $
    ],
    align(center)[

      #v(1fr)
      Integral Equation to solve for $S$:
      $
        T(E_(2 alpha,"rel")) - U(E_(2 alpha,"rel")) = (1+hat(K)) S(E_(2 alpha,"rel"))
      $

      This is numerically solvable if $U$ is known.

      Make the (bad) assumption that $U=0$
      #v(1fr)



    ],
  )
]

#slide[
  == $bold(E_(2alpha, "rel"))$ Decomposition
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align(center)[
      #v(1fr)
      $E_(3alpha, "rel") = 2.5 "MeV" plus.minus 80 "keV"$
      #image("fig/decomp_2.5.png", width: 100%)
      #v(1fr)
    ],
    align(center)[
      #v(1fr)
      $E_(3alpha, "rel") = 6.5 "MeV" plus.minus 80 "keV"$
      #image("fig/decomp_6.5.png", width: 100%)
      #v(1fr)
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
      #image("fig/tot.png", width: 100%)
      #v(1fr)
    ],
    align(horizon)[
      #v(1fr)
      #image("fig/sig.png", width: 100%)
      #v(1fr)
    ],
    align(horizon)[
      #v(1fr)
      #image("fig/kin.png", width: 100%)
      #v(1fr)
    ],
  )
]

#slide[
  == TAPIR (??)
]
#slide[
  == Timeline
]
#slide[
  == Acknowledgements
]


#focus-slide([Extras])

#slide[
  = Sources of Background
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    //stroke: black,
    //
    align()[
      #three_alpha(size: 72pt)
    ],

    // 2012
    align()[
      #v(29pt)
      $3 alpha$ #h(1fr) (no $be8$ or $c12$)
      #v(52pt)
      $be8 + alpha-> 3alpha$ #h(1fr) (no $c12$)
      #v(49pt)
      $c12-> 3alpha$ #h(1fr) (no $be8$)
      #v(68pt)
      #rect($c12-> be8 + alpha -> 3alpha$, outset: 5pt)
    ],
  )
]

#slide[

  == Solve through velocities

  #grid(
    columns: (1.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #v(1fr)
      #kin_diagram_2(size: 20pt)
      #v(1fr)
    ],
    align(left)[
      #v(1fr)
      $
        v_(1,2,"rel")^2 = v_1^2 + v_2^2 - 2v_1v_2 cos theta
      $
      #v(1fr)

      For isotropic sampling, $cos theta$ is sampled uniformly.
      #v(1fr)

      $
        E_(1,2,"rel") = 2 (1 / 2 m_alpha (v_(1,2, "rel") / 2)^2) \
        v_(1,2,"rel")^2 = 4 E_(1,2,"rel") slash m_alpha
      $
      #v(1fr)


    ],
  )
]

#slide[

  == Solve through velocities

  #grid(
    columns: (1.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #v(1fr)
      #kin_diagram_2(size: 20pt)
      #v(1fr)
    ],
    align(left)[

      #v(1fr)

      $
        E_(2alpha,"rel") = 2 (1 / 2 m_alpha v_(1,2, "rel")^2) \
        v_(2) = sqrt(E_(1,2,"rel") slash m_alpha)
      $
      #v(1fr)


    ],
  )
]


#slide[

  == Solve through velocities

  #grid(
    columns: (1.5fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #v(1fr)
      #kin_diagram_2(size: 20pt)
      #v(1fr)
    ],
    align(left)[
      #line(length: 100%)
      In $c12$-frame://, the amount of kinetic energy before the $be8$ breaks up is $E_(3alpha,"rel") - E_(2alpha_"rel")$
      $
        E_(3alpha,"rel") - E_(2alpha,"rel") &= p^2_alpha / (2m_alpha) + p^2_be8 / (2m_be8)\
        &approx p^2_alpha / (2m_alpha) + p^2_alpha / (4m_alpha)\
        &=3 / 4m_alpha v_1^2\
      $
      $
        v_1 = sqrt(4/(3m_alpha)(E_(3alpha,"rel") - E_(2alpha,"rel")))
      $
      #line(length: 100%)
      Scale by $3/2$ to get to $be8$-frame
      #v(1fr)
      $
        v_1 = sqrt(3/m_alpha (E_(3alpha,"rel") - E_(2alpha,"rel")))
      $


    ],
  )
]

#slide[

  == Solve through velocities

  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      #v(1fr)
      #kin_diagram_2(size: 20pt)
      #v(1fr)
    ],
    align(left)[
      $
        v_(1,2,"rel")^2 = v_1^2 + v_2^2 - 2v_1v_2 cos theta\
      $
      #v(1fr)
      $
        E_(1,2,"rel") =& 3 / 4E_(3alpha,"rel") - 1 / 2E_(2alpha,"rel") \ &- 1 / 2 sqrt(3E_(2alpha,"rel")(E_(3alpha,"rel") - E_(2alpha,"rel"))) cos theta
      $
      #v(1fr)

      Uniform Distribution with bounds $E_plus.minus$:
      $
        E_(plus.minus) =& 3 / 4E_(3alpha,"rel") - 1 / 2E_(2alpha,"rel") \ &plus.minus 1 / 2 sqrt(3E_(2alpha,"rel")(E_(3alpha,"rel") - E_(2alpha,"rel")))
      $
    ],
  )
]

#slide[

  == Solve through velocities

  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    align()[
      For a given signal $S(E_(2alpha,"rel"))$, there is also a contribution of
      $
        hat(K)[S(E_(2alpha, "rel"))] = 2 integral_(E_-)^(E_+) (S(x) d x) / (E_+ - E_-)
      $



      If $T-U $ is known, then:
      $
        //T(E_(2alpha, "rel")) &= U(E_(2alpha, "rel")) + S(E_(2alpha, "rel")) + K(E_(2alpha, "rel"))\
         T(E_(2alpha, "rel"))&= U(E_(2alpha, "rel")) + S(E_(2alpha, "rel")) + hat(K)[S(E_(2alpha, "rel"))]\
      $
      $
        T(E_(2alpha, "rel"))- U(E_(2alpha, "rel"))= (1+hat(K))S(E_(2alpha, "rel"))
      $
      is numerically solvable

    ],
    align(left)[ ],
  )
]
