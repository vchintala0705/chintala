install.packages("stargazer")
install.packages("corrplot")
# Load necessary libraries
library(tidyverse)
library(caret)
library(stargazer)
library(zoo)
library(corrplot)
# Load the dataset
stock_data <- read_csv("D:/dataimp/n5/NJ1/project/project/GOOGL.csv")

# View the first few rows of the data
head(stock_data)
# Check for missing values
sum(is.na(stock_data))

# Check data types
str(stock_data)
# Remove rows with missing values
stock_data <- na.omit(stock_data)
# Convert Date column to Date format
stock_data$Date <- as.Date(stock_data$Date, format="%m/%d/%Y")
# Plotting the closing prices
ggplot(stock_data, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +
  labs(title = "Google Stock Prices", x = "Date", y = "Closing Price")
# Plotting Close vs High and Close vs Low in one plot
ggplot(stock_data, aes(x = Date)) +
  geom_line(aes(y = Close, color = "Close")) +
  geom_line(aes(y = High, color = "High")) +
  geom_line(aes(y = Low, color = "Low")) +
  labs(title = "Close vs High and Low", x = "Date", y = "Price") +
  scale_color_manual(values = c("Close" = "blue", "High" = "red", "Low" = "green")) +
  theme_minimal()
# Create a 20-day moving average
stock_data <- stock_data %>%
  mutate(Moving_Avg = rollmean(Close, k = 20, fill = NA))

# Remove rows with NA values in Moving_Avg
stock_data <- na.omit(stock_data)

# View the modified data
head(stock_data)
# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets
trainIndex <- createDataPartition(stock_data$Close, p = .8, 
                                  list = FALSE, 
                                  times = 1)
train_data <- stock_data[trainIndex, ]
test_data <- stock_data[-trainIndex, ]
# Train the model using linear regression
model <- train(Close ~ Open + High + Low + Volume + Moving_Avg, 
               data = train_data, 
               method = "lm")

# Print model summary
summary(model)
# Make predictions on the test set
predictions <- predict(model, test_data)

# Evaluate the model performance
performance <- postResample(pred = predictions, obs = test_data$Close)
performance
# Generate regression analysis table
stargazer(model$finalModel, type = "text")


# Visualize correlations between variables
correlation_matrix <- cor(stock_data[, c("Open", "High", "Low", "Close", "Volume", "Moving_Avg")])
corrplot::corrplot(correlation_matrix, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)

# Pairwise scatterplot of selected variables
pairs(stock_data[, c("Open", "High", "Low", "Close", "Volume", "Moving_Avg")])

# Scatterplot with regression line between Closing Price and Moving Average
ggplot(stock_data, aes(x = Moving_Avg, y = Close)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot of Closing Price vs Moving Average", x = "Moving Average", y = "Closing Price")


