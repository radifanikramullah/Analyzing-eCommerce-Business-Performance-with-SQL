# Analyzing-eCommerce-Business-Performance-with-SQL

## Project Overview
Measuring business performance is really important for company, measuring business performance can tell you wether you success or not with your business plan. In this project, i will analyze business performance using SQL, to measure business metrics, such as customers growth, product quality, and payment methods type.

Tha data will be used today is provided by [Rakamin Academy](https://rakamin.com/), tha data contains information about eCommerce from Brazil, in 2016-2018. 

<img src ="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">

Dataset [Here](https://drive.google.com/file/d/1Uowt8AgNIjPR1cTDjsmsez_iXWNJj51a/view?usp=sharing)

## Data Preparation
Before processing the data, we have to prepare the RAW data, there 8 dataset that related to each others, so the preparation steps taken are as follows:
 - Create new database in PostgreSQL
 - create the table consist columns that similar with the raw dataset
 - set primery key and foreign key
 - import csv file to the tables
 - Create Entity Relationship Diagram (ERD), and export as an image

![ERD](https://user-images.githubusercontent.com/94909135/187103923-b9aaf85d-19bb-41d9-b1bb-b415a1b22571.jpg)
<br>Figure 1. Entity Relationship Diagram (ERD)

## Annual Customer Activity Growth Analysis
![Customer Activity Growth](https://user-images.githubusercontent.com/94909135/187104054-3660708e-0795-4520-8bb1-9a3f8b1a8b5e.jpg)
<br>Figure 2. Customer Activity Growth
<br>*mau = Monthly Active Users

![unnamed (1)](https://user-images.githubusercontent.com/94909135/187104694-950573b7-99b8-4ec8-ad5c-46faf6e79565.png)
<br>Figure 3. Monthly Active Users and New Customers

![unnamed](https://user-images.githubusercontent.com/94909135/187104447-894f3c20-c459-498c-a5a2-cd5c8dd3cfec.png)
<br>Figure 4. Customer Growth and Repeat Order Relation

- Overall, there is an increase every year from average monthly active users and new customers, but for repeat order and average frequency order is decreasing.
- There is no correlation between average active users and repeat order, increasing active users doesn’t correlate with customers who repeat their orders
- it means there is another reason why customers don't repeat order in our market place

## Annual Product Category Quality Analysis
![Screenshot 2022-08-27 113810](https://user-images.githubusercontent.com/94909135/187105022-6ed97cd6-3dc5-4297-afe2-4ea10a5f3251.jpg)
<br>Figure 5. Annual Revenue and Product Category Quality Analysis

![unnamed (2)](https://user-images.githubusercontent.com/94909135/187105139-407ccada-94e3-4b0f-bffe-b90eb68f5cff.png)
<br>Figure 6. Annual Revenue

![429-4298550_home-decor-accessories-png](https://user-images.githubusercontent.com/94909135/187107357-82693e01-51b7-41e9-adb0-85323294ae29.png)![png-transparent-leisure-camping-tourism-leisure-miscellaneous-university-sports-equipment-thumbnail-removebg-preview](https://user-images.githubusercontent.com/94909135/187107493-9384642f-ef3d-420a-878f-b3194c1d7739.png)![ingredients-of-cosmetics-beauty-parlour-png-favpng-LbTaax4xQvKLJEGg5vdvpRak0_t-removebg-preview](https://user-images.githubusercontent.com/94909135/187107498-1fd78f18-eb3f-43cd-9a21-c768c85f9b8f.png)
<br>Figure 7. Annual Top Product Category

![33754-7-toy-transparent-background-thumb](https://user-images.githubusercontent.com/94909135/187107553-683cda67-c1ae-4880-876d-9546b4c43b17.png)
![ingredients-of-cosmetics-beauty-parlour-png-favpng-LbTaax4xQvKLJEGg5vdvpRak0_t-removebg-preview](https://user-images.githubusercontent.com/94909135/187107542-efc53d18-53bb-4f6b-8fd2-62b384a7bf2c.png)





