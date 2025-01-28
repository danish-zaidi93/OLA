create database ola;

select * from bookings;
-- Questions need to be solved 

-- 1. Retrieve all successful bookings:

select * from bookings
where Booking_Status = "Success";

--  2. Find the average ride distance for each vehicle type:

select vehicle_type, avg(ride_distance) as avg_ride
from bookings
group by Vehicle_Type;

--  3. Get the total number of cancelled rides by customers:

select count(canceled_rides_by_customer) as canceled_rides
from bookings;

--  4. List the top 5 customers who booked the highest number of rides:

select customer_id, count(booking_id) as total_ride
from bookings
group by customer_id
order by total_ride desc
limit 5;

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*)
from bookings 
where Canceled_Rides_by_Driver = "personal & car related issue";


--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select max(driver_ratings),
min(driver_ratings)
from bookings 
where Vehicle_Type = "prime sedan";

--  7. Retrieve all rides where payment was made using UPI:

select * from bookings 
where Payment_Method = "UPI";

-- 8. Find the average customer rating per vehicle type:

select vehicle_type, round(avg(customer_rating),3) as avg_cus_rating
from bookings
group by Vehicle_Type
order by avg_cus_rating desc;

--  9. Calculate the total booking value of rides completed successfully:

select sum(booking_value)
from bookings
where Booking_Status = "Success";

--  10. List all incomplete rides along with the reason

select * from bookings;

select incomplete_rides, Incomplete_rides_reason, count(Incomplete_rides_reason)
from bookings
where Incomplete_Rides = "Yes"
group by incomplete_rides, Incomplete_Rides_Reason;

select payment_method, count(customer_id)
from bookings
group by Payment_Method;

select sum(booking_value)
from bookings 
where payment_method = "UPI" or vehicle_type = "MINI";

