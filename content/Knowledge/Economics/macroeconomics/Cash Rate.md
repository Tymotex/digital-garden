---
title: Cash Rate
description: Cash Rate
---

The cash rate, which is set by the [[Knowledge/Economics/macroeconomics/Central Bank|RBA]] as part of its [[Knowledge/Economics/macroeconomics/Monetary Policy|monetary policy]], is a short-term interest rate charged on the 'overnight' loans between banks.
- To 'tighten' monetary policy means to raise the cash rate to discourage lending and therefore lower production.
- To 'loosen' monetary policy means to lower the cash rate to incentivise lending and therefore boost production.

## How does the interest rate affect you and the economy?
When the central bank *raises interest rates*, it'll eventually propagate through the economy, causing private banks to increase the interest rates they offer for savings accounts and the rates they charge on loans, notably *variable-rate mortgages*. When this happens, consumers like you are incentivised to **save more money** and spend less on consumption, which means that businesses will experience less demand for their goods, thus be less inclined to raise prices, hence **reducing the inflation rate**.

> Notably, house prices will tend to drop because mortgage repayments are higher, so people are collectively less willing to take on a bigger mortgage to buy a house.

For businesses, a higher interest rate will discourage them from taking out loans and make capital investments. They'll hire fewer people, lay off more people or cut wages, resulting in a rise in [[Knowledge/Economics/macroeconomics/Labour Market|unemployment]] and reduction in disposable income.

There are potentially disastrous consequences to the economy when the central bank changes the interest rate, so they must be very careful about how big the hikes are and for long they're imposed on the economy.
- When interest rates are increased too much, the economy might enter a [[Knowledge/Economics/macroeconomics/GDP#Recession|recession]].
- When interest rates are decreased too much or not increased by enough, inflation may 'spiral' towards [[Knowledge/Economics/macroeconomics/Inflation#Hyperinflation|hyperinflation]].

Interest rate changes can take a long time (eg. 2 years) to propagate through the economy and actually affect it. The central bank needs to produce an accurate forecast about where the economy might be headed to inform their decision about how much to change the interest by.

---

## Payment Settlement
Suppose Commbank owes Westpac an outstanding $10 million AUD. The payment needs to proceed through accounts held at the RBA, called **Exchange Settlement Accounts (ESA)** which must never have a negative balance. Commbank transfers $10 million from their ESA to Westpac’s ESA. 

If Commbank ever has insufficient funds in their reserve, then it must borrow those funds from another bank which expects full repayment in $<24$ hours (which is where the term ‘overnight’ comes from). When borrowing from other banks' ESAs, the loans are charged an interest rate known as the *cash rate*.

There are 3 interest rates that the RBA defines:
- $i^T$ — the RBA’s target cash rate.
- $i^T-0.25$ — the interest rate RBA pays to banks for their ESAs. The $0.25$ is a typical value, but it can be tweaked.
- $i^T+0.25$ — the interest rate for banks to borrow from other banks’ ESAs.

This creates a 50 basis point ‘channel’ which defines the range the actual cash rate value can be in. *Note*: a 'basis point' is just $\frac{1}{100}$ of $1\%$. 

![[Knowledge/Economics/macroeconomics/assets/cash-rate-channel-system.png|500]]

## Open Market Operations
*Open market operations* is the trading of goverment bonds between the central bank and the private sector. The RBA mainly buys bonds from banks to increase their ESA and therefore the [[Knowledge/Economics/macroeconomics/Money#Money Supply|money supply]], and sells bonds to banks to decrease their ESA and bring down money supply.

## Supply & Demand for ES Funds
Below is the demand curve for banks' ES funds in the overnight cash market.

![[Knowledge/Economics/macroeconomics/assets/ES-funds-demand-curve.png|500]]

Below is the supply curve for ES funds in the overnight cash market.

![[Knowledge/Economics/macroeconomics/assets/ES-funds-supply-curve.png|500]]

Supply is affected exogenously by the value of the open market operations the RBA undertakes with banks, and the transfers government make to households (by transferring funds into the bank’s ESA, therefore increasing ES funds).

By undertaking open market operations, the RBA can push the supply curve to intersect with the demand curve as shown above. This is how the RBA sets the *actual* cash rate to be the *target* cash rate that they’ve announced.

## Expectations Hypothesis
The *expectations hypothesis* predicts how short-term interest rates like the cash rate affects the long-term interest rates after sufficient time. Basically, it predicts how the interest rate set by the central bank will propagate throughout the rest of the economy, influencing the interest rates charged by private banks on loans and savings.

The long-term interest rate, $i^N_0$, is simply the average of the current interest rate (at term 0) and all *expected* future interest rates. This is summarised in the following equation:
$$
	\colorbox{#FFFFBF}{$i^N_0 = \frac{1}{N}(i^1_0+i^2_1+\ldots+i^N_{N-1})$}
$$
where $i^\alpha_\beta$ is the interest rate associated with a loan spanning $\alpha$ total terms starting from at time $\beta$.

Generally, the cash rate can be expected to have a very large effect on the mortgage rate, savings bank account interest rates, exchange rate (currency tends to appreciate when cash rate rises), and so on.

## Policy Rules
A *policy rule*, also called a *monetary policy reaction function* (PRF), is a simple approximation of how the cash rate affects macroeconomic variables and therefore is a model that describes how central banks choose their policy interest rates. 

#### Taylor Rule
The *Taylor rule* is a well-known policy rule, which asserts:
$$\colorbox{#FFFFBF}{$i_\text{nominal cash rate}=1+1.5\pi+0.5\tilde{Y}$},$$
where $\tilde{Y}$ is the output gap. Alternatively, using the *real* cash rate, this would be $r_\text{real cash rate} = 1 + 0.5\pi + 0.5\tilde{Y}$.

#### Simple Policy Rule
The simple monetary policy reaction function is:
$$
	r = r_{0}+ \gamma \pi.
$$
Here, $\gamma$ is a value chosen by the central bank to represent their *sensitivity to inflation*. A higher $\gamma$ results in a larger increase in the cash rate by the RBA. The constant, $r_0$ is the real cash rate when inflation is $0\%$.

![[Knowledge/Economics/macroeconomics/assets/simple-policy-rule-graph.png|500]]
