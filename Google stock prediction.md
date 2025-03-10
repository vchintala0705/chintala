# Prediction of Google Stock Prices

## Author: Vaishnavi Chintala  
## Date: June 26, 2024  

---

## **Introduction**
Stock market prediction is a crucial task for investors, financial analysts, and researchers. This project aims to **predict Google (GOOGL) stock prices** using **historical stock market data** and **statistical modeling techniques**. By leveraging regression analysis, we seek to identify key factors that influence stock price movements and build a predictive model that helps forecast future trends.

---

## **Objective**
This project is designed to:
- Analyze **historical stock data** for Google Inc.
- Identify **key factors** affecting stock price movement.
- Build a **predictive model** using **linear regression**.
- Evaluate model performance using **metrics like RMSE, R-squared, and MAE**.

---

## **Dataset Information**
- **Source:** Yahoo Finance & Kaggle
- **Timeframe:** August 19, 2004 – Present
- **Key Features:**
  - `Date`: The trading date
  - `Open`: Opening stock price
  - `High`: Highest stock price of the day
  - `Low`: Lowest stock price of the day
  - `Close`: Closing stock price
  - `Adj Close`: Adjusted closing price
  - `Volume`: Total number of shares traded
  
---

## **Methodology**
1. **Data Preprocessing**
   - Load dataset and handle missing values.
   - Convert date format and create time-series plots.
   - Compute **20-day moving average** for trend analysis.

2. **Feature Engineering**
   - Identify correlations between stock price variables.
   - Perform regression analysis to determine significant predictors.

3. **Model Development**
   - Train a **linear regression model**:
     ```r
     model <- train(Close ~ Open + High + Low + Volume + Moving_Avg, 
                    data = train_data, method = "lm")
     ```
   - Train on **80%** of the dataset and test on **20%** unseen data.

4. **Model Evaluation**
   - Calculate performance metrics:
     - **Root Mean Squared Error (RMSE)**
     - **R-squared (R²)**
     - **Mean Absolute Error (MAE)**
   - Compare predicted vs. actual stock prices.

---

## **Results**
- **Significant predictors**: `Open`, `High`, `Low`, and `Moving_Avg`
- **Model Performance**:
  - R-squared = **0.9999** (high accuracy)
  - RMSE = **5.47** (small error margin)
  - MAE = **3.02** (low absolute error)

---

## **Data Visualization**
- **Stock Price Trends**: Line plots of Open, High, Low, and Close prices.
- **Moving Average Effect**: Scatter plots showing impact of the 20-day moving average on stock prices.
- **Correlation Analysis**: Heatmaps of feature relationships.

---

## **How to Use**
1. **Run the R Script**  
   ```r
   source("R_pro.R")
   ```
2. **Open R Markdown (`rmd.Rmd`)**
   - View analysis, model-building steps, and plots.

3. **Dataset Exploration**  
   ```r
   stock_data <- read_excel("GOOGL.xlsx")
   head(stock_data)
   ```

4. **Train the Model**  
   ```r
   model <- train(Close ~ Open + High + Low + Volume + Moving_Avg, 
                  data = train_data, method = "lm")
   ```

---

## **Future Improvements**
- Implement **machine learning models** (Random Forest, LSTMs) for better accuracy.
- Test the model with **real-time stock market data**.
- Expand analysis to **other tech stocks (AAPL, MSFT, AMZN, etc.)**.

---

## **Technology Stack**
- **Programming Language:** R
- **Libraries Used:**
  - `tidyverse` – Data manipulation
  - `caret` – Machine learning modeling
  - `ggplot2` – Data visualization
  - `corrplot` – Correlation analysis
  - `zoo` – Moving average computation

---

## **License**
This project is open-source. Feel free to use, modify, and contribute!

**Author:** Vaishnavi Chintala  
 **Date:** June 26, 2024  
 **GitHub Repository:** (https://github.com/vchintala0705/chintala)  

