---
title: "STAT424_Project"
author: "Linyan Li"
date: "2025-04-28"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(ggplot2)
library(dplyr)
library(tidyr)
library(faraway)

```

```{r}
# Read CSV file
data <- read.csv("sleep_study.csv", header = TRUE)

colnames(data) <- c("Run","A", "B", "C", "D", "score1", "score2", "score3")

data$y.bar <- rowMeans(data[, c("score1", "score2", "score3")])
data$s.2 <- apply(data[, c("score1", "score2", "score3")], 1, var)
data$ln.s.2 <- log(data$s.2)
head(data,3)

```

```{r}
# location main effects
mod.loc <- lm(y.bar ~ A*B*C*D, data)
theta.loc <- mod.loc$coefficients * 2
theta.loc <- theta.loc[!is.na(theta.loc)]
theta.loc <- theta.loc[2:16]

theta.loc

# half-normal plots
halfnorm(theta.loc, labs = names(theta.loc), nlab = 15, ylab = "Location")

# dispersion main effects
mod.dis <- lm(ln.s.2 ~ A*B*C*D, data)
theta.dis <- mod.dis$coefficients * 2
theta.dis <- theta.dis[!is.na(theta.dis)]
theta.dis <- theta.dis[2:16]
theta.dis

# half-normal plots
halfnorm(theta.dis, labs = names(theta.dis), nlab = 15, ylab = "Dispersion")
```

```{r}
# re-fit the location model with significant factors only
mod.loc.final <- lm(y.bar ~ A + B + C + D + B:C + A:B:C, data)
summary(mod.loc.final)

# re-fit the dispersion model with significant factors only (change the BCQ to DEQ)
mod.dis.final <- lm(ln.s.2 ~ A:D + B:D + A:B:D + A:B:C+C:D+A:C + A:D, data)
summary(mod.dis.final)
```

```{r}
# creates the B vs D interaction plot
ggplot(data, aes(x = factor(D), y = ln.s.2, linetype = factor(B), group = factor(B))) +
  stat_summary(fun = mean, geom = "line", color = "black") +
  stat_summary(fun = mean, geom = "point", color = "black") +
  labs(x = "D", y = "Dispersion Free Height", linetype = "B") +
  theme_classic(base_size = 14) +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("BD Interaction Plot")

# creates the A vs D interaction plot
ggplot(data, aes(x = factor(D), y = ln.s.2, linetype = factor(A), group = factor(A))) +
  stat_summary(fun = mean, geom = "line", color = "black") +
  stat_summary(fun = mean, geom = "point", color = "black") +
  labs(x = "D", y = "Dispersion Free Height", linetype = "A") +
  theme_classic(base_size = 14) +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("AD Interaction Plot")

# creates the A vs B interaction plot
ggplot(data, aes(x = factor(B), y = ln.s.2, linetype = factor(A), group = factor(A))) +
  stat_summary(fun = mean, geom = "line", color = "black") +
  stat_summary(fun = mean, geom = "point", color = "black") +
  labs(x = "B", y = "Dispersion Free Height", linetype = "A") +
  theme_classic(base_size = 14) +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("AB Interaction Plot")

# creates the B vs C interaction plot
ggplot(data, aes(x = factor(C), y = y.bar, linetype = factor(B), group = factor(B))) +
  stat_summary(fun = mean, geom = "line", color = "black") +
  stat_summary(fun = mean, geom = "point", color = "black") +
  labs(x = "C", y = "Mean Free Height", linetype = "B") +
  theme_classic(base_size = 14) +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("BC Interaction Plot")

# creates the A vs C interaction plot
ggplot(data, aes(x = factor(C), y = y.bar, linetype = factor(A), group = factor(A))) +
  stat_summary(fun = mean, geom = "line", color = "black") +
  stat_summary(fun = mean, geom = "point", color = "black") +
  labs(x = "C", y = "Mean Free Height", linetype = "A") +
  theme_classic(base_size = 14) +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("AC Interaction Plot")

# creates the A vs B interaction plot
ggplot(data, aes(x = factor(B), y = y.bar, linetype = factor(A), group = factor(A))) +
  stat_summary(fun = mean, geom = "line", color = "black") +
  stat_summary(fun = mean, geom = "point", color = "black") +
  labs(x = "B", y = "Mean Free Height", linetype = "A") +
  theme_classic(base_size = 14) +
  theme(
    panel.border = element_rect(colour = "black", fill = NA, size = 1),
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("AB Interaction Plot")

```

```{r}
72.292+2.667*(1)-3.750*(-1)-4.583*(-1)-2.208*(-1)+1.292*(1)-1.250*(1)
```

