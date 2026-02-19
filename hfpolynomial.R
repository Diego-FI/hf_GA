# Based on the methodology shown in doi:
#
# Units:
# time [hours]
# length [centimeters]
#
# Parameters from Van-Genuchten Mualem model:
# Alpha, N, Theta_r (residual volumetric water content), Theta_s (saturated volumetric water content) and Ks (Saturated hydraulic conductivity) 
# H0 is the initial pressure head in the soil
#
# Modify the data vector in order to obtain the wetting front pressure head
#
GAhf <- function(Alpha, H0, N, Ks, Theta_r, Theta_s) {
  hf <-  (0.257992124)+
    (3.6639177)*log10(H0)+
    (6.209447065)*log10(Alpha)*log10(Alpha)*log10(H0)+
    (109.5807167)*log10(N -1)*log10(Alpha)*log10(Alpha)+
    (-103.8440904)*log10(N -1)*log10(N -1)*log10(Alpha)+
    (26.17805337)*log10(Alpha)*log10(H0)*Theta_s+
    (737.5485544)*log10(N -1)*log10(Alpha)*Theta_s+
    (4.424545359)*log10(Alpha)*log10(H0)*log10(Ks)+
    (5.393971588)*log10(Alpha)*log10(Alpha)*log10(Alpha)+
    (-25.73899107)*log10(Alpha)+
    (-340.4432335)*log10(N -1)*log10(N -1)*Theta_s+
    (11.9896582)*log10(H0)*log10(Ks)*Theta_s+
    (2106.13737)*log10(Alpha)*Theta_r*Theta_s+
    (677.2188169)*Theta_s*Theta_s*Theta_s+
    (0.48919711)*log10(Alpha)*log10(H0)*log10(H0)+
    (2.190502017)*log10(H0)*log10(H0)*Theta_s+
    (-30.04484145)*log10(N -1)*log10(Alpha)*log10(H0)+
    (-62.3708493)*log10(N -1)*log10(H0)*Theta_s+
    (2.349615295)*log10(Alpha)*log10(Alpha)*log10(Ks)+
    (-6.34078801)*log10(N -1)*log10(H0)*log10(Ks)+
    (-116.4256693)*log10(N -1)*log10(Ks)*Theta_s+
    (5.862236641)*log10(N -1)*log10(N -1)*log10(H0)+
    (-927.7227704)*log10(N -1)*log10(N -1)*Theta_r+
    (-91.42413112)*log10(N -1)*log10(H0)*Theta_r+
    (-147.3452681)*log10(H0)*Theta_r*Theta_s+
    (-9.970466611)*log10(N -1)*log10(Alpha)*log10(Ks)+
    (-78.89264829)*Theta_s+
    (-84.18734635)*log10(H0)*log10(Ks)*Theta_r+
    (1610.939649)*log10(N -1)*Theta_s*Theta_s+
    (-254.5866249)*log10(Ks)*Theta_s*Theta_s+
    (-1.825154718)*log10(Ks)*log10(Ks)*log10(Ks)+
    (-3.243282403)*log10(H0)*log10(Ks)*log10(Ks)+
    (9.07279062)*log10(Alpha)*log10(Ks)*log10(Ks)+
    (2836.132296)*log10(Ks)*Theta_r*Theta_s+
    (22.58195532)*log10(H0)*Theta_s*Theta_s+
    (-0.136723424)*log10(H0)*log10(H0)*log10(H0)+
    (0.57061601)*log10(H0)*log10(H0)*log10(Ks)+
    (5.776482466)*log10(H0)*log10(H0)*Theta_r+
    (109.6635976)*log10(Ks)*log10(Ks)*Theta_s+
    (-52.53313495)*log10(Alpha)*log10(Ks)*Theta_r+
    (-28.52700456)*log10(N -1)*log10(N -1)*log10(N -1)+
    (-83.08527121)*log10(Alpha)*log10(H0)*Theta_r+
    (66.42111608)*log10(Alpha)*log10(Alpha)*Theta_s+
    (266.2006972)*log10(Alpha)*Theta_s*Theta_s+
    (15.70230269)*log10(N -1)*log10(Ks)*log10(Ks)+
    (138.9506156)*log10(Alpha)*log10(Alpha)*Theta_r+
    (-0.457523123)*log10(N -1)*log10(H0)*log10(H0)+
    (569.8620214)*log10(N -1)*log10(Ks)*Theta_r+
    (-947.9253433)*log10(H0)*Theta_r*Theta_r+
    (-5609.400708)*log10(Alpha)*Theta_r*Theta_r+
    (-31.08133122)*log10(N -1)+
    (-438.0493588)*Theta_r+
    (-105674.8747)*Theta_r*Theta_r*Theta_r+
    (-7197.206984)*log10(Ks)*Theta_r*Theta_r+
    (25307.00856)*Theta_r*Theta_r*Theta_s+
    (-6.710298169)*log10(Ks)+
    (-228.2862275)*log10(Ks)*log10(Ks)*Theta_r+
    (-5093.647355)*log10(N -1)*Theta_r*Theta_s+
    (-673.2798219)*log10(N -1)*log10(Alpha)*Theta_r
  
  
  if (hf <= 1) {
    return(1)
  } else {
    return(hf)
  }
} # Function to calculate based on initial pressure head h0 (cm) and VGM parameters (Alpha, N, Ks, Theta_r, Theta_s)

# data vector to insert parameters
data <- c(
  Alpha=0.5,
  H0 = 100,
  N = 1.61,
  Ks = 1.58,
  Theta_r = 0.045,
  Theta_s = 0.58)


result <- do.call(GAhf, as.list(data))

result #wetting front pressure head calculated
