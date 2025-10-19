data("ToothGrowth")
str(ToothGrowth)
summary(ToothGrowth)
library(ggplot2)

ggplot(ToothGrowth, aes(x=factor(dose), y=len, fill=supp)) +
  geom_boxplot() +
  labs(title="Tooth Length by Supplement Type and Dose",
       x="Dose (mg)", y="Tooth Length")
t.test(len ~ supp, data=ToothGrowth)
ToothGrowth$dose <- factor(ToothGrowth$dose)

t.test(len ~ dose, data=subset(ToothGrowth, dose %in% c(0.5,1)))
t.test(len ~ dose, data=subset(ToothGrowth, dose %in% c(1,2)))
t.test(len ~ dose, data=subset(ToothGrowth, dose %in% c(0.5,2)))
