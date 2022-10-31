
CREATE TYPE [SurrogateKeyInt]
	FROM INT NULL
go

CREATE TYPE [TypeOfObject]
	FROM CHAR(12) NULL
go

CREATE TYPE [Date]
	FROM DATE NULL
go

CREATE TYPE [Salary]
	FROM MONEY NULL
go

CREATE TYPE [Name]
	FROM VARCHAR(50) NULL
go

CREATE TYPE [ID]
	FROM INT NULL
go

CREATE TYPE [StageName]
	FROM VARCHAR(40) NULL
go

CREATE TYPE [MovieTitle]
	FROM VARCHAR(50) NULL
go

CREATE TYPE [LongDescription]
	FROM VARCHAR(200) NULL
go

CREATE TYPE [StreamStatus]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [MovieFormat]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Money]
	FROM MONEY NULL
go

CREATE TYPE [BooleanFlag]
	FROM BIT NULL
go

CREATE TYPE [DateNow]
	FROM TIME() NULL
go

CREATE TYPE [FrameRate]
	FROM SMALLINT NULL
go

CREATE TYPE [IPAddress]
	FROM BINARY(32) NULL
go

CREATE TYPE [IPAddressString]
	FROM CHAR(15) NULL
go

CREATE TYPE [IpAdressOctet]
	FROM TINYINT NULL
go

CREATE TYPE [RatingCode]
	FROM VARCHAR(2) NULL
go

CREATE TYPE [MovieGenreAbbrv]
	FROM VARCHAR(25) NULL
go

CREATE DEFAULT [df_TEST]
	AS 19.97
go

CREATE RULE [CK_testDeviceLimit]
	AS @col BETWEEN 0 AND 9
go

CREATE RULE [CK_Cost]
	AS @col BETWEEN 0.00 AND 99.99
go

CREATE RULE [CK_StreamStatus]
	AS @col IN ('In Use', 'Inactive', 'Paused')
go

CREATE RULE [CK_FrameRate]
	AS @col BETWEEN 1 AND 999
go

CREATE TABLE [Address]
( 
	[AddressId]          [SurrogateKeyInt]  NOT NULL ,
	[AddressState]       char(2)  NULL ,
	[AddressCity]        varchar(20)  NULL ,
	[AddressZipCode]     char(5)  NULL ,
	[AddressStreet]      varchar(40)  NULL 
)
go

CREATE TABLE [CardPayment]
( 
	[CardNumber]         char(16)  MASKED WITH (FUNCTION = 'default();') NULL ,
	[CardType]           char(20)  NULL ,
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[CardExpirationDate] char(4)  NULL ,
	[CardSecurityCode]   char(3)  NULL 
)
go

CREATE TABLE [Check]
( 
	[BankNumber]         varchar(9)  MASKED WITH (FUNCTION = ''partial(0,"XX-XX-XX",4)') NULL ,
	[RoutingNumber]      varchar(9)  NULL ,
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[AccountType]        varchar(20)  NULL 
	CONSTRAINT [CK_AccountType_892274656]
		CHECK  ( [AccountType]='Checkings' OR [AccountType]='Savings' )
)
go

CREATE TABLE [CreditCard]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[CardAccountType]    varchar(6)  NOT NULL 
	CONSTRAINT [CK_CardType_1720797842]
		CHECK  ( [CardAccountType]='Credit' OR [CardAccountType]='Debit' )
)
go

CREATE TABLE [Cryptocurrency]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[PublicAddress]      varchar(35)  NULL 
)
go

CREATE TABLE [Customer]
( 
	[CustomerId]         [SurrogateKeyInt]  NOT NULL ,
	[PersonId]           [SurrogateKeyInt] 
)
go

CREATE TABLE [CustomerPayment]
( 
	[CustomerId]         [SurrogateKeyInt]  NOT NULL ,
	[PaymentId]          [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [CustomerService]
( 
	[EmployeeId]         [SurrogateKeyInt] ,
	[CustomerId]         [SurrogateKeyInt] ,
	[ServiceId]          [SurrogateKeyInt]  NOT NULL ,
	[DateOfService]      datetime  NULL ,
	[PersonId]           [SurrogateKeyInt] ,
	[CustomerSurvey]     text  NULL ,
	[EmployeeReport]     text  NULL ,
	[TicketStatus]       varchar(12)  NOT NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeId]         [SurrogateKeyInt]  NOT NULL ,
	[EmployeeSalary]     [Salary]  NOT NULL ,
	[EmployeeHireDate]   [Date]  NOT NULL ,
	[EmployeeSupervisor] [SurrogateKeyInt] ,
	[EmployeePositionId] [SurrogateKeyInt]  NOT NULL ,
	[PersonId]           [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [EmployeePosition]
( 
	[EmployeePositionId] [SurrogateKeyInt]  NOT NULL ,
	[EmployeePositionDescription] [LongDescription] ,
	[EmployeePositionName] [Name]  NOT NULL 
)
go

CREATE TABLE [GiftCard]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieId]            [SurrogateKeyInt]  NOT NULL ,
	[MovieTitle]         [MovieTitle]  NOT NULL ,
	[MovieDuration]      smallint  NOT NULL ,
	[MovieSynopsis]      [LongDescription]  NOT NULL ,
	[MovieDirector]      [StageName]  NOT NULL ,
	[MovieRating]        [RatingCode] ,
	[MovieGenre]         [MovieGenreAbbrv] 
)
go

CREATE TABLE [MovieResolution]
( 
	[MovieId]            [SurrogateKeyInt]  NOT NULL 
	CONSTRAINT [CK_NonZero_30650836]
		CHECK  ( MovieId >= 0 ),
	[ResolutionId]       [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [MovieStar]
( 
	[MovieId]            [SurrogateKeyInt]  NOT NULL 
	CONSTRAINT [CK_NonZero_1566159774]
		CHECK  ( MovieId >= 0 ),
	[StarId]             [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Payment]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[PaymentType]        varchar(20)  NULL ,
	[PaymentAmount]      [Salary] ,
	[PaymentDate]        datetime  NULL 
)
go

CREATE TABLE [Person]
( 
	[PersonId]           [SurrogateKeyInt]  NOT NULL ,
	[PersonFirstName]    varchar(40)  NULL ,
	[PersonLastName]     varchar(40)  NULL ,
	[PersonEmailAddress] varchar(50)  NULL ,
	[PersonPhoneNumber]  varchar(15)  NULL ,
	[AddressId]          [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Resolution]
( 
	[ResolutionId]       [SurrogateKeyInt]  NOT NULL ,
	[Description]        [LongDescription] ,
	[FrameRate]          [FrameRate]  NOT NULL ,
	[MovieFormat]        [MovieFormat]  NOT NULL ,
	[Resolution]         varchar(30)  NOT NULL 
	CONSTRAINT [CK_MovieResolution_961677524]
		CHECK  ( [Resolution]='720p60' OR [Resolution]='1080p60' OR [Resolution]='UHD' OR [Resolution]='720p30' )
)
go

CREATE TABLE [Star]
( 
	[StarId]             [SurrogateKeyInt]  NOT NULL ,
	[StageName]          [Name] ,
	[DateCreated]        datetime2(7)  NOT NULL ,
	[PersonId]           [SurrogateKeyInt] 
)
go

CREATE TABLE [Stream]
( 
	[StreamId]           [SurrogateKeyInt]  NOT NULL ,
	[Description]        [LongDescription] ,
	[IpAddress1]         [IPAddress]  NOT NULL ,
	[IpAddress2]         [IPAddressString]  NOT NULL ,
	[DateCreated]        [DateNow]  NOT NULL ,
	[Expired]            [BooleanFlag]  NOT NULL ,
	[Status]             [StreamStatus]  NOT NULL ,
	[AverageFrameRate]   [FrameRate] ,
	[LastUpdated]        [DateNow]  NOT NULL ,
	[MovieId]            [SurrogateKeyInt]  NOT NULL 
	CONSTRAINT [CK_NonZero_666668979]
		CHECK  ( MovieId >= 0 ),
	[ResolutionId]       [SurrogateKeyInt]  NOT NULL ,
	[SubscriptionId]     [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Subscription]
( 
	[CustomerId]         [SurrogateKeyInt] ,
	[SubscriptionId]     [SurrogateKeyInt]  NOT NULL ,
	[PaymentId]          [SurrogateKeyInt] ,
	[SubscriptionTierId] [SurrogateKeyInt] 
)
go

CREATE TABLE [SubscriptionTier]
( 
	[SubscriptionTierId] [SurrogateKeyInt]  NOT NULL ,
	[SubscriptionTierDescription] varchar(100)  NULL ,
	[SubscriptionTierMonthlyCost] [Money]  NOT NULL ,
	[SubscriptionTierYearlyCost] [Money]  NOT NULL ,
	[SubscriptionTierConcurrentDeviceLimit] tinyint  NOT NULL ,
	[HighestResolution]  [SurrogateKeyInt]  NOT NULL 
)
go

ALTER TABLE [Address]
	ADD CONSTRAINT [XPKAddress] PRIMARY KEY  CLUSTERED ([AddressId] ASC)
go

ALTER TABLE [Address]
	ADD CONSTRAINT [XAK1Address] UNIQUE ([AddressCity]  ASC,[AddressState]  ASC,[AddressStreet]  ASC,[AddressZipCode]  ASC)
go

ALTER TABLE [CardPayment]
	ADD CONSTRAINT [XPKCardPayment] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Check]
	ADD CONSTRAINT [XPKCheck] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [CreditCard]
	ADD CONSTRAINT [XPKCreditCard] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Cryptocurrency]
	ADD CONSTRAINT [XPKCryptocurrency] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XAK1UniquePerson] UNIQUE ([PersonId]  ASC)
go

ALTER TABLE [CustomerPayment]
	ADD CONSTRAINT [XPKCustomer_Payment] PRIMARY KEY  CLUSTERED ([CustomerId] ASC,[PaymentId] ASC)
go

ALTER TABLE [CustomerService]
	ADD CONSTRAINT [XPKCustomerService] PRIMARY KEY  CLUSTERED ([ServiceId] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC,[PersonId] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XAK1Person] UNIQUE ([PersonId]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Supervisor] ON [Employee]
( 
	[EmployeeId]          ASC
)
go

ALTER TABLE [EmployeePosition]
	ADD CONSTRAINT [XPKEmployeePosition] PRIMARY KEY  CLUSTERED ([EmployeePositionId] ASC)
go

ALTER TABLE [GiftCard]
	ADD CONSTRAINT [XPKGiftCard] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieId] ASC)
go

ALTER TABLE [MovieResolution]
	ADD CONSTRAINT [XPKMovie_Resolution] PRIMARY KEY  CLUSTERED ([MovieId] ASC,[ResolutionId] ASC)
go

ALTER TABLE [MovieStar]
	ADD CONSTRAINT [XPKMovie_Star] PRIMARY KEY  CLUSTERED ([StarId] ASC,[MovieId] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Person]
	ADD CONSTRAINT [XPKPerson] PRIMARY KEY  CLUSTERED ([PersonId] ASC)
go

ALTER TABLE [Resolution]
	ADD CONSTRAINT [XPKResolution] PRIMARY KEY  CLUSTERED ([ResolutionId] ASC)
go

ALTER TABLE [Resolution]
	ADD CONSTRAINT [Code] UNIQUE ([Resolution]  ASC,[FrameRate]  ASC)
go

ALTER TABLE [Star]
	ADD CONSTRAINT [XPKStar] PRIMARY KEY  CLUSTERED ([StarId] ASC)
go

ALTER TABLE [Star]
	ADD CONSTRAINT [XAK1StageNamePerson] UNIQUE ([PersonId]  ASC,[StageName]  ASC)
go

ALTER TABLE [Stream]
	ADD CONSTRAINT [XPKStream] PRIMARY KEY  CLUSTERED ([StreamId] ASC)
go

ALTER TABLE [Subscription]
	ADD CONSTRAINT [XPKSubscription] PRIMARY KEY  CLUSTERED ([SubscriptionId] ASC)
go

ALTER TABLE [SubscriptionTier]
	ADD CONSTRAINT [XPKSubscriptionTier] PRIMARY KEY  CLUSTERED ([SubscriptionTierId] ASC)
go


ALTER TABLE [CardPayment]
	ADD CONSTRAINT [FK_Payment_CardPayment] FOREIGN KEY ([PaymentId]) REFERENCES [Payment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Check]
	ADD CONSTRAINT [FK_Payment_Check] FOREIGN KEY ([PaymentId]) REFERENCES [Payment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [CreditCard]
	ADD CONSTRAINT [FK_CardPayment_CreditCard] FOREIGN KEY ([PaymentId]) REFERENCES [CardPayment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Cryptocurrency]
	ADD CONSTRAINT [FK_Payment_Cryptocurrency] FOREIGN KEY ([PaymentId]) REFERENCES [Payment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Customer]
	ADD CONSTRAINT [FK_Person_Customer] FOREIGN KEY ([PersonId]) REFERENCES [Person]([PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerPayment]
	ADD CONSTRAINT [FK_Customer_CustomerPayment] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerPayment]
	ADD CONSTRAINT [FK_Payment_CustomerPayment] FOREIGN KEY ([PaymentId]) REFERENCES [Payment]([PaymentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerService]
	ADD CONSTRAINT [FK_Employee_CustomerService] FOREIGN KEY ([EmployeeId],[PersonId]) REFERENCES [Employee]([EmployeeId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerService]
	ADD CONSTRAINT [FK_Customer_CustomerService] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([EmployeeId],[PersonId]) REFERENCES [Employee]([EmployeeId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_EmployeePosition_Employee] FOREIGN KEY ([EmployeePositionId]) REFERENCES [EmployeePosition]([EmployeePositionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [FK_Person_Employee] FOREIGN KEY ([PersonId]) REFERENCES [Person]([PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [GiftCard]
	ADD CONSTRAINT [FK_CardPayment_GiftCard] FOREIGN KEY ([PaymentId]) REFERENCES [CardPayment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [MovieResolution]
	ADD CONSTRAINT [FK_Movie_MovieResolution] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieResolution]
	ADD CONSTRAINT [FK_Resolution_MovieResolution] FOREIGN KEY ([ResolutionId]) REFERENCES [Resolution]([ResolutionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStar]
	ADD CONSTRAINT [FK_Movie_MovieStar] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStar]
	ADD CONSTRAINT [FK_Star_MovieStar] FOREIGN KEY ([StarId]) REFERENCES [Star]([StarId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Person]
	ADD CONSTRAINT [FK_Address_Person] FOREIGN KEY ([AddressId]) REFERENCES [Address]([AddressId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Star]
	ADD CONSTRAINT [FK_Person_Star] FOREIGN KEY ([PersonId]) REFERENCES [Person]([PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[CK_StreamStatus]', '[Stream].[Status]'
go


ALTER TABLE [Stream]
	ADD CONSTRAINT [FK_MovieResolution_Stream] FOREIGN KEY ([MovieId],[ResolutionId]) REFERENCES [MovieResolution]([MovieId],[ResolutionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Stream]
	ADD CONSTRAINT [FK_Subscription_Stream] FOREIGN KEY ([SubscriptionId]) REFERENCES [Subscription]([SubscriptionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Subscription]
	ADD CONSTRAINT [FK_Customer_Subscription] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Subscription]
	ADD CONSTRAINT [FK_Payment_Subscription] FOREIGN KEY ([PaymentId]) REFERENCES [Payment]([PaymentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Subscription]
	ADD CONSTRAINT [FK_SubscriptionTier_Subscription] FOREIGN KEY ([SubscriptionTierId]) REFERENCES [SubscriptionTier]([SubscriptionTierId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[CK_Cost]', '[SubscriptionTier].[SubscriptionTierMonthlyCost]'
go

exec sp_bindrule '[CK_Cost]', '[SubscriptionTier].[SubscriptionTierYearlyCost]'
go

exec sp_bindrule '[CK_testDeviceLimit]', '[SubscriptionTier].[SubscriptionTierConcurrentDeviceLimit]'
go


ALTER TABLE [SubscriptionTier]
	ADD CONSTRAINT [FK_Resolution_SubscriptionTier] FOREIGN KEY ([HighestResolution]) REFERENCES [Resolution]([ResolutionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

CREATE TRIGGER Person.tD_Person ON Person.Person FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Person */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Person.Address belongs to a Person.Person on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000177e8", PARENT_OWNER="Person", PARENT_TABLE="Address"
    CHILD_OWNER="Person", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Address_Person", FK_COLUMNS="AddressId" */
    IF EXISTS (SELECT * FROM deleted,Person.Address
      WHERE
        /* %JoinFKPK(deleted,Person.Address," = "," AND") */
        deleted.AddressId = Person.Address.AddressId AND
        NOT EXISTS (
          SELECT * FROM Person.Person
          WHERE
            /* %JoinFKPK(Person.Person,Person.Address," = "," AND") */
            Person.Person.AddressId = Person.Address.AddressId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Person.Person because Person.Address exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Person.tU_Person ON Person.Person FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Person */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPersonId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Person.Address belongs to a Person.Person on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000182cd", PARENT_OWNER="Person", PARENT_TABLE="Address"
    CHILD_OWNER="Person", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Address_Person", FK_COLUMNS="AddressId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AddressId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person.Address
        WHERE
          /* %JoinFKPK(inserted,Person.Address) */
          inserted.AddressId = Person.Address.AddressId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Person.Person because Person.Address does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Person.tD_Address ON Person.Address FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Address */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Person.Address belongs to a Person.Person on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012056", PARENT_OWNER="Person", PARENT_TABLE="Address"
    CHILD_OWNER="Person", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Address_Person", FK_COLUMNS="AddressId" */
    IF EXISTS (
      SELECT * FROM deleted,Person.Person
      WHERE
        /*  %JoinFKPK(Person.Person,deleted," = "," AND") */
        Person.Person.AddressId = deleted.AddressId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Person.Address because Person.Person exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Person.tU_Address ON Person.Address FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Address */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAddressId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Person.Address belongs to a Person.Person on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000134ce", PARENT_OWNER="Person", PARENT_TABLE="Address"
    CHILD_OWNER="Person", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Address_Person", FK_COLUMNS="AddressId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AddressId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Person.Person
      WHERE
        /*  %JoinFKPK(Person.Person,deleted," = "," AND") */
        Person.Person.AddressId = deleted.AddressId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Person.Address because Person.Person exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go





CREATE TRIGGER tD_CardPayment ON CardPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CardPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CardPayment  CreditCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0002de94", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
    DELETE CreditCard
      FROM CreditCard,deleted
      WHERE
        /*  %JoinFKPK(CreditCard,deleted," = "," AND") */
        CreditCard.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* CardPayment  GiftCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
    DELETE GiftCard
      FROM GiftCard,deleted
      WHERE
        /*  %JoinFKPK(GiftCard,deleted," = "," AND") */
        GiftCard.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment  CardPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentId = Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM CardPayment
          WHERE
            /* %JoinFKPK(CardPayment,Payment," = "," AND") */
            CardPayment.PaymentId = Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CardPayment because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CardPayment ON CardPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CardPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CardPayment  CreditCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000452bc", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentId = inserted.PaymentId
        FROM inserted
      UPDATE CreditCard
      SET
        /*  %JoinFKPK(CreditCard,@ins," = ",",") */
        CreditCard.PaymentId = @insPaymentId
      FROM CreditCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(CreditCard,deleted," = "," AND") */
        CreditCard.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade CardPayment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CardPayment  GiftCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentId = inserted.PaymentId
        FROM inserted
      UPDATE GiftCard
      SET
        /*  %JoinFKPK(GiftCard,@ins," = ",",") */
        GiftCard.PaymentId = @insPaymentId
      FROM GiftCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(GiftCard,deleted," = "," AND") */
        GiftCard.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade CardPayment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  CardPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentId = Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CardPayment because Payment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Check ON Check FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Check */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  Check on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000146aa", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentId = Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Check
          WHERE
            /* %JoinFKPK(Check,Payment," = "," AND") */
            Check.PaymentId = Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Check because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Check ON Check FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Check */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  Check on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000177fd", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentId = Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Check because Payment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CreditCard ON CreditCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CreditCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CardPayment  CreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015f31", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,CardPayment
      WHERE
        /* %JoinFKPK(deleted,CardPayment," = "," AND") */
        deleted.PaymentId = CardPayment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM CreditCard
          WHERE
            /* %JoinFKPK(CreditCard,CardPayment," = "," AND") */
            CreditCard.PaymentId = CardPayment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CreditCard because CardPayment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CreditCard ON CreditCard FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CreditCard */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CardPayment  CreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017dbd", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CardPayment
        WHERE
          /* %JoinFKPK(inserted,CardPayment) */
          inserted.PaymentId = CardPayment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CreditCard because CardPayment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Cryptocurrency ON Cryptocurrency FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Cryptocurrency */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  Cryptocurrency on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000160b0", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentId = Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Cryptocurrency
          WHERE
            /* %JoinFKPK(Cryptocurrency,Payment," = "," AND") */
            Cryptocurrency.PaymentId = Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Cryptocurrency because Payment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Cryptocurrency ON Cryptocurrency FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Cryptocurrency */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  Cryptocurrency on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017c64", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentId = Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Cryptocurrency because Payment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Customer ON Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  CustomerService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00046c02", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CustomerPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerPayment
      WHERE
        /*  %JoinFKPK(CustomerPayment,deleted," = "," AND") */
        CustomerPayment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CustomerPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person  Customer on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Customer", FK_COLUMNS="PersonId" */
    IF EXISTS (SELECT * FROM deleted,Person
      WHERE
        /* %JoinFKPK(deleted,Person," = "," AND") */
        deleted.PersonId = Person.PersonId AND
        NOT EXISTS (
          SELECT * FROM Customer
          WHERE
            /* %JoinFKPK(Customer,Person," = "," AND") */
            Customer.PersonId = Person.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Customer because Person exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Customer ON Customer FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  CustomerService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004ef43", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CustomerService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CustomerPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerPayment
      WHERE
        /*  %JoinFKPK(CustomerPayment,deleted," = "," AND") */
        CustomerPayment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CustomerPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Subscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person  Customer on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Customer", FK_COLUMNS="PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person
        WHERE
          /* %JoinFKPK(inserted,Person) */
          inserted.PersonId = Person.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Customer because Person does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CustomerPayment ON CustomerPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  CustomerPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a40f", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentId = Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM CustomerPayment
          WHERE
            /* %JoinFKPK(CustomerPayment,Payment," = "," AND") */
            CustomerPayment.PaymentId = Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerPayment because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  CustomerPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM CustomerPayment
          WHERE
            /* %JoinFKPK(CustomerPayment,Customer," = "," AND") */
            CustomerPayment.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerPayment because Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CustomerPayment ON CustomerPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId SurrogateKeyInt, 
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002dbf2", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentId = Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerPayment because Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  CustomerPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerPayment because Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CustomerService ON CustomerService FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerService */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer  CustomerService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e18b", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM CustomerService
          WHERE
            /* %JoinFKPK(CustomerService,Customer," = "," AND") */
            CustomerService.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerService because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  CustomerService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        deleted.PersonId = Employee.PersonId AND
        NOT EXISTS (
          SELECT * FROM CustomerService
          WHERE
            /* %JoinFKPK(CustomerService,Employee," = "," AND") */
            CustomerService.EmployeeId = Employee.EmployeeId AND
            CustomerService.PersonId = Employee.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerService because Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CustomerService ON CustomerService FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerService */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insServiceId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  CustomerService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00034a13", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerService because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  CustomerService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeId = Employee.EmployeeId and
          inserted.PersonId = Employee.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerService because Employee does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Employee ON Employee FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Employee */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Employee  Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00062e34", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.EmployeeId = deleted.EmployeeId AND
        Employee.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  CustomerService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.EmployeeId = deleted.EmployeeId AND
        CustomerService.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person  Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Employee", FK_COLUMNS="PersonId" */
    IF EXISTS (SELECT * FROM deleted,Person
      WHERE
        /* %JoinFKPK(deleted,Person," = "," AND") */
        deleted.PersonId = Person.PersonId AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Person," = "," AND") */
            Employee.PersonId = Person.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Person exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeePosition  Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
    IF EXISTS (SELECT * FROM deleted,EmployeePosition
      WHERE
        /* %JoinFKPK(deleted,EmployeePosition," = "," AND") */
        deleted.EmployeePositionId = EmployeePosition.EmployeePositionId AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,EmployeePosition," = "," AND") */
            Employee.EmployeePositionId = EmployeePosition.EmployeePositionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because EmployeePosition exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee  Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeId = Employee.EmployeeId AND
        deleted.PersonId = Employee.PersonId AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Employee," = "," AND") */
            Employee.EmployeeId = Employee.EmployeeId AND
            Employee.PersonId = Employee.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Employee ON Employee FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Employee */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeId SurrogateKeyInt, 
           @insPersonId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000736ed", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.EmployeeId = deleted.EmployeeId AND
        Employee.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  CustomerService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.EmployeeId = deleted.EmployeeId AND
        CustomerService.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because CustomerService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person  Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Employee", FK_COLUMNS="PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person
        WHERE
          /* %JoinFKPK(inserted,Person) */
          inserted.PersonId = Person.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because Person does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeePosition  Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeePositionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeePosition
        WHERE
          /* %JoinFKPK(inserted,EmployeePosition) */
          inserted.EmployeePositionId = EmployeePosition.EmployeePositionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeePositionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because EmployeePosition does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee  Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeId = Employee.EmployeeId and
          inserted.PersonId = Employee.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because Employee does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EmployeePosition ON EmployeePosition FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EmployeePosition */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EmployeePosition  Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012e3a", PARENT_OWNER="", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.EmployeePositionId = deleted.EmployeePositionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeePosition because Employee exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_EmployeePosition ON EmployeePosition FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EmployeePosition */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeePositionId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EmployeePosition  Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00014da5", PARENT_OWNER="", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeePositionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.EmployeePositionId = deleted.EmployeePositionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeePosition because Employee exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_GiftCard ON GiftCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on GiftCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CardPayment  GiftCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015114", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,CardPayment
      WHERE
        /* %JoinFKPK(deleted,CardPayment," = "," AND") */
        deleted.PaymentId = CardPayment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM GiftCard
          WHERE
            /* %JoinFKPK(GiftCard,CardPayment," = "," AND") */
            GiftCard.PaymentId = CardPayment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GiftCard because CardPayment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_GiftCard ON GiftCard FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on GiftCard */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CardPayment  GiftCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017089", PARENT_OWNER="", PARENT_TABLE="CardPayment"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CardPayment
        WHERE
          /* %JoinFKPK(inserted,CardPayment) */
          inserted.PaymentId = CardPayment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GiftCard because CardPayment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Movie ON Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  MovieStar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021730", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStar
      WHERE
        /*  %JoinFKPK(MovieStar,deleted," = "," AND") */
        MovieStar.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieStar exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MovieResolution on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieResolution
      WHERE
        /*  %JoinFKPK(MovieResolution,deleted," = "," AND") */
        MovieResolution.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieResolution exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Movie ON Movie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MovieStar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00024cb0", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStar
      WHERE
        /*  %JoinFKPK(MovieStar,deleted," = "," AND") */
        MovieStar.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieStar exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MovieResolution on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieResolution
      WHERE
        /*  %JoinFKPK(MovieResolution,deleted," = "," AND") */
        MovieResolution.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieResolution exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MovieResolution ON MovieResolution FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieResolution */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieResolution  Stream on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003b625", PARENT_OWNER="", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.MovieId = deleted.MovieId AND
        Stream.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieResolution because Stream exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Resolution  MovieResolution on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
    IF EXISTS (SELECT * FROM deleted,Resolution
      WHERE
        /* %JoinFKPK(deleted,Resolution," = "," AND") */
        deleted.ResolutionId = Resolution.ResolutionId AND
        NOT EXISTS (
          SELECT * FROM MovieResolution
          WHERE
            /* %JoinFKPK(MovieResolution,Resolution," = "," AND") */
            MovieResolution.ResolutionId = Resolution.ResolutionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieResolution because Resolution exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MovieResolution on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MovieResolution
          WHERE
            /* %JoinFKPK(MovieResolution,Movie," = "," AND") */
            MovieResolution.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieResolution because Movie exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MovieResolution ON MovieResolution FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieResolution */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieId SurrogateKeyInt, 
           @insResolutionId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieResolution  Stream on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00040837", PARENT_OWNER="", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId) OR
    UPDATE(ResolutionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.MovieId = deleted.MovieId AND
        Stream.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieResolution because Stream exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Resolution  MovieResolution on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ResolutionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Resolution
        WHERE
          /* %JoinFKPK(inserted,Resolution) */
          inserted.ResolutionId = Resolution.ResolutionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieResolution because Resolution does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MovieResolution on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieResolution because Movie does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MovieStar ON MovieStar FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStar */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Star  MovieStar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025ef6", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
    IF EXISTS (SELECT * FROM deleted,Star
      WHERE
        /* %JoinFKPK(deleted,Star," = "," AND") */
        deleted.StarId = Star.StarId AND
        NOT EXISTS (
          SELECT * FROM MovieStar
          WHERE
            /* %JoinFKPK(MovieStar,Star," = "," AND") */
            MovieStar.StarId = Star.StarId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStar because Star exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MovieStar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MovieStar
          WHERE
            /* %JoinFKPK(MovieStar,Movie," = "," AND") */
            MovieStar.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStar because Movie exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MovieStar ON MovieStar FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStar */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieId SurrogateKeyInt, 
           @insStarId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Star  MovieStar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a86f", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StarId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Star
        WHERE
          /* %JoinFKPK(inserted,Star) */
          inserted.StarId = Star.StarId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStar because Star does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MovieStar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStar because Movie does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Payment ON Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment  CustomerPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00047d20", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerPayment
      WHERE
        /*  %JoinFKPK(CustomerPayment,deleted," = "," AND") */
        CustomerPayment.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because CustomerPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  Cryptocurrency on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
    DELETE Cryptocurrency
      FROM Cryptocurrency,deleted
      WHERE
        /*  %JoinFKPK(Cryptocurrency,deleted," = "," AND") */
        Cryptocurrency.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment  Check on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
    DELETE Check
      FROM Check,deleted
      WHERE
        /*  %JoinFKPK(Check,deleted," = "," AND") */
        Check.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment  CardPayment on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
    DELETE CardPayment
      FROM CardPayment,deleted
      WHERE
        /*  %JoinFKPK(CardPayment,deleted," = "," AND") */
        CardPayment.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment  Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Subscription exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Payment ON Payment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Payment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  CustomerPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00067151", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerPayment
      WHERE
        /*  %JoinFKPK(CustomerPayment,deleted," = "," AND") */
        CustomerPayment.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because CustomerPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Cryptocurrency on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentId = inserted.PaymentId
        FROM inserted
      UPDATE Cryptocurrency
      SET
        /*  %JoinFKPK(Cryptocurrency,@ins," = ",",") */
        Cryptocurrency.PaymentId = @insPaymentId
      FROM Cryptocurrency,inserted,deleted
      WHERE
        /*  %JoinFKPK(Cryptocurrency,deleted," = "," AND") */
        Cryptocurrency.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Check on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentId = inserted.PaymentId
        FROM inserted
      UPDATE Check
      SET
        /*  %JoinFKPK(Check,@ins," = ",",") */
        Check.PaymentId = @insPaymentId
      FROM Check,inserted,deleted
      WHERE
        /*  %JoinFKPK(Check,deleted," = "," AND") */
        Check.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  CardPayment on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentId = inserted.PaymentId
        FROM inserted
      UPDATE CardPayment
      SET
        /*  %JoinFKPK(CardPayment,@ins," = ",",") */
        CardPayment.PaymentId = @insPaymentId
      FROM CardPayment,inserted,deleted
      WHERE
        /*  %JoinFKPK(CardPayment,deleted," = "," AND") */
        CardPayment.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Subscription exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Resolution ON Resolution FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Resolution */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Resolution  MovieResolution on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022f75", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieResolution
      WHERE
        /*  %JoinFKPK(MovieResolution,deleted," = "," AND") */
        MovieResolution.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Resolution because MovieResolution exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Resolution  SubscriptionTier on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionTier
      WHERE
        /*  %JoinFKPK(SubscriptionTier,deleted," = "," AND") */
        SubscriptionTier.HighestResolution = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Resolution because SubscriptionTier exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Resolution ON Resolution FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Resolution */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insResolutionId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Resolution  MovieResolution on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00028aef", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ResolutionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieResolution
      WHERE
        /*  %JoinFKPK(MovieResolution,deleted," = "," AND") */
        MovieResolution.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Resolution because MovieResolution exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Resolution  SubscriptionTier on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ResolutionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SubscriptionTier
      WHERE
        /*  %JoinFKPK(SubscriptionTier,deleted," = "," AND") */
        SubscriptionTier.HighestResolution = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Resolution because SubscriptionTier exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Star ON Star FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Star */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Star  MovieStar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021894", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStar
      WHERE
        /*  %JoinFKPK(MovieStar,deleted," = "," AND") */
        MovieStar.StarId = deleted.StarId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Star because MovieStar exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person  Star on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Star", FK_COLUMNS="PersonId" */
    IF EXISTS (SELECT * FROM deleted,Person
      WHERE
        /* %JoinFKPK(deleted,Person," = "," AND") */
        deleted.PersonId = Person.PersonId AND
        NOT EXISTS (
          SELECT * FROM Star
          WHERE
            /* %JoinFKPK(Star,Person," = "," AND") */
            Star.PersonId = Person.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Star because Person exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Star ON Star FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Star */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStarId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Star  MovieStar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000282f4", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StarId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStar
      WHERE
        /*  %JoinFKPK(MovieStar,deleted," = "," AND") */
        MovieStar.StarId = deleted.StarId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Star because MovieStar exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person  Star on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Star", FK_COLUMNS="PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person
        WHERE
          /* %JoinFKPK(inserted,Person) */
          inserted.PersonId = Person.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Star because Person does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Stream ON Stream FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Stream */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Subscription  Stream on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e312", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
    IF EXISTS (SELECT * FROM deleted,Subscription
      WHERE
        /* %JoinFKPK(deleted,Subscription," = "," AND") */
        deleted.SubscriptionId = Subscription.SubscriptionId AND
        NOT EXISTS (
          SELECT * FROM Stream
          WHERE
            /* %JoinFKPK(Stream,Subscription," = "," AND") */
            Stream.SubscriptionId = Subscription.SubscriptionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Stream because Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieResolution  Stream on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
    IF EXISTS (SELECT * FROM deleted,MovieResolution
      WHERE
        /* %JoinFKPK(deleted,MovieResolution," = "," AND") */
        deleted.MovieId = MovieResolution.MovieId AND
        deleted.ResolutionId = MovieResolution.ResolutionId AND
        NOT EXISTS (
          SELECT * FROM Stream
          WHERE
            /* %JoinFKPK(Stream,MovieResolution," = "," AND") */
            Stream.MovieId = MovieResolution.MovieId AND
            Stream.ResolutionId = MovieResolution.ResolutionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Stream because MovieResolution exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Stream ON Stream FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Stream */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Subscription  Stream on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003589c", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriptionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Subscription
        WHERE
          /* %JoinFKPK(inserted,Subscription) */
          inserted.SubscriptionId = Subscription.SubscriptionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SubscriptionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Stream because Subscription does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieResolution  Stream on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId) OR
    UPDATE(ResolutionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieResolution
        WHERE
          /* %JoinFKPK(inserted,MovieResolution) */
          inserted.MovieId = MovieResolution.MovieId and
          inserted.ResolutionId = MovieResolution.ResolutionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieId IS NULL AND
      inserted.ResolutionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Stream because MovieResolution does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Subscription ON Subscription FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Subscription */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Subscription  Stream on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00050238", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.SubscriptionId = deleted.SubscriptionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Subscription because Stream exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* SubscriptionTier  Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
    IF EXISTS (SELECT * FROM deleted,SubscriptionTier
      WHERE
        /* %JoinFKPK(deleted,SubscriptionTier," = "," AND") */
        deleted.SubscriptionTierId = SubscriptionTier.SubscriptionTierId AND
        NOT EXISTS (
          SELECT * FROM Subscription
          WHERE
            /* %JoinFKPK(Subscription,SubscriptionTier," = "," AND") */
            Subscription.SubscriptionTierId = SubscriptionTier.SubscriptionTierId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subscription because SubscriptionTier exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentId = Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Subscription
          WHERE
            /* %JoinFKPK(Subscription,Payment," = "," AND") */
            Subscription.PaymentId = Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subscription because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Subscription
          WHERE
            /* %JoinFKPK(Subscription,Customer," = "," AND") */
            Subscription.CustomerId = Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subscription because Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Subscription ON Subscription FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Subscription */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSubscriptionId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Subscription  Stream on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005d584", PARENT_OWNER="", PARENT_TABLE="Subscription"
    CHILD_OWNER="", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriptionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Stream
      WHERE
        /*  %JoinFKPK(Stream,deleted," = "," AND") */
        Stream.SubscriptionId = deleted.SubscriptionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Subscription because Stream exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* SubscriptionTier  Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriptionTierId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,SubscriptionTier
        WHERE
          /* %JoinFKPK(inserted,SubscriptionTier) */
          inserted.SubscriptionTierId = SubscriptionTier.SubscriptionTierId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SubscriptionTierId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subscription because SubscriptionTier does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentId = Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subscription because Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subscription because Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_SubscriptionTier ON SubscriptionTier FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SubscriptionTier */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* SubscriptionTier  Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a3ec", PARENT_OWNER="", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.SubscriptionTierId = deleted.SubscriptionTierId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete SubscriptionTier because Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Resolution  SubscriptionTier on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
    IF EXISTS (SELECT * FROM deleted,Resolution
      WHERE
        /* %JoinFKPK(deleted,Resolution," = "," AND") */
        deleted.HighestResolution = Resolution.ResolutionId AND
        NOT EXISTS (
          SELECT * FROM SubscriptionTier
          WHERE
            /* %JoinFKPK(SubscriptionTier,Resolution," = "," AND") */
            SubscriptionTier.HighestResolution = Resolution.ResolutionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SubscriptionTier because Resolution exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_SubscriptionTier ON SubscriptionTier FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SubscriptionTier */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSubscriptionTierId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* SubscriptionTier  Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f519", PARENT_OWNER="", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriptionTierId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subscription
      WHERE
        /*  %JoinFKPK(Subscription,deleted," = "," AND") */
        Subscription.SubscriptionTierId = deleted.SubscriptionTierId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update SubscriptionTier because Subscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Resolution  SubscriptionTier on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Resolution"
    CHILD_OWNER="", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HighestResolution)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Resolution
        WHERE
          /* %JoinFKPK(inserted,Resolution) */
          inserted.HighestResolution = Resolution.ResolutionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.HighestResolution IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SubscriptionTier because Resolution does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


