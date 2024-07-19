---
title: Aggregate Supply and Demand
description: Aggregate Supply and Demand
---

The [[Knowledge/Economics/macroeconomics/Income-Expenditure Model|income-expenditure model]] aims to determine the short-run real GDP. The *aggregate supply and demand model* aims to determine the real GDP in both the short-run and long-run.

> Note that the aggregate demand and aggregate supply curves are different in meaning fundamentally to the marginal benefit and marginal cost curves in microeconomic contexts.

### Aggregate Demand (AD)
Recall that the planned aggregate expenditure in a 4-sector economy is given as $PAE = C+I^P+G+X-M$.

One core assumption is that a rise in $r$ will tend to reduce consumption and planned investment. We can assume they are affected in the following way:
- $C=C_{0}+c(Y-T)-\alpha r$, where $\alpha >0$.
- $I^{P}= I_{0}- \beta r$, where $\beta > 0$.

Plugging these in and solving for the equilibrium real GDP, we get:
$$
\begin{align}
	Y_\text{equilibrium}&=PAE=\big[C_{0}+c(Y-T) -\alpha r\big]+ \big[I_{0}- \beta r\big] + G_0 + X_0 -mY \notag \\
	&= \frac{1}{1-c(1-t)+m}\bigg( \big(C_{0}- cT_{0}+ I_{0}+ G_{0}+ X_{0}\big)- r(\alpha + \beta) \bigg). \notag\\
\end{align}
$$

Now we've made $Y_\text{equilibrium}$ a function of $r$, we have a simple model for predicting the effects of [[Knowledge/Economics/macroeconomics/Monetary Policy|monetary policy]] on real GDP.

To express $Y_\text{equilibrium}$ as a function of $\pi$, we can assume that the central bank will use the [[Knowledge/Economics/macroeconomics/Cash Rate#Simple Policy Rule|simple policy rule]] reaction function which tells them to increase the real interest rate in response to an increase in inflation rate. With this assumption, we can relate the real interest rate with the inflation rate, $r= r_{0}+\gamma\pi$ and express $Y_\text{equilibrium}$ as a function of $\pi$:

$$
\begin{align}
	Y_\text{equilibrium} &= \frac{1}{1-c(1-t)+m}\bigg( \big(C_{0}- cT_{0}+ I_{0}+ G_{0}+ X_{0}\big)- r(\alpha + \beta) \bigg), \notag\\
	&= \frac{1}{1-c(1-t)+m}\bigg( \big(C_{0}- cT_{0}+ I_{0}+ G_{0}+ X_{0}\big)- (r_{0}+\gamma\pi)(\alpha + \beta) \bigg), \notag\\
	\notag\\
	\text{Supposing }k &= \frac{1}{1-c(1-t)+m}, \notag\\
	Y_\text{equilibrium} &= k\big(C_{0}- cT_{0}+ I_{0}+ G_{0}+ X_{0} - r_0(\alpha + \beta)\big)-k\gamma(\alpha +\beta)\pi. \notag\\
	\notag\\
\end{align}
$$
Supposing $A_{0} = k \underbrace{\big(C_{0}- cT_{0}+ I_{0}+ G_{0}+ X_{0} - r_0(\alpha + \beta)\big)}_{\text{Exogenous variables}}$, we now have an equation representing the aggregate demand curve:
$$\colorbox{#FFFFBF}{$ Y_\text{equilibrium} = A_0-k\gamma(\alpha +\beta)\pi$},$$
which relates the real GDP to the inflation rate. Although the AD curve links the real GDP and inflation, it does not determine them. That's where we need the aggregate supply curve.

![[Knowledge/Economics/macroeconomics/assets/aggregate-demand-curve.png|500]]

Changes to the exogenous variables in the constant $A_0 = k\big(C_{0}- cT_{0}+ I_{0}+ G_{0}+ X_{0} - r_0(\alpha + \beta)\big)$ will cause shifts in the AD curve, often called *AD shocks*. 

Note that when productivity is low, ie. real GDP is low, prices are high.

### Aggregate Supply (AS)
In the [[Knowledge/Economics/macroeconomics/Income-Expenditure Model|income-expenditure model]], we assumed that the prices would stay fixed in the short run. In the aggregate supply and demand model, we assume that the business will choose the new prices, thereby setting the actual inflation rate, based on 3 factors:
1. <mark style="background: #ADCCFFA6;">The *expected* inflation rate.</mark> 
   
	**Rational expectations hypothesis** — asserts that people always factor in *all* relevant information, producing the best theoretical possible forecast on what the future inflation rate will be. The actual and expected value differ by a completely unpredictable margin, $\omega$:  $\pi_\text{actual}=\pi_\text{expected}+\omega$
	
	**Adaptive expectations hypothesis** — asserts that people will use historical data only in their prediction of the future inflation rate, ie. that $\pi_\text{actual}=\pi_{\text{prev}}$, which makes the AS curve a simple horizontal line:
		![[Knowledge/Economics/macroeconomics/assets/adaptive-expectations-hypothesis-aggregate-supply-curve.png|380]]
	
	*Inflation shocks* are when there are changes to the inflation rate. Events that might cause inflation shocks include changes in commodity prices and foreign exchange rates. Factoring in inflation shocks, we'd have $\pi_\text{actual} = \pi_\text{prev}+\epsilon$, where $\epsilon$ is the size of the inflation shock. Note that inflation shocks, although temporary in nature, cause permanent effects to the inflation rate since the adaptive expectations hypothesis asserts that the next period's inflation rate retains the previous period's inflation rate.
2. <mark style="background: #ADCCFFA6;">Shifts in the aggregate demand curve which impact the business' production costs.</mark> 
3. <mark style="background: #ADCCFFA6;">Size of the output gap.</mark> 
	
	When there exists a short-run expansionary output gap like below for example, businesses will initially ramp up production levels to meet increased demand, but over time they'll experience increased production costs and inflate their prices. When all businesses behave this way, then in aggregate, it'll cause inflation to increase and close the output gap.
	
	![[Knowledge/Economics/macroeconomics/assets/aggregate-supply-expansionary-output-gap.png|500]]

### Applications

If households were to collectively become more optimistic about wage growth and were to start consuming more, then this could cause an increase in $C_0$, causing an AD shock that shifts the curve up, causing the real GDP to increase but with inflation staying constant in the short-run:

![[Knowledge/Economics/macroeconomics/assets/ad-shock-example-1.png|500]]

Progressing towards the long-run, the AS curve will shift up to close the expansionary output gap.

![[Knowledge/Economics/macroeconomics/assets/ad-shock-example-2.png|500]]

Inflation will keep increasing until $Y_\text{equilibrium}=Y^*$.

![[Knowledge/Economics/macroeconomics/assets/ad-shock-example-3.png|500]]

When an inflation shock happens and shifts the AS curve upwards, it'll be the case that in the long run, the inflation rate will drop to the same level prior to the shock.

![[Knowledge/Economics/macroeconomics/assets/inflation-shock-example-1.png|500]]

Notice how the economy 'self-corrects' in the long run. Does this mean that [[Knowledge/Economics/macroeconomics/Fiscal Policy|fiscal]] and [[Knowledge/Economics/macroeconomics/Monetary Policy|monetary]] policy are unnecesssary? No, because they can accelerate the self-correction and minimise the negative effects of AD shocks and inflation shocks.

Note that in the above example, the government and central bank could choose to 'accommodate' the inflation shock by implement tax cuts (or some other policy) to shift up the AD curve and meet the higher inflation value. Doing this will mean that the contractionary gap is closed quicker, but the higher inflation will tend to persist instead of being temporary. If they don't want higher inflation to persist (in order to ensure they meet an inflation target), then they can simply do nothing and let the self-correction proceed.

![[Knowledge/Economics/macroeconomics/assets/accommodating-inflation-shock.png|500]]







