--- 1 Define Data Transformation in ETL and explain why it is important.
​ The process of converting data from its source format into a format that is compatible with the target system or data warehouse.
​Importance: It ensures data consistency, removes errors, and organizes information so it is fit for analysis and decision-making.
​
-- 2: List any four common activities involved in Data Cleaning.
​Handling Missing Values: Using techniques like imputation.
​Removing Duplicates: Identifying and deleting redundant records.
​Standardization: Converting formats (like currencies or dates) into a uniform unit.
​Syntactic Validation: Checking if values follow the expected format (e.g., valid email addresses).

-- 3 What is the difference between Normalization and Standardization?
​Normalization: Scaling features to a specific range, usually [0, 1]. It is sensitive to outliers.
​Standardization: Scaling data to have a mean of 0 and a standard deviation of 1 (Z-score). It is more robust when outliers exist.
​
-- 4: Suggest two techniques to handle missing values in the "Age" column.
​Imputation: Replacing missing values with the mean, median, or mode of the column.
​Deletion: Removing rows with missing "Age" values if the dataset is large enough and 
the missing data is minimal.

--5 Convert the following inconsistent “Gender” entries into a standardized format (“Male”, “Female”)

SELECT 
    Gender_Raw,
    CASE 
        WHEN LOWER(Gender_Raw) IN ('m', 'male') THEN 'Male'
        WHEN LOWER(Gender_Raw) IN ('f', 'female') THEN 'Female'
        ELSE 'Other/Unknown'
    END AS Standardized_Gender
FROM Employees

--6 What is One-Hot Encoding? Give an example with the categories: "Red, Blue, Green".
​Definition: A technique to convert categorical variables into a binary matrix so they can be provided to machine learning algorithms.

-- 7: Explain the difference between Data Integration and Data Mapping in ETL.
​Data Mapping: The process of defining how individual source fields connect to target fields (e.g., Cust_ID → CustomerID).
​Data Integration: The broader process of combining data 
from different sources into a single, unified view.

--8  Explain why Z-score Standardization is preferred over Min-Max Scaling when outliers exist
Min-Max scaling squashes all normal data into a tiny range if an extreme outlier exists.

