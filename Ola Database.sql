Create Database Ola;
Use Ola;
#1. Retrives all successful bookings:
Create View Successful_Bookings As
SELECT* FROM bookings
WHERE Booking_Status= 'Success';
# Retrives all successful bookings:
Select * From Successful_Bookings;

#2.Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distence FROM bookings
GROUP BY Vehicle_Type;
#2.Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;

#3.get the total number ofcanceled rides by customers:
Create View canceled_rides_by_customers as
SELECT COUNT(*) FROM  bookings
WHERE Booking_Status ='Canceled by Customer';
#3.get the total number ofcanceled rides by customers:
Select * from canceled_rides_by_customers;

#4. list the top 5 customers who booked the highest number of rides:
Create View top_5_Customers As
SELECT Customer_ID,COUNT(Booking_ID)as total_rides
From bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
#4. list the top 5 customers who booked the highest number of rides:
SELECT * FROM top_5_Customers;

#5. Get the number of rides canceled by drivers due to personal and car-related issues.
Create View Rides_canceled_by_drivers_P_C_Issues As
SELECT COUNT( * )FROM bookings
WHERE Canceled_Rides_by_Driver= "Personal & Car related issue";
SELECT * FROM Rides_canceled_by_drivers_P_C_Issues;

#6.FIND THE MAXIMUM AND MINIMUM DRIVER RATIMG FOR PRIME SEDAN BOOKING:
SELECT MAX(Driver_Ratings)as max_rating,
MIN(Driver_Ratings)as min_rating
FROM bookings WHERE Vehicle_type='Prime sadan';

#7.retrieve all rides where payment was made using UPI:
Create View UPI_Payment as
SELECT * FROM bookings
WHERE Payment_Method='UPI';

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating as
SELECT Vehicle_type ,AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_type;

#9.calculate the total booking value of rides completed successfully:
Create View total_successful_Ride_value as
SELECT SUM(Booking_Value)as total_successful_Ride_value
FROM BOOKINGS
WHERE Booking_Status="Success";

#10.List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason
FROM BOOKINGS
WHERE Incomplete_Rides= 'Yes';