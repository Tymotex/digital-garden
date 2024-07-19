---
title: Fiscal Policy
description: Fiscal policies are the policies around the usage of government income and expenditure in an effort to positively affect macroeconomic variables.
---

**Fiscal policies** are the policies around the usage of government income and expenditure in an effort to positively affect macroeconomic variables like [[Knowledge/Economics/macroeconomics/Inflation|inflation]], [[Knowledge/Economics/macroeconomics/Labour Market|unemployment rate]], etc.

Fiscal policies include things like:
- Tax cuts which are reductions to how much tax you'd pay on your personal income.
- Transfer payments, which are direct payments the government makes to individuals without anything in return. This is usually done to fairly distribute wealth, or to subsidise something (eg. the [JobKeeper policy](https://treasury.gov.au/coronavirus/jobkeeper) was introduced in the COVID-19 pandemic).
- Subsidising home renovations (eg. [solar panel rebate](https://www.energysaver.nsw.gov.au/save-solar)).

Government expenditure occupies about 20% of a country's [[Knowledge/Economics/macroeconomics/GDP|GDP]].
![[Knowledge/Economics/macroeconomics/assets/gdp-pie.png|500]]

## 3-Sector Economy
Considering a three-sector economy in the [[Knowledge/Economics/macroeconomics/Income-Expenditure Model|income-expenditure model]], we'd have $Y = C+I^P+G$.

Suppose we have the **tax function**: $T=T_0 + tY$, with $t$ being the *marginal propensity to tax*, or *marginal tax rate*. At equilibrium GDP, we would have: 
$$
	Y=PAE=\frac{1}{1-c(1-t)}\underbrace{(C_0-cT_0+I_0+G_0)}_{\text{Exogenous expenditure}}.
$$
Expressed in changes, this would be:
$$
	\Delta Y=PAE=\frac{1}{1-c(1-t)}(\Delta C_0- c \Delta T_0+\Delta I_0+\Delta G_{0}).\tag{1}
$$
This lets you assess how changing one exogenous variable would change the equilibrium GDP. Notice that with the multiplier $\frac{1}{1-c(1-t)}$, an increase in government spending $G_0$ would cause a rise of $\frac{1}{1-c(1-t)}$ which is always larger than $\$1$ to the real GDP.

**Opening the Economy**
When we open this 3-sector economy to international trade, we'd have $PAE=C+I^P+G+X-M$. Using the following substitutions, we can derive the equilibrium GDP and its multiplier:
$$
\begin{align}
	C&=C_{0+c(Y-T)}\\
	I^P&=I_0\\
	G&=G_0\\	
	X&=X_0\\
	M&=mY\\
	Y&=\frac{1}{1-\big(c(1-t)-m\big)}(C_0-cT_0+G_0+I_0+X_0)\\
\end{align}
$$

### Balanced Budget Multiplier
A surprising result from equation $(1)$ is that you can increase government expenditure $G_0$ and taxes $T_0$ by the *same amount* but still end up with a positive change in the GDP. The *balanced budget multiplier* can be determined as:
$$
	\frac{\Delta Y_\text{equilibrium}}{\Delta G_0} = \frac{1-c}{1-c(1-t)}.
$$
This means that fiscal policies can help with closing *contractionary output gap*. For instance, you could achieve the following shift in the $PAE$ curve.

![[Knowledge/Economics/macroeconomics/assets/fiscal-policy-eliminates-output-gap.png|400]]

This shift is achieved by cutting taxes $T_0$ and/or increasing $G_0$. Likewise, when faced with undesirably high inflation, governments can implement a contractionary fiscal policy that closes *expansionary output gaps*. Importantly, fiscal policies have a large effect on [[Knowledge/Economics/macroeconomics/Public Debt|government debt]]. Expansionary fiscal policies reduce government budget and contractionary fiscal policies increase government budget.

### Automatic Fiscal Stabiliser
An **automatic fiscal stabiliser** is a tax or government transfer payments system that helps dampen _business cycle_ fluctuations. Eg. marginal tax rate systems and welfare payments are examples of automatic stabilisers.

Consider the case where all exogenous variables except $I_0$ are constant in a closed 3-sector economy, so: $\Delta Y=\frac{1}{1-c(1-t)}(\Delta I_0)$. Here, the amplitude of each [[Knowledge/Economics/macroeconomics/Business Cycle|business cycle]] can be controlled by tweaking the marginal tax rate $t$ and therefore the multiplier.

![[Knowledge/Economics/macroeconomics/assets/automatic-fiscal-stabiliser.png|400]]

**Discretionary fiscal policies** are ones undertaken explicitly by the government to counter fluctuations in the business cycle.
