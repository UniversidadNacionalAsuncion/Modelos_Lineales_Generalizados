
# =====================
# Convierte el dataset 'cars' de la librería base de R a unidades SI
# Genera un archivo mbay_ruguata.R listo para cargar
# Máxima precisión (6 decimales)

# Cargar dataset directamente desde la librería
cars <- datasets::cars   # no hace falta tener cars.R

# Constantes de conversión
mph_to_ms <- 0.44704  # 1 mph -> m/s
ft_to_m   <- 0.3048   # 1 ft -> m

# Conversión precisa
mbay_ruguata <- cars
mbay_ruguata$speed_ms <- round(cars$speed * mph_to_ms, 6)
mbay_ruguata$dist_m   <- round(cars$dist   * ft_to_m,   6)

# Guardar como archivo R que define el data.frame
r_file <- "mbay_ruguata.R"
con <- file(r_file, "w")

cat("mbay_ruguata <- data.frame(\n", file = con)

cat("  speed_ms = c(", paste(mbay_ruguata$speed_ms, collapse = ", "), "),\n", file = con)
cat("  dist_m   = c(", paste(mbay_ruguata$dist_m, collapse = ", "), ")\n", file = con)
cat(")\n", file = con)
close(con)

cat("✅ Archivo mbay_ruguata.R generado con éxito.\n")
cat("Ahora podés usar: source('mbay_ruguata.R') para cargar el dataset en R.\n")

