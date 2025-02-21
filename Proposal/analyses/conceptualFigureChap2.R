# Set seed for reproducibility
set.seed(123)

# Function to generate valid intercepts and slopes
generate_valid_values <- function() {
  intercept <- runif(1, 50, 100)  # Random intercept between 50 and 100
  slope <- runif(1, -1, -0.1)     # Random slope between -1 and -0.1 (negative)
  
  # Ensure the generated values are finite and valid
  while (!is.finite(intercept) | !is.finite(slope)) {
    intercept <- runif(1, 50, 100)
    slope <- runif(1, -1, -0.1)
  }
  
  return(c(intercept, slope))
}

# Generate values for all 4 groups (Low/High Elevation, Non-Mast/Mast)
intercepts_and_slopes <- matrix(NA, nrow=4, ncol=2)

# Generate values for each of the four groups
intercepts_and_slopes[1, ] <- generate_valid_values()  # Low Elevation, Mast
intercepts_and_slopes[2, ] <- generate_valid_values()  # Low Elevation, Non-Mast
intercepts_and_slopes[3, ] <- generate_valid_values()  # High Elevation, Mast
intercepts_and_slopes[4, ] <- generate_valid_values()  # High Elevation, Non-Mast

# Define the colors for each group
colors <- c("blue", "lightblue", "red", "darkred")
group_names <- c("Low Elevation, Non-Mast", "Low Elevation, Mast", 
                 "High Elevation, Non-Mast", "High Elevation, Mast")

# Set up the plot
plot(NA, xlim=c(0, 150), ylim=c(50, 130), 
     xlab="", ylab="", main="Growth-reproduction trade-off"
     )

# Plot trend lines for each group
# Low Elevation, Non-Mast
abline(a=intercepts_and_slopes[2, 1], b=intercepts_and_slopes[2, 2], col=colors[2], lwd=2)

# Low Elevation, Mast
abline(a=intercepts_and_slopes[1, 1], b=intercepts_and_slopes[1, 2], col=colors[1], lwd=2, lty = 2)

# High Elevation, Non-Mast
abline(a=intercepts_and_slopes[4, 1], b=intercepts_and_slopes[4, 2], col=colors[4], lwd=2)

# High Elevation, Mast
abline(a=intercepts_and_slopes[3, 1], b=intercepts_and_slopes[3, 2], col=colors[3], lwd=2, lty = 2)


plot(NA, xlim=c(0, 150), ylim=c(50, 130), 
     xlab="Seed production (year)", ylab="Annual radial growth", main="Growth-reproduction trade-off for mast and non-mast year",
     xaxt="n", yaxt="n") 
