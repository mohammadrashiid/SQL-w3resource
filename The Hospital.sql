use W3Resource
--1. From the following table, write a SQL query to find those nurses who are yet to be registered. Return all the fields of nurse table.
select *
from Hospital.Nurse
where registered = 'false'

--2. From the following table, write a SQL query to find the nurse who is the head of their department. Return Nurse Name as "name", Position as "Position". 
select [Nurse Name] = name, Position = position
from Hospital.Nurse
where position = 'Head Nurse'

--3. From the following tables, write a SQL query to find those physicians who are the head of the department. Return Department name as "Department" and Physician name as "Physician".
select [Department] = d.name, [Physician] = p.name
from Hospital.Physician p, Hospital.Department d
where d.head = p.employeeid

--4. From the following table, write a SQL query to count the number of patients who booked an appointment with at least one Physician. Return count as "Number of patients taken at least one appointment".
select COUNT(distinct patient) as  [Number of patients taken at least one appointment]
from Hospital.Appointment

--5. From the following table, write a SQL query to find the floor and block where the room number 212 belongs. Return block floor as "Floor" and block code as "Block". 
select Floor = blockfloor, Block = blockcode 
from Hospital.Room
where roomnumber = 212

--6. From the following table, write a SQL query to count the number available rooms. Return count as "Number of available rooms".  
select [Number of available rooms] = COUNT(*)
from Hospital.Room
where unavailable = 'false'

--7. From the following table, write a SQL query to count the number of unavailable rooms. Return count as "Number of unavailable rooms". 
select [Number of unavailable rooms] = COUNT(*)
from Hospital.Room
where unavailable = 'true'

--8. From the following tables, write a SQL query to find the physician and the departments they are affiliated with. Return Physician name as "Physician", and department name as "Department". 
select Physician = p.name, Department = d.name
from Hospital.Physician p, Hospital.Department d, Hospital.Affiliated_With a
where p.employeeid = a.physician and a.department = d.departmentid

--9. From the following tables, write a SQL query to find those physicians who have trained for special treatment. Return Physician name as "Physician", treatment procedure name as "Treatment". 
select Physician = p.name, Treatment = pr.name
from Hospital.Physician p, Hospital.Procedures pr, Hospital.Trained_in t
where p.employeeid = t.physician and t.treatment = pr.code

--10. From the following tables, write a SQL query to find those physicians who are yet to be affiliated. Return Physician name as "Physician", Position, and department as "Department".
select Physician = p.name, position, Department = d.name
from Hospital.Physician p, Hospital.Department d, Hospital.Affiliated_With a
where p.employeeid = a.physician and a.department = d.departmentid
and a.primaryaffiliation = 'false'

--11. From the following tables, write a SQL query to find those physicians who are not a specialized physician. Return Physician name as "Physician", position as "Designation". 
select Physician = name, Designation = position
from Hospital.Physician p left join Hospital.Trained_in t on t.physician = p.employeeid
where t.treatment is null

--12. From the following tables, write a SQL query to find the patients with their physicians by whom they got their preliminary treatment. Return Patient name as "Patient", address as "Address" and Physician name as "Physician". 
select Patient = pa.name, Address = pa.address, Physician = p.name
from Hospital.Patient pa, Hospital.Physician p
where pa.pcp = p.employeeid

--13. From the following tables, write a SQL query to find the patients and the number of physicians they have taken appointment. Return Patient name as "Patient", number of Physicians as "Appointment for No. of Physicians". 
select Patient = pa.name, [Appointment for No. of Physicians] = COUNT(ap.physician)
from Hospital.Patient pa, Hospital.Appointment ap
where ap.patient = pa.ssn
group by pa.name

--14. From the following table, write a SQL query to count number of unique patients who got an appointment for examination room ‘C’. Return unique patients as “No. of patients got appointment for room C”.
select [No. of patients got appointment for room C] = COUNT(distinct patient)
from Hospital.Appointment
where examinationroom = 'C'

--15. From the following tables, write a SQL query to find the name of the patients and the number of the room where they have to go for their treatment. Return patient name as “Patient”, examination room as "Room No.”, and starting date time as Date "Date and Time of appointment".
select Patient = pa.name, [Room No] = ap.examinationroom, [Date and Time of appointment] = ap.start_dt_time
from Hospital.Patient pa, Hospital.Appointment ap
where ap.patient = pa.ssn

--16. From the following tables, write a SQL query to find the name of the nurses and the room scheduled, where they will assist the physicians. Return Nurse Name as “Name of the Nurse” and examination room as “Room No.”. 
select [Name of the Nurse] = n.name, [Room No] = ap.examinationroom
from Hospital.Nurse n, Hospital.Appointment ap
where ap.prepnurse = n.employeeid

--17. From the following tables, write a SQL query to find those patients who taken the appointment on the 25th of April at 10 am. Return Name of the patient, Name of the Nurse assisting the physician, Physician Name as "Name of the physician", examination room as "Room No.", schedule date and approximate time to meet the physician.
select [Name of the patient] = pa.name,
[Name of the Nurse assisting the physician] = n.name,
[Name of the physician] = p.name,
[Room No.]= ap.examinationroom,
ap.start_dt_time
from Hospital.Patient pa
join Hospital.Appointment ap on ap.patient = pa.ssn
join Hospital.Nurse n on n.employeeid = ap.prepnurse
join Hospital.Physician p on p.employeeid = ap.physician 
where ap.start_dt_time = '2008-04-25 10:00:00'

--18. From the following tables, write a SQL query to find those patients and their physicians who do not require any assistance of a nurse. Return Name of the patient as "Name of the patient", Name of the Physician as "Name of the physician" and examination room as "Room No.". 
select [Name of the patient] = pa.name,
[Name of the physician] = p.name,
[Room No.]= ap.examinationroom
from Hospital.Patient pa
join Hospital.Appointment ap on ap.patient = pa.ssn
join Hospital.Physician p on p.employeeid = ap.physician 
where ap.prepnurse is null

--19. From the following tables, write a SQL query to find the patients and their treating physicians and medication. Return Patient name as "Patient", Physician name as "Physician", Medication name as "Medication". 
select Patient = pa.name,
Physician = p.name,
Medication = m.name
from Hospital.Patient pa 
join Hospital.Prescribes pre on pa.ssn = pre.patient
join Hospital.Physician p on p.employeeid=pre.physician
join Hospital.Medication m on m.code = pre.medication

--20. From the following tables, write a SQL query to find those patients who have taken an advanced appointment. Return Patient name as "Patient", Physician name as "Physician" and Medication name as "Medication".
select Patient = pa.name,
Physician = p.name,
Medication = m.name
from Hospital.Patient pa 
join Hospital.Prescribes pre on pa.ssn = pre.patient
join Hospital.Physician p on p.employeeid=pre.physician
join Hospital.Medication m on m.code = pre.medication
where pre.appointment is not null

--21. From the following tables, write a SQL query to find those patients who did not take any appointment. Return Patient name as "Patient", Physician name as "Physician" and Medication name as "Medication". 
select Patient = pa.name,
Physician = p.name,
Medication = m.name
from Hospital.Patient pa 
join Hospital.Prescribes pre on pa.ssn = pre.patient
join Hospital.Physician p on p.employeeid=pre.physician
join Hospital.Medication m on m.code = pre.medication
where pre.appointment is null

--22. From the following table, write a SQL query to count the number of available rooms in each block. Sort the result-set on ID of the block. Return ID of the block as "Block", count number of available rooms as "Number of available rooms". 
select Block = blockcode, [Number of available rooms] = COUNT(unavailable) 
from Hospital.Room
where unavailable = 'false'
group by blockcode
order by blockcode

--23. From the following table, write a SQL query to count the number of available rooms in each floor. Sort the result-set on block floor. Return floor ID as "Floor" and count the number of available rooms as "Number of available rooms". 
select Floor = blockfloor, [Number of available rooms] = COUNT(unavailable) 
from Hospital.Room
where unavailable = 'false'
group by blockfloor
order by blockfloor

--24. From the following table, write a SQL query to count the number of available rooms for each floor in each block. Sort the result-set on floor ID, ID of the block. Return the floor ID as "Floor", ID of the block as "Block", and number of available rooms as "Number of available rooms".
select Floor = blockfloor, Block = blockcode, [Number of available rooms] = COUNT(unavailable) 
from Hospital.Room
where unavailable = 'false'
group by blockfloor, blockcode
order by blockfloor, blockcode

--25. From the following tables, write a SQL query to count the number of unavailable rooms for each block in each floor. Sort the result-set on block floor, block code. Return the floor ID as "Floor", block ID as "Block", and number of unavailable as "Number of unavailable rooms". 
select Floor = blockfloor, Block = blockcode, [Number of unavailable rooms] = COUNT(unavailable) 
from Hospital.Room
where unavailable = 'true'
group by blockfloor, blockcode
order by blockfloor, blockcode

--26. From the following table, write a SQL query to find the floor where the maximum numbers of rooms are available. Return floor ID as "Floor", count "Number of available rooms".  
select Floor = blockfloor, [Number of available rooms] = count(*)
from Hospital.Room
where unavailable = 'false'
group by blockfloor
having count(*) = (
select max(zz) from (select blockfloor, zz = count(*)
from Hospital.Room
where unavailable = 'false'
group by blockfloor)as t)
order by blockfloor

--27. From the following table, write a SQL query to find the floor where the minimum numbers of rooms are available. Return floor ID as “Floor”, Number of available rooms.
select Floor = blockfloor, [Number of available rooms] = count(*)
from Hospital.Room
where unavailable = 'false'
group by blockfloor
having count(*) = (
select min(zz) from (select blockfloor, zz = count(*)
from Hospital.Room
where unavailable = 'false'
group by blockfloor)as t)
order by blockfloor

--28. From the following tables, write a SQL query to find the name of the patients, their block, floor, and room number where they admitted. 
select pa.name, r.blockcode,r.blockfloor,s.room
from Hospital.stay s, Hospital.Patient pa, Hospital.room r
where pa.ssn = s.patient and r.roomnumber=s.room

--29. From the following tables, write a SQL query to find the nurses and the block where they are booked for attending the patients on call. Return Nurse Name as “Nurse”, Block code as "Block". 
select n.name as Nurse, Block=o.blockcode
from Hospital.Nurse n, Hospital.[On-Call] o
where n.employeeid=o.nurse

--30. From the following tables, write a SQL query to get
--a) name of the patient,
--b) name of the physician who is treating him or her,
--c) name of the nurse who is attending him or her,
--d) which treatement is going on to the patient,
--e) the date of release,
--f) in which room the patient has admitted and which floor and block the room belongs to respectively. 
select pa.name as [name of the patient], 
p.name as [name of the physician], 
n.name as [name of the nurse], 
treatement = pro.name,
s.end_time as [date of release], 
block = r.blockcode, 
floor = r.blockfloor, 
room = r.roomnumber
from Hospital.Undergoes u
join Hospital.Patient pa on pa.ssn = u.patient
join Hospital.Physician p on p.employeeid = u.physician
left join Hospital.Nurse n on n.employeeid = u.assistingnurse
join Hospital.Stay s on s.stayid = u.stay
join Hospital.Room r on r.roomnumber = s.room
join Hospital.Procedures pro on u.procedur=pro.code

--31. From the following tables, write a SQL query to find all those physicians who performed a medical procedure, but they are not certified to perform. Return Physician name as “Physician”.
select Physician = name
from Hospital.Physician
where employeeid in (
select u.physician 
from Hospital.Undergoes u 
left join hospital.trained_in t on u.physician = t.physician
and u.procedur = t.treatment where t.treatment is null)

--32. From the following tables, write a SQL query to find all the physicians, their procedure, date when the procedure was carried out and name of the patient on which procedure have been carried out but those physicians are not certified for that procedure. Return Physician Name as "Physician", Procedure Name as "Procedure", date, and Patient. Name as "Patient".
select 
p.name as [Physician], 
[Procedure] = pro.name,
u.date,
pa.name as [Patient]
from Hospital.Undergoes u
join Hospital.Patient pa on pa.ssn = u.patient
join Hospital.Physician p on p.employeeid = u.physician
join Hospital.Procedures pro on u.procedur=pro.code
and NOT EXISTS
    ( SELECT *
     FROM hospital.Trained_in t
     WHERE t.treatment = u.procedur
       AND t.physician = u.physician )

--33. From the following table, write a SQL query to find all those physicians who completed a medical procedure with certification after the date of expiration of their certificate. Return Physician Name as "Physician", Position as "Position".
select 
p.name as [Physician], 
Position = p.position
from Hospital.Undergoes u
join Hospital.Physician p on p.employeeid = u.physician
join Hospital.Trained_in t on u.physician=t.physician and u.procedur = t.treatment
where u.date>t.certificationexpires

--34. From the following table, write a SQL query to find all those physicians who completed a medical procedure with certification after the date of expiration of their certificate. Return Physician Name as “Physician”, Position as "Position", Procedure Name as “Procedure”, Date of Procedure as “Date of Procedure”, Patient Name as “Patient”, and expiry date of certification as “Expiry Date of Certificate”.  
select 
p.name as [Physician], 
position = p.position,
[Procedure] = pro.name,
[Date of Procedure] = u.date,
pa.name as [Patient],
[Expiry Date of Certificate] = t.certificationexpires
from Hospital.Undergoes u
join Hospital.Patient pa on pa.ssn = u.patient
join Hospital.Physician p on p.employeeid = u.physician
join Hospital.Procedures pro on u.procedur =pro.code
join Hospital.Trained_in t on u.physician=t.physician and u.procedur = t.treatment
where u.date>t.certificationexpires

--35. From the following table, write a SQL query to find those nurses who have ever been on call for room 122. Return name of the nurses.  

select name
from hospital.nurse
where employeeid in (
select nurse from Hospital.[On-Call] where blockcode in (
select blockcode from Hospital.Room where roomnumber = 122 ) )

--36. From the following table, write a SQL query to find those patients who have been prescribed by some medication by his/her physician who has carried out primary care. Return Patient name as “Patient”, and Physician Name as “Physician”. 
select Patient = pa.name, Physician = p.name
from Hospital.Patient pa, Hospital.Physician p, Hospital.Prescribes pre
where pa.ssn = pre.patient and pre.physician=p.employeeid and pa.pcp = p.employeeid

--37. From the following table, write a SQL query to find those patients who have been undergone a procedure costing more than $5,000 and the name of that physician who has carried out primary care. Return name of the patient as “Patient”, name of the physician as “Primary Physician”, and cost for the procedure as “Procedure Cost”.
select 
pa.name as [Patient],
p.name as [Physician], 
[Procedure Cost] = pro.cost
from Hospital.Undergoes u
join Hospital.Patient pa on pa.ssn = u.patient
join Hospital.Physician p on p.employeeid = u.physician
join Hospital.Procedures pro on u.procedur =pro.code
where pro.cost > 5000

--38. From the following table, write a SQL query to find those patients who had at least two appointments where the nurse who prepped the appointment was a registered nurse and the physician who has carried out primary care. Return Patient name as “Patient”, Physician name as “Primary Physician”, and Nurse Name as “Nurse”.
select [Patient] = pa.name,
[Primary Physician] = p.name,
[Nurse] = n.name
from Hospital.Patient pa
join Hospital.Appointment ap on ap.patient = pa.ssn
join Hospital.Nurse n on n.employeeid = ap.prepnurse
join Hospital.Physician p on p.employeeid = pa.pcp 
where ap.patient  in (
select ap.patient 
from Hospital.Appointment ap 
group by ap.patient 
having COUNT(patient)>=2 )
and n.registered = 'true'
order by pa.name

--39. From the following table, write a SQL query to find those patients whose primary care a physician who is not the head of any department takes. Return Patient name as “Patient”, Physician Name as “Primary care Physician”. 
select [Patient] = pa.name,
[Primary Physician] = p.name
from Hospital.Patient pa
join Hospital.Physician p on p.employeeid = pa.pcp 
where pa.pcp not in (select head from Hospital.Department)


































































