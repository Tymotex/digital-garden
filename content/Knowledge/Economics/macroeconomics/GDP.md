---
title: GDP
description: GDP
---

**GDP** (*gross domestic product*) is the **monetary** value of all the *domestically-produced **final** goods and services* in a country during a given period. The Australian GDP value is usually announced by the [ABS](https://www.abs.gov.au/) every quarter (3 months). GDP is regarded as a *standard* measure of the *level of production* of a country and its purpose is to serve as an indicator for the size an economy. An increase in a country's GDP indicates that it is undergoing economic growth (an increase in the amount of goods and services produced by the country).

**GDP per capita** is the GDP divided by the country’s population. It's used as an indicator for labour productivity and living standards ([[Knowledge/Economics/macroeconomics/GDP#GDP and Economic Welfare|with many caveats]]).

*Some figures from 2020, rounded loosely:*

| Country     | GDP                 | GDP Per Capita |
| ----------- | ------------------- | -------------- |
| Australia   | $1.33 trillion USD  | $52000 USD     | 
| U.S         | $20.94 trillion USD | $64000 USD     |
| China       | $14.72 trillion USD | $10000 USD     |
| New Zealand | $0.21 trillion USD  | $42000 USD     |

*Sample of Australia's quarterly GDP, sourced from the ABS.* Australia's annual GDP in 2015 is simply the sum of all 4 quarterly GDPs, which in this case, is roughly $\$1.6$ trillion AUD.

| Quarter        | GDP            |
| -------------- | -------------- |
| March 2015     | $404.1 billion |
| June 2015      | $405.4 billion |
| September 2015 | $408.9 billion |
| December 2015  | $410.4 billion |

### GDP and Economic Welfare
Although correlated, GDP is *not* a measure of societal wellbeing. *GDP per capita* is a better indicator but still does not capture the full picture of wellbeing. Notably, GDP omits [[Knowledge/Economics/microeconomics/Externalities|negative externalities]] associated with production, such as pollution, and does not take into account whether a country's wealth is 'fairly' distributed.

### What Contributes to GDP?
GDP only counts the transaction of ***final*** goods and services, which are goods and services that have reached the final owner and will not be resold. This means that the transaction of all intermediate **goods** do not contribute to a country’s GDP, otherwise it would be double counted.

> ️GDP *does not count the value of the inputs*, only the price paid by a **final consumer**.

#### Examples
- If you grow your own vegetables, that doesn’t count to GDP. If you buy vegetables from a supermarket however, then that *will* contribute to the GDP.
    - **Note**: supermarkets purchasing fruits/vegetables for their inventory would be counted to GDP *even* if they’re not sold to customers. The *final consumer* here is the supermarket since they’re the last owner of the good.
- If a constructor purchases materials to buy a house which eventually is sold to a family, the GDP only counts the transaction between the constructor and the family. Ie. we do not count the value of the *inputs to production* such as the bricks, cement, glass, etc.
- ‘Household production’ such as cooking and child care are *mostly* excluded from the GDP, purely because it’s too hard to valuate those goods & services.
- A change in ownership of an asset like buying/selling shares doesn’t count to GDP.
    - Buying an *existing* property doesn’t count either, but buying a *newly* constructed property is counted. Again, what matters is that GDP is only counted once per asset and never again along the chain of ownership.
- Watching YouTube contributes to the GDP since you’re driving a transaction between YouTube and the advertisers paying to put their ads on YouTube.
- **The location of the production of the good/service matters**. Eg. if you’re on holiday in New Zealand and you teach a computer science lesson for $1000 NZD, then that counts to New Zealand's GDP, not your country’s GDP, since the service was produced in New Zealand.

#### Estimating Value
When some good/service does not have a *concrete* price or market value, we can estimate it by calculating the sum of the *value of the inputs* used to *produce* that good or service. This is often done for services provided by the government. 

For instance, if a firefighter is alerted of an incident and has to drive somewhere to put out a fire, that service might have no payment associated with it, but it’ll still contribute to the GDP. The value it contributes is simple a sum of the value of the inputs necessary to provide that service (cost of labour, fuel, extinguisher materials, etc.).

#### Imports/Exports
Buying imported goods **does not** contribute to our country’s GDP, however it **does contribute** to the exporting country’s GDP.

If you’re a foreigner working in Australia, your work contributes to the Australian GDP but not to that of your home country.

> *Exports contribute* to our GDP. Imports do not.

## Calculating GDP
The GDP value is obtainable through 3 main ways: the [[Knowledge/Economics/macroeconomics/GDP#Production Approach|production approach]], [[Knowledge/Economics/macroeconomics/GDP#Expenditure Approach|expenditure approach]] and [[Knowledge/Economics/macroeconomics/GDP#Income Approach|income approach]]. These are all meant to arrive at the same value in theory, but in practice, each will have their own measurement errors and report slightly different values of GDP. The ABS takes the average of the 3 values and reports that as the official GDP value in their announcements.

*Note*: we use $Y$ as the symbol for GDP.

### Production Approach
In the production approach, we measure GDP as the difference between the value of outputs and the value of inputs in producing those outputs.

GDP is calculated as: $Y \equiv \text{gross value of output } - \text{ intermediate costs}$ .

In other words, it’s the total *value-added* of all transactions in a country.

### Expenditure Approach
In the expenditure approach, we measure GDP as the total money spent on *domestically produced final* goods and services by everyone (individuals/businesses in Australia and other countries who consume what Australia supplies).

We can calculate GDP based on total expenditures from different sources: 
$$\colorbox{#ffffbf}{$Y\equiv C+I+G+(X-M)$}.$$
- $C$ — **household** **consumption spending**. Ie. how much households spend.
	- The goods consumed can be categorised into *durable* (longer-lived items whose ownership can be transferred) and *non-durable* (single-use items, like food).
- $I$ — **gross private investment**. Ie. how much businesses spend.
	- This can be further categorised as: dwelling construction costs, non-dwelling construction costs, machinery/equipment costs, etc.
- $G$ — **government spending**.
- $X$ — **exports**. Ie. how much the rest of the world purchases from us (Australia).
- $M$ — **imports**. Ie. how much we (Australia) spend on imports from the rest of the world.
	- $NX = X - M$ — **net exports**.

### Income Approach
In the income approach, we calculate GDP as the total income generated by the production of all goods and services.

GDP is calculated as: 
$$Y\equiv \text{labour income + capital income + }\underbrace{\text{(indirect taxes - subsidies)}}_{\text{Net indirect taxes}}.$$
Expressed differently and assuming $0$ net indirect taxes,
$$Y \equiv (W \times L) + (R \times K),$$
where $W \times L$ is the wage per ‘unit’ of labour times the total labour and $R\times K$ is the rate of return times the total capital.

## Real vs. Nominal GDP

***Nominal GDP*** counts everything at *current prices*. It therefore does not account for [[Knowledge/Economics/macroeconomics/Inflation|inflation]]. This means that the value of nominal GDP can change year-to-year even when the rate of production has stayed the same, because some goods/services have become more or less valuable over time.

***Real GDP*** counts the changes in production by holding prices constant at a chosen *base year*’s prices. Which base year you choose affects the real GDP calculated in other years. It's basically *nominal GDP*, but adjusted for inflation.

## Recession
A *recession* is a period, typically several months, where production levels have declined from previous levels and unemployment rates are high. There is no universal formal definition of a recession, but it's typically identified as two consecutive quarters where GDP growth has been negative, which means that the total final goods and services produced in the country has reduced for 6 months straight.

A *depression* is like a recession, but it lasts for many years, is more destructive, and is much rarer.
