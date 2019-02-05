## Project Members
    * DJ
    * Mounica
    * Dexter

## Project proposal guidelines
For our ETL project we’re going to download datasets from NOAA and The University of Colorado’s sea ice index. We will separate the data into northern and southern hemispheres for the sea ice so that analysts can compare against the global max and global min tempreature of the combined land and sea temperatures. We will transform the date and group by year.

* Identify at least 2 data sources
    * 1st Source: Global temperatures (ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/v3/csv/)
        * 8 data sets from GHCN-Monthly Version 3 comprising of the following:
        4 avg datasets
        2 min datasets
        2 max datasets
    
        * Selection: For this source, we only used 1 min and 1 max dataset. 

        * transformation process/steps
        1. Read in the two csv files, adding a header row per the data spec.
        2. Select just the columns we needed which were the 12 monthly max / min temperature values in degrees Celsius as integer values
        3. Renamed the columns to denote the column month 1 for Jan .... 12 for December
        4. Selected the year as the index
        5. Un-pivoted the data so that the columns 1 per month are now represented as rows
        6. Convert the month value from string to integer
        7. Added a date column, constructing a datetime object using a lamda function selecting the Year and month columns
        8. Saved each transformed data as a csv file
        9. Collated both the datasets by Year into one dataset for tmax and tmin.
            a) dropped rows where the monthly TMAX or TMIN values == -9999 (as per the spec VALUE: monthly value (MISSING == -9999))
            b) transformed TMAX and TMIN values (divide by 100.0 to get whole degrees Celsius)
        10. Pushed single dataset into a mySQL database called global_temp_sea_ice_db with the table being global_temp


    * 2nd Source: Sea Ice (ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/)
        * transformation process/steps
        1. We found two csv data sources for sea ice area from the university of Colorado. One for the northern hemisphere and the other for the southern hemisphere. 
        2. After importing into a pandas data frame we noticed that the date was separated into three columns comprising of the year, month, and day. 
        3. In order to make this more compatible with typical date formats we used an inline function to convert the three separate columns to one “date_time” column. 
        4. We then used the “pd.to_datetime” function to convert the “date_time” column to the proper format for grouping.
        5. Both northern and southern data frames were merged.
        6. The desired columns were extracted from the merged data frame. 
        7. The “date_time” column was then grouped by year and the sea ice area columns were aggregated by the max value. 
        8. A connection the the MySQL server was then established.
        9. We used the pandas “.to_sql” function to upload the merged and sorted data frame to MySQL.

* Production Database
    * global_temp_sea_ice_comp_db
        * tables
            * sea_ice
            * global_temp