# life-history-traits-of-porgy
This repository including codes 1) to estimate life history parameters (growth parameters, length-weight relationship parameters and natural mortality rate) using Bayesian approaches for threadfin porgy Evynnis cardinalis over the past two decades in the Beibu Gulf, South China Sea; 
                                2) to estimate growth paramter K using values of Linf derived from the length-based Bayesian biomass estimation method.

Growth parameters
(1) growbf2000.R, growmodelbf2000.R and growthbf2000.csv produced distributions for growth parameters Linf,K and t0 in 1999 using the priors and values between 1961 and 1999, which served as new priors.
(2) k_fromLinf_LBB.R, k_fromLinf_model.R and wangxh.csv produced distributions for growth performance index and k for the data of Wang et al.(2020).
(3) grow06_18.R, growmodel06_18.R, and growthxxxx.csv produced distributions for growth parameters Linf,K and t0 in a year between 2006 and 2018.
(4) plot_LKt0priorpost.R plots figure 3 in the manuscript. But date files cannot be uploaded due to the large size. plot_LKt0priorpostnormdis.R plots a figure like figure 3 using statistics of data files requred by plot_LKt0priorpost.R
(5) plot_phiK_com_wang.R plots figure 4 in the manuscript for the data of Wang et al.(2020)
(6) plot_phiK_wang.R plots figure S1 in the manuscript for the data of Wang et al.(2020). But the data file cannot be uploaded due to large size.
(7) plot_LinfKHDI.R, plot_LinfHDI.csv and plot_groworiginal.csv plots figure 5.
