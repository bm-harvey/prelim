//#import "@preview/slydst:0.1.4": *
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
//#show: slides.with(
//title: [Concerns about "AI-assisted analysis of $bold(si28->7alpha)$ breakup data"],
////subtitle: [ https://journals.aps.org/prc/abstract/10.1103/xb3c-qhwh],
//date: [#today.month()/#today.day()/#today.year()],
//authors: "Bryan M Harvey",
//ratio: 16 / 9,
//layout: "large",
//title-color: red.darken(40%),
//)

#set page(numbering: "1")

#slide[
  #set page(footer: none, header: none)
  #set align(horizon)
  #text(size: 2em, weight: "bold")[
    #toolbox.side-by-side(columns: (auto, 1fr))[
      //#image("../assets/polylux-logo.svg", height: 2em)
    ][
      #text(fill: red.darken(40%))[The Toroidal Nucleus Search in $bold(si28)$ at TAMU Cyclotron Institute]

    ]


  ]
  #line(stroke: black, length: 100%)

  //An overview over all the features

  Bryan M Harvey, September 2025
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
        image(height: 110pt, "fig/wong_1978_fig7.png"),
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
        image(height: 110pt, "fig/ichikawa_2012_fig1.png"),
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
        image(height: 190pt, "fig/wong_2018_fig3.png"),
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
          image(height: 190pt, "fig/wong_2014_fig3.jpg"),
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
#slide[
  == Experimental Background - NIMROD (Cao _et al._)
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
    align()[

      #strong[N]eutron #strong[I]on #strong[M]ultidetector for #strong[R]\eaction #strong[O]riented #strong[D]ynamics

      #image(height: 75%, "fig/pics/nimrod.jpg")

    ],
    align(center)[
      #align(center + horizon)[ #box(image(width: 100%, "fig/cao_bg_est.png"))]
      #my_ref(
        journal: "Phys. Rev. C",
        volume: "99",
        year: "2019",
        id: "014606",
        url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.99.014606",
      )
    ],
    align()[
      - 2009 data as part of a much larger $alpha$-conjugate study
      - $si28 + c12$ \@ 35 MeV / u
      #v(1fr)
      #line()
      #v(1fr)
      - $E^* = sum_i K_(i,"c.o.m.") - Q$


      - $E^*=114, 126, & bold(138) "MeV"$ structures observed


      #v(1fr)
      - Background subtraction
      #v(1fr)
      #line()
      #v(1fr)
      - Limited $E^*$ Resolution
        - \~9.4 MeV FWHM at 138 MeV
        - Meas. widths $approx$ Detector Res.

      - Limited Sample Size
        - \~6.5k $7alpha$ events

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
  == #text(size: 12pt)[A Very Incomplete] Theoretical Background (Post Cao _et al._)
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
        columns: (1.2fr, 1fr),
        gutter: 8pt,
        inset: 2pt,
        stroke: none,
        image(height: 110pt, "fig/agbemava_fig1.png"),
        [
          #my_ref(
            journal: "Phys. Rev. C",
            volume: "103",
            year: "2021",
            id: "034323",
            url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.103.034323",
          )

          - Exotic hyper heavy deformation, including toroids
        ],
      )
    ],
    // 2018
    align()[
      #grid(
        columns: (1fr, 1fr),
        gutter: 8pt,
        inset: 2pt,
        stroke: none,
        box(image(height: 110pt, "fig/gaamouci_fig18.png"), stroke: none, inset: 2pt),
        [
          #my_ref(
            journal: "Phys. Rev. C",
            volume: "103",
            year: "2021",
            id: "054311",
            url: "https://journals.aps.org/prc/abstract/10.1103/PhysRevC.103.054311",
          )

          - Mean-field calculations to predict toroidal geometries
        ],
      )
    ],
    align()[
      #grid(
        columns: (2fr, 1fr),
        gutter: 8pt,
        inset: 2pt,
        stroke: none,
        [
          #v(1fr)
          #image(height: 140pt, "fig/ren_2021_fig8.jpg")
          #v(1fr)
        ],
        [
          #my_ref(
            journal: "Nuc. Phys. A",
            volume: "996",
            year: "2020",
            id: "121696",
            url: "https://www.sciencedirect.com/science/article/pii/S0375947420300063?via%3Dihub",
          )
          #v(1fr)
          - CDFT Calculations
          #v(1fr)
          - Many predictions in #si28
          #v(1fr)
        ],
      )
    ],
    // 2014
    align()[
      #box(
        grid(
          columns: (1.5fr, 1fr),
          gutter: 8pt,
          inset: 2pt,
          stroke: none,
          image(height: 200pt, "fig/aldo_2021_fig11.png"),
          [
            // Cheuk-Yin Wong
            #my_ref(
              journal: "Symmetry",
              volume: "13",
              year: "2021",
              id: "1777",
              url: "https://www.mdpi.com/2073-8994/13/10/1777",
            )

            - Hybrid $alpha$-Cluster (H$alpha$C) model

            - Breakup probabilities assessed at various $l$ and $E^*$
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

      #image(width: 100%, "fig/pics/faust.png")

    ],
    align(center)[
      #align(center + horizon)[ #box(image(width: 100%, "fig/hannaman_5_8_mixed.png"))]

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
      #box(image(height: 90%, "fig/hannaman_poly_fit.png"), stroke: none)
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


//= New Attempts to Extract Peaks
#focus-slide[
  = New Attempts to Extract Peaks
]
//
//
//
//
//
#slide[
  == Introduction to Common Themes
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






#slide[
  == Gaussian Mixture Model (Depastas _et al._)

  #grid(
    columns: (1.1fr, 1.8fr, 1.2fr),
    gutter: 20pt,
    align(horizon)[
      - #bright[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #dim[Binned data is sampled $N_p=10^6$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #dim[Select the model that optimizes $chi^2_nu$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align(center)[
      #box(image(height: 85%, "fig/hac_gmm.png"))
      #linebreak()
      #my_ref(
        journal: "Phys. Rev. C",
        volume: "112",
        year: "2025",
        id: "014614",
        url: "https://doi.org/10.1103/xb3c-qhwh",
      )
    ],
    align()[
      #v(1fr)
      - Experimental data is already provided as binned with Poisson uncertainties
        - Not shown here
      #v(1fr)
      - Model data is calculated at bin centers and bin errors are set to $5%$
        - See #text(fill: red.darken(30%), weight: "bold", [RED]) in #strong[(b)]
      #v(1fr)
    ],
  )
]






#slide[
  == Gaussian Mixture Model (Depastas _et al._)

  #grid(
    columns: (1.1fr, 1.8fr, 1.2fr),
    gutter: 20pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #bright[Binned data is sampled $bold(N_p=10^6)$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #dim[Select the model that optimizes $chi^2_nu$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align(center)[
      #box(image(height: 85%, "fig/hac_gmm.png"))
      #linebreak()
      #my_ref(
        journal: "Phys. Rev. C",
        volume: "112",
        year: "2025",
        id: "014614",
        url: "https://doi.org/10.1103/xb3c-qhwh",
      )
    ],
    align()[
      #v(1fr)
      #quote(["From this discrete histogram, we generate $N_p = 10^6$ random points, from a normal distribution around the center of each bin"])
      #v(1fr)
      - Unspecified width of sampled Gaussian
      #v(1fr)
      - See #text(fill: rgb(130, 255, 255).darken(40%), weight: "bold", [CYAN]) in *(b)*
      #v(1fr)
    ],
  )
]






#slide[
  == Gaussian Mixture Model (Depastas _et al._)

  #grid(
    columns: (1.1fr, 1.8fr, 1.2fr),
    gutter: 20pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #dim[Binned data is sampled $N_p=10^6$ times]
      #v(1fr)
      - #bright[Point cloud is passed to Gaussian Mixture Model for various $bold(N_G)$]
      #v(1fr)
      - #dim[Select the model that optimizes $chi^2_nu$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align(center)[
      #box(image(height: 85%, "fig/hac_gmm.png"))
      #linebreak()
      #my_ref(
        journal: "Phys. Rev. C",
        volume: "112",
        year: "2025",
        id: "014614",
        url: "https://doi.org/10.1103/xb3c-qhwh",
      )
    ],
    align()[
      #quote(["A Gaussian mixture model is a probabilistic model that assumes all the data points are generated from a mixture of a finite number of Gaussian distributions with unknown parameters"])
      - #raw("https://scikit-learn.org/stable/modules/mixture.html")

      #v(1fr)
      #line()
      #v(1fr)
      - Iteratively partition data
        - $N_G$ groups
      - Calculate Gaussians
      - Calculate & maximize $cal(L)$
      #v(1fr)
      #line()
      #v(1fr)

      - Final result is similar to multi-Gaussian fit
    ],
  )
]






#slide[
  == Gaussian Mixture Model (Depastas _et al._)

  #grid(
    columns: (1.1fr, 1.8fr, 1.2fr),
    gutter: 20pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #dim[Binned data is sampled $N_p=10^6$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #bright[Select the model that optimizes $bold(chi^2_nu)$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align(center)[
      #box(image(height: 85%, "fig/hac_gmm.png"))
      #linebreak()
      #my_ref(
        journal: "Phys. Rev. C",
        volume: "112",
        year: "2025",
        id: "014614",
        url: "https://doi.org/10.1103/xb3c-qhwh",
      )
    ],
    align()[
      #v(1fr)
      #text(
        size: 12pt,
        [$
            chi^2_nu = (sum_i {1 / (delta y_i)[y_i - sum_(I_G=0)^(N_G - 1) w_I_G g_I_G (E^*_i; mu_I_G, sigma_I_G)]}^2) / (N_p- 3N_G)
          $],
      )
      #v(1fr)
      #line()
      #v(1fr)

      $N_p=10^6$

      #v(1fr)
      //$
      //"Experimental : " delta y_i &= sqrt(y_i)
      //#linebreak()
      //"Model : " delta y_i &= (5%)y_i
      //$

      $
        delta y_i = cases(
            sqrt(y_i) &" if Experimental",,
            (5%)y_i &" if Model"
        )
      $

      #v(1fr)
      #line()
      #v(1fr)
      - See *various colored* curves in *(c)*, labelled *G1-10*
      #v(1fr)
    ],
  )
]







//#focus-slide[Definitions of Consistency #linebreak() (and the implications on statistical significance)]







#slide[
  == Application to Experimental Data

  #grid(
    columns: (1.1fr, 1.6fr, 1.4fr),
    gutter: 20pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #dim[Binned data is sampled $N_p=10^6$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #dim[Select the model that optimizes $chi^2_nu$]
      #v(1fr)
      - #bright[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align(horizon)[
      #box(image(width: 100%, "fig/gmm_exp.png"), clip: true, inset: (right: -115%), stroke: none)
    ],
    [
      - #quote(["For the [Cao data] we obtain six peaks which *approximately reproduce* the predicted 114 MeV and 138 MeV toroid resonances (black triangles) in the region of high statistics. The peak at 126 MeV is not reproduced independently, but *belongs to* the wide fourth Gaussian." --- $section 4 "par" 1$])
      #v(1fr)

      //- [G3 (centered at $~110$ MeV) and G4 (centered at $~130$ MeV) are the closest peaks to any of the Cao predictions]

      //- #bad[G3 is \~4 MeV from the 114 MeV state.]
      - #bad[114 MeV: \~4 MeV away from G3]
      #v(1fr)
      - #bad[126 MeV: \~4 MeV away from G4]
      #v(1fr)
      - #bad[138 MeV: \~8 MeV away from G4]

      #v(1fr)

    ],
  )
]






#slide[
  == Application to Experimental Data

  #grid(
    columns: (1.1fr, 1.6fr, 1.4fr),
    gutter: 10pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #dim[Binned data is sampled $N_p=10^6$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #dim[Select the model that optimizes $chi^2_nu$]
      #v(1fr)
      - #bright[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align(horizon)[
      #box(image(width: 100%, "fig/gmm_exp.png"), clip: true, inset: (left: -86%), stroke: none)

    ],
    [
      #v(1fr)
      - #quote(["Interestingly, the resonances are *close to* the aforementioned found by Cao and collaborators." --- $section 4 "par" 1$])
      #v(1fr)
      - #bad[114 MeV: \~10 MeV away from G4]
      #v(1fr)
      - #good[126 MeV: \~1 MeV away from G5]
      #v(1fr)
      - #bad[138 MeV: \~4 MeV away from G6]
      #v(1fr)
    ],
  )
]



#slide[
  == Suppose 2 MeV Windows


  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(height: 90%, "fig/recreation/hannaman_gmm_recreation_lin_w2.png"), stroke: none)
    ],
    [
      //#v(1fr)
      - Define "consistency" _before_ looking at predicitons
      #v(1fr)
      - "Any Gaussian that lands within $x$ MeV of a prediction is said to be consistent with that prediction."
      #v(1fr)
      - Ask : "How surprising is it if at least one out of three predictions is reproduced for $plus.minus$ 2 MeV windows?"
      #v(0.25fr)
      $
        P_(>=1|3) &= P(n_"repro." >= 1 | 3 "pred.")
        #linebreak()
        &= 1 - [P(n_"repro." = 0| 1 "pred.")]^3
        #linebreak()
        &approx 1 - ((120-24)/120)^3
        #linebreak()
        &= #box([48.8%], stroke:black, inset: 4pt)
      $


    ],
  )
]





#slide[
  == Add in Cao Predictions

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(height: 90%, "fig/recreation/hannaman_gmm_recreation_lin_w2_w_predictions.png"), stroke: none)
    ],
    [
      #v(1fr)

      - A statistically unsuprising result:
        - One of the predictions was consistent with one of the Gaussians.
      #v(1fr)
      $
        P_(=0|3) &approx 51.2%
    #linebreak()
      P_(=1|3) &approx 38.4%
    #linebreak()
      P_(=2|3) &approx 9.6%
    #linebreak()
      P_(=3|3) &approx 0.8%
      $
      #v(1fr)
      Maybe open the window?
      #v(1fr)

    ],
  )
]





#slide[
  == Suppose 4 MeV Windows


  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(height: 90%, "fig/recreation/hannaman_gmm_recreation_lin_w4_w_predictions.png"), stroke: none)
    ],
    [
      #v(1fr)
      - One or two peaks consistent
        - Neither result would would be surprising
      #v(1fr)
      $
        P_(=0|3) &approx 21.6%
    #linebreak()
      P_(=1|3) &approx 43.2%
    #linebreak()
      P_(=2|3) &approx 28.8%
    #linebreak()
      P_(=3|3) &approx 6.4%
      $
      #v(1fr)


    ],
  )
]




#slide[
  == Suppose Very Wide Windows

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #v(1fr)
      #box(image(height: 90%, "fig/recreation/hannaman_gmm_recreation_lin_w8_w_predictions.png"), stroke: none)
      #v(1fr)
    ],
    [
      #v(1fr)
      #box(image(height: 90%, "fig/recreation/hannaman_gmm_recreation_lin_w10_w_predictions.png"), stroke: none)
      #v(1fr)
    ],
  )
]






#slide[
  == Use HWHM of Each Gaussian

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(height: 90%, "fig/recreation/hannaman_gmm_recreation_lin_wsigma_w_prediction.png"), stroke: none)
    ],
    [
      #v(1fr)
      #box(
        [It is challenging to have a definition of consistent/close/reproducing which simultaneously shows agreement of the GMM peaks and the Cao predictions that is statistically significant],
        stroke: black,
        inset: 5pt,
      )
      #v(1fr)
    ],
  )
]







#focus-slide[= The Benchmark]






#slide[
  == Dependence of Agreement on the Existence of Distinct Features


  #grid(
    columns: (1fr, 1.2fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(width: 95%, "fig/hac_gmm.png"), clip: true, inset: (bottom: -220%), stroke: black)
      #box(image(width: 95%, "fig/hac_gmm.png"), clip: true, inset: (top: -150%), stroke: black)
    ],
    [
      Using absolute deltas to line up Gaussians within $2$ MeV

      #line()
      * Correspond to obvious local maxima*
      - #good[G1 and G2 : within 1 MeV of $l=16$]
      - #good[G3 : within 1 MeV with $l=18$]
      - #good[G4 : within 1 MeV with $l=20$]
      //#line()
      * Do not correspond to obvious local maxima*
      - #good[G5 : $~2$ MeV of $l=22$]
      - #bad[G6 : $~4$ MeV away from $l=24$]
      - #good[G7 : within $1$ MeV of $l=26$]
      - #bad[G8 : $~7$ MeV away from $l=30$]
      - #bad[G9 : $~10$ MeV away from $l=30$ or $l=32$]
      - #bad[G10 : $~10$ MeV away from $l=32$\* ]
      #line()
      - #box(
          stroke: black,
          inset: 5pt,
        )[Without distinct features, GMM fails to consistently reproduce overlapping contributions]
      //There are no obvious local maxima in the experimental data beyond statistical limits to the degree of the first three peaks here
    ],
  )
]







#slide[
  == Robustness of Agreement in the Presence of a Background

  #grid(
    columns: (1.2fr, 1.8fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(height: 90%, "fig/cao_bg_est.png"))
    ],
    [
      #v(1fr)
      - The background according to MD & mixed:
        - not Gaussian.
        - the dominant feature ($ gt.approx 90%$) of the distribution.
      #v(1fr)

      //- Pre-equilibrium emmission & target-like $alpha$s

      - No background was included in the benchmark

      #v(1fr)
      - GMM assumes the underlying probability distribution is a sum of Gaussians
      #v(1fr)
      - #box(
          [The reliability of the GMM technique in the presence of an uncharacterized, but dominant, non-Gaussian background has _not_ been demonstrated.],
          stroke: black,
          inset: 5pt,
        )
      #v(1fr)
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
      #box(image(height: 90%, "fig/hannaman_poly_fit.png"), stroke: none)
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
      #box(image(height: 90%, "fig/hannaman_poly_fit.png"), stroke: none)
    ],
  )
]







#slide[
  == Use of Polynomial Roots to Discredit the Polynomial Fit

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      #box(image(width: 95%, "fig/hac_gmm.png"), clip: true, inset: (bottom: -220%), stroke: black)
      #box(image(width: 95%, "fig/hac_gmm.png"), clip: true, inset: (top: -150%), stroke: black)
    ],
    [
      #v(1fr)
      #quote(["We observe that seven out of ten machine learning Gaussians reproduce the known peaks compared to four out of twelve polynomial roots. This demonstrates the superiority of the proposed AI method."])
      //#v(1fr)
      //- I would never suggest the sequential derivative maxima is a good way to locate peak centroids
      #v(1fr)
      - The Hannaman analysis only used the polynomial to demonstrate a lack of structure
      #v(1fr)
      - The 'special' points were not used to predict underlying structure
      #v(1fr)
      - I agree using the 'special' points in this way is a bad idea
      #v(1fr)
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
      #box(image(height: 90%, "fig/calib/calib_natowitz_split.png"), stroke: none)

    ],
  )
]








#slide[
  == 8-fold split
  #grid(
    columns: (2fr, 1fr),
    align(horizon)[
      #box(figure(image(height: 90%, "fig/calib/monster_std_res.png")), stroke: none)
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
      #box(image(height: 85%, "fig/calib/3a_full.png"))
    ],
    align(center)[
      #box(image(height: 85%, "fig/calib/3a_zoom.png"))
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
  == Summary
  #v(1cm)
  #grid(
    columns: (1.5fr, 1fr, 1.5fr),
    gutter: 10pt,
    align(horizon)[

      === When is a peak consistent with a prediction?
      The Cao candidate peaks are too far from the GMM peaks to be statistically significant

      #v(1fr)

      === What is the background?
      The possibility of the background must be accounted for
      #v(1cm)
    ],
    align(horizon + right)[],
    align(horizon + right)[

      === Use of Polynomial
      Only used to show there is not strong narrow structure

      #v(1fr)
      === Quality of Calibration
      There are not detectable gain drifts
      #v(1fr)

      === General Statistics
      $chi^2_nu$ requires independent samples which supersampling breaks

      Handling of experimental systematics
      #v(1cm)
    ],
  )
]

#slide[
  == Acknowledgments
  #grid(
    columns: (2fr, 1fr),
    gutter: 10pt,
    image(height: 90%, "fig/pics/group.jpg"),
    [
      #v(1fr)
      - SJY Group
      #v(1fr)
      - Andy Hannaman
      #v(1fr)
      - Department of Energy: DE-FG02-93ER40773
        #box(stroke: black, clip: true, inset: (top: -100%, bottom: -100%))[#image(width: 100%, "fig/pics/doe.png")]
      #v(1fr)
    ],
  )
]





#focus-slide[= Backup Slides]






#counter(page).update(1)
#slide[
  #outline(depth: 2)
]

#slide[
  == With Shuffle
  #box(image(height: 90%, "fig/calib/calib_natowitz_split_with_shuffle.png"), stroke: none)
]


#slide[
  == Reproduction of Paper data
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[
      Original Plot

      #box(image(height: 80%, "fig/gmm_exp.png"), clip: true, inset: (left: -86%), stroke: none)
    ],
    [
      Recreation Using Plot Digitizer

      #box(image(height: 80%, "fig/recreation/hannaman_gmm_recreation_log.png"), stroke: none)


    ],
  )
]

#focus-slide[Statistical Concerns with the GMM Technique as Implemented #linebreak() (And other miscellaneous concerns)]

#slide[
  == Assigning 5% $bold(delta y)$ to model calculations
  #grid(
    columns: (1.1fr, 3fr),
    gutter: 40pt,
    align(horizon)[
      - #bright[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #dim[Binned data is sampled $N_p=10^6$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #bright[Select the model that optimizes $bold(chi^2_nu)$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align()[
      #v(1fr)
      "For the calculation of $chi^2_nu$ we assume a uniform 5% error" - $section 2 "par." 4$
      - $delta y_i = (0.05)y_i$

      $
        chi^2_nu = (sum_i {1 / (#box([$delta y_i$], stroke :red, inset: 3pt))[y_i - sum_(I_G=0)^(N_G - 1) w_I_G g_I_G (E^*_i; mu_I_G, sigma_I_G)]}^2) / (N_p- 3N_G)
      $
      #v(1fr)
      - This type of error does not reflect counting statistics
      #v(1fr)
      - This might explain the degenerate peak ($"G1 = G2"$) in the benchmark
      #v(1fr)
      - Probably need to sample the model 186k times and use the resultant spectra from that sampling with Poisson errors
      #v(1fr)


    ],
  )
]

#slide[
  == Super Sampling
  #grid(
    columns: (1.1fr, 3fr),
    gutter: 40pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #bright[Binned data is sampled $bold(N_p=10^6)$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #bright[Select the model that optimizes $bold(chi^2_nu)$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align()[
      "From this discrete histogram, we generate $N_p=10^6$ random points, from a normal distribution around the center of each bin"
      #v(1fr)
      $
        chi^2_nu = (sum_i {1 / (delta y_i)[y_i - sum_(I_G=0)^(N_G - 1) w_I_G g_I_G (E^*_i; mu_I_G, sigma_I_G)]}^2) / (#box([$N_p$], stroke : red,inset:1pt, outset: (y :3pt,x:1pt) ) - 3N_G)
      $
      #v(1fr)

      - $N_p = 10^6$ samples from a condensed representation of the data (binning) are not independent samples
        - Especially when there are only 186k events in the most populated spectra
      #v(1fr)
      - This could create an unexpected bias on sample size as $chi^2_nu$ should depend on $N$, but doesn't here
      #v(1fr)


    ],
  )
]

#slide[
  == Super Sampling with Bin-Centered Gaussians
  #grid(
    columns: (1.1fr, 3fr),
    gutter: 40pt,
    align(horizon)[
      - #dim[Spectrum is binned and bins are assigned uncertainty]
      #v(1fr)
      - #bright[Binned data is sampled $bold(N_p=10^6)$ times]
      #v(1fr)
      - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
      #v(1fr)
      - #dim[Select the model that optimizes $chi^2_nu$]
      #v(1fr)
      - #dim[Locations of resultant Gaussians are compared to previous predictions]
    ],
    align()[
      "From this discrete histogram, we generate $N_p=10^6$ random points, from a normal distribution around the center of each bin"

      #v(1fr)
      - This by construction creates peaks at every bin center
      #v(1fr)
      - Would not see effect without binning finer after supersampling
      #v(1fr)
      - GMM takes the raw point cloud and can be affected
      #v(1fr)
      - Unclear to me what the exact effect is
      #v(1fr)
    ],
  )
]

#slide[
  == Comparison of Theory to Experiment w/o Experimental Response
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align(horizon)[

      #box(image(width: 100%, "fig/theory_to_exp.png"), clip: true, inset: (top: -5%), stroke: none)

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
  #box(image(height: 79%, "fig/sample_demo.png"), stroke: none)

]


#slide[
  == State of the Search as of 2023
  #box(image("fig/hannaman_thesis_5_9_forest.png"), height: 90%, clip: true, inset: (bottom: -27%))
]

#slide[
  == Recent $c12$ spectra
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    inset: 6pt,
    //stroke: black,
    //
    align()[
      #box(image("fig/250902_3aspec.png"), height: 80%)
    ],

    // 2012
    align()[
      #box(image("fig/250902_3spec_n.png"), height: 80%)
    ],
  )
]

#slide[
  == Paritioned Results
  #box(image("fig/theo_partitioned.png"), height: 90%)
]
#slide[
  == Paritioned Results
  #box(image("fig/theo_partitioned_2.png"), height: 90%)
]
