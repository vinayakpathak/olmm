# Bibliography

## Verified In Iteration 1 Synthesis

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari. "Online Learning under Delayed Feedback." Proceedings of the 30th International Conference on Machine Learning, PMLR 28(3):1453-1461, 2013. https://proceedings.mlr.press/v28/joulani13.html. Relevance: primary delayed-feedback reduction/background for the bounded-delay full-information grid step.

- Kent Quanrud, Daniel Khashabi. "Online Learning with Adversarial Delays." Advances in Neural Information Processing Systems 28, 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html. Relevance: regret controlled by total delay; supports \(D\lesssim TH\) intuition.

- Tobias Sommer Thune, Nicolo Cesa-Bianchi, Yevgeny Seldin. "Nonstochastic Multiarmed Bandits with Unrestricted Delays." NeurIPS 2019. https://papers.nips.cc/paper_files/paper/2019/hash/0e4f5cc9f4f3f7f1651a6b9f9214e5b1-Abstract.html. Relevance: unbounded delays, skipping large delays, and skip-set/oracle delay penalties.

- Julian Zimmert, Yevgeny Seldin. "An Optimal Algorithm for Adversarial Bandits with Arbitrary Delays." AISTATS 2020 / arXiv:1910.06054. https://arxiv.org/abs/1910.06054. Relevance: optimal arbitrary-delay bandit bounds and refined excluded-round delay accounting.

- Tal Lancewicki, Shahar Segal, Tomer Koren, Yishay Mansour. "Stochastic Multi-Armed Bandits with Unrestricted Delay Distributions." ICML 2021, PMLR 139:5969-5978. https://proceedings.mlr.press/v139/lancewicki21a.html. Relevance: quantile-style control under unbounded or infinite delays.

- Lukas Zierahn, Dirk van der Hoeven, Tal Lancewicki, Aviv Rosenberg, Nicolo Cesa-Bianchi. "A Unified Analysis of Nonstochastic Delayed Feedback for Combinatorial Semi-Bandits, Linear Bandits, and MDPs." JMLR 26(104):1-60, 2025. https://www.jmlr.org/papers/v26/24-0496.html. Relevance: modern delayed-feedback decomposition; less direct than full-information expert references.

- Dirk van der Hoeven, Nicolo Cesa-Bianchi. "Nonstochastic Bandits and Experts with Arm-Dependent Delays." AISTATS 2022, PMLR 151:2022-2044. https://proceedings.mlr.press/v151/van-der-hoeven22a.html. Relevance: arm-dependent delays, including full-information experts; quote delays are action-dependent.

- Ilai Bistritz, Zhengyuan Zhou, Xi Chen, Nicholas Bambos, Jose Blanchet. "Online EXP3 Learning in Adversarial Bandits with Delayed Feedback." NeurIPS 2019. https://proceedings.neurips.cc/paper/2019/hash/ae2a2db40a12ec0131d48acc1218d2ef-Abstract.html. Relevance: delayed bandit feedback and missing feedback beyond horizon; useful for horizon-censoring distinctions.

- Nicolo Cesa-Bianchi, Claudio Gentile, Yishay Mansour. "Nonstochastic Bandits with Composite Anonymous Feedback." COLT 2018, PMLR 75:750-773. https://proceedings.mlr.press/v75/cesa-bianchi18a.html. Relevance: adjacent harder anonymous/composite delayed-feedback model; comparison only.

- Nicolo Cesa-Bianchi, Tommaso Cesari, Roberto Colomboni, Luigi Foscari, Vinayak Pathak. "Market Making without Regret." COLT 2025, PMLR 291:799-837. https://proceedings.mlr.press/v291/cesa-bianchi25a.html. Relevance: adjacent market-making regret framework and threshold/pricing connections.

- Jacob Abernethy, Satyen Kale. "Adaptive Market Making via Online Learning." NeurIPS 2013. https://papers.neurips.cc/paper/4910-adaptive-market-making-via-online-learning.pdf. Relevance: online-learning market-making model with exogenous price series.

## Verified In Iteration 2 Synthesis

- Andras Gyorgy, Pooria Joulani. "Adapting to Delays and Data in Adversarial Multi-Armed Bandits." Proceedings of the 38th International Conference on Machine Learning, PMLR 139:3988-3997, 2021. https://proceedings.mlr.press/v139/gyorgy21a.html. Relevance: delay/data-adaptive adversarial bandit bounds and skip-set penalties; candidate tool for adaptive truncation.

- Genevieve E. Flaspohler, Francesco Orabona, Judah Cohen, Soukayna Mouatadid, Miruna Oprescu, Paulo Orenstein, Lester Mackey. "Online Learning with Optimism and Delay." Proceedings of the 38th International Conference on Machine Learning, PMLR 139:3363-3373, 2021. https://proceedings.mlr.press/v139/flaspohler21a.html. Relevance: delay-as-optimism perspective; useful for predictable delayed fills and adaptive algorithms.

- Paul Duetting, Guru Guruganesh, Jon Schneider, Joshua Ruizhi Wang. "Optimal No-Regret Learning for One-Sided Lipschitz Functions." Proceedings of the 40th International Conference on Machine Learning, PMLR 202:8836-8850, 2023. https://proceedings.mlr.press/v202/duetting23b.html. Relevance: possible tool for exploiting one-sided threshold geometry beyond uniform grids.

- Nicolo Cesa-Bianchi, Claudio Gentile, Yishay Mansour, Alberto Minora. "Delay and Cooperation in Nonstochastic Bandits." 29th Annual Conference on Learning Theory, PMLR 49:605-622, 2016. https://proceedings.mlr.press/v49/cesa-bianchi16.html. Relevance: delayed-bandit minimax background and lower-bound methodology for class-uniform readings.

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari. "Delay-Tolerant Online Convex Optimization: Unified Analysis and Adaptive-Gradient Algorithms." Proceedings of the AAAI Conference on Artificial Intelligence 30(1), 2016. DOI: https://doi.org/10.1609/aaai.v30i1.10320. Relevance: full-information delayed-feedback/OCO reduction and adaptive-gradient algorithms; possible support for cleaner grid sufficiency variants.

- Nicolo Cesa-Bianchi, Gabor Lugosi. *Prediction, Learning, and Games*. Cambridge University Press, 2006. https://cesa-bianchi.di.unimi.it/predbook/. Relevance: standard reference for online prediction, expert advice, individual-sequence guarantees, and minimax regret quantifiers.

- Andrew C. C. Yao. "Probabilistic Computations: Toward a Unified Measure of Complexity." 18th Annual Symposium on Foundations of Computer Science, 1977, pp. 222-227. DOI: https://doi.org/10.1109/SFCS.1977.24. Relevance: canonical minimax/Yao framing for randomized-algorithm lower bounds; background for two-continuation lower-bound interpretation.

- Robert D. Kleinberg, Frank Thomson Leighton. "The Value of Knowing a Demand Curve: Bounds on Regret for Online Posted-Price Auctions." 44th IEEE Symposium on Foundations of Computer Science, 2003, pp. 594-605. DOI: https://doi.org/10.1109/SFCS.2003.1238232. Relevance: foundational posted-price regret bounds and lower-bound context for threshold/pricing geometry.

## Verified In Iteration 3 Synthesis

- Emmanuel Esposito, Saeed Masoudian, Hao Qiu, Dirk van der Hoeven, Nicolo Cesa-Bianchi, Yevgeny Seldin. "Delayed Bandits: When Do Intermediate Observations Help?" Proceedings of the 40th International Conference on Machine Learning, PMLR 202:9374-9395, 2023. https://proceedings.mlr.press/v202/esposito23a.html. Relevance: delayed bandits with intermediate observations; useful analogue for public price histories that may predict delayed fills.

- Ciara Pike-Burke, Shipra Agrawal, Csaba Szepesvari, Steffen Grunewalder. "Bandits with Delayed, Aggregated Anonymous Feedback." Proceedings of the 35th International Conference on Machine Learning, PMLR 80:4105-4113, 2018. https://proceedings.mlr.press/v80/pike-burke18a.html. Relevance: delayed aggregated anonymous feedback; useful contrast with identifiable public-price/full-information fills.

- Marcelo J. Weinberger, Erik Ordentlich. "On delayed prediction of individual sequences." IEEE Transactions on Information Theory 48(7):1959-1976, 2002. DOI: https://doi.org/10.1109/TIT.2002.1013136. Relevance: older individual-sequence delayed-prediction background.

- Alexander Ryabchenko, Idan Attias, Daniel M. Roy. "A Reduction from Delayed to Immediate Feedback for Online Convex Optimization with Improved Guarantees." arXiv:2602.02634, 2026. https://arxiv.org/abs/2602.02634. Relevance: recent delayed-to-immediate OCO reduction with total-delay and outstanding-observation terms; candidate background for adaptive truncation, not direct market-making proof support.

- Jiahao Zhang, Tao Lin, Weiqiang Zheng, Zhe Feng, Yifeng Teng, Xiaotie Deng. "Learning Thresholds with Latent Values and Censored Feedback." ICLR 2024. https://openreview.net/forum?id=qaKRfobbTg. Relevance: threshold/censored-feedback learning with one-sided Lipschitz assumptions; possible background for continuum quote geometry.

- Jianyu Xu, Yining Wang, Xi Chen, Yu-Xiang Wang. "Dynamic Pricing with Adversarially-Censored Demands." arXiv:2502.06168, 2025, revised 2026. https://arxiv.org/abs/2502.06168. Relevance: adjacent dynamic pricing with adversarial censoring; useful terminology and techniques for censored observations.

- Jacob Abernethy, Peter L. Bartlett, Elad Hazan. "Blackwell Approachability and No-Regret Learning are Equivalent." COLT 2011, PMLR 19:27-46. https://proceedings.mlr.press/v19/abernethy11b.html. Relevance: possible framework for simultaneous constraint feasibility or prefix-compatibility formulations.

- Amit Daniely, Alon Gonen, Shai Shalev-Shwartz. "Strongly Adaptive Online Learning." Proceedings of the 32nd International Conference on Machine Learning, PMLR 37:1405-1411, 2015. https://proceedings.mlr.press/v37/daniely15.html. Relevance: background on guarantees over all intervals/prefixes; useful contrast for horizon-oblivious regret.

- Elad Hazan, C. Seshadhri. "Efficient Learning Algorithms for Changing Environments." Proceedings of the 26th International Conference on Machine Learning, 2009, pp. 393-400. DOI: https://doi.org/10.1145/1553374.1553425. Relevance: adaptive regret background for simultaneous interval/prefix quantifiers.

## Verified In Iteration 4 Synthesis

- Julius Graf, Thibaut Mastrolia. "Learning Market Making with Closing Auctions." arXiv:2601.17247, 2026. https://arxiv.org/abs/2601.17247. Relevance: recent adjacent market-making work with closing-auction/terminal-liquidity effects; useful for terminology but not a direct delayed-fill tail characterization source.

- Ofir Schlisselberg, Tal Lancewicki, Peter Auer, Yishay Mansour. "Improved Best-of-Both-Worlds Regret for Bandits with Delayed Feedback." Advances in Neural Information Processing Systems 38 (NeurIPS 2025) / arXiv:2505.24193. https://proceedings.neurips.cc/paper_files/paper/2025/hash/02f0ac0a323dc17d964d4bbf8a62e01b-Abstract-Conference.html. Relevance: modern delayed-bandit bounds involving cumulative delay and missing observations; context for adaptive truncation alternatives, not direct market-making proof support.

- Saeed Masoudian, Julian Zimmert, Yevgeny Seldin. "A Best-of-both-worlds Algorithm for Bandits with Delayed Feedback with Robustness to Excessive Delays." NeurIPS 2024, OpenReview. https://openreview.net/forum?id=LDzrQB4X5w. Relevance: delayed-bandit algorithm emphasizing outstanding/missing observations over elapsed time; useful conceptual support for replacing hard tail cutoffs by information-based penalties.

- Haipeng Luo, Robert E. Schapire. "Towards Minimax Online Learning with Unknown Time Horizon." Proceedings of the 31st International Conference on Machine Learning, PMLR 32(1):226-234, 2014. https://proceedings.mlr.press/v32/luo14.html. Relevance: background for fixed-horizon, horizon-aware, and unknown/adversarial-horizon quantifier distinctions.

- Eyal Gofer, Yishay Mansour. "Lower bounds on individual sequence regret." Machine Learning 103:1-26, 2016. DOI: https://doi.org/10.1007/s10994-015-5531-y. Relevance: anytime individual-sequence lower-bound context; useful contrast for same-path prefix-conflict obstructions.

- Cristobal Guzman, Nishant Mehta, Ali Mortazavi. "Best-case lower bounds in online learning." Advances in Neural Information Processing Systems 34 (NeurIPS 2021). https://proceedings.neurips.cc/paper/2021/hash/b7da6669894867f04b8727876a69ffc0-Abstract.html. Relevance: conceptual background on lower-bound/adaptivity quantifiers in online learning.

- Shie Mannor, John N. Tsitsiklis, Jia Yuan Yu. "Online Learning with Sample Path Constraints." Journal of Machine Learning Research 10:569-590, 2009. https://jmlr.org/beta/papers/v10/mannor09a.html. Relevance: sample-path constraint framework that may help formulate simultaneous-prefix compatibility, but this is speculative and not proof support.

## Verified In Iteration 5 Synthesis

- Alexander Ryabchenko, Idan Attias, Daniel M. Roy. "Capacity-Constrained Online Learning with Delays: Scheduling Frameworks and Regret Trade-offs." Proceedings of Thirty Eighth Conference on Learning Theory, PMLR 291:4973-5014, 2025. https://proceedings.mlr.press/v291/ryabchenko25a.html. Relevance: delayed online learning with tracking-capacity constraints; useful for adaptive truncation/outstanding-feedback variants of the finite-grid reduction.

- Saeed Masoudian, Julian Zimmert, Yevgeny Seldin. "A Best-of-Both-Worlds Algorithm for Bandits with Delayed Feedback." NeurIPS 2022 / arXiv:2206.14906. https://arxiv.org/abs/2206.14906. Relevance: arbitrary-delay bandit bounds using total delay, maximal delay, and outstanding observations; predecessor to the 2024 robustness-to-excessive-delays paper.

- Haipeng Luo, Spandan Senapati, Vatsal Sharan. "Simultaneous Swap Regret Minimization via KL-Calibration." NeurIPS 2025 spotlight, OpenReview. https://openreview.net/forum?id=Ib4ZXPXpss. Relevance: simultaneous-regret/calibration analogy for multiple-prefix compatibility; not a delayed-feedback result.

- Shan Xue, Ye Du, Liang Xu. "Adaptive Market Making with Inventory Constraints via Online Learning." Proceedings of the AAAI Conference on Artificial Intelligence 39(20):21859-21867, 2025. https://doi.org/10.1609/aaai.v39i20.35492. Relevance: adjacent online-learning market-making model with inventory constraints; not a delayed-fill tail characterization.

- Junzhe Jiang, Chang Yang, Xinrun Wang, Zhiming Li, Xiao Huang, Bo Li. "Resolving Latency and Inventory Risk in Market Making with Reinforcement Learning." arXiv:2505.12465, 2025. https://arxiv.org/abs/2505.12465. Relevance: adjacent latency-aware RL market-making work; useful context only.

- David Blackwell. "An analog of the minimax theorem for vector payoffs." Pacific Journal of Mathematics 6(1):1-8, 1956. https://msp.org/pjm/1956/6-1/p01.xhtml. Relevance: classical origin of approachability/vector-payoff feasibility; conceptual background for prefix-compatibility formulations.

- Maurice Sion. "On general minimax theorems." Pacific Journal of Mathematics 8(1):171-176, 1958. https://msp.org/pjm/1958/8-1/p14.xhtml. Relevance: direct minimax theorem background for finite-grid LP duality; not by itself a market-making lower-bound proof.

- Joon Kwon, Vianney Perchet. "Online Learning and Blackwell Approachability with Partial Monitoring: Optimal Convergence Rates." AISTATS 2017, PMLR 54:604-613. https://proceedings.mlr.press/v54/kwon17a.html. Relevance: approachability with partial monitoring and multi-criteria objectives; possible framework for dynamic prefix-compatibility variants.

- Joon Kwon. "Refined approachability algorithms and application to regret minimization with global costs." Journal of Machine Learning Research 22(200):1-38, 2021. https://jmlr.org/papers/v22/20-1019.html. Relevance: vector-payoff/global-cost regret background for compatibility-gap objectives.

## Verified In Iteration 6 Synthesis

- Davide Maran, Marcello Restelli. "Online Market Making and the Value of Observing the Order Book." arXiv:2605.19584, 2026; listed on the COLT 2026 accepted-papers page. https://arxiv.org/abs/2605.19584. Relevance: adjacent online market-making regret model with action-dependent order-book feedback; useful contrast, not a delayed-fill tail characterization.

- Alexander Ryabchenko, Idan Attias, Daniel M. Roy. "Capacity-Constrained Online Convex Optimization with Delayed Feedback." arXiv:2606.11711, 2026. https://arxiv.org/abs/2606.11711. Relevance: capacity-constrained delayed OCO/BCO with delayed-weighted reductions; supports adaptive truncation/tracking-capacity directions.

- Lunjia Hu, Kevin Tian, Chutong Yang. "Simultaneous Blackwell Approachability and Applications to Multiclass Omniprediction." COLT 2026 / arXiv:2602.17577. https://arxiv.org/abs/2602.17577. Relevance: simultaneous approachability with coupled actions; analogy for prefix-compatibility and simultaneous-horizon feasibility.

- Rafael Frongillo, Haipeng Luo, Nishant A. Mehta, Jon Schneider. "Toward Simultaneously Optimal Regret in U-Calibration." COLT 2026 / arXiv:2606.18527. https://arxiv.org/abs/2606.18527. Relevance: simultaneous-regret/U-calibration analogy for one sequence serving many downstream objectives.

- Anne-Katrin Roesler, Balázs Szentes. "Buyer-Optimal Learning and Monopoly Pricing." American Economic Review 107(7):2072-2080, 2017. DOI: https://doi.org/10.1257/aer.20160145. Relevance: unit-elastic/equal-revenue posted-price geometry related to the \(1/e\) multi-threshold \(\kappa\) dual.

- Weiran Shen, Pingzhong Tang, Yulong Zeng. "Buyer-Optimal Distribution." Proceedings of the 17th International Conference on Autonomous Agents and MultiAgent Systems (AAMAS), 1513-1521, 2018. ACM record: https://dl.acm.org/doi/10.5555/3237383.3237926; PDF: https://www.weiran-shen.info/page_files/buyer_optimal_distribution.pdf. Relevance: direct buyer-chosen distribution/posting-price problem; useful for the truncated equal-revenue \(1/e\) construction.

- Daniele Condorelli, Balázs Szentes. "Information Design in the Holdup Problem." Journal of Political Economy 128(2):681-709, 2020. DOI: https://doi.org/10.1086/704574. Relevance: arbitrary-distribution monopoly-pricing model with related unit-elastic/equal-revenue structure.

- Jason D. Hartline. *Mechanism Design and Approximation*, Chapter 4, "Bayesian Approximation." https://jasonhartline.com/MDnA/MDnA-ch4.pdf. Relevance: pedagogical equal-revenue/monopoly-pricing background for the multi-threshold LP analogy.

## Verified In Iteration 7 Synthesis

- Dirk Bergemann, Benjamin Brooks, Stephen Morris. "The Limits of Price Discrimination." *American Economic Review* 105(3):921-957, 2015. DOI: https://doi.org/10.1257/aer.20130848. Relevance: foundational price-discrimination and surplus-frontier geometry adjacent to the welfare-minus-posted-revenue view of \(\kappa\); not a delayed market-making theorem.

- Dirk Bergemann, Karl H. Schlag. "Pricing Without Priors." *Journal of the European Economic Association* 6(2-3):560-569, 2008. DOI: https://doi.org/10.1162/JEEA.2008.6.2-3.560. Relevance: minimax/regret pricing without distributional priors; useful robust-pricing background for primal action-law ideas around \(\kappa\).

- Zhi Chen, Zhenyu Hu, Ruiqin Wang. "Screening with Limited Information: A Dual Perspective." *Operations Research* 72(4):1487-1504, 2024. DOI: https://doi.org/10.1287/opre.2022.0016. Relevance: robust screening and minimax pricing duality; adjacent to the LP-duality interpretation of the multi-threshold \(\kappa\) gap.

- Rachel Cummings, Nikhil R. Devanur, Zhiyi Huang, Xiangning Wang. "Algorithmic Price Discrimination." Proceedings of the 2020 ACM-SIAM Symposium on Discrete Algorithms (SODA), 2432-2451, 2020. DOI: https://doi.org/10.1137/1.9781611975994.149. Relevance: algorithmic finite-dimensional price-discrimination/segmentation LP context; possible computational background for finite \(\kappa\) problems.

- Shao-Heng Ko, Kamesh Munagala. "Optimal Price Discrimination for Randomized Mechanisms." Proceedings of the 23rd ACM Conference on Economics and Computation (EC), 477-496, 2022. DOI: https://doi.org/10.1145/3490486.3538335. Journal version: *ACM Transactions on Economics and Computation* 12(2), 2024, DOI: https://doi.org/10.1145/3650107. Relevance: finite equal-revenue signal constructions in price discrimination; adjacent support for the geometry, but not a direct citation for the exact finite-\(m\) threshold constant.

## Verified In Iteration 8 Synthesis

- Bobby Kleinberg, Renato Paes Leme, Jon Schneider, Yifeng Teng. "U-Calibration: Forecasting for an Unknown Agent." Proceedings of the 36th Conference on Learning Theory, PMLR 195:5143-5145, 2023. https://proceedings.mlr.press/v195/kleinberg23a.html. Relevance: simultaneous downstream-regret analogy for one sequence serving many objectives; not direct support for delayed market-making lower bounds.

- Lunjia Hu, Yifan Wu. "Calibration Error for Decision Making." FOCS 2024 / arXiv:2404.13503. https://arxiv.org/abs/2404.13503. Relevance: introduces Calibration Decision Loss as a decision-relevant worst-case payoff-loss metric; useful terminology for replacing raw delay tails by actionable information-loss moduli.

- Haipeng Luo, Spandan Senapati, Vatsal Sharan. "Optimal Multiclass U-Calibration Error and Beyond." NeurIPS 2024, OpenReview / arXiv:2405.19374. https://openreview.net/forum?id=7aFRgCC8Q7; https://arxiv.org/abs/2405.19374. Relevance: simultaneous-regret/minimax calibration analogy; not a delayed-feedback or market-making theorem.

- Konstantina Bairaktari, Lunjia Hu, Huy L. Nguyen, Jonathan Ullman. "Testable and Actionable Calibration for Full Swap Regret." arXiv:2605.17749, 2026. https://arxiv.org/abs/2605.17749. Relevance: recent actionable/testable calibration measure for swap regret; useful analogy for decision-relevant delay-tail statistics, not proof support for CL-026/CL-027.

## Still-Unchecked Candidates From Iteration Reports

- Jerome Dugast, Thomas Marta, Fabrice Riva. "Market Depth and Execution Delays." SSRN working paper, 2026, DOI candidate 10.2139/ssrn.6440898. https://ssrn.com/abstract=6440898. Relevance: adjacent order-book/execution-delay economics; needs full metadata/source verification before use.

## Verified In Iteration 9 Synthesis

- Dirk Bergemann, Karl H. Schlag. "Robust Monopoly Pricing." *Journal of Economic Theory* 146(6):2527-2543, 2011. DOI: https://doi.org/10.1016/j.jet.2011.10.018. Relevance: robust/maximin/minimax-regret monopoly-pricing context for randomized pricing laws and local primal interpretations; adjacent only, not a proof of the finite-\(C\) root formula.

- René Caldentey, Ying Liu, Ilan Lobel. "Intertemporal Pricing Under Minimax Regret." *Operations Research* 65(1):104-129, 2017. DOI: https://doi.org/10.1287/opre.2016.1548. Relevance: dynamic minimax-regret pricing background for known-path anytime upper-bound attempts; adjacent only, not a delayed-fill theorem.

- Ioannis Anagnostides, Gabriele Farina, Maxwell Fishelson, Haipeng Luo, Jon Schneider. "Swap Regret Minimization Through Response-Based Approachability." arXiv:2602.06264, 2026. https://arxiv.org/abs/2602.06264. Relevance: weak approachability/simultaneous-regret analogy if the known-path problem is later formulated as vector-payoff feasibility; not proof support for the \(1/e\) market-making upper bound.

## Verified In Iteration 10 Synthesis

- Wassily Hoeffding. "Probability Inequalities for Sums of Bounded Random Variables." *Journal of the American Statistical Association* 58(301):13-30, 1963. DOI: https://doi.org/10.1080/01621459.1963.10500830. Relevance: direct concentration inequality used in the monotone-threshold derandomization lemma.

- Noga Alon, Joel H. Spencer. *The Probabilistic Method*, 4th ed. Wiley, 2016. Wiley listing: https://www.wiley.com/en-gb/The%2BProbabilistic%2BMethod%2C%2B4th%2BEdition-p-9781119061953. Relevance: standard background for nonconstructive existence via random constructions, concentration, union bounds, and Borel-Cantelli.

- Aad W. van der Vaart, Jon A. Wellner. *Weak Convergence and Empirical Processes: With Applications to Statistics*. Springer Series in Statistics, 1996. DOI: https://doi.org/10.1007/978-1-4757-2545-2. Relevance: empirical-process and bracketing background for possible sharper proofs of the monotone-threshold uniform convergence lemma.

- Fuchang Gao, Jon A. Wellner. "Entropy Estimate for High-Dimensional Monotonic Functions." *Journal of Multivariate Analysis* 98(9):1751-1764, 2007. DOI: https://doi.org/10.1016/j.jmva.2006.09.003; arXiv: https://arxiv.org/abs/math/0512641. Relevance: monotone-function entropy context; useful if replacing the elementary grid proof by a bracketing argument.

- Harald Niederreiter. *Random Number Generation and Quasi-Monte Carlo Methods*. CBMS-NSF Regional Conference Series in Applied Mathematics, SIAM, 1992. DOI: https://doi.org/10.1137/1.9781611970081. Relevance: possible background for explicit low-discrepancy replacements for the nonconstructive deterministic sequence.

- V. N. Vapnik, A. Ya. Chervonenkis. "On the Uniform Convergence of Relative Frequencies of Events to Their Probabilities." *Theory of Probability and Its Applications* 16(2):264-280, 1971. DOI: https://doi.org/10.1137/1116025. Relevance: classical uniform-convergence background; useful mainly as context for why the accepted proof avoids a naive finite-VC route.

## Verified In Iteration 11 Synthesis

- Cagil Kocyigit, Napat Rujeerapaiboon, Daniel Kuhn. "Robust Multidimensional Pricing: Separation Without Regret." *Mathematical Programming* 196:841-874, 2022. DOI: https://doi.org/10.1007/s10107-021-01615-4. Relevance: adjacent minimax-regret robust-pricing and finite-approximation context for compact menu arguments; not direct proof support for delayed market making.

- Shixin Wang, Shaoxuan Liu, Jiawei Zhang. "Minimax Regret Robust Screening with Moment Information." *Manufacturing & Service Operations Management* 26(3):992-1012, 2024. DOI: https://doi.org/10.1287/msom.2023.0072. Relevance: adjacent robust-screening LP/minimax context with finite support approximations; not direct proof support for the compact suffix-menu theorem.

## Verified In Iteration 12 Synthesis

- David Lagziel, Ehud Lehrer. "Approachability with delayed information." *Journal of Economic Theory* 157:425-444, 2015. DOI: https://doi.org/10.1016/j.jet.2015.01.010. Relevance: delayed-information approachability/no-regret background for possible vector-deficit or simultaneous-horizon formulations; not direct proof support for the market-making compactness lemma.

- Haitian Xie, Ying Zhu, Denis Shishkin. "On the limitations of data-based price discrimination." *Theoretical Economics* 20(1):303-351, 2025. DOI: https://doi.org/10.3982/TE5916; arXiv: https://arxiv.org/abs/2204.12723. Relevance: adjacent data-driven price-discrimination/minimax-pricing source; useful context for robust pricing and equal-revenue geometry, not a delayed-fill theorem.

- Ilai Bistritz, Zhengyuan Zhou, Xi Chen, Nicholas Bambos, Jose Blanchet. "No Weighted-Regret Learning in Adversarial Bandits with Delays." *Journal of Machine Learning Research* 23(139):1-43, 2022. https://www.jmlr.org/papers/v23/20-411.html. Relevance: delayed adversarial bandit paper with weighted-regret objectives and total-delay bounds; relevant background for horizon-weighted finite-prefix dual certificates, not direct proof support for the deterministic-path LP.

## Verified In Iteration 13 Synthesis

- Christoph Dann, Yishay Mansour, Mehryar Mohri, Jon Schneider, Balasubramanian Sivan. "Rate-Preserving Reductions for Blackwell Approachability." Proceedings of the 38th Conference on Learning Theory, PMLR 291:1380-1414, 2025. https://proceedings.mlr.press/v291/dann25a.html. Relevance: approachability/regret reduction background for possible vector-deficit formulations; not direct proof support for \(D_n\)-gluing.

- Shie Mannor, Vianney Perchet, Gilles Stoltz. "Set-Valued Approachability and Online Learning with Partial Monitoring." *Journal of Machine Learning Research* 15:3247-3295, 2014. https://jmlr.org/papers/v15/mannor14a.html. Relevance: set-valued/vector payoff feasibility background for horizon-indexed constraints; analogy only.

- Ehud Lehrer. "Approachability in Infinite Dimensional Spaces." *International Journal of Game Theory* 31(2):253-268, 2002/2003. DOI: https://doi.org/10.1007/s001820200115. Relevance: infinite-dimensional approachability background for countably many horizon constraints; analogy only.

- Ehud Lehrer. "A Wide Range No-Regret Theorem." *Games and Economic Behavior* 42(1):101-115, 2003. DOI: https://doi.org/10.1016/S0899-8256(03)00032-0. Relevance: one-strategy/many-comparators no-regret background, analogous to one quote sequence serving many horizons.

- Andrey Bernstein, Nahum Shimkin. "Response-Based Approachability with Applications to Generalized No-Regret Problems." *Journal of Machine Learning Research* 16:747-773, 2015. https://jmlr.org/papers/v16/bernstein15a.html. Relevance: possible algorithmic framework if the finite-prefix dual is recast as response-based vector feasibility; not a delayed market-making theorem.

- Jerome Renault. "Uniform value in dynamic programming." *Journal of the European Mathematical Society* 13(2):309-330, 2011. DOI: https://doi.org/10.4171/JEMS/254. Relevance: uniform-value/gluing background with explicit structural sufficient conditions; analogy for finite-prefix-to-anytime questions.

- Xiaoxi Li, Xavier Venel. "Recursive games: Uniform value, Tauberian theorem and the Mertens conjecture." *International Journal of Game Theory* 45(1-2):155-189, 2016. DOI: https://doi.org/10.1007/s00182-015-0496-4; arXiv: https://arxiv.org/abs/1506.00949. Relevance: total-boundedness/stability conditions for uniform values; supports caution about gluing finite-prefix values.

- J.-F. Mertens, A. Neyman. "Stochastic games." *International Journal of Game Theory* 10:53-66, 1981. DOI: https://doi.org/10.1007/BF01769259. Relevance: classical uniform-value/stochastic-games background; analogy only.

- Janos Flesch, Rida Laraki, Vianney Perchet. "Online Learning and Blackwell Approachability in Quitting Games." Proceedings of the 29th Conference on Learning Theory, PMLR 49:941-942, 2016. https://proceedings.mlr.press/v49/flesch16.html. Relevance: weak background for fixed-horizon versus anytime approachability in quitting-game settings; not direct proof support.

## Verified In Iteration 14 Synthesis

- Jérôme Renault. "General limit value in dynamic programming." *Journal of Dynamics and Games* 1(3):471-484, 2014. DOI: https://doi.org/10.3934/jdg.2014.1.471. Relevance: uniform-value/gluing background via total-boundedness criteria for dynamic-programming value families; analogy only.

- Christoph Dann, Yishay Mansour, Mehryar Mohri, Jon Schneider, Balubramanian Sivan. "Pseudonorm Approachability and Applications to Regret Minimization." Proceedings of the 34th International Conference on Algorithmic Learning Theory, PMLR 201:471-509, 2023. https://proceedings.mlr.press/v201/dann23a.html. Relevance: \(\ell_\infty\)/pseudonorm approachability tools for many simultaneous regret constraints; possible formulation background for horizon-indexed deficits, not proof support for \(D_n\)-gluing.

- Juan Kuntz, Philipp Thomas, Guy-Bart Stan, Mauricio Barahona. "Approximations of Countably Infinite Linear Programs over Bounded Measure Spaces." *SIAM Journal on Optimization* 31(1):604-629, 2021. DOI: https://doi.org/10.1137/19M1268847; arXiv: https://arxiv.org/abs/1810.03658. Relevance: countably infinite LP approximation over bounded measure spaces; possible language for fixed-envelope infinite feasibility, not market-specific.

- Delbert Ray Fulkerson, Oliver Alfred Gross. "Incidence matrices and interval graphs." *Pacific Journal of Mathematics* 15(3):835-855, 1965. https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-15/issue-3/Incidence-matrices-and-interval-graphs/pjm/1102995572.full; PDF: https://msp.org/pjm/1965/15-3/pjm-v15-n3-p11-s.pdf. Relevance: primary source for consecutive-ones/interval-incidence structure; background for finite-alphabet dual reductions only.

- Alexander Rakhlin, Karthik Sridharan, Ambuj Tewari. "Online Learning: Beyond Regret." Proceedings of the 24th Annual Conference on Learning Theory, PMLR 19:559-594, 2011. https://proceedings.mlr.press/v19/rakhlin11a.html. Relevance: broad framework for online learning with global/non-additive objectives; conceptual background only.

## Verified In Iteration 15 Synthesis

- Changlong Wu, Mohsen Heidari, Ananth Grama, Wojciech Szpankowski. "Sequential vs. Fixed Design Regrets in Online Learning." 2022 IEEE International Symposium on Information Theory (ISIT), pp. 438-443, 2022. DOI: https://doi.org/10.1109/ISIT50566.2022.9834776. Relevance: terminology for fixed-design/path-known versus sequential regret, matching the run's quantifier distinctions.

- Angelos Assos, Idan Attias, Yuval Dagan, Constantinos Daskalakis, Maxwell K. Fishelson. "Online Learning and Solving Infinite Games with an ERM Oracle." Proceedings of the 36th Conference on Learning Theory, PMLR 195:274-324, 2023. https://proceedings.mlr.press/v195/assos23a.html. Relevance: possible background for recasting fixed-envelope feasibility as an infinite game or best-response-oracle problem; not a delayed market-making theorem.

- Changlong Wu, Ananth Grama, Wojciech Szpankowski. "Online Learning in Dynamically Changing Environments." Proceedings of the 36th Conference on Learning Theory, PMLR 195:325-358, 2023. https://proceedings.mlr.press/v195/wu23a.html. Relevance: process-complexity viewpoint that may inform finite-alphabet switching or drought-complexity parameters; background only.

- Vasilis Kontonis, Mingchen Ma, Christos Tzamos. "The Gain from Ordering in Online Learning." Advances in Neural Information Processing Systems 36, 2023. https://proceedings.neurips.cc/paper_files/paper/2023/hash/c9b1fe9c41f1eeec3a659154d575a282-Abstract-Conference.html. Relevance: fixed-design/self-directed online-learning analogy for path-known order effects; not proof support for delayed market making.

- Alexander Rakhlin, Karthik Sridharan. "Online Learning with Predictable Sequences." Proceedings of the 26th Annual Conference on Learning Theory, PMLR 30:993-1019, 2013. https://proceedings.mlr.press/v30/Rakhlin13.html. Relevance: predictable-sequence/optimistic online-learning background for stable or predictable delayed-fill regimes.

- D. V. Lindley. "The theory of queues with a single server." Mathematical Proceedings of the Cambridge Philosophical Society 48(2):277-289, 1952. DOI: https://doi.org/10.1017/S0305004100027638. Relevance: background for reflected-queue or surplus/debt recursion analogies in two-level drought bookkeeping; not a market-making theorem.

## Verified In Iteration 16 Synthesis

- Amelie Heliou, Panayotis Mertikopoulos, Zhengyuan Zhou. "Gradient-free Online Learning in Continuous Games with Delayed Rewards." Proceedings of the 37th International Conference on Machine Learning, PMLR 119:4172-4181, 2020. https://proceedings.mlr.press/v119/heliou20a.html; arXiv: https://arxiv.org/abs/2006.10911. Relevance: continuous-action online learning with delayed, asynchronous payoff feedback and priority-queue processing; adjacent background for adaptive delayed rewards, not a suffix-horizon market-fill theorem.

- Jialun Cao, David Siska, Lukasz Szpruch, Tanut Treetanthiploet. "Logarithmic regret in the ergodic Avellaneda-Stoikov market making model." SIAM Journal on Financial Mathematics, accepted/in press 25 Mar 2026; arXiv:2409.02025. https://arxiv.org/abs/2409.02025. Relevance: market-making regret in an ergodic Avellaneda-Stoikov stochastic-control model; adjacent context only and not a delayed-fill tail characterization.

- Jakob Albers, Mihai Cucuringu, Sam Howison, Alexander Y. Shestopaloff. "The Market Maker's Dilemma: Navigating the Fill Probability vs. Post-Fill Returns Trade-Off." arXiv:2502.18625, submitted 2025, revised 2025. https://arxiv.org/abs/2502.18625. Relevance: empirical market-microstructure paper documenting a fill-probability/post-fill-return tradeoff; useful motivation only, not a regret or finite-prefix LP result.

## Verified In Iteration 17 Synthesis

- Miriam Ayer, H. D. Brunk, G. M. Ewing, W. T. Reid, Edward Silverman. "An Empirical Distribution Function for Sampling with Incomplete Information." *The Annals of Mathematical Statistics* 26(4):641-647, 1955. DOI: https://doi.org/10.1214/aoms/1177728423; Project Euclid: https://projecteuclid.org/journals/annals-of-mathematical-statistics/volume-26/issue-4/An-Empirical-Distribution-Function-for-Sampling-with-Incomplete-Information/10.1214/aoms/1177728423.full. Relevance: classical pooling/isotonic-estimation source; useful proof-technology background for possible unequal-low pooling rules, not a delayed-market-making theorem.

- Nilotpal Chakravarti. "Isotonic Median Regression: A Linear Programming Approach." *Mathematics of Operations Research* 14(2):303-308, 1989. DOI: https://doi.org/10.1287/moor.14.2.303. Relevance: LP perspective on isotonic median regression and PAVA-like methods; useful analogy for the unequal-low drought LP dual, not proof support for the market model.

- Awi Federgruen, Henri Groenevelt. "The Greedy Procedure for Resource Allocation Problems: Necessary and Sufficient Conditions for Optimality." *Operations Research* 34(6):909-918, 1986. DOI: https://doi.org/10.1287/opre.34.6.909. Relevance: greedy/resource-allocation background for nested capacity constraints; possible proof-technology analogy for front-loaded low-mass allocation, not a delayed-fill result.

## Verified In Iteration 18 Synthesis

- Thibaut Vidal, Patrick Jaillet, Nelson Maculan. "A Decomposition Algorithm for Nested Resource Allocation Problems." *SIAM Journal on Optimization* 26(2):1322-1340, 2016. DOI: https://doi.org/10.1137/140965119. Relevance: exact algorithms for nested resource allocation; useful proof-technology background for possible pooling/decomposition rules for the accepted unequal-low one-drought LP.

- Thibaut Vidal, Daniel Gribel, Patrick Jaillet. "Separable Convex Optimization with Nested Lower and Upper Constraints." *INFORMS Journal on Optimization* 1(1):71-90, 2019. DOI: https://doi.org/10.1287/ijoo.2018.0004. Relevance: nested partial-sum constraint algorithms; relevant if the drought LP can be transformed into a nested resource-allocation problem.

- Jan de Leeuw, Kurt Hornik, Patrick Mair. "Isotone Optimization in R: Pool-Adjacent-Violators Algorithm (PAVA) and Active Set Methods." *Journal of Statistical Software* 32(5):1-24, 2009. DOI: https://doi.org/10.18637/jss.v032.i05. Relevance: generalized PAVA and active-set methods; useful background for deriving a pooling rule from the unequal-low dual.

- Ravindra K. Ahuja, James B. Orlin. "A Fast Scaling Algorithm for Minimizing Separable Convex Functions Subject to Chain Constraints." *Operations Research* 49(5):784-789, 2001. DOI: https://doi.org/10.1287/opre.49.5.784.10601. Relevance: separable convex optimization under chain constraints; useful if the reduced LP admits a chain-constrained reformulation.

- Zeyang Wu, Kameng Nip, Qie He. "A New Combinatorial Algorithm for Separable Convex Resource Allocation with Nested Bound Constraints." *INFORMS Journal on Computing* 33(3):1197-1212, 2021. DOI: https://doi.org/10.1287/ijoc.2020.1006. Relevance: exact combinatorial algorithms for nested bound resource allocation; possible background for finite-LP regression and algorithmic solution of drought LPs.

## Verified In Iteration 19 Synthesis

- Dorit S. Hochbaum. "Lower and Upper Bounds for the Allocation Problem and Other Nonlinear Optimization Problems." *Mathematics of Operations Research* 19(2):390-409, 1994. DOI: https://doi.org/10.1287/moor.19.2.390; author PDF: https://hochbaum.ieor.berkeley.edu/html/pub/MOR-Hochbaum94.pdf. Relevance: allocation and nonlinear optimization proof-technology background for possible certificate-producing algorithms for the CL-049 unequal-low LP; not direct support for the market-making reduction, the two-low closed form, or a pooling/PAVA theorem.

## Verified In Iteration 20 Synthesis

- David Gale. "A theorem on flows in networks." *Pacific Journal of Mathematics* 7(2):1073-1082, 1957. Project Euclid: https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-7/issue-2/A-theorem-on-flows-in-networks/pjm/1103043501.full; PDF: https://msp.org/pjm/1957/7-2/pjm-v7-n2-p04-p.pdf. Relevance: direct Hall-type flow feasibility background for the nested scheduling step in the strictly increasing-low proof.

- D. R. Fulkerson. "A Network-Flow Feasibility Theorem and Combinatorial Applications." *Canadian Journal of Mathematics* 11:440-451, 1959. DOI: https://doi.org/10.4153/CJM-1959-045-1; Cambridge PDF: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8FC3E849880D946C790E442B4376D3E3/S0008414X00003369a.pdf/networkflow_feasibility_theorem_and_combinatorial_applications.pdf. Relevance: feasible-flow/cut-condition background for formalizing Hall-style segment allocation certificates.

- Giorgio Gallo, Michael D. Grigoriadis, Robert E. Tarjan. "A Fast Parametric Maximum Flow Algorithm and Applications." *SIAM Journal on Computing* 18(1):30-55, 1989. DOI: https://doi.org/10.1137/0218003. Relevance: optional proof-technology background for future parametric-flow or active-set algorithms; not needed for the current increasing-low theorem.

- Jean-Claude Picard, Maurice Queyranne. "On the structure of all minimum cuts in a network and applications." *Mathematical Programming* 22:121, 1982. DOI: https://doi.org/10.1007/BF01581031. Relevance: optional min-cut lattice/closure background for future active-set or violated-cut enumeration; not direct support for the market-making LP theorem.
