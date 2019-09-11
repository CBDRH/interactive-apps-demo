## Disseminating Research in the 21st Century
## Mark Hanly
## m.hanly@unsw.edu.au

## This file contains data preperation steps for the mapping and timeseries data used in the app.
## The interim files created by this code are not included in the app, but the code is made 
## available in case anybody wants to reproduce the analysis


## 1. Read and prepare mapping data

sla = "https://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1259030002_sla06aaust_shape.zip&1259.0.30.002&Data%20Cubes&18E90A962EFD4D7ECA25795D00244F5A&0&2006&06.12.2011&Previous"


# Download
download.file(sla, destfile = "data/sla.zip", mode="wb")

# Unzip
unzip("data/sla.zip", exdir="data")

# Load NSW shapefile data
nsw_sla <- readOGR(dsn = "data", layer = "SLA06aAUST") 
# Convert to GeoJSON
nsw_sla_json <- geojson_json(nsw_sla)
# Simplify the polygons to reduce the size
nsw_sla_sim <- ms_simplify(nsw_sla_json)
# Write GeoJSON file out to a file system
geojson_write(nsw_sla_sim, file = "nsw_sla.geojson")

# Read sla data
sla.dat <- geojsonio::geojson_read("nsw_sla.geojson", what = "sp") 

# Read delay data
sla.delay <- read_excel("data/20190312_sla2006_percent_delay.xls") %>%
  mutate(category_delay_num = 5-category_delay_num)

# Merge with AIHW data
map.dat <- merge(sla.dat, sla.delay, by = "SLA_CODE06", sll.x=FALSE)

# save as binary 
qmap <- tempfile() 
save(map.dat, ascii=FALSE, file="data/qmap") 



## 2. Load timeseries data from ABS
wpi <- read_abs("6345.0") %>%
  mutate(date2 = as.Date(unlist(date), origin = "1970-01-01"))

saveRDS(wpi, file = "data/wpi.rds")


