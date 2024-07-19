---
title: Private Banks
description: Private Banks
---

Private banks are *financial intermediaries* that make household savings available for borrowing. 

When you make a deposit of physical currency to a bank, you are converting physical currency into an increase in the number representing the the value of your bank account. 

Deposits represent a liability for the bank. 

Banks make money by incentivising people to make deposits that they can earn a small interest on, and then making that deposited money available for borrowing at a higher interest rate. The money they make is in the difference between the two.

### Bank Balance Sheet

![[Knowledge/Economics/macroeconomics/assets/private-bank-balance-sheet.png|400]]

To start a bank, you need an initial fund, called the 'shareholders' equity capital', or just 'equity'. Suppose you start a bank with $100 AUD equity. This also means the bank has $100 in its *reserves*.

![[Knowledge/Economics/macroeconomics/assets/private-bank-initial-balance.png|300]]

Suppose a customer gets a $1000 loan from our bank. They'd have a deposit account with $1000. Our balance sheet would record a $1000 loan as an *illiquid* financial asset and a deposit of $1000. 

Note that we essentially 'created' money out of thin air. We say that the borrower has $1000 available, but we don't need to actually provide it until they withdraw it from our reserves. When they do withdraw more than is in our reserves, we must either attract more deposits to build up our reserves or borrow it from someplace else. If we fail to do either, then we'll become *insolvent*, ie. unable to pay back depositors and therefore operate.

We must do our best to ensure that $\text{Assets} > \text{Liabilities}$.

### Bank Run
When someone wants to withdraw more money than the bank has in its reserves, then it’ll have to actively attract more deposits *or* they’ll have to resort to borrowing the necessary money from the central bank or other financial institutions in the [[Knowledge/Economics/macroeconomics/Central Bank|overnight cash market]].

A bank run is when *a lot of people* all try to withdraw their deposits in full from the bank, and the bank becomes *insolvent*, where the bank is no longer able to pay back people's deposits. The unfortunate thing is that the mass panic about the bank becoming insolvent is what *causes* the bank to become insolvent, just like how [panic buying](https://en.wikipedia.org/wiki/Panic_buying) causes shortages.

Even when $\text{Assets}>\text{Liabilities}$ on the balance sheet, it is still possible for banks to become insolvent if they have insufficient *liquid* assets to meet a sudden increase in demand for withdrawal.

#### Surviving Bank Runs
**Central bank bailout**
The [[Knowledge/Economics/macroeconomics/Central Bank|central bank]] can help bail out banks that are on the verge of becoming insolvent, however they shouldn’t do this liberally. The general rule is that the central bank should lend to a bank only if it is *solvent* (ie. $\text{Assets} > \text{Liabilities}$ in their balance sheet), but they're simply just lacking in *liquid* assets to pay deposits with.

**Deposit insurance**
Governments can provide deposit insurance that guarantee you can withdraw currency up to some maximum value. In Australia, the government promises you deposits of up to 250000 AUD can be withdrawn without fear of the bank losing your savings. This insurance doesn’t come for free — the government charges a fee to banks to have this insurance, and the banks in turn charge the depositor by lowering the deposit rates or charging more admin fees.

### Prudential Regulations
Government regulations set by [APRA](https://www.apra.gov.au/what-prudential-regulation), called 'prudential' or 'macro-prudential' regulations, require banks (and other financial institutions like super funds, insurance companies, etc.) to adhere to certain balance sheet values in order to prevent becoming insolvent.

For a bank, there are the following ratios that must be above/below a prescribed safe value:
1. **Leverage ratio** — $\frac{\text{Loans}}{\text{Equity}}$ should be below a ceiling value. 
	- Note that $\text{Equity = Loans + Reserves - Debt}$. Equity provides a buffer to prevent banks becoming insolvent.
1. **Reserve-deposit ratio** (*liquidity coverage ratio*) — $\frac{\text{Reserves}}{\text{Deposits}}$ should be above some floor value. It's also called 'liquidity coverage' ratio because there must be sufficient liquid reserves to meet sudden withdrawal demand.
2. **Capital ratios** — a ratio of equity to a weighted risk measure of their assets. A [[Knowledge/Economics/macroeconomics/Bonds|government bond]], for example, is far less risky financial asset than a mortgage arranged with someone with low income.
3. **Net stable funding ratios** — a value associated with the sources of bank funding. For example, longer-term loans corresponds to a lower likelihood of currency withdrawal.
4. **Loan to value ratio** — a limit on the amount someone can borrow to hold a certain asset. For instance, a loan-to-value ratio of $0.8$ means that banks will lend a maximum of $80\%$ of the market value of an asset.
