# ================================================================================
# Polynomial Model for Green-Ampt Wetting Front Suction (hf)
# ================================================================================
# Units:
# - Time: [hours]
# - Length: [centimeters]
#
# Inputs (Van Genuchten-Mualem parameters & Initial Condition):
# - Alpha   : Model parameter [1/cm]
# - N       : Model parameter [-]
# - Ks      : Saturated hydraulic conductivity [cm/h]
# - Theta_r : Residual volumetric water content [cm3/cm3]
# - Theta_s : Saturated volumetric water content [cm3/cm3]
# - H0      : Initial pressure head (suction) in the soil [cm]
# ================================================================================


# ================================================================================
# USER GUIDANCE FOR SPREADSHEETS:
# To use your own dataset (e.g., from Excel or a CSV file), ensure your table 
# contains at least the following columns: Alpha, N, Ks, Theta_r, Theta_s, and H0.
# 
# If you are using a standard template (like the output from Rosetta) that 
# includes Sand, Silt, Clay, and L, you MUST add a column for the initial 
# suction (H0) or specify it manually in the code.
#
# You can load your dataset using:
# data <- read.csv("your_spreadsheet.csv")
# The following data were obtained by using Rosetta 3 on the granulometric content
# and H0 were assigned randomly
# ================================================================================

data <- read.csv("data.csv")



GAhf <- function(Alpha, H0, N, Ks, Theta_r, Theta_s) {
  resultado <- ( 284.455341 ) +
    ( -11.374838 ) * log10(H0) +
    ( 160.104035 ) * log10(Alpha) +
    ( -42.518729 ) * log10(N - 1) +
    ( -1765.721569 ) * Theta_r +
    ( -946.642876 ) * Theta_s +
    ( -83.252689 ) * log10(Ks) +
    ( -24.055371 ) * log10(H0) * log10(Alpha) +
    ( -71.370994 ) * log10(Alpha) * log10(N - 1) +
    ( -60.899358 ) * log10(H0) * log10(N - 1) +
    ( 1929.752476 ) * log10(N - 1) * Theta_r +
    ( -998.969454 ) * log10(Alpha) * Theta_r +
    ( -926.365386 ) * log10(H0) * Theta_r +
    ( 58.714928 ) * log10(H0) * Theta_s +
    ( -25.983131 ) * log10(H0) * log10(Ks) +
    ( -492.483093 ) * Theta_r * log10(Ks) +
    ( 102.414183 ) * log10(N - 1) * log10(Ks) +
    ( -501.269152 ) * log10(Alpha) * Theta_s +
    ( 457.031654 ) * Theta_s * log10(Ks) +
    ( 9530.705118 ) * Theta_r * Theta_s +
    ( -228.114568 ) * log10(N - 1) * Theta_s +
    ( -50.274812 ) * log10(Alpha) * log10(Ks) +
    ( -64.137306 ) * log10(H0) * log10(Alpha) * log10(N - 1) +
    ( -415.925974 ) * log10(H0) * log10(Alpha) * Theta_r +
    ( -436.251527 ) * log10(H0) * log10(N - 1) * Theta_r +
    ( 1491.864853 ) * log10(Alpha) * log10(N - 1) * Theta_r +
    ( -241.693200 ) * log10(N - 1) * Theta_r * log10(Ks) +
    ( 47.222309 ) * log10(H0) * log10(Alpha) * Theta_s +
    ( 12.882255 ) * log10(H0) * Theta_s * log10(Ks) +
    ( -996.225050 ) * Theta_r * Theta_s * log10(Ks) +
    ( 122.741807 ) * log10(H0) * Theta_r * Theta_s +
    ( -62.636978 ) * log10(N - 1) * Theta_s * log10(Ks) +
    ( 58.748705 ) * log10(Alpha) * log10(N - 1) * Theta_s +
    ( -425.587283 ) * log10(Alpha) * Theta_r * log10(Ks) +
    ( 37.077868 ) * log10(Alpha) * log10(N - 1) * log10(Ks) +
    ( -8.429578 ) * log10(H0) * log10(Alpha) * log10(Ks) +
    ( 5172.983499 ) * log10(Alpha) * Theta_r * Theta_s +
    ( 36.719021 ) * log10(H0) * Theta_r * log10(Ks) +
    ( 250.022469 ) * log10(Alpha) * Theta_s * log10(Ks) +
    ( 2759.394809 ) * log10(N - 1) * Theta_r * Theta_s
  
  if (resultado <= 1) {
    return(1)
  } else if (resultado >= H0){
    return(H0)
  }else{
    return(resultado)}
  }
 
# Create the new 'hf' column by applying the function to each row

data$hf <- mapply(GAhf, 
                  Alpha = data$Alpha, 
                  H0 = data$H0, 
                  N = data$N, 
                  Ks = data$Ks, 
                  Theta_r = data$Theta_r, 
                  Theta_s = data$Theta_s)

# Save the updated table back to the same CSV file

write.csv(data, "data_hf.csv", row.names = FALSE)

cat("Done! The 'hf' column has been created and the data_hf.csv file has been created.\n")

