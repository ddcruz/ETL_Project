## Project Members
    * DJ
    * Mounica
    * Dexter

## Project proposal guidelines
For our ETL project we’re going to download datasets from NOAA (https://www.ncdc.noaa.gov/data-access/marineocean-data) and The University of Colorado’s (https://nsidc.org/data/seaice_index/archives) sea ice index. We will separate the data into northern and southern hemispheres to compare the air / sea temperature and the rate of ice melt. We will transform the date and group by month and look at the data over a 10-20 year time period.

Global temperatures (https://data.giss.nasa.gov/gistemp/)
Northern Hemisphere-mean monthly, seasonal, and annual means, 1880-present, updated through most recent month
https://data.giss.nasa.gov/gistemp/tabledata_v3/NH.Ts+dSST.csv

Southern Hemisphere-mean monthly, seasonal, and annual means, 1880-present, updated through most recent month
https://data.giss.nasa.gov/gistemp/tabledata_v3/SH.Ts+dSST.csv

* Identify at least 2 data sources
    * 8 data sets from GHCN-Monthly Version 3 (ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/v3/)
        4 avg datasets
        2 min datasets
        2 max datasets
    * 13 data sets from (ftp://ftp.ncdc.noaa.gov/pub/data/noaaglobaltemp/operational/timeseries/)
        Monthly data of merged land and ocean filename mask (aravg.<mon>.<land_ocean>.<la1><lat2><version><yyyymm>)
        1st column = year
        2nd column = month
        3rd column = anomaly of temperature (K)
        4th column = total error variance (K**2)
        5th column = high-frequency error variance (K**2)
        6th column = low-frequency error variance (K**2)
        7th column = bias error variance (K**2)
        8th column = diagnostic variable
        9th column = diagnostic variable
        10th column= diagnostic variable    

Sea Ice (ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/)

* Determine transformation process/steps

* Identify a data destination 
    mySQL database
    