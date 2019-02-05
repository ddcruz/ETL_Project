## Project Members
    * DJ
    * Mounica
    * Dexter

## Project proposal guidelines
For our ETL project we’re going to download datasets from NOAA and The University of Colorado’s sea ice index. We will separate the data into northern and southern hemispheres to compare the land / sea temperature and the rate of ice melt. We will transform the date and group by month and look at the data over a 10-20 year time period.

* Identify at least 2 data sources
    * 1st Source: Global temperatures (ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/v3/csv/)
        * 8 data sets from GHCN-Monthly Version 3 (ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/v3/)
        4 avg datasets
        2 min datasets
        2 max datasets
    
        * Selection: For this source, we only used 1 min and 1 max dataset. 

        * Determine transformation process/steps
        1. Read in the csv file, adding a header row per the data spec.
        2. Select just the columns we needed which were the 12 monthly max / min temperature values in degrees Celsius
        3. Renamed the columns to denote the column month 1 for Jan .... 12 for December
        4. Selected the year as the index
        5. Unpivot the data so that the columns 1 per month are now represented as rows
        6. Convert the month value from string to integer
        7. Added a date column, contructing a datetime object using a lamda function selecting the Year and month columns
        8. Saved each transformed data as a csv file
        9. Collated both the datasets by Year into one dataset for tmax and tmin.
            a) dropped where the monthly TMAX or TMIN values == -9999 (as per the spec VALUE: monthly value (MISSING=-9999))
            b) transformed TMAX and TMIN values (divide by 100.0 to get whole degrees Celsius)
        10. Pushed single dataset into a mySQL database called global_temp_sea_ice_db with the table being global_temp


    * 2nd Source: Sea Ice (ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/)


* Identify a data destination 
    mySQL database
    