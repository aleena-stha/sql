
		--Excercise 2 
use Fewa_Boating_DB

--1)Find the names and ages of all sailors. 
 SELECT sailor_name,sailor_age FROM sailor;
 

--2)Find all sailors with a rating above 7.
	SELECT sailor_name FROM Sailor WHERE sailor_rating > 7;

--3)Find the names of customer who have sailed boat number 304.

select * from Boat
	SELECT customer_name
	FROM Customer C, Boating B, reserve R
	WHERE C.customer_id = B.Cus_id 
		AND B.Reserv_id = R.Reserve_id
		AND R.Boat_id = 304;
				--OR
	SELECT customer_name FROM Customer 
		WHERE customer_id IN (SELECT Cus_id FROM Boating 
								WHERE Reserv_id IN (SELECT Reserve_id FROM reserve WHERE Boat_id = 304));
				--OR
	SELECT customer_name FROM CUSTOMER C
		INNER JOIN Boating B ON C.customer_id = B.Cus_id
		INNER JOIN reserve R ON B.Reserv_id = R.Reserve_id
		WHERE Boat_id = 304;

--4)Find the sailors id of sailors who have reserved a red boat.
	SELECT R.sailor_id 
	FROM reserve R, Boat B
	WHERE R.Boat_id = B.boat_id 
		AND boat_color = 'RED'
		
		--OR
	
	SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='RED');

		--OR

	SELECT Sailor_id FROM reserve R
		INNER JOIN Boat B ON R.Boat_id = B.boat_id
			WHERE boat_color = 'RED';

--5)Find the names of sailors who have reserved a red boat.
	SELECT DISTINCT S.sailor_name
	FROM Sailor S, reserve R, Boat B
	WHERE R.Boat_id = B.boat_id 
		AND R.Sailor_id = S.sailor_id
		AND boat_color = 'RED'

		--OR
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='RED'));

		--OR

	SELECT S.sailor_name FROM Sailor S
		INNER JOIN reserve R ON S.sailor_id = R.Sailor_id
		INNER JOIN Boat B ON R.Boat_id = B.boat_id
			WHERE boat_color = 'RED';

--6)Find the names of sailors who have reserved at least one boat.
	SELECT DISTINCT sailor_name FROM Sailor S, reserve R
		WHERE S.sailor_id = R.Sailor_id;

		--OR
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve);

		--OR

	SELECT DISTINCT S.sailor_name FROM Sailor S
		INNER JOIN reserve R ON S.sailor_id = R.Sailor_id;

		SELECT  DISTINCT sailor.sailor_name FROM sailor INNER JOIN   reserve ON reserve.Sailor_id=Sailor.sailor_id

		
--7)Find the names of sailors who have reserved a red or a green boat.
	SELECT DISTINCT S.sailor_name
	FROM Sailor S, reserve R, Boat B
	WHERE R.Boat_id = B.boat_id 
		AND R.Sailor_id = S.sailor_id
		AND (boat_color = 'RED' OR boat_color = 'GREEN');

		--OR

	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='RED'))
	UNION
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='GREEN'));

--8)Find the names of sailors who have reserved both a red and a green boat.
	
	SELECT DISTINCT S.sailor_name
		FROM Sailor S, reserve R1, Boat B1, reserve R2, Boat B2
		WHERE S.sailor_id = R1.Sailor_id 
			AND R1.Boat_id = B1.boat_id
			AND S.sailor_id =  R2.Sailor_id 
			AND R2.Boat_id = B2.boat_id
			AND B1.boat_color='RED'
			AND B2.boat_color = 'GREEN';
--OR
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='RED'))
	INTERSECT
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='GREEN'));

--9)Find the sailors id of all sailors who have reserved red boats but not green boats.
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='RED'))
	EXCEPT
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve
		WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='GREEN'));

		SELECT DISTINCT Sailor.sailor_id FROM Sailor
INNER JOIN reserve ON Sailor.sailor_id = reserve.Sailor_id INNER JOIN Boat ON reserve.boat_id = Boat.boat_id
WHERE Boat.boat_color = 'red' AND Sailor.sailor_id NOT IN ( SELECT Sailor.sailor_id
    FROM Sailor  INNER JOIN reserve ON Sailor.sailor_id = reserve.Sailor_id
    INNER JOIN Boat ON reserve.Boat_id = Boat.boat_id WHERE Boat.boat_color = 'green');


--10)Find all sailors id of sailors who have a rating of 10 or have reserved boat 304.

	SELECT sailor_id FROM Sailor 
		WHERE sailor_rating = 10
	UNION
	SELECT S.sailor_id FROM Sailor S, reserve R
		WHERE S.sailor_id = R.Reserve_id
			AND R.Boat_id = 304

--11)Find the names of sailors who have not reserved a red boat.
	SELECT sailor_name FROM Sailor
		WHERE sailor_id NOT IN (SELECT sailor_id FROM reserve 
			WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color ='RED'));

			--OR
	SELECT S.sailor_name FROM Sailor S
		INNER JOIN reserve R ON S.sailor_id = R.Sailor_id
		INNER JOIN Boat B ON R.Boat_id = B.boat_id
			WHERE boat_color <> 'RED';

--12)Find the names of sailors who have reserved both a red and a green boat.
	--SEE QUERIES NUMBER 8.

--13)Find the names of sailors who have reserved all boats.
	SELECT S.sailor_name
		FROM Sailor S
		WHERE NOT EXISTS (( SELECT B.boat_id FROM Boat B )
		EXCEPT
		(SELECT DISTINCT R.Boat_id FROM reserve R WHERE R.Sailor_id = S.sailor_id ))


--14)Find the average age of all sailors.
	SELECT AVG(sailor_age) AS [Average sailor age] 	FROM Sailor

--15)Find the average age of sailors with a rating of 10.
	SELECT AVG(sailor_age) AS [Average sailor age with 10 rating] 	FROM Sailor where sailor_rating = 10;

--16)Find the name and age of the oldest sailor.
	SELECT S.sailor_name, S.sailor_age FROM Sailor S
	WHERE S.sailor_age = (SELECT MAX(sailor_age) FROM Sailor);

--17)Count the number of sailors.
	SELECT COUNT(Sailor_ID) AS "TOTAL NUMBER OF SAILOR"  FROM Sailor;

--18)Count the number of different sailor names.
	SELECT COUNT(DISTINCT sailor_name) AS "TOTAL NUMBER OF SAILOR"  FROM Sailor;

--19)Find the names of sailors who are older than the oldest sailor with a rating of 10.
	SELECT S.sailor_name
		FROM Sailor S
		WHERE S.sailor_age > ( SELECT MAX ( S2.sailor_age )
								FROM Sailor S2
								WHERE S2.sailor_rating = 10);

		--OR
	SELECT S.sailor_name
		FROM Sailor S
		WHERE S.sailor_age > ALL ( SELECT S2.sailor_age
									FROM Sailor S2
									WHERE S2.sailor_rating = 10 )


--20)For each red boat, find the number of reservations for this boat.
		SELECT B.boat_id, COUNT (*) AS sailorcount
		FROM Boat B, reserve R
		WHERE R.Boat_id = B.boat_id AND B.boat_color = 'RED'
		GROUP BY B.boat_id


--21)Find the average age of sailors for each rating level that has at least two sailors.
	SELECT S.sailor_rating, AVG (S.sailor_age) AS avgage, COUNT(S.sailor_id) AS [TOTAL SAILOR]
		FROM Sailor S
		GROUP BY S.sailor_rating		
		HAVING COUNT (*) >1
		ORDER BY COUNT(S.sailor_id)
	
--22)Find the name of a customer who have given more than 7 rating to the sailor.
	SELECT customer_name, cus_rating 
		FROM Customer C, Boating B 
		WHERE C.customer_id = B.Cus_id 
			  AND  cus_rating >7;


--23)Finds the name of a sailor who have sailed on red boat.
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve 
		WHERE Reserve_id IN (SELECT Reserv_id FROM Boating))


--24)Find the name of a sailor who have sailed ‘Sankhar Pun’.
	SELECT sailor_name FROM Sailor
		WHERE sailor_id IN (SELECT Sailor_id FROM reserve 
		WHERE Reserve_id IN (SELECT Reserv_id FROM Boating 
		WHERE Cus_id IN (SELECT  customer_id FROM Customer WHERE customer_name = 'Sankhar Pun')));

		
--25)Find the name of a  customer who have sailed on ‘red’ boat but not after ‘2021-06-11’.
	SELECT DISTINCT customer_name, customer_id FROM Customer
		WHERE customer_id IN (SELECT Cus_id FROM Boating WHERE boating_date > '2021-06-11'
								AND Reserv_id IN(SELECT Reserv_id FROM reserve 
									WHERE Boat_id IN (SELECT Boat_id FROM Boat WHERE boat_color = 'RED')))
