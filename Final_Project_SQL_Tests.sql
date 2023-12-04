delete from Club;
delete from Administrators;
delete from Members;
delete from Trainers;
delete from Profiles;
delete from Trainings;
delete from Rooms;
delete from Events;
delete from Members_Have;
delete from Can_Access;
delete from Profiles_Have_Training;
delete from Profiles_Have_Event;
delete from Events_Use;
delete from Training_Use;

insert into Club values ('Health Club');
insert into Administrators values ('100', 'John', 'Taylor', '1995-01-14', 'Health Club');
insert into Members values ('100', 'Bill', 'Painter', '2001-02-21', 'Health Club');
insert into Members values ('101', 'Bob', 'Terry', '2003-07-22', 'Health Club');
insert into Trainers values ('100', 'Phil', 'Watson', '2000-04-28', 'Health Club');
insert into Profiles values ('1', 'Lose 10 pounds', 'N/A', 'N/A');
insert into Profiles values ('2', 'Lose 15 pounds', 'Lost 5 pounds', 'Sit-ups');
insert into Trainings values ('1000', 'Push-ups', '2023-12-04', '2023-12-05');
insert into Rooms values ('214', '30', 'Health Club');
insert into Events values ('1010', 'Workshop', '2023-12-08', '2023-12-12');

insert into Members_Have values ('100', '1');
insert into Members_Have values ('101', '2');
insert into Can_Access values ('100', '1');
insert into Can_Access values ('100', '2');
insert into Profiles_Have_Training values ('1', '1000');
insert into Profiles_Have_Training values ('2', '1000');
insert into Profiles_Have_Event values ('1', '1010');
insert into Events_Use values ('1010', '214');
insert into Training_Use values ('1000', '214');

Select club_name From Club;

Select first_name, last_name From Members;

Delete from Members Where memberID='101';

-- Select all the profiles that can be accessed by a certain trainer
Select Profiles.profileID, Profiles.fitness_goals, Profiles.achievements, Profiles.exercises
From Profiles
INNER JOIN Can_Access ON Profiles.profileID=Can_Access.profileID
INNER JOIN Trainers ON Can_Access.trainerID=Trainers.trainerID
Where Trainers.trainerID='100';