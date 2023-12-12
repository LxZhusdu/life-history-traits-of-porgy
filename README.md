# life-history-traits-of-porgy
This repository including codes 1) to estimate life history parameters (growth parameters, length-weight relationship parameters and natural mortality rate) using Bayesian approaches for threadfin porgy Evynnis cardinalis over the past two decades in the Beibu Gulf, South China Sea; 
                                2) to estimate growth paramter K using values of Linf derived from the length-based Bayesian biomass estimation method.

Growth parameters
(1) growbf2000.R, growmodelbf2000.R and growthbf2000.csv produced distributions for growth parameters Linf,K and t0 in 1999 using the priors and values between 1961 and 1999, which served as new priors.
(2) k_fromLinf_LBB.R, k_fromLinf_model.R and wangxh.csv produced distributions for growth performance index and k for the data of Wang et al.(2020).
(3) grow06_18.R, growmodel06_18.R, and growthxxxx.csv produced distributions for growth parameters Linf,K and t0 in a year between 2006 and 2018.
(4) plot_LKt0priorpost.R plots figure 3 in the manuscript. But date files cannot be uploaded due to the large size. plot_LKt0priorpostnormdis.R plots a figure like figure 3 using statistics of data files requred by plot_LKt0priorpost.R. These data files are uploaded.
(5) plot_phiK_com_wang.R plots figure 4 in the manuscript for the data of Wang et al.(2020)
(6) plot_phiK_wang.R plots figure S1 in the manuscript for the data of Wang et al.(2020). But the data file cannot be uploaded due to large size.
(7) plot_LinfKHDI.R, plot_LinfHDI.csv and plot_groworiginal.csv plots figure 5.

Length weight relationship paramters
(1) lengthweightbf2000.R, lwmodelbf2000.R, and lwbf2000.csv produced distributions for parameters log10a, a, and b in 1999 using the priors and values between 1961 and 1999, which served as new priors.
(2) lengthweight06_15.R, lwmodel06_15.R, and lwxxxx.csv produced distributions for parameters log10a, a, and b in 2006, 2007,2008 and 2015.
(3) plot_ab_priorpost.R plots figure 6 in the manuscript. But date files are not uploaded due to the large size. plot_ab_priorpostnormdis.R plots a figure like figure 6 using statistics of data files requred by plot_ab_priorpost.R. These data files are uploaded.
(4) plot_abHDI.R, plot_abHDI.csv and plot_aboriginal.csv plots Figure 7.

Natural mortality rate
(1) GrowMbf2000.R, Mmodelbf2000.R and growthbf2000.csv produced distributions for natural mortality rate in 1999 using the priors and values between 1961 and 1999, which served as new priors.
(2) GrowM06_18MPauly.R, Mmodel06_18.R and growthxxxx.csv produced distributions for natural mortality rate in a year between 2006 and 2018, in which values estimated using Pauly's empirical equation for the data of Wang et al.(2020) were used.
(3) GrowM06_18MtoK.R, Mmodel06_18.R and growthxxxx.csv produced distributions for natural mortality rate in a year between 2006 and 2018, in which values estimated using the ratio of M to K for the data of Wang et al.(2020) were used.
(4) plot_Mprorpost.R plots figure 8 in the manuscript. But date files are not uploaded due to the large size. plot_Mpriorpostnormdis.R plots a figure like figure 8 using statistics of data files requred by plot_Mpriorpost.R. These data files are uploaded.
(5) plot_MHDI.R, plot_MHDI.csv and plot_groworiginal.csv plots Figure 9.
