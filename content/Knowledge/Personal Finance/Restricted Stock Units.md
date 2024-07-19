---
title: Restricted Stock Units
---

*Restricted stock units (RSUs)* are [[Knowledge/Investing/Stocks|stocks]] given as part of your compensation by your employer.
- Ownership of RSUs is transferred from your employer to you based on a [[Knowledge/Personal Finance/Restricted Stock Units|vesting plan]]. Once 'vested', those shares become like any normal asset under your ownership — you're free to hold or sell them as you please.
- There are important things to know about how they're [[Knowledge/Personal Finance/Restricted Stock Units|taxed]]. The main difference is that the *entire value* of the stocks are considered your income, not just the [[Knowledge/Investing/Capital Gains Tax|capital gains]] you get when you sell them. In this sense, RSUs are treated like [[Knowledge/Personal Finance/Income Tax|Income Tax]]

## How GSUs Work
GSU is basically a Google internal name for restricted stock units. I think the vast majority of things below here apply for restricted stock units in general.

When you join Google, you are put on a vesting schedule. In my case, I was put on a 4-year schedule with 60k USD vesting annually at 33% in year 1, 33% in year 2, 22% in year 3, 12% in year 4. Throughout each year, 1/12th of the year's equities vest each month.

Some things to know:
- "Awards" and "grants" are interchangeable terms.
- Once a GSU is said to be ‘vested’, it is entirely yours and Google cannot take it away from you. A vested share is exactly the same as if you were to have independently went out and bought the share yourself.
- Awards are given based *on the value of GSUs*, not the *number of GSUs*. **You are promised a value, not a fixed number of GSUs**.
	- GSUs are rounded up. E.g. if you are meant to be given 3.7 GSUs, you will actually get 4 GSUs.
	- How many GSUs you get depends on the average closing price of GOOG in the month before the grant.
- Award vesting dates and frequency can differ between people. For me, I can expect 1 grant every month. Others might get 1 grant every quarter or 6 months.
- **FMV** — fair market value, “an asset's estimated value if it were sold today in the current market."

## Insider Trading
Insider trading is the buying/selling of shares when you have non-publicly disclosed information about your company that could help you predict when to buy and sell shares. This also includes ‘tipping’ others about when to buy and sell.
- Information that’s considered helpful in predicting buy/sell decisions involve: earnings data, upcoming mergers/acquisitions, upcoming patents, new partnerships, unannounced data breaches, changes in management, etc.
- Your employer may have a program that you can opt into where you regularly sell shares based on a preplanned schedule. Your shares will be sold even in closed trading windows, but the catch is that you have to commit to selling it in advance.

Basically:
- Don’t ever do short-term speculative trading (i.e. dipping in and out of holding GOOG stock).
- Don’t trade outside of trading windows. In Google’s case, you have a few weeks to buy/sell shares every quarter.
    ![[Knowledge/Personal Finance/assets/trading-windows.png|800]]

## How RSUs Get Taxed
In Australia, RSUs you get as part of compensation are treated like [[Knowledge/Personal Finance/Income Tax|Income Tax]]. 
- The moment your GSUs vest, that’s a *taxable event*. I.e. the moment some shares vest and are put under your ownership, you have been essentially paid the value of those shares.
- There is **no** [[Knowledge/Personal Finance/Income Tax#Tax Withholding|income tax withholding]] on GSUs. This means you likely **do** need to make a pretty big lump sum transfer in your tax return.

Some taxation rules to know about:
- If you sell within 30 days of vesting, your taxing point will not be at vesting, but instead will be the date of sale (under what is referred to as the “30 Day Rule”)
	- The ESS Statement does not take this into account.
	- No capital gains are reported in this situation. Sales within 30 day of vesting are not subject to CGT.
- Shares held to 12+ months get a 50% CGT discount.
- If you're in Australia getting stocks in a U.S. company, you need to fill out the W8-BEN form. It's filled by non-US citizens, and is used to determine whether you are a U.S. taxpayer.
    - Must be filled every 3 years.
    - Selling RSUs without having this filled out will result in some money being withheld from you.

![[Knowledge/Personal Finance/assets/rsu-cgt-explained.png|800]]

If vest date is on a closed trading window, then the FMV is sourced from the first day of the next open trading window.
If the vest date is on a weekend or public holiday, then the FMV is sourced from the next USD to AUD exchange rate is used.

There's also the complication that you were compensated based on USD, not AUD. You need to account for the capital gains and losses from the exchange rate to AUD.
- The canonical values to use for the USD to AUD exchange rates are sourced [from the RBA](https://www.rba.gov.au/statistics/frequency/exchange-rates.html).

### ESS Statement
The **ESS statement** (*Employee share scheme statement*) is a document that helps you with your tax return.

The ESS statement tells you the total taxable value of your GSUs and FMV at vest but it knows nothing about your share sales (to find the transaction data for that, you’d need to download it from your broker, in my case Charles Schwab). This is how much the GSUs contribute to income tax. It also tells you the FMV of your shares at their time of vest.
- Your employer reports your GSU income here.
- As a Google employee, expect this to be available around July 14 each year.

Note: When you do your tax return, expect Google to pre-fill some things, but expect to override some figures yourself if you sold RSUs.

### Calculating FMV
For each grant, you need to determine the *fair market value* (FMV) of the RSUs at the time of vesting. This is used as the basis for calculating taxable income. Your employer likely provides you the FMV for each grant they've given you.

Here's my situation: I get 1 grant each month. This happens on a designated vesting date. The FMV for this grant is the total value I could have sold it for on that date. But what time of that day do you pick for valuing the stock? Google uses the *closing price* (and so do most other companies), i.e. the final price of the last transaction of the stock on the vesting date.

### Currency Exchange Taxation
When I sell my stock and route the money to my Australian bank account, I am converting USD to AUD. Here, I might have either made capital gains or losses on the currency exchange.
- If I haven't made the currency exchange, then I haven't realised the gains/losses yet. No taxable events have occurred here.

## Equity Refresh Grants
Equity refresh grants are modifications to the vesting schedule of existing employees that ensure they're incentivised and stay invested in the company's long-term success.
- The size of equity refresh grants are often tied to your work performance and the company's success.

As a new hire, you might be put on a 4-year vesting schedule that descends, like 33%, 33%, 22%, 12%. Equity refresh grants aim to reinvigorate you by increasing the equities awarded to you beyond the first 4 years.

At Google, annual refresh grants are calculated as: target grant * (individual) grant multiplier, followed by discretionary adjustment by manager.
