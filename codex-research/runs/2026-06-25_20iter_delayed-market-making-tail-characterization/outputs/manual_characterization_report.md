# Manual Characterization Report

This report synthesizes the completed research-loop artifacts for
`latex/delays.tex`.  It is a new file because the automated final-report
child job hit the Codex CLI usage limit.

## Audit

The automated math-research-loop run directory is

`/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization`.

The loop reached `current_iteration = 20` in its state file, but the usable
agent work is not twenty full successful iterations.  Iterations 1--18
completed through solver, ideas, explorers, critics, and synthesis.  Iteration
19 completed solver and idea generation, but the explorer, critic, synthesis,
and final-report jobs failed after the Codex CLI usage limit was reached.
Iteration 20's child jobs also failed for the same reason.  Thus the accepted
mathematical state is the synthesized working notes through iteration 18, plus
an unchecked iteration-19 solver/idea note.  No existing source file, including
`latex/delays.tex`, was edited.

## Model Conventions

At time `t`, the learner posts a quote `a_t in [0,1]` after observing public
prices up to time `t`.  A quote posted at time `t` pays once by horizon `T`:

```tex
r_t(a;T) = a 1{ tau_t(a) <= T-t },
tau_t(a) = min{s > 0 : P_{t+s} > a}.
```

For deterministic exogenous paths it is useful to write

```tex
M_{t,T} = max_{t < s <= T} P_s,
r_t(a;T) = a 1{a < M_{t,T}}.
```

The comparator should be

```tex
V_T^* = sup_{a in [0,1]} sum_{t<T} a 1{a < M_{t,T}},
```

not necessarily a maximum, because strict crossing can make the best fixed
quote unattained.

## Main Answer

There is no nontrivial necessary-and-sufficient condition of the proposed
"delay tail tends to zero" form.  The proposed condition

```tex
beta(h) -> 0
```

is a valid sufficient condition under full-information exogenous-price
assumptions, but it is not necessary.  The phrase "sublinear regret is
possible" is also not well-defined until the policy class and quantifiers are
fixed.

The sharp conclusions are:

1. Instance-wise, process-aware, horizon-aware pseudo-regret is trivial:
   every exogenous process is learnable.  For each `P,T`, play an
   `epsilon_T`-optimal fixed quote for that horizon.  Therefore no tail
   condition can be necessary in that oracle regime.

2. Instance-wise tail necessity is false even without using the horizon-aware
   oracle collapse.  The sparse vanishing-spike process

   ```tex
   P_{2^n}=U_n/2^n,  P_t=0 otherwise
   ```

   has raw `beta(h)=1` for every `h`, but the always-zero learner has regret at
   most `1` for every horizon.

3. For deterministic known exogenous paths with horizon-oblivious policies, an
   exact necessary-and-sufficient condition is available, but it is an LP
   compactness/envelope condition, not a scalar tail condition.  Define the
   finite-prefix simultaneous value

   ```tex
   D_n(P) =
     inf_{mu_1,...,mu_{n-1}}
     max_{T <= n}
       [ V_T^*
         - sum_{t<T} int_{[0,M_{t,T}]} x d mu_t(x) ].
   ```

   A formal left-limit horizon-oblivious randomized marginal policy with
   sublinear regret exists iff there is an envelope `e_T=o(T)` such that, for
   every `n`, the finite-prefix LP constraints

   ```tex
   V_T^* - sum_{t<T} int_{[0,M_{t,T}]} x d mu_t(x) <= e_T,
   T <= n,
   ```

   are feasible with the same envelope `e_T`.  Actual strict-crossing quotes
   are obtained by posting `(1-eta_t)A_t` with
   `sum_{t<T} eta_t=o(T)`.

   The simpler scalar condition `D_n(P)=o(n)` is necessary.  The run did not
   prove it sufficient; projective consistency/gluing remains open.

4. For unrestricted deterministic exogenous paths and horizon-oblivious
   policies, sublinear regret is impossible in the worst case.  The sharp
   worst-case asymptotic constant is `1/e`.

## Sufficient Tail Bound

Under exogenous public prices and full-information delayed feedback, use a
grid of `K` quotes and truncate rewards at delay `H`.  A delayed
full-information expert algorithm gives

```tex
R_T <= C sqrt(T (H+1) log K) + T/K + T beta(H).
```

The same proof works with the sharper payoff-weighted tail

```tex
gamma(h) =
  sup_{t,a} esssup_{F_t} a Pr(h < tau_t(a) < infinity | F_t),
```

giving

```tex
R_T <= C sqrt(T (H+1) log K) + T/K + T gamma(H).
```

Even sharper horizon-level penalties are

```tex
Delta_T(H) =
  sup_a sum_{t<=T} E[a 1{H < tau_t(a) <= T-t}]
```

and the comparator gap

```tex
Gamma_T(H) = sup_a V_T(a) - sup_a V_T^H(a) <= Delta_T(H).
```

If `K=T`, `H=H_T -> infinity`, `H_T log T=o(T)`, and the chosen tail penalty
is `o(T)`, the regret is sublinear.

For a polynomial tail `beta(h) <= c h^{-alpha}` with `alpha>0`, optimizing
`H` gives

```tex
R_T = O( T^{(alpha+1)/(2 alpha+1)}
         (log T)^{alpha/(2 alpha+1)} )
```

up to constants, using `K=T`.  Exponential tails give nearly
`sqrt(T)` regret up to logarithmic factors.

No matching lower bound for this tail theorem was proved in the run.  The
obstructions found show that raw tails are too crude to be necessary.

## Sharp Worst-Case Anytime Bound

For deterministic exogenous paths and horizon-oblivious randomized policies,
the minimax/worst-path expected-regret constant is exactly `1/e`.

### Lower bound

For any horizon-oblivious policy, construct one deterministic known path from
dominant blocks

```tex
0^{N_i}, c_{i,1}, ..., c_{i,m_i},
```

where `c_{i,j}` are the `m_i`-point equal-revenue thresholds,
`m_i -> infinity`, and previous-block length `M_i=o(N_i)`.  At one endpoint
inside each block,

```tex
R_T >= N_i ((m_i-1)/m_i)^{m_i} - M_i.
```

Therefore

```tex
limsup_T R_T/T >= 1/e.
```

The finite local certificate behind this is

```tex
kappa(C) =
  max_{lambda in Delta(C)}
    ( E_lambda C - sup_a a Pr_lambda(C>a) ),
```

and for `m` positive support points,

```tex
kappa(C) <= ((m-1)/m)^m -> 1/e,
```

with equality for the finite equal-revenue menu.

### Upper bound

The process-unaware randomized policy drawing every quote independently from

```tex
d mu(a) = a^{-1} 1{e^{-1} <= a <= 1} da
```

satisfies, for every deterministic exogenous path and every horizon,

```tex
R_T <= (T-1)/e.
```

Indeed, its per-time expected payoff against suffix maximum `c` is

```tex
g_mu(c) = int_{[0,c)} a d mu(a) = (c-e^{-1})_+,
```

so `c-g_mu(c) <= e^{-1}`, and the fixed comparator earns at most
`sum_{t<T} M_{t,T}`.

There is also a nonconstructive deterministic quote sequence with

```tex
R_T <= (T-1)/e + O(T^{2/3} sqrt(log T))
```

uniformly over deterministic exogenous paths.  It is obtained by a
probabilistic-method uniform-convergence argument over nonincreasing threshold
sequences.

Thus the lower and upper bounds match at first order:

```tex
R_T = (1/e + o(1)) T
```

in the unrestricted worst-case deterministic exogenous, horizon-oblivious
model.

## Exact Known-Path Characterization

For a fixed deterministic exogenous path, expected regret of any
horizon-oblivious randomized policy depends only on the one-time marginals
`mu_t`:

```tex
R_T =
  V_T^*
  - sum_{t<T} int_{[0,M_{t,T})} x d mu_t(x).
```

Consequently, finite-prefix feasibility gives an exact formal
necessary-and-sufficient condition:

```tex
exists e_T=o(T) such that for all n
exists mu_1,...,mu_{n-1} with
V_T^* - sum_{t<T} int_{[0,M_{t,T}]} x d mu_t(x) <= e_T
for every T <= n.
```

The finite-prefix dual is

```tex
D_n(P)=
max_{lambda in Delta_n}
[
  sum_{T<=n} lambda_T V_T^*
  - sum_{t<n} sup_a sum_{T>t} lambda_T a 1{a<M_{t,T}}
].
```

This dual is the right certificate for impossibility.  If
`D_n(P) >= epsilon n` infinitely often, every horizon-oblivious policy has
linear limsup regret at least `epsilon`.  If the fixed-envelope condition
holds, sublinear regret is possible.  Whether the scalar asymptotic condition
`D_n(P)=o(n)` alone implies the fixed-envelope condition remains open.

## Local Finite-Prefix Formulas

Several useful local identities were established.

For two thresholds `0<c0<c1<=1`, the common-prefix block coefficient is

```tex
alpha(c0,c1) = c0(c1-c0)/c1,
```

maximized at `c0=1/2,c1=1`, giving `1/4`.

For increasing threshold blocks `0^N,c_1,...,c_m`,

```tex
N kappa(C) <= D_{N+m}(P) <= N kappa(C)+m.
```

For two levels `0<ell<h`,

```tex
D(h^M,0^N,ell,h)
 =
 [ ell(M+N)-h(M-1)_+ ]_+ (1-ell/h).
```

The post-low gap does not change this local value:

```tex
D(h^M,0^N,ell,0^L,h)
 =
 [ ell(M+N)-h(M-1)_+ ]_+ (1-ell/h).
```

For equal repeated lows before a resolving high,

```tex
D =
[ ell(s_r-1)-h(M-1)_+ ]_+ (1-ell/h),
```

where `s_r` is the last low time.

For unequal lows before a resolving high, the accepted result is a reduced LP,
not a closed form.  For

```tex
h^M,0^{N_0},ell_1,0^{N_1},ell_2,...,0^{N_{r-1}},ell_r,0^L,h,
```

the formal finite-prefix value is the optimum over segment masses `x_{i,c}`:

```tex
min z
s.t.
z >= S_j - sum_{i<j} sum_{c in L, c <= m_{i,j}} c x_{i,c},
     j=1,...,r,
z >= sum_i sum_{c in L} (h-c) x_{i,c},
sum_c x_{i,c} <= B_i,
x_{i,c} >= 0.
```

Here `L={ell_1,...,ell_r}`, `m_{i,j}=max_{q=i+1,...,j} ell_q`,
`B_0=N_0+1{M>=1}`, `B_i=N_i+1`, and
`S_j=V^*_{s_j}-h(M-1)_+`.  The example `P=(0,0.4,0.9,1)` has

```tex
D_4 = 68/225.
```

Iteration 19 added an unchecked but plausible reformulation: for a trial
level `z`, cover the residual low demands `d_j(z)=(S_j-z)_+` at minimum high
debt `C(z)`, and the one-drought value is the smallest `z` with `C(z)<=z`.
This is useful as a candidate algorithmic route, but it was not criticized or
promoted before the usage limit stopped child jobs.

## Bottom Line

If the intended model is the full-information exogenous delayed-feedback model
from the draft, then `beta(h)->0` is a clean sufficient condition and yields
the truncation bound above.  It is not necessary.

If the intended model is unrestricted deterministic exogenous paths with a
single horizon-oblivious anytime learner, then sublinear regret is not possible
in the worst case; the optimal worst-case regret is exactly

```tex
(1/e + o(1)) T.
```

If the intended model is a single fixed known deterministic path, then the
exact necessary-and-sufficient condition is the fixed-envelope finite-prefix LP
criterion above.  A simpler structural characterization remains open; the main
open question is whether `D_n(P)=o(n)` already suffices.
