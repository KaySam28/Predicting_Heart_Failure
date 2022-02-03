--Going through all columns in the table
Select *
from heart$

--Age range and sex of people with heart disease
Select Age,
		Sex,
		HeartDisease
From heart$
Where HeartDisease = 1
Group by Age,Sex,HeartDisease
order by Age DESC

--All columns with patients without heart disease
Select *
From heart$
where HeartDisease = 0
order by Age DESC


--Percentage of both gender with heart disease having serum cholesterol greater than 20
Select	Heartdisease,
		(Count(HeartDisease) * 100/ (Select Count (*) From heart$)) as Percentage_HeartDisease
From heart$
where HeartDisease =1
		or HeartDisease = 0
Group by HeartDisease

--- percentage chest pain types with heart disease
SELECT   ChestPainType,
		(Count(ChestPainType)* 100 / (SELECT Count(*) FROM heart$))  Percentage_ChestPainType
FROM heart$
WHERE HeartDisease = 1
GROUP BY ChestPainType

--Understanding Patients below the age 40 with a  heart disease
SELECT *
FROM heart$
WHERE HeartDisease = 1
	AND Age < 40
ORDER BY Age DESC


--Average Age of people below 40 with a heart disease
SELECT AVG(AGE)
FROM heart$
WHERE HeartDisease = 1
	AND Age < 40
--Group by Age
--ORDER BY Age DESC


--Comparing males to females related to heart issues
SELECT 
	COUNT(Sex) AS count_sex
FROM heart$
WHERE Sex = 'M'
	AND HeartDisease = 1


--Comparing males to females related to heart issues
SELECT 
	COUNT(Sex) AS count_sex
FROM heart$
WHERE Sex = 'F'
	AND HeartDisease = 1


--- Persons  with diabetes, Typical Angina and cholesterol level greater than 240 that also have heart disease
SELECT *
FROM heart$
WHERE HeartDisease = 1
	AND ChestPainType Like 'T%'
	AND FastingBS = 1
	AND Cholesterol > 240

--Patients with heart disease that also have diabetes,Blood Pressure above 130, serum cholesterol above 240 and experiences pain during excercising 
SELECT *
FROM heart$
WHERE HeartDisease = 1
	AND RestingBP > 130
	AND cholesterol > 240
	AND ExerciseAngina = 'Y'


--- Patients with heart disease that also have diabetes, BP above 130, serum cholesterol above 240 and experiences pain during exercise
SELECT *
FROM heart$
WHERE HeartDisease = 1
	AND RestingBP > 130
	AND cholesterol > 240
	AND FastingBS = 1 
	AND ExerciseAngina = 'Y'

--- Chest pain types when patients have blood pressure greater than 130, cholesterol greater than 240 and heart disease
SELECT
CASE 
	WHEN ChestPainType = 'ASY' THEN 'RED'
	WHEN ChestPainType = 'TA' THEN 'B'
	WHEN ChestPainType = 'ATA' THEN 'C'
	ELSE 'D'
	END AS ChestPainGroup
FROM heart$
WHERE HeartDisease = 1
	 AND RestingBP > 130
	 AND cholesterol > 240


--- A union select statements to get chest pain types
SELECT
CASE 
	WHEN ChestPainType = 'ASY' THEN 'RED'
	WHEN ChestPainType = 'TA' THEN 'B'
	WHEN ChestPainType = 'ATA' THEN 'C'
	ELSE 'D'
	END AS ChestPainGroup
FROM heart$
WHERE HeartDisease = 1
	 AND RestingBP > 130
	 AND cholesterol > 240
	 UNION
SELECT ChestPainType
FROM heart$
WHERE HeartDisease = 1
	 AND RestingBP > 130
	 AND cholesterol > 240


--- Total number of heart disease patient with ASY  
SELECT 
	COUNT(ChestPainType) AS cCunt_ASY
FROM heart$
WHERE ChestPainType = 'ASY'
	AND HeartDisease = 1


	--Total number of patients with heart disease and TA
SELECT 
	COUNT(ChestPainType) AS Count_TA
FROM heart$
WHERE ChestPainType = 'TA'
	AND HeartDisease = 1


--- Total number of heart disease patient with ATA
SELECT 
	COUNT(ChestPainType) AS Count_ATA
FROM heart$
WHERE ChestPainType = 'ATA'
	AND HeartDisease = 1


--- Total number of heart disease patient with NAP
SELECT 
	COUNT(ChestPainType) AS count_NAP
FROM heart$
WHERE ChestPainType = 'NAP'
	AND HeartDisease = 1


--- Maximum age of patients with heart disease and above the age of 30
SELECT
	MAX(Age) AS max_age,
	Sex,
	HeartDisease
FROM heart$
WHERE HeartDisease = 1
	AND Age > 30
GROUP BY Sex, HeartDisease
HAVING MAX(Age) > 0
ORDER BY MAX(Age)


--- TOP ten patients with heart disease and age above 30
SELECT TOP (10)
	Age,
	Sex,
	HeartDisease
FROM heart$
WHERE HeartDisease = 1
	AND Age > 30
GROUP BY Age, Sex, HeartDisease
ORDER BY Age DESC


----- Number of patients with heart disesae between age 20 and 80
SELECT
	Age,
	Sex,
	HeartDisease,
	COUNT(HeartDisease) AS count_HeartDisease
FROM heart$
WHERE HeartDisease = 1
	AND Age BETWEEN 20 AND 80
GROUP BY Age, Sex, HeartDisease
HAVING COUNT(HeartDisease) > 0
ORDER BY count_HeartDisease DESC


--- maximum and minimum cholesterol for each gender whith and whithout heart disease
SELECT
	Sex,
	HeartDisease,
	MAX(Cholesterol) AS max_cholesterol,
	MIN(cholesterol) AS min_cholesterol
FROM heart$
GROUP BY Sex, HeartDisease


--- percentage of both gender
SELECT   Sex, 
		(Count(Sex)* 100 / (SELECT Count(*) FROM heart$)) as MyPercentage
FROM heart$
GROUP BY Sex

--- Percentage of both gender with heart disease
SELECT	Sex, 
		(Count(Sex)* 100 / (SELECT Count(*) FROM heart$)) as Percentage_HeartDisease
FROM heart$
WHERE HeartDisease = 1
GROUP BY Sex


----- percentage of both gender without heart disease
SELECT   Sex, 
		(Count(Sex)* 100 / (SELECT Count(*) FROM heart$)) as Percentage_HeartDisease
FROM heart$
WHERE HeartDisease = 0
GROUP BY Sex


--- percentage of both gender with heart disease having serum cholesterol greater than 240
SELECT  Sex,
		(Count(Sex)* 100 / (SELECT Count(*) FROM heart$)) as Percentage_HeartDisease
FROM heart$
WHERE HeartDisease = 1
	AND Cholesterol > 240
GROUP BY Sex