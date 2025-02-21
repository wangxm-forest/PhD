rm(list=ls()) 
options(stringsAsFactors = FALSE)
setwd("C:/PhD/Project/Masting/data")
d <- read.csv("MORA_cleanseeds_2009-2017.csv")
d$totalseed <- d$filledseeds + d$emptyseeds
d <- subset(d,stand %in% c("AE10", "AB08","AG05","AM16","AO03","AV06","PARA","SUNR","TO04","TA01"))
subset_data <- subset(d, species %in% c("ABAM", "CANO", "THPL","TSHE","TSME","PSME"))

par(mfrow = c(2, 2))
species_list <- unique(subset_data$species)
with(subset(d, species == species_list[1]), {
  plot(year, filledseeds, type = "n", # 'n' means no points initially
       xlab = "Year", ylab = "Total Seeds in 10 Stands",
       ylim = c(0, 200),
       xaxt = "n")
})
axis(1, at = 2009:2017, labels = 2009:2017, las = 2)  # 'las = 2' rotates the labels

colors <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#CC79A7")
# Add smooth lines for each species
for (i in 1:length(species_list)) {
  species_data <- subset(d, species == species_list[i])
  smooth_line <- smooth.spline(species_data$year, species_data$filledseeds)  # Apply smoothing
  lines(smooth_line, col = colors[i], lwd = 2)  # Add the smoothed line with a width of 2
}
legend("topright", legend = species_list, col = colors, lty = 1, lwd = 2)

species_list <- unique(subset_data$species)
with(subset(d, species == species_list[1]), {
  plot(year, totalseed, type = "n", # 'n' means no points initially
       xlab = "Year", ylab = "Total Seeds in 10 Stands", 
       ylim = c(0, 400),
       xaxt = "n")
})
axis(1, at = 2009:2017, labels = 2009:2017, las = 2)  # 'las = 2' rotates the labels

colors <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#CC79A7")
# Add smooth lines for each species
for (i in 1:length(species_list)) {
  species_data <- subset(d, species == species_list[i])
  smooth_line <- smooth.spline(species_data$year, species_data$totalseed)  # Apply smoothing
  lines(smooth_line, col = colors[i], lwd = 2)  # Add the smoothed line with a width of 2
}
legend("topright", legend = species_list, col = colors, lty = 1, lwd = 2)

subset_data1 <- subset(d, species %in% c("ABAM", "CANO", "THPL","TSME","PSME"))
species_list <- unique(subset_data1$species)
with(subset(d, species == species_list[1]), {
  plot(year, filledseeds, type = "n", # 'n' means no points initially
       xlab = "Year", ylab = "Total Seeds in 10 Stands", 
       ylim = c(0, 70),
       xaxt = "n")
})
axis(1, at = 2009:2017, labels = 2009:2017, las = 2)  # 'las = 2' rotates the labels

colors <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7")
# Add smooth lines for each species
for (i in 1:length(species_list)) {
  species_data <- subset(d, species == species_list[i])
  smooth_line <- smooth.spline(species_data$year, species_data$filledseeds)  # Apply smoothing
  lines(smooth_line, col = colors[i], lwd = 2)  # Add the smoothed line with a width of 2
}
legend("topright", legend = species_list, col = colors, lty = 1, lwd = 2)


with(subset(d, species == species_list[1]), {
  plot(year, totalseed, type = "n", # 'n' means no points initially
       xlab = "Year", ylab = "Total Seeds in 10 Stands", 
       ylim = c(0, 100),
       xaxt = "n")
})
axis(1, at = 2009:2017, labels = 2009:2017, las = 2)  # 'las = 2' rotates the labels

colors <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#CC79A7")
# Add smooth lines for each species
for (i in 1:length(species_list)) {
  species_data <- subset(d, species == species_list[i])
  smooth_line <- smooth.spline(species_data$year, species_data$totalseed)  # Apply smoothing
  lines(smooth_line, col = colors[i], lwd = 2)  # Add the smoothed line with a width of 2
}
legend("topright", legend = species_list, col = colors, lty = 1, lwd = 2)
