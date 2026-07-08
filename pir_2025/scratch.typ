//#import "@preview/slydst:0.1.4": *
//#import "@preview/polylux:0.4.0": *
//#set page(paper: "presentation-16-9")

#import "@preview/cetz:0.4.2"
//#set page(width: auto, height: auto, margin: .5cm)
#import "@preview/physica:0.9.3": isotope
#show math.equation: set text(font: "Fira Math")
#set text(font: "Fira Sans", size: 12pt)
//#show heading.where(level: 2): set text(22pt, red.darken(40%))
//#show heading.where(level: 3): set text(18pt, red.darken(40%))
//#set page(margin: 0.5in)


#let vec(body) = {
  [$bold(body)$]
}
#let dim(body) = {
  set text(gray.darken(30%))
  [_ #body _]
}

#let bright(body) = {
  set text(blue.darken(30%))
  [*#body*]
}
Omega
#let b9 = $isotope("B", a:9)$
#let be9 = $isotope("Be", a:9)$
#let be8 = $isotope("Be", a:8)$
#let c12 = $isotope("C", a:12)$
#let o16 = $isotope("O", a:16)$
#let li5 = $isotope("Li", a:5)$
#let li5 = $isotope("Li", a:5)$
#let si28 = $isotope("Si", a:28)$

#let today = datetime.today()

= Fit $bold(3 alpha)$ vs $bold(2 alpha)$Omega
== Given $bold(E_"rel"^(c12))$ and $bold(E_"rel"^(be8))$, what is the distribution of $bold(E_"rel"^(2 alpha))$?
Assume isotropic #be8 decay and no detector efficiency issues.
Classical for now.
Label the first $alpha$ that comes off with a "1".
$
  E_"rel"^(c12) = sum_i p_i^2/(2m_i)
#linebreak()
vec(v)_be8-vec(v)_1 =
$


$
  integral^v d y#h(0.2em)y(v_("rel", be8)) integral d Omega sqrt(v_alpha^2 + 1/4 v_("rel", be8)^2 - v_alpha^2v_("rel", be8)cos theta)\
  2pi integral^v d y#h(0.2em)y(v_("rel", be8)) integral d theta sin theta sqrt(v_alpha^2 + 1/4 v_("rel", be8)^2 - v_alpha^2v_("rel", be8)cos theta)
$

#pagebreak()
== Given $bold(E_"rel"^(c12))$ and $bold(E_"rel"^(be8))$, what is the distribution of $bold(E_"rel"^(2 alpha))$?

Assume the two $alpha$s associated with #be8 are identifiable. Choose the #be8 frame. The $alpha$ not associated with #be8 is $alpha_1$.

#figure([
  #v(1cm)
  #cetz.canvas(
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
      content((alpha1_x, alpha1_y), $bold(v)_(alpha_1)$, anchor: "east", padding: 0.2cm)
      content((alpha2_x, alpha2_y), $bold(v)_(alpha_2)$, anchor: "west", padding: 0.2cm)
      content(
        (alpha3_x, alpha3_y),
        text(fill: luma(70%))[$bold(v)_(alpha_3)$],
        anchor: "west",
        padding: 0.4cm,
      )
      content((-0.1, -0.1), $(0,0)$, anchor: "west", padding: 0.4cm)

      cetz.angle.angle(
        (0, 0),
        (angle_scale * alpha2_x, angle_scale * alpha2_y),
        (-angle_scale, 0),
        label: text($theta$),
        radius: angle_scale,
        //stroke: luma(50%),
      )
    },
  )
])

Assuming classical kinematics, isotropic #be8 decay, with no detector effeciency considerations:
$
  cos Theta tilde k
$

$
  v^2_(alpha_1, alpha_2,"rel") = v^2_alpha_1 + v^2_alpha_2 - 2v_alpha_1 v_alpha_2 cos theta \
  cos theta = (v^2_alpha_1 + v^2_alpha_2-v^2_(alpha_1, alpha_2,"rel")) / (2 v_alpha_1 v_alpha_2)
$

For every possible value of $v^2_(alpha_1, alpha_2,"rel")$, weight calculate $cos theta$, and add a constant contribution to the kinematic density if $|cos theta |< 1$.


In the #c12 frame:
$
  E_"rel"^c12 = p^2_alpha/(2m_alpha) + p_be8^2/(2m_be8)#h(1cm) p_alpha^2 = p_be8^2\
  E_"rel"^c12 approx p^2_alpha/(2m_alpha) + p_alpha^2/(4m_alpha)=(3p^2_alpha)/(4m_alpha) = (3m^2_alpha v_alpha^2)/(4m_alpha)\
  v_(alpha_1,c12" frame") = sqrt((4 E_"rel"^c12) / (3m_alpha))\
  v_alpha_1 = 3/2 sqrt((4 E_"rel"^c12) / (3m_alpha))
$

$
  v_alpha_2 = sqrt(E_"rel"^be8 / m_alpha)
$
