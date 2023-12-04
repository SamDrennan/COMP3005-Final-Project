create table Club
	(club_name				varchar(255) NOT NULL,
	 primary key (club_name)
	);
	
create table Administrators
	(adminID				int UNIQUE, 
	 first_name				varchar(255) NOT NULL,
	 last_name				varchar(255) NOT NULL,
	 birth_date				date DEFAULT CURRENT_DATE,
	 club_name				varchar(255) NOT NULL,
	 primary key (adminID),
	 foreign key (club_name) references Club
	 	on delete cascade
	);

create table Members
	(memberID				int UNIQUE, 
	 first_name				varchar(255) NOT NULL,
	 last_name				varchar(255) NOT NULL,
	 birth_date				date DEFAULT CURRENT_DATE,
	 club_name				varchar(255) NOT NULL,
	 primary key (memberID),
	 foreign key (club_name) references Club
	 	on delete cascade
	);

create table Trainers
	(trainerID				int UNIQUE, 
	 first_name				varchar(255) NOT NULL,
	 last_name				varchar(255) NOT NULL,
	 birth_date				date DEFAULT CURRENT_DATE,
	 club_name				varchar(255) NOT NULL,
	 primary key (trainerID),
	 foreign key (club_name) references Club
	 	on delete cascade
	);

create table Profiles
	(profileID				int UNIQUE, 
	 fitness_goals			varchar(255) NOT NULL,
	 achievements			varchar(255) NOT NULL,
	 exercises				varchar(255) NOT NULL,
	 primary key (profileID)
	);
	
create table Trainings
	(trainingID				int UNIQUE, 
	 exercise				varchar(255) NOT NULL,
	 start_time				date DEFAULT CURRENT_DATE,
	 end_time				date DEFAULT CURRENT_DATE,
	 primary key (trainingID)
	);

create table Events
	(eventID				int UNIQUE, 
	 event_type				varchar(255) NOT NULL,
	 start_time				date DEFAULT CURRENT_DATE,
	 end_time				date DEFAULT CURRENT_DATE,
	 primary key (eventID)
	);

create table Rooms
	(roomID					int UNIQUE, 
	 capacity				int,
	 club_name				varchar(255) NOT NULL,
	 primary key (roomID),
	 foreign key (club_name) references Club
	 	on delete cascade
	);

create table Members_Have
	(memberID		int, 
	 profileID		int,
	 primary key (memberID),
	 foreign key (memberID) references Members
	 	on delete cascade,
	 foreign key (profileID) references Profiles
	 	on delete cascade
	);

create table Can_Access
	(trainerID		int, 
	 profileID		int,
	 primary key (profileID, trainerID),
	 foreign key (trainerID) references Trainers
	 	on delete cascade,
	 foreign key (profileID) references Profiles
	 	on delete cascade
	);

create table Profiles_Have_Training
	(profileID		int,
	 trainingID		int, 
	 primary key (trainingID, profileID),
	 foreign key (trainingID) references Trainings
	 	on delete cascade,
	 foreign key (profileID) references Profiles
	 	on delete cascade
	);

create table Profiles_Have_Event
	(profileID		int,
	 eventID		int, 
	 primary key (eventID, profileID),
	 foreign key (eventID) references Events
	 	on delete cascade,
	 foreign key (profileID) references Profiles
	 	on delete cascade
	);

create table Events_Use
	(eventID		int, 
	 roomID			int,
	 primary key (eventID, roomID),
	 foreign key (eventID) references Events
	 	on delete cascade,
	 foreign key (roomID) references Rooms
	 	on delete cascade
	);
	
create table Training_Use
	(trainingID		int, 
	 roomID			int,
	 primary key (trainingID, roomID),
	 foreign key (trainingID) references Trainings
	 	on delete cascade,
	 foreign key (roomID) references Rooms
	 	on delete cascade
	);
