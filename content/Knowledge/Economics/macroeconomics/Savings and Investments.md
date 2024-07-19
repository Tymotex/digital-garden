---
title: Savings and Investments
description: Savings and Investments
---

## Investment
An **investment**, in macroeconomics, is the act of purchasing new capital goods to bolster productivity.
- **Private investment** — any investment made by households/businesses. Eg. buying equipment, software, computers, buildings (new dwelling), etc.
- **Public investment** — any investment made by the government such as infrastructure.

**Capital stock** — encompasses everything in an economy that enables businesses to generate future sales such as buildings, bridges, literally everything like that.
- *Accumulation of capital stock*: $K_1 = I_1 + \underbrace{ K_0(1-\delta)}_{\text{Depreciation}}$. The stock at the end of a period is equal to the stock at the start of the period, plus any more investments made over that period, minus the depreciation of the stock at the start.
    - Typically, capital goods are *durable*, meaning they can be consumed multiple times over a longer time period, and can be sold after some use.

The decision of whether a business purchases capital goods (ie. invests) follows the familiar marginal cost-benefit analysis in microeconomics. 
- Marginal benefit: **value of the marginal product of capital**, $VMPK = MPK\times \text{price per unit}$ — value of the marginal product of capital ($MPK$).
- Marginal cost: **user cost of capital**, $UC = P_K + \underbrace{iP_K}_{\text{Interest}}-\underbrace{(1 - \delta)}_{\text{Dep.}} \times\underbrace{(P_K+\Delta P_K)}_{\text{End-of-year market price}}$ — the cost for holding the capital asset for 1 year, for example. Note that we can resell the capital good since it’s *durable*.
    - A simpler approximation is given as $UC\approx P_K\big( i + \delta - \frac{\Delta P_K}{P_K} \big)$.
    - An even further simplification is assuming that changes in the market price $\frac{\Delta P_K}{P_K}$ is equal to inflation $\pi$, giving $UC\approx P_K(r+\delta)$, where $r = i - \pi$.

We will only invest in a capital good if the **value of marginal product of capital** (margin benefit) equals the **user cost of capital** (marginal cost), ie. when $VMPK=UC$.

![[Knowledge/Economics/macroeconomics/assets/investment-demand-curve.png|200]]

### Savings (in Closed Economies)
The amount of **savings** is the difference between income and consumption.
- **Household savings** — $\text{gross household saving} = \text{disposable income }- \text{ consumption expenditure}$, where:
    - Disposable income can be broken down as: $Y_\text{disp. income} = Y_\text{gross income} - \text{taxes}+\text{government transfers} + \text{government interest payments} - \text{business retained earnings}$.
        - *Government transfers* is the money you receive from the government directly ‘for free’ (eg. [youth allowance](https://www.servicesaustralia.gov.au/youth-allowance)).
        - *Government interest payments* is the interest the government pays you for holding _government [[Knowledge/Economics/macroeconomics/Bonds|bonds]]_.
        - Business retained earnings is the profit that a business won’t pay out as [[Knowledge/Investing/Dividends|dividends]] to [[Knowledge/Investing/Stocks|shareholders]].
    - *Accumulation of wealth*: $W_1 = W_0 + \text{household savings} + \text{net capital gains}$. The change in wealth for a household is given by how much they saved and how much their assets have gained in value.
-   **Business savings** — savings are in the form of *retained earnings*, ie. the profit that businesses don’t distribute to owners and shareholders as dividends.
-   **Government savings** — $\text{public savings} = \text{taxes} - \text{gov. transfers} - \text{gov. interest payments}$ also called [[Knowledge/Economics/macroeconomics/Public Debt|government budget balance]]. 

**National Saving (Supply) and Investment Demand:**
_National saving_ is the *sum* of all household, business and government savings: $NS(r)= S(r)+\text{Business Savings} + \text{Gov. Savings}$, where business and government savings are *exogenous* variables, that is, variables whose value is determined by factors outside the current model.

Combining the national saving curve with the investment demand curve, we get an aggregate savings supply and aggregate investment demand graph curve for a closed economy. Remember, both curves depend on the real interest rate $r$. The equilibrium condition is when $NS(r) = I(r)$.

![[Knowledge/Economics/macroeconomics/assets/national-savings-vs-investment-demand-curve.png|500]]

When the [[Knowledge/Economics/macroeconomics/Central Bank|RBA]] sets a higher [[Knowledge/Economics/macroeconomics/Cash Rate|interest rate]], that means higher borrowing costs, so people will tend to save instead of invest. Likewise, setting a lower interest rate encourages households to consume more and businesses to invest more.
