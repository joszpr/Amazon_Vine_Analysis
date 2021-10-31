# Amazon_Vine_Analysis

### Analysis Overview ###
This project is focused on analyzing Amazon reviews written by members of the Amazon Vine program. Data regarding reviews of Computers and Computers components will be processed
in order to find relevant statistics that could give insight about the usefulness of the Amazon Vine program and impacts we could gather with the available data. 

The data used is provided by Amazon1️⃣ with real reviews about their products. They provide data about different categories and the impact of the Amazon Vine review may vary by category, which must be taken into account. The review data from Amazon is considered Big Data. The file we used had more than 6 millions reviews and in order to process the amount of information we used different programs at various stages. First we used Amazon Web Services (AWS) in order to store the data and have it available for every member of the team to access it. We made the initial queries to the data using the SpySpark, which provides functionality to Python to Apache Spark. The initial analysis was done via Google Colaboratory in order to easier share the data between peers of the team, access the data from AWS and parse the data initially without using local computers resources. The final stage of the analysis was done using pgAdmin, after the data was converted to tables that could be further analyzed using SQL. 

![Data_Overview](https://user-images.githubusercontent.com/85839235/139564398-cdfefd48-594e-49e6-94dc-7467cae7c8fa.png)
###### Data Overview ######



### Results ###

**Statistic**
![Statistics](https://user-images.githubusercontent.com/85839235/139564061-23814d12-703e-4a8e-9fba-306d096976cd.png)

The over 6 millions reviews regarding Computer products were filtered for all reviews that contained 20 or more helpful votes. This was done in order to look at the data which is more likely to have an effect on customer engagement and also facilitate other analysis. 
  - The data contained more than 6 million reviews but only 79,135 reviews had 20 helpful votes or higher. It is reasonable to conclude most reviews do not provide much engagement from customers. 
  - From the reviews that had 20 or more helpful votes, there were 36,720 5-stars review, which represents a 46.40% of the total reviews which were considered helpful. 
 
 **Comparison between paid reviewers (Vine members) and non paid reviewers**
 ![Count Paid vs Unpaid Reviews](https://user-images.githubusercontent.com/85839235/139564121-01962b93-b20c-46a7-b2de-466b9c2d958a.png)
  - The amount of 5-stars reviews that received 20 or more helpful votes are overwhelmingly done by unpaid Amazon customers. Which is expected given the amount of customers Amazon has that review their products (35,937) and the number of reviewers that get paid to review products (783). 

![Avg Rating Paid vs Unpaid Reviews](https://user-images.githubusercontent.com/85839235/139564174-e0bd4a46-2326-4e29-bcfc-82b0fffd6b9e.png)
  - The average rate of 5-stars reviews that received 20 or more helpful votes is similar but slightly higher in favor to Vine members. The is a difference of 0.53 of a star between the average review between both. There could be a hint of positivity bias on the reviews of Amazon Vine members but is not clear with the data for Computers and Computers component. There is about half a star of difference in 5-stars reviews from Amazon Vine members, in itself is does not present sufficient evidence of bias. But the fact that percentage was calculated with a sizeable difference in sample size, 783 vs 35,937 suggest more analysis must be done in order to conclude there is or there isn't positivity bias from Amazon Vine Customers.  
 

### Future Analysis ###
While the statistics gathered show a glimpse into the behavior of the Vine program in comparison with unpaid reviewers, more analysis is suggested in order to better answer questions regarding the efficacy of the program. 
  - Perform the same analysis with data from different product categories and compare their trends. 
  - Compare the helpfulness sentiment from Amazon shoppers and amount of upvotes the paid reviews received in average compared to unpaid ones. Could provide insight regarding the possible impact paid reviews may have on a product compared to the unpaid ones. 
  - Compare numbers of reviews with 20 or more helpful votes with amount of reviews with comments, length of comments and if there were multimedia present in the reviews (videos or photos).
  - Compare the percentage of 5-stars reviews with the total reviews, without being filtered by 20 or more helpful votes. 

##### Links and Sources #####
1️⃣ https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_PC_v1_00.tsv.gz
