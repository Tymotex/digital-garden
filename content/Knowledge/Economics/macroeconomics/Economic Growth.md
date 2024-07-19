---
title: Economic Growth
description: Economic Growth
---

*Economic growth* is the general improvement in *living standards*, which is representable through an indicator like *real [[Knowledge/Economics/macroeconomics/GDP|GDP]] per capita*.

Supposing $y=\frac{Y_\text{real}}{\text{Population}}$, the economic growth rate from $t-1$ to $t$ is
$$
    g = \frac{y_{t}- y_{t-1}}{y_{t-1}}.
$$
Making $y_t$ the subject, and then extrapolating across time periods $[0, t]$, we have:
$$
\begin{align}
    y_{t} &= (1 + g) \cdot y_{t-1},\\
    &= (1+g)^{2} \cdot y_{t-2} \\
    &= (1+g)^{t} \cdot y_0. \\
\end{align}
$$
A small difference in $g$ across a long span of time will result in enormous differences because of the compounding effect.

## Purchase Power Parity
The **Purchase Power Parity** exchange rate uses a standard basket of goods and services to assess economic productivity and living standards across different countries.

## Aggregate Production Function
An aggregate production function is a function of variables such as aggregate physical capital stock, aggregate labour quantity used, general level of factor productivity, etc. 

The [Cobb-Douglas Production Function](https://en.wikipedia.org/wiki/Cobb%E2%80%93Douglas_production_function) is an example of an aggregate production function that produces real GDP as a function of labour, physical capital and technology and has the the form:
$$
     Y_\text{real} = AK^{\alpha}L^{1-\alpha},
$$
where $A$ is 'factor productivity', $K$ is physical capital, $L$ is labour input, and $0 < \alpha < 1$.

A notable property of this function is that if you were to double capital $K$ and labour $L$ (representing the quantity and quality of human capital), the production output doubles. This property is called *constant returns to scale*.

- *Marginal product of labour*: $MPL = \frac{\delta Y}{\delta L} = (1-\alpha)\frac{Y}{L}$
- *Marginal product of capital*: $MPK = \frac{\delta Y}{\delta L} = \alpha\frac{Y}{K}$

**Capital Per Worker**
The average worker productivity is given by $\frac{Y}{L}=A(\frac{K}{L})^\alpha$. Since $0 < \alpha < 1$, increases in $\frac{K}{L}$ result in *diminishing increases* in worker productivity. Letting $y=\frac{Y}{L}$ and $k=\frac{K}{L}$ (the *capital per worker*), we have $y=Ak^\alpha$.  

**Growth of Productivity**
The change in aggregate production is given by
$$
    \Delta Y = \Delta A + \alpha \Delta K + (1 - \alpha) \Delta L,
$$
which can be rearranged to get the growth in productivity, $\Delta A$,
$$
    \Delta A = \Delta Y - \alpha \Delta K - (1 - \alpha) \Delta L.
$$
