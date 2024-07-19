---
title: Public Debt
description: Public Debt
---

**Public debt**, also called *government debt* or *national debt*, is the financial liabilities of the government. Since raising taxes is not always reasonable, nearly all governments have to borrow money from the [[Knowledge/Economics/macroeconomics/Sectors|private sector]] to meet their expenses. The main way governments borrow money is buy selling *securities* known as **[[Knowledge/Economics/macroeconomics/Bonds|government bonds]]**. 

The government's *budget balance* is expressed as: 
$$
	BB=T-G,
$$
where $T$ is taxes and $G$ is government spending.
- When $BB < 0$, we say there's a **budget deficit**.
- When $BB > 0$, we say there's a **budget surplus**.

The governments debt at a time $t$ is expressed as $D_t = D_{t-1} - BB_t$, basically the previous debt minus the *budget balance* over the time between $t-1$ and $t$.

### Golden Rule of Public Investment
A golden rule for public investment says:
- Government expenditures that benefit the current taxpayers should be paid for using *their* taxes.
- Government investments that are long-lived, such as the construction of hospitals, should be funded through government borrowing.

The aim is to be fairer to each generation. Your children shouldn’t have to pay off debts that paid for things which you can enjoy now but which they cannot enjoy in their time.

### Government Budget Constraint
The government budget constraint equation is given as:
$$
\begin{align}
	-(T_t-G_t) &= D_t-D_{t-1} \\ 
	-(\tilde{T_t} - TR_t - rD_{t-1} - G_t)&= D_t - D_{t-1},\\
\end{align}
$$
rearranging terms, we have:
$$
	\underbrace{G_t+TR_t+rD_{t-1}}_{\text{Expenses}} = \underbrace{\tilde{T_t} + D_t - D_{t-1}}_{\text{Funding sources}}.
$$
Remember, $T_t=\tilde{T_t}-TR_t-rD_{t-1}$ consists of tax revenue $\tilde{T_t}$ , transfer payments $TR_t$ and interest on debt $rD_{t-1}$. 

We call the equation above the government 'budget constraint' because we can see that the only way to fund expenses is to either raise taxes or borrow.

### Sustainability of Public Debt
The *debt-to-GDP ratio* is the standard way we assess whether a country's total public debt is sustainable in the long-term. 

Australia's public debt-to-GDP ratio is sitting at ~60% as of 2022, which is regarded as sustainable. Japan's debt-to-GDP ratio, however, is at about +200%, the highest of any developed country. Public debt may be owed to domestic households or firms, or foreign residents.

An equation for the change in debt-to-GDP ratio is derived from:

$$
\begin{align}
	D_t &= D_{t-1} - BB_t \\
	&=D_{t-1}+rD_{t-1}-(\tilde{T_t}-G_t - TR_t) \\
	&=D_{t-1}+rD_{t-1}-PBB_t \\
	\frac{D_t}{Y_t}	&=\frac{D_{t-1}(1+r)}{Y_t}-\frac{PBB_t}{Y_t}
\end{align}
$$

Assuming GDP grows at a constant rate $g$, we can use $Y_t=Y_{t-1}(1+g)$ to obtain:

$$
\begin{align}
	\frac{D_t}{Y_t} &= \frac{D_{t-1}(1+r)}{Y_{t-1}(1+g)}-\frac{PBB_t}{Y_t} \\
	d_t&= \frac{d_{t-1}(1+r)}{1+g}-pbb_t\\
	d_t-d_{t-1}&= \frac{(r-g)d_{t-1}}{1+g} - pbb_t \\
	\Delta d_t &= \frac{(r-g)d_{t-1}}{1+g} - pbb_t.
\end{align}
$$
-   $g$ is the real growth rate of GDP.
-   $r$ is the real interest rate.
-   $PBB=\tilde{T_t}-G_t - TR_t$ is the *primary budget balance*, consisting of taxes $\tilde{T_t}$, government bond interest payments $G_t$, and transfer payments $TR_t$.
-   $pbb_t=\frac{PBB}{Y}$.

From the above equation, running a budget surplus (ie. making $pbb_t$ positive) is the best way to reduce debt. Alternatively, if you can achieve $r<g$, then you can still reduce debt that way.

In general, a higher public debt to GDP ratio results in a reduction in real GDP growth.

**Crowding out:**
See [[Knowledge/Economics/macroeconomics/Savings and Investments|savings and investment]]. When the government borrows more, it tends to shift the national savings curve to the left (remember that national savings is a function of government balance), causing the equilibrium real interest rate to rise and therefore the investment demand curve to fall.
