#set page(
  paper: "us-letter",
  margin: (top: 0.92in, bottom: 0.88in, left: 1in, right: 1in),
  numbering: "1",
  number-align: center + bottom,
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.64em,
)

#set heading(numbering: "1.1")
#set list(indent: 1.25em, body-indent: 0.55em)
#set enum(indent: 1.25em, body-indent: 0.55em)

#align(center)[
  #text(size: 17pt)[Adversarial delays with secondary-market prices]
  #v(0.55em)
  #text(size: 12pt)[Vinayak Pathak]
  #v(0.45em)
  #text(size: 11pt)[August 2026]
]

#v(1.15em)
= Model and path parameters
<model-and-path-parameters>
The player's action space is $[0 , 1]$. Fix a horizon $T gt.eq 2$. The
game is parameterized by two unknown deterministic sequences chosen by
an oblivious adversary,

$ bold(p) = (p_1 , p_2 , dots.h) , #h(2em) bold(m) = (m_1 , m_2 , dots.h) , $

where $p_t , m_t in [0 , 1]$. Let
$bold(p)_T := (p_1 , dots.h , p_T)$ and
$bold(m)_T := (m_1 , dots.h , m_T)$ denote their horizon-$T$ prefixes.
All horizon-$T$ rewards and path parameters below depend only on these
prefixes, so any finite construction may be extended arbitrarily after
time $T$.
The primary-price sequence defines the delay functions

$ d_t (a) := min { tau in bb(N)_0 : p_(t + tau) > a } , $

where $bb(N)_0 = {0 , 1 , dots.h}$, with $d_t (a) = oo$ if the set is
empty. We use the usual convention $t + oo = oo$. For notational
convenience, set $m_oo := 0$; this value is always multiplied by a zero
execution indicator and never affects a reward.

At time $t$:
+ The player posts an offer $A_t in [0 , 1]$, possibly using
  randomization and the observations from times $1 , dots.h , t - 1$.
+ The environment reveals $p_t in [0 , 1]$ and the secondary-market
  price $m_t in [0 , 1]$.
+ For each $s lt.eq t$: if the offer $A_s$ is still outstanding and
  $p_t > A_s$, then $A_s$ is executed. The market maker sells at $A_s$,
  immediately buys at $m_t$, and receives reward $A_s - m_t$.

The reward associated with an offer $a$ submitted at time $t$ is

$ r_t (a) := (a - m_(t + d_t (a))) bb(I) {t + d_t (a) lt.eq T} . $

The benchmark obtained by posting the same offer on every round is

$ B_T (bold(p)_T , bold(m)_T) := sup_(a in [0 , 1]) sum_(t = 1)^T r_t (a) . $

The regret of a possibly randomized policy $pi$ is

$ R_T^pi (bold(p)_T , bold(m)_T)
  := B_T (bold(p)_T , bold(m)_T)
  - bb(E)_pi [sum_(t = 1)^T r_t (A_t)] , $

where $bb(I)$ denotes the indicator function and $bb(E)_pi$ is only over
the player's internal randomization. We write $R_T$ when the policy and
paths are clear. Notice that
$B_T (bold(p)_T , bold(m)_T) gt.eq 0$, because the offer $a = 1$ never
executes.

For each $t lt.eq T$, define the suffix maximum

$ M_t := max_(t lt.eq s lt.eq T) p_s . $

Then $M_1 gt.eq M_2 gt.eq dots.h.c gt.eq M_T$. By definition,

$ t + d_t (a) lt.eq T $

if and only if $a < M_t$, and

$ {a in [0 , 1] : 1 lt.eq d_t (a) lt.eq T - t} = [p_t , M_t) . $

Let $U$ be uniformly distributed on $[0 , 1]$. Define the primary-price
path complexity

$ cal(V)_T := sum_(t = 1)^(T - 1) bb(P) (1 lt.eq d_t (U) lt.eq T - t)
  = sum_(t = 1)^(T - 1) (M_t - p_t) . $

The new issue is that the liquidation price attached to a quote depends
on the date at which that quote first executes.

== Possible execution dates
<possible-execution-dates>
Fix a submission time $s$. Define

$ cal(J)_s (bold(p)_T)
  := {s + d_s (a) : a in [0 , 1] , s + d_s (a) lt.eq T} . $

These are exactly the dates that can be the first execution time of some
offer submitted at time $s$. Equivalently,

$ cal(J)_s (bold(p)_T)
  = {u in {s , dots.h , T} : p_u > max ({0} union {p_v : s lt.eq v < u})} . $

Indeed, if $u in cal(J)_s (bold(p)_T)$, then one can choose

$ max ({0} union {p_v : s lt.eq v < u}) lt.eq a < p_u , $

and this offer first executes at $u$. Conversely, a first execution can
occur at $u$ only if $p_u$ is a strict running maximum since the offer
was submitted.

For $s gt.eq 2$, define the execution-price exposure

$ omega_s (bold(p)_T , bold(m)_T)
  := max_(u in cal(J)_s (bold(p)_T)) lr(|m_u - m_(s - 1)|) , $

where the maximum is defined to be zero if
$cal(J)_s (bold(p)_T) = emptyset$.
Finally, define

$ W_T (bold(p)_T , bold(m)_T)
  := sum_(s = 2)^T omega_s (bold(p)_T , bold(m)_T) . $

Throughout, when the underlying paths are clear, we suppress the path
arguments of path-dependent quantities.

The quantity $W_T$ depends only on the realized joint path
$(bold(p)_T , bold(m)_T)$. It does not depend on the learner or on an
auxiliary predictor.

The interpretation is direct. When the offer at time $s$ is selected,
the most recently observed secondary-market price is $m_(s - 1)$.
Depending on its level, that offer can first execute at any date in
$cal(J)_s$. Thus $omega_s$ is the largest secondary-price movement to
which the offer at $s$ could be exposed.

For example, if $p_t$ is nonincreasing, an offer either executes
immediately or never executes. Hence
$cal(J)_s subset.eq {s}$ and

$ W_T lt.eq sum_(s = 2)^T lr(|m_s - m_(s - 1)|) . $

Equality holds if $p_s > 0$ for every $s = 2 , dots.h , T$.

= Upper bound
<upper-bound>
For every $t = 1 , dots.h , T$, define

$ H_t := sum_(s = 1)^t 1 / s . $

Write $(x)_(+) := max {x , 0}$.

Set

$ c_1 := 1 , #h(2em) c_t := m_(t - 1) quad (t gt.eq 2) , $

and define the surrogate reward

$ tilde(r)_t (a) := (a - c_t) bb(I) {a < M_t} . $

Let

$ tilde(B)_T := sup_(a in [0 , 1])
  sum_(t = 1)^T tilde(r)_t (a) . $

For every $t = 1 , dots.h , T$, define

$ C_t := sum_(s = 1)^t c_s . $

#strong[Lemma 1.] For every pair of paths $bold(p)_T , bold(m)_T$,

$ tilde(B)_T lt.eq
  max {0 , max_(1 lt.eq k lt.eq T) (k M_k - C_k)} . $

#emph[Proof.] For $a in [0 , 1]$, let

$ N (a) := max {1 lt.eq t lt.eq T : a < M_t} , $

with $N (a) = 0$ if the set is empty. Since
$M_1 gt.eq M_2 gt.eq dots.h.c gt.eq M_T$, if $N (a) gt.eq 1$, then

$ sum_(t = 1)^T tilde(r)_t (a)
  = sum_(t = 1)^(N (a)) (a - c_t)
  = a N (a) - C_(N (a)) . $

Moreover, $a < M_(N (a))$, and hence

$ a N (a) - C_(N (a))
  < N (a) M_(N (a)) - C_(N (a))
  lt.eq max_(1 lt.eq k lt.eq T) (k M_k - C_k) . $

If $N (a) = 0$, the surrogate payoff is zero.
Taking the supremum over $a$ concludes the proof. $square.filled$

Define the clairvoyant actions

$ A_1^star.op := c_1 $

and, for $t gt.eq 2$,

$ A_t^star.op := c_t + frac(t - 1, t) (M_(t - 1) - c_t)_(+) . $

Let

$ S_t^star.op := sum_(s = 1)^t tilde(r)_s (A_s^star.op) . $

#strong[Lemma 2 \(Clairvoyant potential bound).] For every
$t = 1 , dots.h , T$,

$ S_t^star.op gt.eq t M_t - C_t - H_t + 1 . $

Consequently,

$ S_T^star.op gt.eq tilde(B)_T - (H_T - 1) . $

#emph[Proof.] We prove the statement by induction on $t$. For $t = 1$,

$ S_1^star.op = tilde(r)_1 (1) = 0
  gt.eq M_1 - C_1 - H_1 + 1 = M_1 - 1 . $

Now fix $t gt.eq 2$ and assume

$ S_(t - 1)^star.op
  gt.eq (t - 1) M_(t - 1) - C_(t - 1) - H_(t - 1) + 1 . $

There are two cases.

+ If $A_t^star.op < M_t$, then $M_(t - 1) > c_t$, the offer executes by
  time $T$, and

  $ tilde(r)_t (A_t^star.op)
    = frac(t - 1, t) (M_(t - 1) - c_t) . $

  Therefore

  $ S_t^star.op
    & gt.eq (t - 1) M_(t - 1) - C_(t - 1) - H_(t - 1) + 1
      + frac(t - 1, t) (M_(t - 1) - c_t) \
    & = (t - 1 / t) M_(t - 1) - C_t - H_(t - 1) + 1 + c_t / t \
    & gt.eq t M_t - C_t - H_t + 1 . $

  For the last step, we used $M_(t - 1) gt.eq M_t$ and

  $ (t - 1 / t) M_t + c_t / t + 1 / t - t M_t
    = frac(1 + c_t - M_t, t) gt.eq 0 . $

+ If $A_t^star.op gt.eq M_t$, then the offer does not execute by time
  $T$ and
  $tilde(r)_t (A_t^star.op) = 0$. If $M_(t - 1) lt.eq c_t$, then

  $ t M_t lt.eq t M_(t - 1)
    lt.eq (t - 1) M_(t - 1) + c_t . $

  If $M_(t - 1) > c_t$, the case condition gives the same inequality.
  Hence

  $ S_t^star.op
    = S_(t - 1)^star.op
    gt.eq (t - 1) M_(t - 1) - C_(t - 1) - H_(t - 1) + 1
    gt.eq t M_t - C_t - H_t + 1 . $

This completes the induction. To prove the last statement, observe that
every clairvoyant surrogate reward is nonnegative. If the outer maximum
in Lemma 1 is positive, choose $k$ achieving the inner maximum. Then

$ S_T^star.op
  gt.eq S_k^star.op
  gt.eq k M_k - C_k - H_k + 1
  gt.eq tilde(B)_T - (H_T - 1) . $

If the outer maximum is zero, Lemma 1 gives $tilde(B)_T = 0$, while
$S_T^star.op gt.eq 0$. The same conclusion follows, completing the
proof. $square.filled$

#strong[Lemma 3.] For every $t$ and every
$c_t lt.eq x lt.eq y lt.eq 1$,

$ tilde(r)_t (x) gt.eq tilde(r)_t (y) - (y - x) . $

#emph[Proof.] If $y < M_t$, then also $x < M_t$, and

$ tilde(r)_t (x) = x - c_t
  = tilde(r)_t (y) - (y - x) . $

If $y gt.eq M_t$, then $tilde(r)_t (y) = 0$, and so
$tilde(r)_t (y) - (y - x) lt.eq 0$, whereas
$tilde(r)_t (x) gt.eq 0$, concluding the proof. $square.filled$

#strong[Theorem 1 \(Pathwise upper bound).] The deterministic policy

$ A_1 = 1 , #h(2em)
  A_t = m_(t - 1)
  + frac(t - 1, t) (p_(t - 1) - m_(t - 1))_(+)
  quad (t gt.eq 2) $

satisfies

$ R_T lt.eq H_T + cal(V)_T + 2 W_T . $

#emph[Proof.] For $t gt.eq 2$, one has
$p_(t - 1) lt.eq M_(t - 1)$, and therefore

$ c_t lt.eq A_t lt.eq A_t^star.op . $

Applying Lemma 3 gives

$ tilde(r)_t (A_t)
  gt.eq tilde(r)_t (A_t^star.op) - (A_t^star.op - A_t) . $

Moreover,

$ A_t^star.op - A_t
  & = frac(t - 1, t)
      [(M_(t - 1) - c_t)_(+) - (p_(t - 1) - c_t)_(+)] \
  & lt.eq frac(t - 1, t) (M_(t - 1) - p_(t - 1)) , $

because $x arrow.r.bar (x - c_t)_(+)$ is $1$-Lipschitz. The same
surrogate-reward inequality is trivial at $t = 1$, because
$A_1 = A_1^star.op = 1$.

We next compare surrogate and actual rewards. For $t gt.eq 2$,

$ lr(|r_t (a) - tilde(r)_t (a)|)
  = lr(|m_(t - 1) - m_(t + d_t (a))|)
    bb(I) {t + d_t (a) lt.eq T}
  lt.eq omega_t , $

because, whenever the offer executes by time $T$, its first execution
date $t + d_t (a)$ belongs to $cal(J)_t$. At $t = 1$,

$ r_1 (a) - tilde(r)_1 (a)
  = (1 - m_(1 + d_1 (a))) bb(I) {1 + d_1 (a) lt.eq T}
  lt.eq 1 . $

Thus, for every fixed offer $a$,

$ sum_(t = 1)^T r_t (a)
  lt.eq sum_(t = 1)^T tilde(r)_t (a) + 1 + W_T , $

and therefore

$ B_T lt.eq tilde(B)_T + 1 + W_T . $

For the learner, $A_1 = 1$ never executes and
$r_1 (A_1) = tilde(r)_1 (A_1) = 0$. Applying the preceding bound to the
remaining offers and summing over $t$, we obtain

$ sum_(t = 1)^T r_t (A_t)
  & gt.eq sum_(t = 1)^T tilde(r)_t (A_t) - W_T \
  & gt.eq S_T^star.op
    - sum_(t = 2)^T frac(t - 1, t) (M_(t - 1) - p_(t - 1)) - W_T \
  & gt.eq tilde(B)_T - (H_T - 1)
    - sum_(s = 1)^(T - 1) frac(s, s + 1) (M_s - p_s) - W_T \
  & gt.eq B_T - H_T
    - sum_(s = 1)^(T - 1) frac(s, s + 1) (M_s - p_s) - 2 W_T \
  & gt.eq B_T - H_T - cal(V)_T - 2 W_T . $

#parbreak()
The third inequality uses Lemma 2, the fourth uses the preceding
benchmark comparison, and the last one uses the definition of
$cal(V)_T$. Rearranging concludes the proof.
$square.filled$

= A matching lower bound for the new term
<a-matching-lower-bound-for-the-new-term>
The quantity $W_T$ is not merely an artifact of the upper-bound proof. A
single secondary-price movement can create one unit of uncertainty for
every old offer that could still be waiting in the book.

#strong[Theorem 2 \(Necessity of $W_T$).] Fix $T gt.eq 2$. For every
possibly randomized learner and every

$ 0 lt.eq w lt.eq frac(T - 1, 4) , $

there exists a deterministic oblivious pair of sequences
$(bold(p) , bold(m))$ such that

$ W_T = w , #h(2em) cal(V)_T = frac(w, 4 T) , $

and

$ R_T gt.eq 3 / 8 w . $

Thus no algorithm can guarantee $o (W_T)$ regret uniformly, even on
sequences satisfying

$ cal(V)_T = O (W_T / T) . $

#emph[Proof.] Set

$ q := 3 / 4 , #h(2em) c := 1 / 2 , #h(2em) delta := frac(w, T - 1) , #h(2em) epsilon := frac(delta, 4 T) . $

Use the primary-price sequence

$ p_t = q quad (t < T) , #h(2em) p_T = q + epsilon . $

Consider two possible secondary-price sequences. In both worlds,

$ m_t = c quad (t < T) , $

whereas

$ m_T = cases(
    delim: "{",
    c - delta & upright("in world L"),
    c + delta & upright("in world H"),
  ) . $

Put the uniform prior on the two worlds. Before choosing $A_T$, the
learner has observed the same history in both worlds. Hence every
learner action is independent of the world.

For any round, the learner’s prior-expected reward is at most

$ q + epsilon - c = 1 / 4 + epsilon . $

Indeed, if $a < q$, it executes immediately and receives
$a - c lt.eq q - c$. If $q lt.eq a < q + epsilon$, it executes at $T$
and its prior-expected reward is $a - c lt.eq q + epsilon - c$. If
$a gt.eq q + epsilon$, it never executes. Thus the learner’s expected
cumulative reward is at most

$ T (1 / 4 + epsilon) . $

In world L, the fixed comparator may quote just below $q + epsilon$,
wait until $T$, and obtain a payoff arbitrarily close to

$ T (1 / 4 + epsilon + delta) . $

In world H, the comparator may quote just below $q$. It executes
immediately on the first $T - 1$ rounds and at $T$ on the final round,
obtaining a payoff arbitrarily close to

$ (T - 1) 1 / 4 + (1 / 4 - delta) = T / 4 - delta . $

Therefore the prior-averaged regret is at least

$  & 1 / 2 [T (1 / 4 + epsilon + delta) + (T / 4 - delta)] - T (1 / 4 + epsilon)\
 & #h(2em) = frac(T - 1, 2) delta - T / 2 epsilon\
 & #h(2em) = w / 2 - delta / 8\
 & #h(2em) gt.eq 3 / 8 w . $

By Yao’s principle, one of the two deterministic worlds gives at least
this expected regret against the original randomized learner.

For every $s = 2 , dots.h , T$, both the immediate date $s$ and the
terminal date $T$ are possible execution dates, and

$ omega_s = delta . $

Hence

$ W_T = (T - 1) delta = w . $

Finally,

$ cal(V)_T = (T - 1) epsilon = frac(w, 4 T) . $

This completes the proof. $square.filled$

= The harmonic and primary-price terms are also necessary
<the-harmonic-and-primary-price-terms-are-also-necessary>
The preceding theorem isolates the new secondary-price difficulty. The
two terms inherited from the original problem are independently
unavoidable as well.

#strong[Theorem 3 \(Harmonic lower bound).] For every possibly
randomized policy and every $T gt.eq 2$, there exists a deterministic
nonincreasing sequence $p_1 gt.eq dots.h.c gt.eq p_T > 0$ and the
constant secondary-price sequence $m_t = 0$ such that

$ cal(V)_T = 0 , #h(2em) W_T = 0 , $

and

$ R_T gt.eq 3 / 16 (H_T - 1) . $

#emph[Intuition.] Conditional on the current primary price being $x$,
let the next price remain at $x$ with high probability and fall to
$(1 - epsilon_t) x$ with probability $epsilon_t$. Uncertainty about
whether the fall occurs costs the learner about $epsilon_t x$ at round
$t$. The expected erosion of the final-price comparator is only of order
$t epsilon_t^2 x$. Choosing $epsilon_t = 1 \/ (2 t)$ makes the net loss
of order $x \/ t$. Meanwhile, $sum_t epsilon_t^2 < oo$, so the expected
price stays bounded away from zero. Summing $1 \/ t$ gives the
logarithmic lower bound.

#emph[Proof.] The random construction is only a proof device. Every
realization is a deterministic oblivious sequence.

Set $p_1 = 1$. Independently for every $t = 2 , dots.h , T$, conditional
on $p_(t - 1) = x$, let

$ p_t = cases(delim: "{", x , & upright("with probability ") 1 - epsilon_t ,, (1 - epsilon_t) x , & upright("with probability ") epsilon_t ,) #h(2em) epsilon_t := frac(1, 2 t) . $

Every realization is nonincreasing. Therefore $M_t = p_t$ and
$cal(V)_T = 0$.
Since $m_t = 0$, we also have $W_T = 0$.

Conditional on $p_(t - 1) = x$, the expected reward of any offer at
round $t$ is at most

$ (1 - epsilon_t) x . $

To see this, first condition on a deterministic offer $a$. If
$a < (1 - epsilon_t) x$, it executes in both states and earns at most
$(1 - epsilon_t) x$. If $(1 - epsilon_t) x lt.eq a < x$, it executes
only when there is no drop and its expected reward is
$(1 - epsilon_t) a lt.eq (1 - epsilon_t) x$. If $a gt.eq x$, it earns
zero. Randomized offers follow by averaging.

Let

$ mu_t := bb(E) [p_t] , #h(2em) mu_0 = mu_1 = 1 , $

and set $epsilon_1 = 0$. Then

$ mu_t = (1 - epsilon_t^2) mu_(t - 1) . $

Moreover,

$ mu_t = product_(s = 2)^t (1 - frac(1, 4 s^2)) gt.eq 1 - sum_(s = 2)^oo frac(1, 4 s^2) gt.eq 3 / 4 . $

Because the path is nonincreasing, every fixed offer $a < p_T$ executes
on every round. Hence the benchmark satisfies

$ B_T gt.eq T p_T . $

The prior-averaged regret is therefore at least

$ T mu_T - sum_(t = 1)^T (1 - epsilon_t) mu_(t - 1) . $

Using

$ sum_(t = 1)^T mu_(t - 1) - T mu_T = sum_(t = 1)^T t (mu_(t - 1) - mu_t) $

and $mu_(t - 1) - mu_t = epsilon_t^2 mu_(t - 1)$, we obtain

$ bb(E) [R_T] & gt.eq sum_(t = 1)^T (epsilon_t - t epsilon_t^2) mu_(t - 1)\
 & = 1 / 4 sum_(t = 2)^T mu_(t - 1) / t\
 & gt.eq 3 / 16 (H_T - 1) . $

At least one deterministic realization in the support has at least this
regret. $square.filled$

#strong[Theorem 4 \(Primary-price lower bound).] Fix $T gt.eq 2$ and
$v in (0, T - 1]$. For every possibly randomized learner, there
exists a deterministic pair $(bold(p) , bold(m))$ such that

$ cal(V)_T lt.eq v , #h(2em) W_T = 0 , $

and

$ R_T gt.eq v / e . $

#emph[Proof.] Let

$ b := frac(v, T - 1) . $

Set $m_t = 0$ for all $t$, and let

$ p_1 = dots.h.c = p_(T - 1) = 0 , #h(2em) p_T = X , $

where $X in [0 , b]$ has survival function

$ bb(P) (X > x) = cases(delim: "{", 1 , & 0 lt.eq x < b \/ e ,, frac(b, e x) , & b \/ e lt.eq x < b ,, 0 , & x gt.eq b .) $

Then

$ bb(E) [X] = frac(2 b, e) , $

and every offer $a$ satisfies

$ a bb(P) (X > a) lt.eq b / e . $

All learner decisions are made before $X$ is observed, so the learner’s
expected reward is at most $T b \/ e$. The fixed comparator has payoff
$T X$, whose expectation is $2 T b \/ e$. Thus the Bayes regret is at
least

$ frac(T b, e) = frac(T, e (T - 1)) v gt.eq v / e . $

Consequently, one deterministic value of $X$ gives at least this much
regret. For every realization,

$ cal(V)_T = (T - 1) X lt.eq v , #h(2em) W_T = 0 . $

This proves the theorem. $square.filled$
