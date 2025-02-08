# Japan Visa Analysis Project

## Overview
This project analyzes and visualizes Japanese visa issuance data from 2006 to 2017. It processes raw CSV data using PySpark and creates interactive visualizations using Plotly.

## Project Structure
```
SparkCluster/
│
├── src/
│   └── jobs/
│       └── visualisation.py
│
├── input/
│   └── visa_number_in_japan.csv
│
├── output/
│   ├── visa_number_in_japan_continent_2006_2017.html
│   ├── visa_number_in_japan_by_country_2017.html
│   ├── visa_number_in_japan_year_map.html
│   └── visa_number_in_japan_cleaned.csv
│
├── uploadfiles.sh
├── downloadfiles.sh
├── .env
├── .env.example
└── .gitignore
```

## Prerequisites
- Python 3.x
- Apache Spark
- PySpark
- Required Python packages:
  ```bash
  pip install plotly pycountry pycountry-convert fuzzywuzzy python-Levenshtein
  ```

## Environment Setup
1. Update the environment variables in `.env`:
```bash
SSH_KEY=your_key.pem
REMOTE_USER=your_username
REMOTE_IP=your.ip.address
REMOTE_PATH=/path/on/remote
LOCAL_PATH=local/path
```

## Data Processing
The script performs the following operations:
1. Loads raw visa data from CSV
2. Cleans and standardizes country names
3. Maps countries to continents
4. Aggregates data for visualization
5. Generates three types of visualizations

## Visualizations
1. **Continent-wise Analysis** (`visa_number_in_japan_continent_2006_2017.html`)
   - Bar chart showing visa issuance by continent over time

2. **Top 10 Countries 2017** (`visa_number_in_japan_by_country_2017.html`)
   - Bar chart of top 10 countries with most visas issued in 2017

3. **Geographic Visualization** (`visa_number_in_japan_year_map.html`)
   - Interactive choropleth map showing yearly visa issuance by country

## Usage
### Local Execution
```bash
cd src/jobs
python visualisation.py
```

### Remote Execution
Upload files to remote server:
```bash
./uploadfiles.sh
```

Download results from remote server:
```bash
./downloadfiles.sh
```

## Output
The processed data and visualizations are saved in the `output/` directory:
- Interactive HTML visualizations
- Cleaned CSV data file

## Data Sources
- Input data: `visa_number_in_japan.csv`
- Data contains visa issuance information from 2006 to 2017

## Dependencies
- PySpark: Data processing
- Plotly: Interactive visualizations
- pycountry & pycountry_convert: Country name standardization
- fuzzywuzzy: String matching for country names

## Notes
- You will need a Azure Virtual Machine server to host the workers
- Country names are standardized using fuzzy matching
- Null values are handled appropriately
- Special cases for country naming are managed through a corrections dictionary