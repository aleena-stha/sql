CREATE TABLE [dbo].[NewCustomer] (
    [MID]            INT           IDENTITY (100, 1) NOT NULL,
    [Name]          VARCHAR (150) NOT NULL,
    [Dob]            VARCHAR (100) NOT NULL,
    [Mobile]         VARCHAR(50)     NOT NULL,
    [Email]          VARCHAR (150) NOT NULL,
    [JoinDate]       VARCHAR (150) NOT NULL,
    [GymTime]        VARCHAR (120) NOT NULL,
    [Maddress]       VARCHAR (250) NOT NULL,
    [MembershipTime] VARCHAR (120) NOT NULL,
    PRIMARY KEY CLUSTERED ([MID] ASC)
);

