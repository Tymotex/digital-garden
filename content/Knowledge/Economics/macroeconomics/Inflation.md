---
title: Inflation
description: Inflation
---

> "Like virginity, a stable price level seems capable of maintenance, but not of restoration" — Warren Buffett.

Inflation describes a period where *prices in an economy are increasing*, or alternatively, the decline of the purchasing power of a country’s currency. Likewise, *deflation* describes a period where prices are falling. The *inflation rate* describes a value for how much the prices for goods and services have increased in an economy from one point of time to another.

The [[Knowledge/Economics/macroeconomics/Central Bank|central bank]] measures inflation using a *price index*, which is a value that is representative of the aggregate price level. One standard and very commonly chosen price index central banks use to measure inflation is the [[Knowledge/Economics/macroeconomics/Inflation#Consumer Price Index|consumer price index (CPI)]]. Inflation is measured in terms of the CPI between the current year, $CPI$, and its previous year, $CPI_{-1}$:
$$
	\pi=\big( \frac{CPI-CPI_{-1}}{CPI_{-1}} \big) \times 100
$$
*Note*: we use $\pi$ as the symbol for inflation.

Inflation is generally bad for your savings because the same amount of money will purchase fewer goods and services in the future. During inflation, you’re incentivised to minimise holdings of currency and ‘store’ wealth in other assets.

Inflation is sometimes classified into 3 types:
- **Cost-push inflation** is when the costs of a business producing goods and services rises (due to shortages in materials, increases in wage, etc.), causing the price of those goods and services charged to consumers to rise. This assumes demand for the business' output hasn't changed.
- **Demand-pull inflation** is when the demand for a good or service increases while the supply doesn't, causing prices to rise for that good or service.
- **Built-in inflation** is when *expectations* about future increases in price are the thing that's pushing prices up.

## Consumer Price Index
The consumer price index (CPI) value aims to represent changes to the cost of living experienced by typical households. It does this by comparing the price of a *fixed basket* of ‘standard’ goods/services that households consume at a base year with the price of that same basket of goods/services in subsequent years. The items in such a basket might include milk, clothes, chicken, fruit, etc., basically a huge set of things that are usually good representatives of the average urban consumption (since it's based on real data and constant price sampling).
$$
	CPI = \frac{\texttt{basket\_cost(current\_year)}}{\texttt{basket\_cost(base\_year)}}.
$$
To get the CPI for a year $n$ with base year $m$, first calculate the cost of the basket in year $m$ with year $m$ prices, then calculate the cost of the same basket but with year $n$’s prices. Finally, the CPI is the ratio of the price of the basket calculated at year $n$’s prices to the price of the basket calculated at year $m$’s prices.

Eg. Consider the following:
	
		![[Knowledge/Economics/macroeconomics/assets/cpi-calculation-example.png|400]]
The CPI at year 2010 is given by: $CPI=\frac{100\times3 + 50 \times 10}{100 \times 5 + 50 \times 10}$.

**Shortfalls of CPI:**
- When the quality of an item in the basket changes (eg. a phone gets a hardware upgrade), the CPI value fails to capture that. This means the reported CPI might over-estimate increases in living cost. This is called *quality adjustment bias*.
- CPI does not take into account the *substitution effect*. Eg. when beef becomes expensive, people will tend to substitute away towards chicken, however the CPI will report its value assuming people continue consuming the same amount of the same things in the fixed basket. This is called *substitution bias*.

## Optimal Inflation Rate
It’s typically desirable for economies to maintain a low and stable inflation rate over time, usually in the ballpark of 1-3% per year. This is usually controlled through [[Knowledge/Economics/macroeconomics/Fiscal Policy|fiscal]] and [[Knowledge/Economics/macroeconomics/Monetary Policy|monetary]] policies.

Having an inflation rate above zero will tend to grow the economy. Although highly contended, [[Knowledge/Economics/macroeconomics/Income-Expenditure Model|Keynesian economics]] argues in the short-run, it takes some time for the decrease in purchasing power of money to fall, so there is a 'window of opportunity' where before inflation 'kicks in' and errodes people's savings, prices all stay the same allowing people or businesses with more money to acquire more goods & services, growing the country's real GDP. This is what governments may try to exploit to grow the economy, but it's a move that has historically backfired hard for some economies.

Aiming for an inflation rate of around 1-3% reduces the likelihood of deflation, which is usually agreed to be more destructive than a little bit of inflation. For example, in deflationary periods, when you expect prices in the future to be lower, then you might hold off on purchasing. Preventing a transaction like this causes businesses to have lower income, resulting in higher unemployment and lower productivity in an economy.

High inflation tends to be self-reinforcing. When too high, it's easy for countries to lose the ability to control the escalation towards hyperinflation, which amplifies all the [[Knowledge/Economics/macroeconomics/Inflation#Undesirable Effects of Inflation|undesirable effects of inflation]].

## Undesirable Effects of Inflation
- Inflation can be particularly bad for some parties when it’s *unanticipated*.
  
  Eg. Suppose a bank loans you $1000 with an interest rate calculated based on its *expected rate of inflation* for the loan period. If the inflation is in fact higher than what the bank expected, then you will be repaying the loan in dollars with less purchasing power. Ie. there has been an unintended redistribution of real wealth in your favour, as the borrower.
- **Menu costs** — the cost of having to *literally* re-printing physical menus to reflect new cost, or any other process that needs to take place to update costs of items in a high-inflation environment.
- **Shoe-leather cost** — the real cost associated with the process of conducting transactions with banks. Inflation increases the transactions you’d make with the bank since you’d want to minimise the amount of currency you have (because they’re decreasing in value).
  
  The term ‘shoe-leather’ cost is the cost associated with *literally* wearing out the shoe leather each time you take a physical trip to the bank (back in the early 2000s, that is). Generally however, shoe-leather cost refers to the real cost of making transactions with banks which doesn't just involve wearing out your shoes. 
 - The poorer bracket of people in society tend to have a higher [[Knowledge/Economics/macroeconomics/Income-Expenditure Model#Consumption Function|marginal propensity to consume]]. A reduction in purchasing power of their money will hurt them more than more affluent individuals. Poorer households typically have less assets that act as a *hedge* against inflation, such as real estate or gold.

### Hyperinflation
When the inflation rate escalates uncontrollably. This tends to result in a sudden drop in living standards as people can no longer afford the same basket of goods and services. People will tend to hoard goods, creating shortages. People become bankrupt. Banks may become insolvent. Governments fail to provide critical services, payments and infrastructure. Everything basically falls apart.
