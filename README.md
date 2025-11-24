# Health-Data-Experimentation

This individual project is build on the UW-Madison Course: STAT424 Statistical Experient Design

Full Report:

## Overview

This project investigates how common lifestyle factors influence sleep quality in modern society. Using a 16-night self-experiment based on a 2⁴ full factorial design, I systematically examined the effects of room temperature, screen exposure before bedtime, bedtime, and light conditions during sleep on sleep performance.

Data were collected through two wearable sleep tracking devices combined with self-assessment scores to capture multi-dimensional indicators such as sleep duration, deep sleep ratio, and efficiency. Statistical analyses (including factorial ANOVA and interaction effect visualization) were conducted to identify the most significant factors affecting sleep quality. The findings provide a data-driven foundation for optimizing personal rest habits and may offer practical insights for individuals facing similar sleep challenges.

<img width="594" height="227" alt="Screenshot 2025-11-23 at 7 52 07 PM" src="https://github.com/user-attachments/assets/19a5a857-0539-4a7a-b44f-3a7c1a51e5ac" />

## Measurement of Location and Dispersion
To comprehensively assess the effects of each treatment combination on sleep quality in terms of both “location” and “dispersion” dimensions, two key statistics were calculated for each treatment condition. First, the mean total score was used to measure the average level of sleep quality under the combination (Equation 1). Second, the logarithmic variance Second, the logarithmic variance lns2 was used to measure the stability of the scores, i.e., the magnitude of fluctuations. It is calculated by first finding the sample variance s2 (Equation 2) and then taking the natural logarithm.

Since the variance $s^2$ is always positive and skewed in distribution, its natural logarithm $lns^2$ is used in this paper to measure volatility. This treatment brings the data closer to a normal distribution for subsequent modeling and analysis, and also makes the results easier to compare and interpret numerically and graphically.

<img width="284" height="92" alt="Screenshot 2025-11-23 at 7 52 33 PM" src="https://github.com/user-attachments/assets/c371b350-7326-4ba7-af51-036628d4dd99" />

## Main and Interaction Effects
Before optimization, the effect of each factor on the response needs to be analyzed. The main effect indicates the effect of a change in the level of a single factor on the mean of the response (Equation 3) . The interaction effect indicates the additional effect of multiple factor combinations on the response (Equation 4). These effects help identify which factors or combinations have a significant effect on sleep quality and provide a basis for subsequent optimization.

<img width="658" height="76" alt="Screenshot 2025-11-23 at 7 53 10 PM" src="https://github.com/user-attachments/assets/2a67b00e-f33d-4e04-b8c2-9440238953ef" />

## Statistical Model
To analyze the effects of experimental factors on sleep quality, I used a linear summation model. The model assumes that the total response can be expressed as a combination of main effects, interaction effects, and random errors (Equation 5, 6).

<img width="672" height="117" alt="Screenshot 2025-11-23 at 7 53 47 PM" src="https://github.com/user-attachments/assets/07b29347-8041-4efb-9358-b93405796de2" />

## Nominal-the-Best Optimization
This data structure is used in this study to support the analysis of “Nominal-the-Best” type of problems, where the goal is not only to improve the average response, but also to minimize its fluctuation around the desired target value t. In this framework, a quadratic loss function is used to measure the deviation from the target value. In this framework, a quadratic loss function is used to measure the deviation from the target value (Equation 7). According to the loss expectation (Equation 8) the magnitude of the loss depends on the sum of the squares of the variance of the response variable and its mean deviation from the target value.

<img width="392" height="60" alt="Screenshot 2025-11-23 at 7 55 16 PM" src="https://github.com/user-attachments/assets/96f2d42c-a4e5-48ad-a3ec-084a911180e5" />

Based on this, the study used a two-step optimization strategy:
i. Select levels of some factors to minimize Var(y).
ii. Select the adjustment factor (level of a factor not in i.) to move E(y) closer to t.

This method is both “good” and “stable”, and can provide an operational reference for real-life sleep optimization strategies.

## Data Analysis
To identify the factors and interaction terms that had a significant effect on sleep quality, I plotted two half-normal plots (Figures 4, 5) to assess the mean (location) and logarithmic variance (dispersion) of the response variables, respectively.

<img width="686" height="213" alt="Screenshot 2025-11-23 at 7 55 53 PM" src="https://github.com/user-attachments/assets/58cd1add-9cee-4645-89d0-5c97f41feb63" />

In Figure 4, factors C (bedtime), B (screen use), A (room temperature), D (light), B:C and A:B:C deviate significantly from the reference line, indicating that they have a significant effect on average sleep quality. This implies that going to bed earlier, reducing screen exposure, having the right room temperature and turning off light may help improve overall sleep levels. Figure 5 shows the results of the log-variance analysis, which is used to look at the volatility of sleep quality. the interaction terms B:D, A:B:D and A:D deviate significantly from the straight line, suggesting that these combinations have a significant effect on the stability of sleep, while a single factor has a relatively small effect on the volatility.

## Refit the Model
After identifying the main influence terms, I re-fitted linear regressions to $\bar{y}$ and $lns^2$, respectively (Tables 5, 6). 

In the location model, A (room temperature), B (screen), C (bedtime), and D (light) all significantly affected the means, with A being a positive effect and the rest negative, suggesting that appropriate temperature contributes to sleep quality, whereas screen exposure, late bedtime, and turning on the light may reduce scores. The interaction terms B:C and A:B:C also reached significant levels. 

In the discrete model, A:D, B:D, and A:B:D significantly affected sleep volatility, and the negative effects of B:D and A:D suggest that certain combinations may contribute to sleep stability.

<img width="601" height="223" alt="Screenshot 2025-11-23 at 7 58 18 PM" src="https://github.com/user-attachments/assets/da3145d7-43f3-4fb7-b295-01154b258124" />

<img width="614" height="73" alt="Screenshot 2025-11-23 at 7 58 38 PM" src="https://github.com/user-attachments/assets/e6fc4b9f-885e-4130-b059-f523d86d625e" />

## Select the level
To simultaneously optimize the stability and mean performance of sleep scores, I used the Two-Step Procedure method for factor screening. The method first controls volatility by minimizing the variance of the response variable, and then selects an adjustment factor to regulate the mean on this basis. Since BD is the most significant in the regression model, we first determine the level of BD. According to Figure 6, B should be chosen - and D should also be chosen - to make the dispersion as small as possible. Similarly, according to Equation 9, Figure 7, and Figure 8, A should choose +. Therefore, A, B, D = (+,−,−) to make the value of $sigma^2$ smaller.

<img width="626" height="727" alt="Screenshot 2025-11-23 at 7 59 39 PM" src="https://github.com/user-attachments/assets/00b870d9-85d8-4baf-91b4-a91dab3abf73" />

## Adjustment factor
After fixing the levels of A, B, and D, an adjustment factor needs to be further selected to enhance the mean value of sleep scores without introducing additional fluctuations. Equations 9 and 10 show that C (bedtime) significantly affects the mean in the location model, and there is no significant main effect or interaction term in the dispersion model, which is consistent with the definition of adjustment factor. The conclusion of 4.3 can be carried into Equation 9 to obtain Equation 11 and Equation 12, and then the expected score value of 85 before the experiment can be carried into (Equation 13) to solve for xC as -0.88(Equation 14). Meanwhile, it is consistent with the conclusion presented in Figure 9 and Figure 10. Therefore, A,B,C,D = (+,−,−,−).

<img width="683" height="124" alt="Screenshot 2025-11-23 at 8 00 51 PM" src="https://github.com/user-attachments/assets/ae146d0a-98e3-4b57-8aef-29a4ca4de79b" />

Since the prediction point $x_C$ = -0.88 still belongs to the valid range [-1,+1] of the experimental factor, the estimation is an interpolation with model rationality and explanatory power of the results, without additional caution about the risk of extrapolation.

## Results & Reflection
In Conclusion, the modified 24 full factorial experiment systematically examined the effects of four daily habits on sleep quality. Its findings provided me with a set of optimization recommendations with practical guidance. Firstly, a slightly warmer room temperature not only helped improve overall sleep scores but also reduced fluctuations in scores to some extent. Secondly, not using electronic devices before bedtime significantly improves sleep stability. More importantly, going to bed as early as possible played a decisive role in improving average sleep performance, especially if other conditions remained stable. Furthermore, sleeping with the lights off significantly reduces the ups and downs of sleep states during the night and improves overall sleep quality. Therefore, this combination of habits helped me achieve higher quality and more consistent sleep.
