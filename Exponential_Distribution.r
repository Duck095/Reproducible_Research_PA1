# === Setup ===
set.seed(42)
lambda <- 0.2
n <- 40
nsim <- 1000

# === Simulate ===
means <- replicate(nsim, mean(rexp(n, lambda)))

# === Compare Sample vs Theoretical Mean ===
sample_mean <- mean(means)
theoretical_mean <- 1/lambda

# === Compare Sample vs Theoretical Variance ===
sample_var <- var(means)
theoretical_var <- (1/lambda^2)/n

# === Visualization ===
hist(means, breaks=40, prob=TRUE, main="Distribution of Means of 40 Exponentials")
abline(v=sample_mean, col="red", lwd=2)
abline(v=theoretical_mean, col="blue", lwd=2)
lines(density(means), col="darkgreen", lwd=2)

# Overlay normal curve
x <- seq(min(means), max(means), length=100)
y <- dnorm(x, mean=theoretical_mean, sd=sqrt(theoretical_var))
lines(x, y, col="purple", lwd=2)
legend("topright", legend=c("Sample Mean","Theoretical Mean","Normal Fit"),
       col=c("red","blue","purple"), lwd=2)
