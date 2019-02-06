## Project Members
    * DJ
    * Mounica
    * Dexter

## Project proposal
For our ETL project we’re going to download datasets from NOAA and National Snow and Ice Data Center sea ice index. We will separate the data into northern and southern hemispheres for the sea ice so that analysts can compare against the global max and global min temperature of the combined land and sea temperatures. We will transform the date and group by year and push the transformed data sets into a MySQL database.

## Identify at least 2 data sources
We extracted global temperature data from NOAA and sea ice data from National Ice and Snow Data center. Total eight datasets were downloaded for global temperature but we only used two datasets being the minimum and maximum temperatures. Two datasets were downloaded for Northern hemisphere and Southern hemisphere sea ice. Sea ice data is the area of ice covered the sea in square kilometers (sq.km) and maximum and minimum temperatures are in degrees Celsius. Python library pandas was used to read csv files.

    * 1st Source: Global temperatures (ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/v3/csv/)]
        * Selection: For this source, we only used 1 min and 1 max dataset.
            ./Resources/noaa/ghcn/csv/ghcnm.tmax.v3.3.0.20170708.qca.dat.csv
            ./Resources/noaa/ghcn/csv/ghcnm.tmin.v3.3.0.20170708.qca.dat.csv

    * 2nd Source: Sea Ice (ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/)
        * Selection: For this source, we use the north and south daily datasets
            ./Resources/noaa/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv
            ./Resources/noaa/G02135/south/daily/data/S_seaice_extent_daily_v3.0.csv

    For the purpose of this submisson, the datasets were truncated to the first 500 rows so that the could be uploaded on github without hitting the large file limitation.

## Production Database
    We chose to use a relational database as the final datasets were in a tabular format
    Database name: global_temp_sea_ice_db
    Table names:
        * sea_ice
        * global_temp
    Use the global_temp_sea_ice_db.sql file to create the above db and tables.

## Transformation process/steps for Global_temp.ipynb
    1. Read in the two csv files, adding a header row per the data spec.
    2. Select just the columns we needed which were the 12 monthly max / min temperature values in degrees Celsius as integer values
    3. Renamed the columns to denote the column month 1 for Jan .... 12 for December
    4. Selected the year as the index
    5. Un-pivoted the data so that the columns 1 per month are now represented as rows
    6. Convert the month value from string to integer
    7. Added a date column, constructing a datetime object using a lambda function selecting the Year and month columns
    8. Saved each transformed data as a csv file
    9. Collated both the datasets by Year into one dataset for tmax and tmin.
        a) dropped rows where the monthly TMAX or TMIN values == -9999 (as per the spec VALUE: monthly value (MISSING == -9999))
        b) transformed TMAX and TMIN values (divide by 100.0 to get whole degrees Celsius)
    10. Pushed single dataset into a mySQL database called global_temp_sea_ice_db with the table being global_temp

## Transformation process/steps for sea_ice_extents.ipynb
    1. We found two csv data sources for sea ice area from the university of Colorado. One for the northern hemisphere and the other for the southern hemisphere. 
    2. After importing into a pandas data frame we noticed that the date was separated into three columns comprising of the year, month, and day. 
    3. In order to make this more compatible with typical date formats we used an inline function to convert the three separate columns to one “date_time” column. 
    4. We then used the “pd.to_datetime” function to convert the “date_time” column to the proper format for grouping.
    5. Both northern and southern data frames were merged.
    6. The desired columns were extracted from the merged data frame. 
    7. The “date_time” column was then grouped by year and the sea ice area columns were aggregated by the max value. 
    8. A connection the the MySQL server was then established.
    9. We used the pandas “.to_sql” function to upload the merged and sorted data frame to MySQL.

## Viewing Results in MySQL Workbench
    SELECT * FROM sea_ice;
    SELECT * FROM global_temp;

## Potential analysis to do on the newly formed dataset
    The new tables in our data base could be used to analyze if the total ice area in the northern and southern arctic regions are correlated to global land and sea temperatures.

## Challenges we overcame
    1. Taking fragmented date data and combining individual columns into a typical date format using the datetime python module.
    2. The transformed gobal temp tmax and tmin datasets were so large that we encountered a MemoryError exception while doing a pd.merge.  We overcame this by saving the output to a csv.  I also had do use del(<varaible_name>) during the analysis to free up memory.