#import "@preview/slydst:0.1.4": *

#import "@preview/physica:0.9.3": isotope
#show math.equation: set text(font: "Fira Math")
#set text(font: "Fira Sans")
//#show

#let good(body) = {
  set text(green.darken(30%))
  [#body]
}

#let quote(body) = {
  set text(gray.darken(60%))
  [#emph(body)]
}

#let bad(body) = {
  set text(red.darken(30%))
  [_ #body _]
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
#show: slides.with(
  title: [Concerns about "AI-assisted analysis of $bold(si28->7alpha)$ breakup data"],
  //subtitle: [ https://journals.aps.org/prc/abstract/10.1103/xb3c-qhwh],
  date: [#today.month()/#today.day()/#today.year()],
  authors: "Bryan M Harvey",
  ratio: 16 / 9,
  layout: "large",
  title-color: red.darken(40%),
  numbering("A")
)


== References
#v(1fr)
- Examination of evidence for resonances at high excitation energy in the $7alpha$ disassembly of $si28$
  - X.G. Cao _et al._
  - #link("https://journals.aps.org/prc/abstract/10.1103/PhysRevC.99.014606")[Phys. Rev. C *99*, 014606]
#v(1fr)
- Experimental search for toroidal high-spin isomers in collisions of $si28+c12 " @ " 35 "MeV/nucleon"$ with the Forward Array Using Silicon Technology
  - A. Hannaman, B. M. Harvey, _et al._
  - #link("https://journals.aps.org/prc/abstract/10.1103/PhysRevC.109.054615")[ Phys. Rev. C *109*, 054615]
#v(1fr)
- Artificial-intelligence-assisted analysis of $si28->7alpha$ breakup data
  - T. Depastas, A. Bonasera, and J. Natowitz
  - #link("https://journals.aps.org/prc/abstract/10.1103/xb3c-qhwh")[Phys. Rev. C *112*, 014614]
#v(1fr)

== Theoretical History (Pre Cao _et al._)
#box()

== NIMROD Experiment
#box()

== NIMROD Analysis
#box()

== FAUST Experiment
#box()

== FAUST Analysis
#box()

== Theoretical History (Post Cao _et al._)

== New Attempts to Extract Peaks
#v(1cm)
#grid(
  columns: (1fr, 3fr),
  gutter: 40pt,
  align(horizon)[
    - #dim[Spectra is binned and bins are assigned uncertainty]
    #v(1fr)
    - #dim[Binned data is sampled $N_p=10^6$ times]
    #v(1fr)
    - #dim[Point cloud is passed to Gaussian Mixture Model for various $N_G$]
    #v(1fr)
    - #dim[Select the model that optimizes $chi^2_nu$]
    #v(1fr)
    - #dim[Locations of resultant Gaussians are compared to previous predictions]
  ],
  align()[ ],
)

//== Outline
//#v(1fr)
//- GMM techniqe
//- Application of of the analysis to experimental data
//- Robustness of the validation check
//- Statistical concerns with the technique itself
//#v(1fr)
//- Polynomial discussion
//- A brief reminder of our exact analysis
//- The disconnect in the polynomial discussion between the two papers
//#v(1fr)
//- Mixing of Theoretical and Experimental results without the proper tools
//#v(1fr)
//- FAUST stability
//#v(1fr)

== Introduction to Common Themes
#v(1cm)
#grid(
  columns: (1fr, 2fr),
  gutter: 10pt,
  align(horizon)[

    === When is a peak consistent with a prediction?
    Absolute difference?

    Statistical significance?

    #v(1fr)

    === What is the background?
    Shape

    Size

    Confidence

    Importance
    #v(1cm)
  ],
  align(horizon + right)[

    === Use of Polynomial
    What does the fit represent?

    What conclusions can be drawn from the fit?
    #v(1fr)
    === Quality of Calibration
    Are there detectable gain drifts?
    #v(1fr)
    === General Statistics
    Independence of samples

    Signficance of deviations in spectra
    #v(1cm)
  ],
)
//=== General Statistical Handling
//- Goodness of fit

= Defintions of Consistency #linebreak() (and the implications on statistical significance)

== Application to Experimental Data
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    #box(image(height: 100%, "fig/gmm_exp.png"), clip: true, inset: (right: -115%), stroke: none)
  ],
  [
    #v(1fr)
    - #quote(["For the [Cao data] we obtain six peaks which approximately reproduce the predicted 114 MeV and 138 MeV toroid resonances (black triangles) in the region of high statistics. The peak at 126 MeV is not reproduced independently, but belongs to the wide fourth Gaussian." --- $section 4 "par" 1$])
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

== Application to Experimental Data
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    #box(image(height: 100%, "fig/gmm_exp.png"), clip: true, inset: (left: -86%), stroke: none)

  ],
  [
    #v(1fr)
    - #quote(["Interestingly, the resonances are close to the aforementioned found by Cao and collaborators." --- $section 4 "par" 1$])
    //- "The situation for the Hannaman yield data is similar with also six peaks. Interestingly, the resonances are close to the aforementioned found by Cao and collaborators." --- $section 4 "par" 1$
    #v(1fr)
    //- #bad[G4 is the closest gaussian to the 114 MeV prediction, being $~10$ MeV away.]
    - #bad[114 MeV: \~10 MeV away from G4]
    #v(1fr)
    //- #good[G5 is with an MeV or so of the 126 MeV prediction.]
    - #good[126 MeV: \~1 MeV away from G5]
    #v(1fr)
    - #bad[138 MeV: \~4 MeV away from G6]
    //- #bad[G6 is the closest Gaussian to the 138 MeV prediction, being $~3-4$ MeV away.]
    #v(1fr)
  ],
)



== Suppose 2 MeV Windows
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    //#box(image(height: 100%, "fig/hannaman_gmm_recreation_lin.png"), stroke: black)
    #box(image(height: 100%, "fig/recreation/hannaman_gmm_recreation_lin_w2.png"), stroke: none)
  ],
  [
    //#v(1fr)
    - Define "consistency" _before_ looking at predicitons
    #v(1fr)
    - "Any Gaussian that lands within $x$ MeV of a prediction is said to be consistent with that prediction."
    #v(1fr)
    - Ask : "How surprising is it if at least one out of three predictions is reproduced?"
    #v(0.25fr)
    $
      P_(>=1|3) = P(n_"repro." >= 1 | 3 "pred.") &= 1 - [P(n_"repro." = 0| 1 "pred.")]^3
        #linebreak()
        &approx 1 - ((120-24)/120)^3
        #linebreak()
        &= #box([48.8%], stroke:black, inset: 4pt)
    $
    #v(1fr)


  ],
)
== Add in Cao Predictions
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    #box(image(height: 100%, "fig/recreation/hannaman_gmm_recreation_lin_w2_w_predictions.png"), stroke: none)
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

== Suppose 4 MeV Windows
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    //#box(image(height: 100%, "fig/hannaman_gmm_recreation_lin.png"), stroke: black)
    #box(image(height: 100%, "fig/recreation/hannaman_gmm_recreation_lin_w4_w_predictions.png"), stroke: none)
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

== Suppose Very Wide Windows
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    //#box(image(height: 100%, "fig/hannaman_gmm_recreation_lin.png"), stroke: black)
    #box(image(height: 100%, "fig/recreation/hannaman_gmm_recreation_lin_w8_w_predictions.png"), stroke: none)
  ],
  [
    #box(image(height: 100%, "fig/recreation/hannaman_gmm_recreation_lin_w10_w_predictions.png"), stroke: none)
  ],
)
== Use HWHM of Each Gaussian
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    //#box(image(height: 100%, "fig/hannaman_gmm_recreation_lin.png"), stroke: black)
    #box(image(height: 100%, "fig/recreation/hannaman_gmm_recreation_lin_wsigma_w_prediction.png"), stroke: none)
  ],
  [
    //#v(1fr)
    //- Still get full coverage of the spectra
    //#v(1fr)
    //- Not surprising
    //- The *whole* spectra needs to be supported by 6 Gaussians
    #v(1fr)
    #box(
      [It is challenging to have a defintion of consistent/close/reproducing which simultaneusly shows agreement of the GMM peaks and the Cao predictions that is statistically significant],
      //[Any definition of "consistent" where the Cao predictions are reconstructed does not provide high statistical significance],
      stroke: black,
      inset: 5pt,
    )
    #v(1fr)
  ],
)

= Shortcomings of the Chosen Benchmark

== Degree of agreement

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    #box(image(width: 95%, "fig/hac_gmm.png"), clip: true, inset: (bottom: -220%), stroke: black)
    #box(image(width: 95%, "fig/hac_gmm.png"), clip: true, inset: (top: -150%), stroke: black)
  ],
  [
    Using absolute deltas to line up Gaussians within $2$ MeV

    #line()
    * Correspond to obvious local maxima*
    - #good[G1 and G2 seem duplicated but within 1 MeV of $l=16$]
    - #good[G3 within 1 MeV with $l=18$]
    - #good[G4 within 1 MeV with $l=20$]
    //#line()
    * Do not correspond to obvious local maxima*
    - #good[G5 is within $~1-2$ MeV of $l=22$]
    - #bad[G6 is within $~4$ MeV of $l=24$]
    - #good[G7 is within $~1$ MeV of $l=26$]
    - #bad[G8 is within $~7$ MeV of $l=30$]
    - #bad[G9 is about $10$ MeV off of $l=30$ or $l=32$]
    - #bad[G10 is $>10$ MeV away from $l=32$]
    #line()
    - Without distinct features, GMM fails to reproduce overlapping contributions
    //There are no obvious local maxima in the experimental data beyond statistical limits to the degree of the first three peaks here
  ],
)

== Robustness of agreement in the presence of a background
#grid(
  columns: (1fr, 2fr),
  gutter: 10pt,
  align(horizon)[
    #box(image(height: 95%, "fig/cao_bg_est.png"))
  ],
  [
    #v(1fr)
    - The background according to MD & mixed:
      - not Gaussian.
      - the dominent feature ($ gt.approx 90%$) of the distribution.
    #v(1fr)

    - No background was included in the benchmark

    #v(1fr)
    - GMM assumes the underlying probability distribution is a sum of Gaussians
    #v(1fr)
    - #box(
        [The reliability of the GMM technique in the prescence of an uncharacterized, but dominant, non-Gaussian background has _not_ been demonstrated.],
        stroke: black,
        inset: 3pt,
      )
    #v(1fr)
  ],
)


= Discussion of the Polynomial Fit
== We Are Looking for Prominent, Narrow Resonances
#v(1cm)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,

  //stroke: black,
  align(horizon)[

    #align(left)[=== NIMROD]
    Si + CsI telescopes

    High angular coverage ($~85%$ of $4pi$)

    Neutron Ball

    Position limited by detector size
    #line()

  ],
  align(horizon + right)[
    #align(right)[=== FAUST]
    Si + CsI telescopes

    Very foward focucssed ($~2 degree - 25 degree$ lab frame)

    No neutron detection

    Position only limited by DADL resolution
    #line()
  ],
)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align()[


    $~9.4$ MeV (FWHM) $7alpha$ $E^*$ resolution in ROI

    Measured $~6.5$k $7alpha$ events
    #line()

    Claims possible peaks with measured FWHMs
    - 5.88 MeV
    - 8.57 MeV
    - 8.03 MeV

  ],
  align(right)[
    $~2.5$ MeV (FWHM) $7alpha$ $E^*$ resolution in ROI

    Measured $~185$k $7alpha$ events

    #line()
    Looking for *narrow* resonances, as suggested by the NIMROD analysis
  ],
)
== We Did not See Prominent, Narrow Resonances
#v(0.5cm)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  align()[
    #align()[=== NIMROD]
    #align(center)[ #box(image(height: 87%, "fig/cao_bg_est.png"))]

  ],
  align()[
    #align()[=== FAUST]
    #box(image(height: 87%, "fig/hannaman_5_8_mixed.png"))

  ],
  align()[

    #v(1fr)
    - No obvious narrow structure appears in FAUST spectra
    #v(1fr)
    - No accurate background estimate #linebreak()
      #h(0.5cm) #emoji.crossmark Mixed Events#linebreak()
      #h(0.5cm) #emoji.crossmark MD Sims
    #v(1fr)
    - In the absence of a phsyically motivated and well constrained and benchmarked background...
    #v(1fr)
  ],
)


== Polynomial Fit
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    #box(image(height: 100%, "fig/hannaman_poly_fit.png"), stroke: none)
  ],
  [
    - The _only_ purpose of this fit is to demonstrate the entire spectrum is consistent with some broad, 'featureless' description.

    #v(1fr)
    - The fit is good:
      - Residuals shown
      - $chi_nu^2 = 1.01$
    #v(1fr)
    - We only claim that there is "no strong evidence was found for statistically significant resonant state yield in the seven $alpha$-particle channel".
    #v(1fr)
  ],
)

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
    #box(image(height: 100%, "fig/hannaman_poly_fit.png"), stroke: none)
  ],
)

== Polynomial Roots
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[
    #v(1fr)
    #quote(["Second, a polynomial function possesses several 'special' points of maxima, minima and inflections that are given by the roots of each derivative of the polynomial. Since a polynomial of order N, can in principle have at most N roots, a subtractive analysis yields additional structure that is not present in the data. In our analysis, we obtain the “special” points numerically for each dataset, by fitting a 9th order polynomial and accept the roots on each derivative if they are real and their value of the next derivative is negative (2nd Derivative Criterion)." --- $section 2 "par" 1$])
    #v(1fr)

    - We looked into this
      - There are not prominent fluctuations in the polynomial on the few MeV scale
      - Also not in the std. residuals
    #v(1fr)
    //- The polynomial fit is void of rapid oscillations on the domain shown here.

  ],
  [
    #box(image(height: 100%, "fig/hannaman_poly_fit.png"), stroke: none)
  ],
)

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
    - This was not done in the Hannaman analysis
    #v(1fr)
    - This is an unfair comparison of analytical techniques
    #v(1fr)
  ],
)


= There is not statisitically signficant evidence for gain drifts in the time-ordered $bold(E^*_(7alpha))$ spectrum

== Looking for Gain Drifts
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  align(horizon)[

    #v(1fr)
    - No matter how you partition the time-ordered data, you always end up with consistent spectra

    #v(1fr)
    - Right: a \~50-50 split for example

    #v(1fr)

    - Disclaimer: Treating Poisson as simple $sqrt(N)$ due to timing constraints
      - (Careful looking too hard at the high $E^*$ tail)
    #v(1fr)

  ],
  [
    #box(image(height: 100%, "fig/calib/calib_natowitz_split.png"), stroke: none)

  ],
)

== 8-fold split
#grid(
  columns: (2fr, 1fr),
  //gutter: 10pt,
  align(horizon)[
    #box(figure(image(height: 100%, "fig/calib/monster_std_res.png")), stroke: none)
  ],
  [
    #v(1fr)
    - *BLACK:* Time ordered
    - #text(stroke: none, fill: red.darken(20%), [*RED:* Time shuffled])
    #v(1fr)

    - Variances of standardized residuals range from \~0.78 - \~1.4 for both
      - Typically between 0.85 and 1.15 for both


    #v(1fr)

    //- There is no statistically unexcpected difference between the time ordered partition
    - #box([$=>$ There is no evidence for gain drifts], stroke: black, inset: 3pt)
    #v(1fr)
  ],
)


== 8-fold Split on $bold(3alpha)$ Spectra
#box()

== Conclusions
#v(1cm)
#grid(
  columns: (1fr, 2fr),
  gutter: 10pt,
  align(horizon)[

    === When is a peak consistent with a prediction?
    The Cao candidate peaks are too far from the GMM peaks to be statistically significant

    #v(1fr)

    === What is the background?
    The possibility of the background has to be accounted for
    #v(1cm)
  ],
  align(horizon + right)[

    === Use of Polynomial
    Only used to show there is not strong narrow structure

    #v(1fr)
    === Quality of Calibration
    There are not detectable gain drifts
    #v(1fr)

    === General Statistics
    (?) #quote([I removed these slides so idk what to put here.])

    #v(1cm)
  ],
)
== Acknowledgments
- (To largely be lifted from WPCF)





= Backup Slides

== With Shuffle
#box(image(height: 100%, "fig/calib/calib_natowitz_split_with_shuffle.png"), stroke: none)


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

= Statistical Concerns with the GMM Technique as Implemented #linebreak() (And other miscallaneous concerns)

== Assigning 5% $bold(delta y)$ to model calculations
#v(1cm)
#grid(
  columns: (1fr, 3fr),
  gutter: 40pt,
  align(horizon)[
    - #bright[Spectra is binned and bins are assigned uncertainty]
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

== Super Sampling
#v(1cm)
#grid(
  columns: (1fr, 3fr),
  gutter: 40pt,
  align(horizon)[
    - #dim[Spectra is binned and bins are assigned uncertainty]
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

== Super Sampling with Bin-Centered Gaussians
#v(1cm)
#grid(
  columns: (1fr, 3fr),
  gutter: 40pt,
  align(horizon)[
    - #dim[Spectra is binned and bins are assigned uncertainty]
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

== We Would See Prominent, Narrow Resonances
#box(image(height: 80%, "fig/sample_demo.png"), stroke: none)

Anything NIMROD could have possibly measured, FAUST should have seen clear as day.
(FIXME: Fig formatting)


