rm(list=ls()) 
options(stringsAsFactors = FALSE)

setwd("C:/PhD/Project/Masting/data")
d <- read.csv("MORA_cleanseeds_2009-2017.csv")
d$totalseed <- d$filledseeds + d$emptyseeds
d <- subset(d,stand %in% c("AE10", "AB08","AG05","AM16","AO03","AV06","PARA","SUNR","TO04","TA01"))
subset_data <- subset(d, species %in% c("ABAM", "CANO", "THPL","TSHE","TSME","PSME"))

summary_data <- aggregate(totalseed ~ year + species, data = subset_data, FUN = sum)

wide_data <- reshape(summary_data, idvar = "year", timevar = "species", direction = "wide")



# Sort by year in case it's out of order
wide_data <- wide_data[order(wide_data$year), ]

# Years to show on x-axis
years <- wide_data$year
dev.new()
par(mfrow = c(1, 2))
# Set up empty plot
plot(years, wide_data[[2]], type = "n", 
     ylim = range(wide_data[,-1], na.rm = TRUE),
     xlab = "Year", ylab = "Total Seeds in 10 stands",
     xaxt = "n")  # suppress x-axis for custom ticks

# Add custom x-axis with all years
axis(1, at = years, labels = years, las = 2)

# Set colors
colors <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#CC79A7")

# Loop through species columns
for (i in 2:ncol(wide_data)) {
  lines(years, wide_data[[i]], col = colors[i - 1], lwd = 2)
  points(years, wide_data[[i]], col = colors[i - 1], pch = 16)
}

subset_data1 <- subset(subset_data, species %in% c("ABAM", "CANO", "THPL","TSME","PSME"))

summary_data <- aggregate(totalseed ~ year + species, data = subset_data1, FUN = sum)

wide_data <- reshape(summary_data, idvar = "year", timevar = "species", direction = "wide")

# Sort by year in case it's out of order
wide_data <- wide_data[order(wide_data$year), ]

# Years to show on x-axis
years <- wide_data$year

# Set up empty plot
plot(years, wide_data[[2]], type = "n", 
     ylim = range(wide_data[,-1], na.rm = TRUE),
     xlab = "Year", ylab = "Total Seeds in 10 stands",
     xaxt = "n")  # suppress x-axis for custom ticks

# Add custom x-axis with all years
axis(1, at = years, labels = years, las =2)

# Set colors
colors1 <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7")

# Loop through species columns
for (i in 2:ncol(wide_data)) {
  lines(years, wide_data[[i]], col = colors1[i - 1], lwd = 2)
  points(years, wide_data[[i]], col = colors1[i - 1], pch = 16)
}

species_list <- unique(subset_data$species)

legend("topright", 
       legend = species_list, 
       col = colors, 
       lty = 1, 
       lwd = 2, 
       bty = "n") 
