
CREATE SCHEMA [DefaultTestSchema]
go

CREATE SCHEMA [ConstraintTestSchema]
go

CREATE SCHEMA [HumanResources]
go

CREATE SCHEMA [Film]
go

CREATE SCHEMA [Service]
go

CREATE SCHEMA [Tech]
go

CREATE SCHEMA [Payment]
go

CREATE SCHEMA [Person]
go

CREATE TYPE [SurrogateKeyInt]
	FROM INT NULL
go

CREATE TYPE [TypeOfObject]
	FROM CHAR(12) NULL
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

CREATE TYPE [BooleanFlag]
	FROM BIT NULL
go

CREATE TYPE [DateNow]
	FROM TIME NULL
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

CREATE TYPE [StateAbbreviation]
	FROM CHAR(2) NULL
go

CREATE TYPE [ZipCode]
	FROM CHAR(5) NULL
go

CREATE TYPE [DateOfBirth]
	FROM DATETIME NULL
go

CREATE TYPE [GenderPronoun]
	FROM VARCHAR(20) NULL
go

CREATE DEFAULT [DefaultTestSchema].[df_TEST]
	AS 19.97
go

CREATE RULE [ConstraintTestSchema].[CK_testDeviceLimit]
	AS @col BETWEEN 0 AND 9
go

CREATE RULE [ConstraintTestSchema].[CK_Cost]
	AS @col BETWEEN 0.00 AND 99.99
go

CREATE RULE [ConstraintTestSchema].[CK_StreamStatus]
	AS @col IN ('In Use', 'Inactive', 'Paused')
go

CREATE RULE [ConstraintTestSchema].[CK_FrameRate]
	AS @col BETWEEN 1 AND 999
go

CREATE TABLE [Person].[Address]
( 
	[AddressId]          [SurrogateKeyInt]  NOT NULL ,
	[AddressState]       [StateAbbreviation]  NOT NULL 
	CONSTRAINT [CK_String_StateAbbreviation_1414573287]
		CHECK  ( [AddressState]='AL' OR [AddressState]='AK' OR [AddressState]='AZ' OR [AddressState]='AR' OR [AddressState]='CA' OR [AddressState]='CO' OR [AddressState]='CT' OR [AddressState]='DE' OR [AddressState]='FL' OR [AddressState]='GA' OR [AddressState]='HI' OR [AddressState]='ID' OR [AddressState]='IL' OR [AddressState]='IN' OR [AddressState]='IA' OR [AddressState]='KS' OR [AddressState]='KY' OR [AddressState]='LA' OR [AddressState]='ME' OR [AddressState]='MD' OR [AddressState]='MA' OR [AddressState]='MI' OR [AddressState]='MN' OR [AddressState]='MS' OR [AddressState]='MO' OR [AddressState]='MT' OR [AddressState]='NE' OR [AddressState]='NV' OR [AddressState]='NH' OR [AddressState]='NJ' OR [AddressState]='NM' OR [AddressState]='NY' OR [AddressState]='NC' OR [AddressState]='ND' OR [AddressState]='OH' OR [AddressState]='OK' OR [AddressState]='OR' OR [AddressState]='PA' OR [AddressState]='RI' OR [AddressState]='SC' OR [AddressState]='SD' OR [AddressState]='TN' OR [AddressState]='TX' OR [AddressState]='UT' OR [AddressState]='VT' OR [AddressState]='VA' OR [AddressState]='WA' OR [AddressState]='WV' OR [AddressState]='WI' OR [AddressState]='WY' ),
	[AddressCity]        varchar(20)  NOT NULL ,
	[AddressZipCode]     [ZipCode]  NOT NULL ,
	[AddressStreet]      varchar(40)  NOT NULL 
)
go

CREATE TABLE [Payment].[CardPayment]
( 
	[CardNumber]         char(16)  MASKED WITH (FUNCTION = 'default()') NULL ,
	[CardType]           char(20)  NULL ,
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[CardExpirationDate] char(4)  NULL ,
	[CardSecurityCode]   char(3)  NULL 
)
go

CREATE TABLE [Payment].[Check]
( 
	[BankNumber]         varchar(9)  MASKED WITH (FUNCTION = 'partial(0, "XX-XX-XX",4)') NULL ,
	[RoutingNumber]      varchar(9)  NULL ,
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[AccountType]        varchar(20)  NULL 
	CONSTRAINT [CK_AccountType_892274656]
		CHECK  ( [AccountType]='Checkings' OR [AccountType]='Savings' )
)
go

CREATE TABLE [Payment].[CreditCard]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[CardAccountType]    varchar(6)  NOT NULL 
	CONSTRAINT [CK_CardType_1720797842]
		CHECK  ( [CardAccountType]='Credit' OR [CardAccountType]='Debit' )
)
go

CREATE TABLE [Payment].[Cryptocurrency]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[PublicAddress]      varchar(35)  NULL 
)
go

CREATE TABLE [Service].[Customer]
( 
	[CustomerId]         [SurrogateKeyInt]  NOT NULL ,
	[PersonId]           [SurrogateKeyInt] 
)
go

CREATE TABLE [Payment].[CustomerPayment]
( 
	[CustomerId]         [SurrogateKeyInt]  NOT NULL ,
	[PaymentId]          [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [HumanResources].[CustomerService]
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

CREATE TABLE [HumanResources].[Employee]
( 
	[EmployeeId]         [SurrogateKeyInt]  NOT NULL ,
	[EmployeeSalary]     [Salary]  NOT NULL ,
	[EmployeeHireDate]   datetime  NOT NULL ,
	[EmployeeSupervisor] [SurrogateKeyInt] ,
	[EmployeePositionId] [SurrogateKeyInt]  NOT NULL ,
	[PersonId]           [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [HumanResources].[EmployeePosition]
( 
	[EmployeePositionId] [SurrogateKeyInt]  NOT NULL ,
	[EmployeePositionDescription] [LongDescription] ,
	[EmployeePositionName] [Name]  NOT NULL 
)
go

CREATE TABLE [Payment].[GiftCard]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Film].[Movie]
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

CREATE TABLE [Tech].[MovieResolution]
( 
	[MovieId]            [SurrogateKeyInt]  NOT NULL 
	CONSTRAINT [CK_NonZero_30650836]
		CHECK  ( MovieId >= 0 ),
	[ResolutionId]       [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Film].[MovieStar]
( 
	[MovieId]            [SurrogateKeyInt]  NOT NULL 
	CONSTRAINT [CK_NonZero_1566159774]
		CHECK  ( MovieId >= 0 ),
	[StarId]             [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Payment].[Payment]
( 
	[PaymentId]          [SurrogateKeyInt]  NOT NULL ,
	[PaymentType]        varchar(20)  NULL ,
	[PaymentAmount]      [Salary] ,
	[PaymentDate]        datetime  NULL 
)
go

CREATE TABLE [Person].[Person]
( 
	[PersonId]           [SurrogateKeyInt]  NOT NULL ,
	[PersonFirstName]    varchar(40)  NOT NULL ,
	[PersonLastName]     varchar(40)  NOT NULL ,
	[PersonEmailAddress] varchar(50)  NOT NULL ,
	[PersonPhoneNumber]  varchar(15)  NOT NULL ,
	[AddressId]          [SurrogateKeyInt]  NOT NULL ,
	[PersonDateOfBirth]  [DateOfBirth]  NOT NULL ,
	[PersonGenderPronoun] [GenderPronoun]  NOT NULL 
)
go

CREATE TABLE [Tech].[Resolution]
( 
	[ResolutionId]       [SurrogateKeyInt]  NOT NULL ,
	[Description]        [LongDescription] ,
	[FrameRate]          [FrameRate] ,
	[MovieFormat]        varchar(20)  NULL 
	CONSTRAINT [CK_MovieFormat_732463021]
		CHECK  ( [MovieFormat]='Valid_Value_1665' ),
	[Resolution]         varchar(50)  NULL 
	CONSTRAINT [CK_MovieResolution_961677524]
		CHECK  ( [Resolution]='720p60' OR [Resolution]='1080p60' OR [Resolution]='UHD' OR [Resolution]='720p30' )
)
go

CREATE TABLE [Film].[Star]
( 
	[StarId]             [SurrogateKeyInt]  NOT NULL ,
	[StageName]          [Name] ,
	[DateCreated]        datetime2(7)  NOT NULL ,
	[PersonId]           [SurrogateKeyInt] 
)
go

CREATE TABLE [Service].[Stream]
( 
	[StreamId]           [SurrogateKeyInt]  NOT NULL ,
	[Description]        [LongDescription] ,
	[IpAddress1]         [IPAddress] ,
	[IpAddress2]         [IPAddressString] ,
	[DateCreated]        [DateNow] ,
	[Expired]            [BooleanFlag] ,
	[Status]             [StreamStatus] ,
	[AverageFrameRate]   [FrameRate] ,
	[LastUpdated]        [DateNow] ,
	[MovieId]            [SurrogateKeyInt] 
	CONSTRAINT [CK_NonZero_666668979]
		CHECK  ( MovieId >= 0 ),
	[ResolutionId]       [SurrogateKeyInt]  NOT NULL ,
	[SubscriptionId]     [SurrogateKeyInt]  NOT NULL 
)
go

CREATE TABLE [Service].[Subscription]
( 
	[CustomerId]         [SurrogateKeyInt] ,
	[SubscriptionId]     [SurrogateKeyInt]  NOT NULL ,
	[PaymentId]          [SurrogateKeyInt] ,
	[SubscriptionTierId] [SurrogateKeyInt] 
)
go

CREATE TABLE [Service].[SubscriptionTier]
( 
	[SubscriptionTierId] [SurrogateKeyInt]  NOT NULL ,
	[SubscriptionTierDescription] varchar(100)  NULL ,
	[SubscriptionTierMonthlyCost] integer  NULL ,
	[SubscriptionTierYearlyCost] integer  NULL ,
	[SubscriptionTierConcurrentDeviceLimit] tinyint  NULL ,
	[HighestResolution]  [SurrogateKeyInt] 
)
go

ALTER TABLE [Person].[Address]
	ADD CONSTRAINT [XPKAddress] PRIMARY KEY  CLUSTERED ([AddressId] ASC)
go

ALTER TABLE [Person].[Address]
	ADD CONSTRAINT [XAK1Address] UNIQUE ([AddressCity]  ASC,[AddressState]  ASC,[AddressStreet]  ASC,[AddressZipCode]  ASC)
go

ALTER TABLE [Payment].[CardPayment]
	ADD CONSTRAINT [XPKCardPayment] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Payment].[Check]
	ADD CONSTRAINT [XPKCheck] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Payment].[CreditCard]
	ADD CONSTRAINT [XPKCreditCard] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Payment].[Cryptocurrency]
	ADD CONSTRAINT [XPKCryptocurrency] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Service].[Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC)
go

ALTER TABLE [Service].[Customer]
	ADD CONSTRAINT [XAK1UniquePerson] UNIQUE ([PersonId]  ASC)
go

ALTER TABLE [Payment].[CustomerPayment]
	ADD CONSTRAINT [XPKCustomer_Payment] PRIMARY KEY  CLUSTERED ([CustomerId] ASC,[PaymentId] ASC)
go

ALTER TABLE [HumanResources].[CustomerService]
	ADD CONSTRAINT [XPKCustomerService] PRIMARY KEY  CLUSTERED ([ServiceId] ASC)
go

ALTER TABLE [HumanResources].[Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC,[PersonId] ASC)
go

ALTER TABLE [HumanResources].[Employee]
	ADD CONSTRAINT [XAK1Person] UNIQUE ([PersonId]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Supervisor] ON [HumanResources].[Employee]
( 
	[EmployeeId]          ASC
)
go

ALTER TABLE [HumanResources].[EmployeePosition]
	ADD CONSTRAINT [XPKEmployeePosition] PRIMARY KEY  CLUSTERED ([EmployeePositionId] ASC)
go

ALTER TABLE [Payment].[GiftCard]
	ADD CONSTRAINT [XPKGiftCard] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Film].[Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieId] ASC)
go

ALTER TABLE [Tech].[MovieResolution]
	ADD CONSTRAINT [XPKMovie_Resolution] PRIMARY KEY  CLUSTERED ([MovieId] ASC,[ResolutionId] ASC)
go

ALTER TABLE [Film].[MovieStar]
	ADD CONSTRAINT [XPKMovie_Star] PRIMARY KEY  CLUSTERED ([StarId] ASC,[MovieId] ASC)
go

ALTER TABLE [Payment].[Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentId] ASC)
go

ALTER TABLE [Person].[Person]
	ADD CONSTRAINT [XPKPerson] PRIMARY KEY  CLUSTERED ([PersonId] ASC)
go

ALTER TABLE [Tech].[Resolution]
	ADD CONSTRAINT [XPKResolution] PRIMARY KEY  CLUSTERED ([ResolutionId] ASC)
go

ALTER TABLE [Tech].[Resolution]
	ADD CONSTRAINT [Code] UNIQUE ([Resolution]  ASC,[FrameRate]  ASC)
go

ALTER TABLE [Film].[Star]
	ADD CONSTRAINT [XPKStar] PRIMARY KEY  CLUSTERED ([StarId] ASC)
go

ALTER TABLE [Film].[Star]
	ADD CONSTRAINT [XAK1StageNamePerson] UNIQUE ([PersonId]  ASC,[StageName]  ASC)
go

ALTER TABLE [Service].[Stream]
	ADD CONSTRAINT [XPKStream] PRIMARY KEY  CLUSTERED ([StreamId] ASC)
go

ALTER TABLE [Service].[Subscription]
	ADD CONSTRAINT [XPKSubscription] PRIMARY KEY  CLUSTERED ([SubscriptionId] ASC)
go

ALTER TABLE [Service].[SubscriptionTier]
	ADD CONSTRAINT [XPKSubscriptionTier] PRIMARY KEY  CLUSTERED ([SubscriptionTierId] ASC)
go


ALTER TABLE [Payment].[CardPayment]
	ADD CONSTRAINT [FK_Payment_CardPayment] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[Payment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Payment].[Check]
	ADD CONSTRAINT [FK_Payment_Check] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[Payment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Payment].[CreditCard]
	ADD CONSTRAINT [FK_CardPayment_CreditCard] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[CardPayment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Payment].[Cryptocurrency]
	ADD CONSTRAINT [FK_Payment_Cryptocurrency] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[Payment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Service].[Customer]
	ADD CONSTRAINT [FK_Person_Customer] FOREIGN KEY ([PersonId]) REFERENCES [Person].[Person]([PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment].[CustomerPayment]
	ADD CONSTRAINT [FK_Customer_CustomerPayment] FOREIGN KEY ([CustomerId]) REFERENCES [Service].[Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment].[CustomerPayment]
	ADD CONSTRAINT [FK_Payment_CustomerPayment] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[Payment]([PaymentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [HumanResources].[CustomerService]
	ADD CONSTRAINT [FK_Employee_CustomerService] FOREIGN KEY ([EmployeeId],[PersonId]) REFERENCES [HumanResources].[Employee]([EmployeeId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [HumanResources].[CustomerService]
	ADD CONSTRAINT [FK_Customer_CustomerService] FOREIGN KEY ([CustomerId]) REFERENCES [Service].[Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [HumanResources].[Employee]
	ADD CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([EmployeeId],[PersonId]) REFERENCES [HumanResources].[Employee]([EmployeeId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [HumanResources].[Employee]
	ADD CONSTRAINT [FK_EmployeePosition_Employee] FOREIGN KEY ([EmployeePositionId]) REFERENCES [HumanResources].[EmployeePosition]([EmployeePositionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [HumanResources].[Employee]
	ADD CONSTRAINT [FK_Person_Employee] FOREIGN KEY ([PersonId]) REFERENCES [Person].[Person]([PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment].[GiftCard]
	ADD CONSTRAINT [FK_CardPayment_GiftCard] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[CardPayment]([PaymentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Tech].[MovieResolution]
	ADD CONSTRAINT [FK_Movie_MovieResolution] FOREIGN KEY ([MovieId]) REFERENCES [Film].[Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Tech].[MovieResolution]
	ADD CONSTRAINT [FK_Resolution_MovieResolution] FOREIGN KEY ([ResolutionId]) REFERENCES [Tech].[Resolution]([ResolutionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Film].[MovieStar]
	ADD CONSTRAINT [FK_Movie_MovieStar] FOREIGN KEY ([MovieId]) REFERENCES [Film].[Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Film].[MovieStar]
	ADD CONSTRAINT [FK_Star_MovieStar] FOREIGN KEY ([StarId]) REFERENCES [Film].[Star]([StarId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Person].[Person]
	ADD CONSTRAINT [FK_Address_Person] FOREIGN KEY ([AddressId]) REFERENCES [Person].[Address]([AddressId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Film].[Star]
	ADD CONSTRAINT [FK_Person_Star] FOREIGN KEY ([PersonId]) REFERENCES [Person].[Person]([PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[ConstraintTestSchema].[CK_StreamStatus]', '[Service].[Stream].[Status]'
go


ALTER TABLE [Service].[Stream]
	ADD CONSTRAINT [FK_MovieResolution_Stream] FOREIGN KEY ([MovieId],[ResolutionId]) REFERENCES [Tech].[MovieResolution]([MovieId],[ResolutionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Service].[Stream]
	ADD CONSTRAINT [FK_Subscription_Stream] FOREIGN KEY ([SubscriptionId]) REFERENCES [Service].[Subscription]([SubscriptionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Service].[Subscription]
	ADD CONSTRAINT [FK_Customer_Subscription] FOREIGN KEY ([CustomerId]) REFERENCES [Service].[Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Service].[Subscription]
	ADD CONSTRAINT [FK_Payment_Subscription] FOREIGN KEY ([PaymentId]) REFERENCES [Payment].[Payment]([PaymentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Service].[Subscription]
	ADD CONSTRAINT [FK_SubscriptionTier_Subscription] FOREIGN KEY ([SubscriptionTierId]) REFERENCES [Service].[SubscriptionTier]([SubscriptionTierId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[ConstraintTestSchema].[CK_testDeviceLimit]', '[Service].[SubscriptionTier].[SubscriptionTierConcurrentDeviceLimit]'
go


ALTER TABLE [Service].[SubscriptionTier]
	ADD CONSTRAINT [FK_Resolution_SubscriptionTier] FOREIGN KEY ([HighestResolution]) REFERENCES [Tech].[Resolution]([ResolutionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
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




CREATE TRIGGER Payment.tD_CardPayment ON Payment.CardPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CardPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.CardPayment  Payment.CreditCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00035fc5", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
    DELETE Payment.CreditCard
      FROM Payment.CreditCard,deleted
      WHERE
        /*  %JoinFKPK(Payment.CreditCard,deleted," = "," AND") */
        Payment.CreditCard.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment.CardPayment  Payment.GiftCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
    DELETE Payment.GiftCard
      FROM Payment.GiftCard,deleted
      WHERE
        /*  %JoinFKPK(Payment.GiftCard,deleted," = "," AND") */
        Payment.GiftCard.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.CardPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.Payment
      WHERE
        /* %JoinFKPK(deleted,Payment.Payment," = "," AND") */
        deleted.PaymentId = Payment.Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Payment.CardPayment
          WHERE
            /* %JoinFKPK(Payment.CardPayment,Payment.Payment," = "," AND") */
            Payment.CardPayment.PaymentId = Payment.Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.CardPayment because Payment.Payment exists.'
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


CREATE TRIGGER Payment.tU_CardPayment ON Payment.CardPayment FOR UPDATE AS
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
  /* Payment.CardPayment  Payment.CreditCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0004a5d6", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="CreditCard"
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
      UPDATE Payment.CreditCard
      SET
        /*  %JoinFKPK(Payment.CreditCard,@ins," = ",",") */
        Payment.CreditCard.PaymentId = @insPaymentId
      FROM Payment.CreditCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(Payment.CreditCard,deleted," = "," AND") */
        Payment.CreditCard.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment.CardPayment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.CardPayment  Payment.GiftCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="GiftCard"
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
      UPDATE Payment.GiftCard
      SET
        /*  %JoinFKPK(Payment.GiftCard,@ins," = ",",") */
        Payment.GiftCard.PaymentId = @insPaymentId
      FROM Payment.GiftCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(Payment.GiftCard,deleted," = "," AND") */
        Payment.GiftCard.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment.CardPayment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.Payment  Payment.CardPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.Payment
        WHERE
          /* %JoinFKPK(inserted,Payment.Payment) */
          inserted.PaymentId = Payment.Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.CardPayment because Payment.Payment does not exist.'
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




CREATE TRIGGER Payment.tD_Check ON Payment.[Check] FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Check */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.Check on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016642", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.Payment
      WHERE
        /* %JoinFKPK(deleted,Payment.Payment," = "," AND") */
        deleted.PaymentId = Payment.Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Payment.[Check]
          WHERE
            /* %JoinFKPK(Payment.Check,Payment.Payment," = "," AND") */
            Payment.[Check].PaymentId = Payment.Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.Check because Payment.Payment exists.'
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


CREATE TRIGGER Payment.tU_Check ON Payment.[Check] FOR UPDATE AS
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
  /* Payment.Payment  Payment.Check on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000180b2", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.Payment
        WHERE
          /* %JoinFKPK(inserted,Payment.Payment) */
          inserted.PaymentId = Payment.Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.Check because Payment.Payment does not exist.'
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




CREATE TRIGGER Payment.tD_CreditCard ON Payment.CreditCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CreditCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.CardPayment  Payment.CreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001917c", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.CardPayment
      WHERE
        /* %JoinFKPK(deleted,Payment.CardPayment," = "," AND") */
        deleted.PaymentId = Payment.CardPayment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Payment.CreditCard
          WHERE
            /* %JoinFKPK(Payment.CreditCard,Payment.CardPayment," = "," AND") */
            Payment.CreditCard.PaymentId = Payment.CardPayment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.CreditCard because Payment.CardPayment exists.'
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


CREATE TRIGGER Payment.tU_CreditCard ON Payment.CreditCard FOR UPDATE AS
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
  /* Payment.CardPayment  Payment.CreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001a095", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_CreditCard", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.CardPayment
        WHERE
          /* %JoinFKPK(inserted,Payment.CardPayment) */
          inserted.PaymentId = Payment.CardPayment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.CreditCard because Payment.CardPayment does not exist.'
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




CREATE TRIGGER Payment.tD_Cryptocurrency ON Payment.Cryptocurrency FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Cryptocurrency */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.Cryptocurrency on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00018e27", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.Payment
      WHERE
        /* %JoinFKPK(deleted,Payment.Payment," = "," AND") */
        deleted.PaymentId = Payment.Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Payment.Cryptocurrency
          WHERE
            /* %JoinFKPK(Payment.Cryptocurrency,Payment.Payment," = "," AND") */
            Payment.Cryptocurrency.PaymentId = Payment.Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.Cryptocurrency because Payment.Payment exists.'
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


CREATE TRIGGER Payment.tU_Cryptocurrency ON Payment.Cryptocurrency FOR UPDATE AS
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
  /* Payment.Payment  Payment.Cryptocurrency on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000195a6", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.Payment
        WHERE
          /* %JoinFKPK(inserted,Payment.Payment) */
          inserted.PaymentId = Payment.Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.Cryptocurrency because Payment.Payment does not exist.'
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




CREATE TRIGGER Service.tD_Customer ON Service.Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Service.Customer  HumanResources.CustomerService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004fe9a", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.CustomerService
      WHERE
        /*  %JoinFKPK(HumanResources.CustomerService,deleted," = "," AND") */
        HumanResources.CustomerService.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Service.Customer because HumanResources.CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Service.Customer  Payment.CustomerPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment.CustomerPayment
      WHERE
        /*  %JoinFKPK(Payment.CustomerPayment,deleted," = "," AND") */
        Payment.CustomerPayment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Service.Customer because Payment.CustomerPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Service.Customer  Service.Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Service.Subscription
      WHERE
        /*  %JoinFKPK(Service.Subscription,deleted," = "," AND") */
        Service.Subscription.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Service.Customer because Service.Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person.Person  Service.Customer on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Service", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Customer", FK_COLUMNS="PersonId" */
    IF EXISTS (SELECT * FROM deleted,Person.Person
      WHERE
        /* %JoinFKPK(deleted,Person.Person," = "," AND") */
        deleted.PersonId = Person.Person.PersonId AND
        NOT EXISTS (
          SELECT * FROM Service.Customer
          WHERE
            /* %JoinFKPK(Service.Customer,Person.Person," = "," AND") */
            Service.Customer.PersonId = Person.Person.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.Customer because Person.Person exists.'
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


CREATE TRIGGER Service.tU_Customer ON Service.Customer FOR UPDATE AS
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
  /* Service.Customer  HumanResources.CustomerService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005903e", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.CustomerService
      WHERE
        /*  %JoinFKPK(HumanResources.CustomerService,deleted," = "," AND") */
        HumanResources.CustomerService.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Service.Customer because HumanResources.CustomerService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Service.Customer  Payment.CustomerPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment.CustomerPayment
      WHERE
        /*  %JoinFKPK(Payment.CustomerPayment,deleted," = "," AND") */
        Payment.CustomerPayment.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Service.Customer because Payment.CustomerPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Service.Customer  Service.Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.Subscription
      WHERE
        /*  %JoinFKPK(Service.Subscription,deleted," = "," AND") */
        Service.Subscription.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Service.Customer because Service.Subscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person.Person  Service.Customer on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Service", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Customer", FK_COLUMNS="PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person.Person
        WHERE
          /* %JoinFKPK(inserted,Person.Person) */
          inserted.PersonId = Person.Person.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.Customer because Person.Person does not exist.'
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




CREATE TRIGGER Payment.tD_CustomerPayment ON Payment.CustomerPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.CustomerPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00031542", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.Payment
      WHERE
        /* %JoinFKPK(deleted,Payment.Payment," = "," AND") */
        deleted.PaymentId = Payment.Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Payment.CustomerPayment
          WHERE
            /* %JoinFKPK(Payment.CustomerPayment,Payment.Payment," = "," AND") */
            Payment.CustomerPayment.PaymentId = Payment.Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.CustomerPayment because Payment.Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Service.Customer  Payment.CustomerPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Service.Customer
      WHERE
        /* %JoinFKPK(deleted,Service.Customer," = "," AND") */
        deleted.CustomerId = Service.Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Payment.CustomerPayment
          WHERE
            /* %JoinFKPK(Payment.CustomerPayment,Service.Customer," = "," AND") */
            Payment.CustomerPayment.CustomerId = Service.Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.CustomerPayment because Service.Customer exists.'
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


CREATE TRIGGER Payment.tU_CustomerPayment ON Payment.CustomerPayment FOR UPDATE AS
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
  /* Payment.Payment  Payment.CustomerPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000314cd", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.Payment
        WHERE
          /* %JoinFKPK(inserted,Payment.Payment) */
          inserted.PaymentId = Payment.Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.CustomerPayment because Payment.Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Service.Customer  Payment.CustomerPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerPayment", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Service.Customer
        WHERE
          /* %JoinFKPK(inserted,Service.Customer) */
          inserted.CustomerId = Service.Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.CustomerPayment because Service.Customer does not exist.'
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




CREATE TRIGGER HumanResources.tD_CustomerService ON HumanResources.CustomerService FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerService */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Service.Customer  HumanResources.CustomerService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003a3fc", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Service.Customer
      WHERE
        /* %JoinFKPK(deleted,Service.Customer," = "," AND") */
        deleted.CustomerId = Service.Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.CustomerService
          WHERE
            /* %JoinFKPK(HumanResources.CustomerService,Service.Customer," = "," AND") */
            HumanResources.CustomerService.CustomerId = Service.Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.CustomerService because Service.Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Employee  HumanResources.CustomerService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /* %JoinFKPK(deleted,HumanResources.Employee," = "," AND") */
        deleted.EmployeeId = HumanResources.Employee.EmployeeId AND
        deleted.PersonId = HumanResources.Employee.PersonId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.CustomerService
          WHERE
            /* %JoinFKPK(HumanResources.CustomerService,HumanResources.Employee," = "," AND") */
            HumanResources.CustomerService.EmployeeId = HumanResources.Employee.EmployeeId AND
            HumanResources.CustomerService.PersonId = HumanResources.Employee.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.CustomerService because HumanResources.Employee exists.'
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


CREATE TRIGGER HumanResources.tU_CustomerService ON HumanResources.CustomerService FOR UPDATE AS
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
  /* Service.Customer  HumanResources.CustomerService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003b7dc", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_CustomerService", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Service.Customer
        WHERE
          /* %JoinFKPK(inserted,Service.Customer) */
          inserted.CustomerId = Service.Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.CustomerService because Service.Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Employee  HumanResources.CustomerService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.Employee
        WHERE
          /* %JoinFKPK(inserted,HumanResources.Employee) */
          inserted.EmployeeId = HumanResources.Employee.EmployeeId and
          inserted.PersonId = HumanResources.Employee.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.CustomerService because HumanResources.Employee does not exist.'
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




CREATE TRIGGER HumanResources.tD_Employee ON HumanResources.Employee FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Employee */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* HumanResources.Employee  HumanResources.Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0007bc15", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.EmployeeId = deleted.EmployeeId AND
        HumanResources.Employee.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.Employee because HumanResources.Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Employee  HumanResources.CustomerService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.CustomerService
      WHERE
        /*  %JoinFKPK(HumanResources.CustomerService,deleted," = "," AND") */
        HumanResources.CustomerService.EmployeeId = deleted.EmployeeId AND
        HumanResources.CustomerService.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.Employee because HumanResources.CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person.Person  HumanResources.Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Employee", FK_COLUMNS="PersonId" */
    IF EXISTS (SELECT * FROM deleted,Person.Person
      WHERE
        /* %JoinFKPK(deleted,Person.Person," = "," AND") */
        deleted.PersonId = Person.Person.PersonId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.Employee
          WHERE
            /* %JoinFKPK(HumanResources.Employee,Person.Person," = "," AND") */
            HumanResources.Employee.PersonId = Person.Person.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.Employee because Person.Person exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.EmployeePosition  HumanResources.Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.EmployeePosition
      WHERE
        /* %JoinFKPK(deleted,HumanResources.EmployeePosition," = "," AND") */
        deleted.EmployeePositionId = HumanResources.EmployeePosition.EmployeePositionId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.Employee
          WHERE
            /* %JoinFKPK(HumanResources.Employee,HumanResources.EmployeePosition," = "," AND") */
            HumanResources.Employee.EmployeePositionId = HumanResources.EmployeePosition.EmployeePositionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.Employee because HumanResources.EmployeePosition exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Employee  HumanResources.Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /* %JoinFKPK(deleted,HumanResources.Employee," = "," AND") */
        deleted.EmployeeId = HumanResources.Employee.EmployeeId AND
        deleted.PersonId = HumanResources.Employee.PersonId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.Employee
          WHERE
            /* %JoinFKPK(HumanResources.Employee,HumanResources.Employee," = "," AND") */
            HumanResources.Employee.EmployeeId = HumanResources.Employee.EmployeeId AND
            HumanResources.Employee.PersonId = HumanResources.Employee.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.Employee because HumanResources.Employee exists.'
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


CREATE TRIGGER HumanResources.tU_Employee ON HumanResources.Employee FOR UPDATE AS
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
  /* HumanResources.Employee  HumanResources.Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00086289", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.EmployeeId = deleted.EmployeeId AND
        HumanResources.Employee.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.Employee because HumanResources.Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Employee  HumanResources.CustomerService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_CustomerService", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.CustomerService
      WHERE
        /*  %JoinFKPK(HumanResources.CustomerService,deleted," = "," AND") */
        HumanResources.CustomerService.EmployeeId = deleted.EmployeeId AND
        HumanResources.CustomerService.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.Employee because HumanResources.CustomerService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person.Person  HumanResources.Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Employee", FK_COLUMNS="PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person.Person
        WHERE
          /* %JoinFKPK(inserted,Person.Person) */
          inserted.PersonId = Person.Person.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.Employee because Person.Person does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.EmployeePosition  HumanResources.Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeePositionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.EmployeePosition
        WHERE
          /* %JoinFKPK(inserted,HumanResources.EmployeePosition) */
          inserted.EmployeePositionId = HumanResources.EmployeePosition.EmployeePositionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeePositionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.Employee because HumanResources.EmployeePosition does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Employee  HumanResources.Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Employee"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Employee_Employee", FK_COLUMNS="EmployeeId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.Employee
        WHERE
          /* %JoinFKPK(inserted,HumanResources.Employee) */
          inserted.EmployeeId = HumanResources.Employee.EmployeeId and
          inserted.PersonId = HumanResources.Employee.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.Employee because HumanResources.Employee does not exist.'
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




CREATE TRIGGER HumanResources.tD_EmployeePosition ON HumanResources.EmployeePosition FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EmployeePosition */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* HumanResources.EmployeePosition  HumanResources.Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001623f", PARENT_OWNER="HumanResources", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.EmployeePositionId = deleted.EmployeePositionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.EmployeePosition because HumanResources.Employee exists.'
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


CREATE TRIGGER HumanResources.tU_EmployeePosition ON HumanResources.EmployeePosition FOR UPDATE AS
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
  /* HumanResources.EmployeePosition  HumanResources.Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00018baf", PARENT_OWNER="HumanResources", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_EmployeePosition_Employee", FK_COLUMNS="EmployeePositionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeePositionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.EmployeePositionId = deleted.EmployeePositionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.EmployeePosition because HumanResources.Employee exists.'
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




CREATE TRIGGER Payment.tD_GiftCard ON Payment.GiftCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on GiftCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.CardPayment  Payment.GiftCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00018d4a", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.CardPayment
      WHERE
        /* %JoinFKPK(deleted,Payment.CardPayment," = "," AND") */
        deleted.PaymentId = Payment.CardPayment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Payment.GiftCard
          WHERE
            /* %JoinFKPK(Payment.GiftCard,Payment.CardPayment," = "," AND") */
            Payment.GiftCard.PaymentId = Payment.CardPayment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment.GiftCard because Payment.CardPayment exists.'
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


CREATE TRIGGER Payment.tU_GiftCard ON Payment.GiftCard FOR UPDATE AS
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
  /* Payment.CardPayment  Payment.GiftCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000198e2", PARENT_OWNER="Payment", PARENT_TABLE="CardPayment"
    CHILD_OWNER="Payment", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_CardPayment_GiftCard", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.CardPayment
        WHERE
          /* %JoinFKPK(inserted,Payment.CardPayment) */
          inserted.PaymentId = Payment.CardPayment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment.GiftCard because Payment.CardPayment does not exist.'
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




CREATE TRIGGER Film.tD_Movie ON Film.Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Film.Movie  Film.MovieStar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023b25", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,Film.MovieStar
      WHERE
        /*  %JoinFKPK(Film.MovieStar,deleted," = "," AND") */
        Film.MovieStar.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Film.Movie because Film.MovieStar exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Film.Movie  Tech.MovieResolution on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,Tech.MovieResolution
      WHERE
        /*  %JoinFKPK(Tech.MovieResolution,deleted," = "," AND") */
        Tech.MovieResolution.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Film.Movie because Tech.MovieResolution exists.'
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


CREATE TRIGGER Film.tU_Movie ON Film.Movie FOR UPDATE AS
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
  /* Film.Movie  Film.MovieStar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000266f5", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Film.MovieStar
      WHERE
        /*  %JoinFKPK(Film.MovieStar,deleted," = "," AND") */
        Film.MovieStar.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Film.Movie because Film.MovieStar exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Film.Movie  Tech.MovieResolution on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Tech.MovieResolution
      WHERE
        /*  %JoinFKPK(Tech.MovieResolution,deleted," = "," AND") */
        Tech.MovieResolution.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Film.Movie because Tech.MovieResolution exists.'
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




CREATE TRIGGER Tech.tD_MovieResolution ON Tech.MovieResolution FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieResolution */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Tech.MovieResolution  Service.Stream on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00040fd5", PARENT_OWNER="Tech", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
    IF EXISTS (
      SELECT * FROM deleted,Service.Stream
      WHERE
        /*  %JoinFKPK(Service.Stream,deleted," = "," AND") */
        Service.Stream.MovieId = deleted.MovieId AND
        Service.Stream.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Tech.MovieResolution because Service.Stream exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Tech.Resolution  Tech.MovieResolution on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
    IF EXISTS (SELECT * FROM deleted,Tech.Resolution
      WHERE
        /* %JoinFKPK(deleted,Tech.Resolution," = "," AND") */
        deleted.ResolutionId = Tech.Resolution.ResolutionId AND
        NOT EXISTS (
          SELECT * FROM Tech.MovieResolution
          WHERE
            /* %JoinFKPK(Tech.MovieResolution,Tech.Resolution," = "," AND") */
            Tech.MovieResolution.ResolutionId = Tech.Resolution.ResolutionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Tech.MovieResolution because Tech.Resolution exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Film.Movie  Tech.MovieResolution on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Film.Movie
      WHERE
        /* %JoinFKPK(deleted,Film.Movie," = "," AND") */
        deleted.MovieId = Film.Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM Tech.MovieResolution
          WHERE
            /* %JoinFKPK(Tech.MovieResolution,Film.Movie," = "," AND") */
            Tech.MovieResolution.MovieId = Film.Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Tech.MovieResolution because Film.Movie exists.'
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


CREATE TRIGGER Tech.tU_MovieResolution ON Tech.MovieResolution FOR UPDATE AS
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
  /* Tech.MovieResolution  Service.Stream on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00044af3", PARENT_OWNER="Tech", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId) OR
    UPDATE(ResolutionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.Stream
      WHERE
        /*  %JoinFKPK(Service.Stream,deleted," = "," AND") */
        Service.Stream.MovieId = deleted.MovieId AND
        Service.Stream.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Tech.MovieResolution because Service.Stream exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Tech.Resolution  Tech.MovieResolution on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ResolutionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Tech.Resolution
        WHERE
          /* %JoinFKPK(inserted,Tech.Resolution) */
          inserted.ResolutionId = Tech.Resolution.ResolutionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Tech.MovieResolution because Tech.Resolution does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Film.Movie  Tech.MovieResolution on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieResolution", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Film.Movie
        WHERE
          /* %JoinFKPK(inserted,Film.Movie) */
          inserted.MovieId = Film.Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Tech.MovieResolution because Film.Movie does not exist.'
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




CREATE TRIGGER Film.tD_MovieStar ON Film.MovieStar FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStar */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Film.Star  Film.MovieStar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002965d", PARENT_OWNER="Film", PARENT_TABLE="Star"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
    IF EXISTS (SELECT * FROM deleted,Film.Star
      WHERE
        /* %JoinFKPK(deleted,Film.Star," = "," AND") */
        deleted.StarId = Film.Star.StarId AND
        NOT EXISTS (
          SELECT * FROM Film.MovieStar
          WHERE
            /* %JoinFKPK(Film.MovieStar,Film.Star," = "," AND") */
            Film.MovieStar.StarId = Film.Star.StarId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Film.MovieStar because Film.Star exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Film.Movie  Film.MovieStar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Film.Movie
      WHERE
        /* %JoinFKPK(deleted,Film.Movie," = "," AND") */
        deleted.MovieId = Film.Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM Film.MovieStar
          WHERE
            /* %JoinFKPK(Film.MovieStar,Film.Movie," = "," AND") */
            Film.MovieStar.MovieId = Film.Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Film.MovieStar because Film.Movie exists.'
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


CREATE TRIGGER Film.tU_MovieStar ON Film.MovieStar FOR UPDATE AS
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
  /* Film.Star  Film.MovieStar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c5ec", PARENT_OWNER="Film", PARENT_TABLE="Star"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StarId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Film.Star
        WHERE
          /* %JoinFKPK(inserted,Film.Star) */
          inserted.StarId = Film.Star.StarId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Film.MovieStar because Film.Star does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Film.Movie  Film.MovieStar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Film", PARENT_TABLE="Movie"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_MovieStar", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Film.Movie
        WHERE
          /* %JoinFKPK(inserted,Film.Movie) */
          inserted.MovieId = Film.Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Film.MovieStar because Film.Movie does not exist.'
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




CREATE TRIGGER Payment.tD_Payment ON Payment.Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.CustomerPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00051102", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment.CustomerPayment
      WHERE
        /*  %JoinFKPK(Payment.CustomerPayment,deleted," = "," AND") */
        Payment.CustomerPayment.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment.Payment because Payment.CustomerPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.Cryptocurrency on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Cryptocurrency"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Cryptocurrency", FK_COLUMNS="PaymentId" */
    DELETE Payment.Cryptocurrency
      FROM Payment.Cryptocurrency,deleted
      WHERE
        /*  %JoinFKPK(Payment.Cryptocurrency,deleted," = "," AND") */
        Payment.Cryptocurrency.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.Check on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Check"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Check", FK_COLUMNS="PaymentId" */
    DELETE Payment.[Check]
      FROM Payment.[Check],deleted
      WHERE
        /*  %JoinFKPK(Payment.Check,deleted," = "," AND") */
        Payment.[Check].PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment.Payment  Payment.CardPayment on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CardPayment", FK_COLUMNS="PaymentId" */
    DELETE Payment.CardPayment
      FROM Payment.CardPayment,deleted
      WHERE
        /*  %JoinFKPK(Payment.CardPayment,deleted," = "," AND") */
        Payment.CardPayment.PaymentId = deleted.PaymentId

    /* erwin Builtin Trigger */
    /* Payment.Payment  Service.Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
    IF EXISTS (
      SELECT * FROM deleted,Service.Subscription
      WHERE
        /*  %JoinFKPK(Service.Subscription,deleted," = "," AND") */
        Service.Subscription.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment.Payment because Service.Subscription exists.'
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


CREATE TRIGGER Payment.tU_Payment ON Payment.Payment FOR UPDATE AS
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
  /* Payment.Payment  Payment.CustomerPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00075b0a", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CustomerPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_CustomerPayment", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment.CustomerPayment
      WHERE
        /*  %JoinFKPK(Payment.CustomerPayment,deleted," = "," AND") */
        Payment.CustomerPayment.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment.Payment because Payment.CustomerPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.Payment  Payment.Cryptocurrency on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Cryptocurrency"
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
      UPDATE Payment.Cryptocurrency
      SET
        /*  %JoinFKPK(Payment.Cryptocurrency,@ins," = ",",") */
        Payment.Cryptocurrency.PaymentId = @insPaymentId
      FROM Payment.Cryptocurrency,inserted,deleted
      WHERE
        /*  %JoinFKPK(Payment.Cryptocurrency,deleted," = "," AND") */
        Payment.Cryptocurrency.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment.Payment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.Payment  Payment.Check on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="Check"
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
      UPDATE Payment.[Check]
      SET
        /*  %JoinFKPK(Payment.Check,@ins," = ",",") */
        Payment.[Check].PaymentId = @insPaymentId
      FROM Payment.[Check],inserted,deleted
      WHERE
        /*  %JoinFKPK(Payment.Check,deleted," = "," AND") */
        Payment.[Check].PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment.Payment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.Payment  Payment.CardPayment on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Payment", CHILD_TABLE="CardPayment"
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
      UPDATE Payment.CardPayment
      SET
        /*  %JoinFKPK(Payment.CardPayment,@ins," = ",",") */
        Payment.CardPayment.PaymentId = @insPaymentId
      FROM Payment.CardPayment,inserted,deleted
      WHERE
        /*  %JoinFKPK(Payment.CardPayment,deleted," = "," AND") */
        Payment.CardPayment.PaymentId = deleted.PaymentId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Payment.Payment update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.Payment  Service.Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.Subscription
      WHERE
        /*  %JoinFKPK(Service.Subscription,deleted," = "," AND") */
        Service.Subscription.PaymentId = deleted.PaymentId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment.Payment because Service.Subscription exists.'
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




CREATE TRIGGER Person.tD_Person ON Person.Person FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Person */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Person.Person  HumanResources.Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004ad74", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Employee", FK_COLUMNS="PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Person.Person because HumanResources.Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person.Person  Film.Star on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Film", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Star", FK_COLUMNS="PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,Film.Star
      WHERE
        /*  %JoinFKPK(Film.Star,deleted," = "," AND") */
        Film.Star.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Person.Person because Film.Star exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person.Person  Service.Customer on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Service", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Customer", FK_COLUMNS="PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,Service.Customer
      WHERE
        /*  %JoinFKPK(Service.Customer,deleted," = "," AND") */
        Service.Customer.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Person.Person because Service.Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person.Address belongs to a Person.Person on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Address"
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
  /* Person.Person  HumanResources.Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000516e8", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Employee", FK_COLUMNS="PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Employee
      WHERE
        /*  %JoinFKPK(HumanResources.Employee,deleted," = "," AND") */
        HumanResources.Employee.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Person.Person because HumanResources.Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person.Person  Film.Star on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Film", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Star", FK_COLUMNS="PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Film.Star
      WHERE
        /*  %JoinFKPK(Film.Star,deleted," = "," AND") */
        Film.Star.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Person.Person because Film.Star exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person.Person  Service.Customer on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Service", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Customer", FK_COLUMNS="PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.Customer
      WHERE
        /*  %JoinFKPK(Service.Customer,deleted," = "," AND") */
        Service.Customer.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Person.Person because Service.Customer exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person.Address belongs to a Person.Person on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Address"
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




CREATE TRIGGER Tech.tD_Resolution ON Tech.Resolution FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Resolution */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Tech.Resolution  Tech.MovieResolution on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027bf8", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
    IF EXISTS (
      SELECT * FROM deleted,Tech.MovieResolution
      WHERE
        /*  %JoinFKPK(Tech.MovieResolution,deleted," = "," AND") */
        Tech.MovieResolution.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Tech.Resolution because Tech.MovieResolution exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Tech.Resolution  Service.SubscriptionTier on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Service", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
    IF EXISTS (
      SELECT * FROM deleted,Service.SubscriptionTier
      WHERE
        /*  %JoinFKPK(Service.SubscriptionTier,deleted," = "," AND") */
        Service.SubscriptionTier.HighestResolution = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Tech.Resolution because Service.SubscriptionTier exists.'
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


CREATE TRIGGER Tech.tU_Resolution ON Tech.Resolution FOR UPDATE AS
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
  /* Tech.Resolution  Tech.MovieResolution on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a6c1", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Tech", CHILD_TABLE="MovieResolution"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_MovieResolution", FK_COLUMNS="ResolutionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ResolutionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Tech.MovieResolution
      WHERE
        /*  %JoinFKPK(Tech.MovieResolution,deleted," = "," AND") */
        Tech.MovieResolution.ResolutionId = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Tech.Resolution because Tech.MovieResolution exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Tech.Resolution  Service.SubscriptionTier on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Service", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ResolutionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.SubscriptionTier
      WHERE
        /*  %JoinFKPK(Service.SubscriptionTier,deleted," = "," AND") */
        Service.SubscriptionTier.HighestResolution = deleted.ResolutionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Tech.Resolution because Service.SubscriptionTier exists.'
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




CREATE TRIGGER Film.tD_Star ON Film.Star FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Star */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Film.Star  Film.MovieStar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000260e5", PARENT_OWNER="Film", PARENT_TABLE="Star"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
    IF EXISTS (
      SELECT * FROM deleted,Film.MovieStar
      WHERE
        /*  %JoinFKPK(Film.MovieStar,deleted," = "," AND") */
        Film.MovieStar.StarId = deleted.StarId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Film.Star because Film.MovieStar exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Person.Person  Film.Star on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Film", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Star", FK_COLUMNS="PersonId" */
    IF EXISTS (SELECT * FROM deleted,Person.Person
      WHERE
        /* %JoinFKPK(deleted,Person.Person," = "," AND") */
        deleted.PersonId = Person.Person.PersonId AND
        NOT EXISTS (
          SELECT * FROM Film.Star
          WHERE
            /* %JoinFKPK(Film.Star,Person.Person," = "," AND") */
            Film.Star.PersonId = Person.Person.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Film.Star because Person.Person exists.'
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


CREATE TRIGGER Film.tU_Star ON Film.Star FOR UPDATE AS
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
  /* Film.Star  Film.MovieStar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b4db", PARENT_OWNER="Film", PARENT_TABLE="Star"
    CHILD_OWNER="Film", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Star_MovieStar", FK_COLUMNS="StarId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StarId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Film.MovieStar
      WHERE
        /*  %JoinFKPK(Film.MovieStar,deleted," = "," AND") */
        Film.MovieStar.StarId = deleted.StarId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Film.Star because Film.MovieStar exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person.Person  Film.Star on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Person", PARENT_TABLE="Person"
    CHILD_OWNER="Film", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Person_Star", FK_COLUMNS="PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Person.Person
        WHERE
          /* %JoinFKPK(inserted,Person.Person) */
          inserted.PersonId = Person.Person.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Film.Star because Person.Person does not exist.'
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




CREATE TRIGGER Service.tD_Stream ON Service.Stream FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Stream */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Service.Subscription  Service.Stream on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00034109", PARENT_OWNER="Service", PARENT_TABLE="Subscription"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
    IF EXISTS (SELECT * FROM deleted,Service.Subscription
      WHERE
        /* %JoinFKPK(deleted,Service.Subscription," = "," AND") */
        deleted.SubscriptionId = Service.Subscription.SubscriptionId AND
        NOT EXISTS (
          SELECT * FROM Service.Stream
          WHERE
            /* %JoinFKPK(Service.Stream,Service.Subscription," = "," AND") */
            Service.Stream.SubscriptionId = Service.Subscription.SubscriptionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.Stream because Service.Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Tech.MovieResolution  Service.Stream on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
    IF EXISTS (SELECT * FROM deleted,Tech.MovieResolution
      WHERE
        /* %JoinFKPK(deleted,Tech.MovieResolution," = "," AND") */
        deleted.MovieId = Tech.MovieResolution.MovieId AND
        deleted.ResolutionId = Tech.MovieResolution.ResolutionId AND
        NOT EXISTS (
          SELECT * FROM Service.Stream
          WHERE
            /* %JoinFKPK(Service.Stream,Tech.MovieResolution," = "," AND") */
            Service.Stream.MovieId = Tech.MovieResolution.MovieId AND
            Service.Stream.ResolutionId = Tech.MovieResolution.ResolutionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.Stream because Tech.MovieResolution exists.'
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


CREATE TRIGGER Service.tU_Stream ON Service.Stream FOR UPDATE AS
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
  /* Service.Subscription  Service.Stream on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00039a55", PARENT_OWNER="Service", PARENT_TABLE="Subscription"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriptionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Service.Subscription
        WHERE
          /* %JoinFKPK(inserted,Service.Subscription) */
          inserted.SubscriptionId = Service.Subscription.SubscriptionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SubscriptionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.Stream because Service.Subscription does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Tech.MovieResolution  Service.Stream on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="MovieResolution"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieResolution_Stream", FK_COLUMNS="MovieId""ResolutionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId) OR
    UPDATE(ResolutionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Tech.MovieResolution
        WHERE
          /* %JoinFKPK(inserted,Tech.MovieResolution) */
          inserted.MovieId = Tech.MovieResolution.MovieId and
          inserted.ResolutionId = Tech.MovieResolution.ResolutionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieId IS NULL AND
      inserted.ResolutionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.Stream because Tech.MovieResolution does not exist.'
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




CREATE TRIGGER Service.tD_Subscription ON Service.Subscription FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Subscription */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Service.Subscription  Service.Stream on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005cc95", PARENT_OWNER="Service", PARENT_TABLE="Subscription"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
    IF EXISTS (
      SELECT * FROM deleted,Service.Stream
      WHERE
        /*  %JoinFKPK(Service.Stream,deleted," = "," AND") */
        Service.Stream.SubscriptionId = deleted.SubscriptionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Service.Subscription because Service.Stream exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Service.SubscriptionTier  Service.Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
    IF EXISTS (SELECT * FROM deleted,Service.SubscriptionTier
      WHERE
        /* %JoinFKPK(deleted,Service.SubscriptionTier," = "," AND") */
        deleted.SubscriptionTierId = Service.SubscriptionTier.SubscriptionTierId AND
        NOT EXISTS (
          SELECT * FROM Service.Subscription
          WHERE
            /* %JoinFKPK(Service.Subscription,Service.SubscriptionTier," = "," AND") */
            Service.Subscription.SubscriptionTierId = Service.SubscriptionTier.SubscriptionTierId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.Subscription because Service.SubscriptionTier exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment.Payment  Service.Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
    IF EXISTS (SELECT * FROM deleted,Payment.Payment
      WHERE
        /* %JoinFKPK(deleted,Payment.Payment," = "," AND") */
        deleted.PaymentId = Payment.Payment.PaymentId AND
        NOT EXISTS (
          SELECT * FROM Service.Subscription
          WHERE
            /* %JoinFKPK(Service.Subscription,Payment.Payment," = "," AND") */
            Service.Subscription.PaymentId = Payment.Payment.PaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.Subscription because Payment.Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Service.Customer  Service.Subscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Service.Customer
      WHERE
        /* %JoinFKPK(deleted,Service.Customer," = "," AND") */
        deleted.CustomerId = Service.Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Service.Subscription
          WHERE
            /* %JoinFKPK(Service.Subscription,Service.Customer," = "," AND") */
            Service.Subscription.CustomerId = Service.Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.Subscription because Service.Customer exists.'
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


CREATE TRIGGER Service.tU_Subscription ON Service.Subscription FOR UPDATE AS
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
  /* Service.Subscription  Service.Stream on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00065485", PARENT_OWNER="Service", PARENT_TABLE="Subscription"
    CHILD_OWNER="Service", CHILD_TABLE="Stream"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Subscription_Stream", FK_COLUMNS="SubscriptionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriptionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.Stream
      WHERE
        /*  %JoinFKPK(Service.Stream,deleted," = "," AND") */
        Service.Stream.SubscriptionId = deleted.SubscriptionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Service.Subscription because Service.Stream exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Service.SubscriptionTier  Service.Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriptionTierId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Service.SubscriptionTier
        WHERE
          /* %JoinFKPK(inserted,Service.SubscriptionTier) */
          inserted.SubscriptionTierId = Service.SubscriptionTier.SubscriptionTierId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SubscriptionTierId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.Subscription because Service.SubscriptionTier does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment.Payment  Service.Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Payment", PARENT_TABLE="Payment"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Payment_Subscription", FK_COLUMNS="PaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment.Payment
        WHERE
          /* %JoinFKPK(inserted,Payment.Payment) */
          inserted.PaymentId = Payment.Payment.PaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.Subscription because Payment.Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Service.Customer  Service.Subscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Service", PARENT_TABLE="Customer"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Customer_Subscription", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Service.Customer
        WHERE
          /* %JoinFKPK(inserted,Service.Customer) */
          inserted.CustomerId = Service.Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.Subscription because Service.Customer does not exist.'
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




CREATE TRIGGER Service.tD_SubscriptionTier ON Service.SubscriptionTier FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SubscriptionTier */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Service.SubscriptionTier  Service.Subscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e2e8", PARENT_OWNER="Service", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
    IF EXISTS (
      SELECT * FROM deleted,Service.Subscription
      WHERE
        /*  %JoinFKPK(Service.Subscription,deleted," = "," AND") */
        Service.Subscription.SubscriptionTierId = deleted.SubscriptionTierId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Service.SubscriptionTier because Service.Subscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Tech.Resolution  Service.SubscriptionTier on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Service", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
    IF EXISTS (SELECT * FROM deleted,Tech.Resolution
      WHERE
        /* %JoinFKPK(deleted,Tech.Resolution," = "," AND") */
        deleted.HighestResolution = Tech.Resolution.ResolutionId AND
        NOT EXISTS (
          SELECT * FROM Service.SubscriptionTier
          WHERE
            /* %JoinFKPK(Service.SubscriptionTier,Tech.Resolution," = "," AND") */
            Service.SubscriptionTier.HighestResolution = Tech.Resolution.ResolutionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Service.SubscriptionTier because Tech.Resolution exists.'
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


CREATE TRIGGER Service.tU_SubscriptionTier ON Service.SubscriptionTier FOR UPDATE AS
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
  /* Service.SubscriptionTier  Service.Subscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00031d4f", PARENT_OWNER="Service", PARENT_TABLE="SubscriptionTier"
    CHILD_OWNER="Service", CHILD_TABLE="Subscription"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SubscriptionTier_Subscription", FK_COLUMNS="SubscriptionTierId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriptionTierId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Service.Subscription
      WHERE
        /*  %JoinFKPK(Service.Subscription,deleted," = "," AND") */
        Service.Subscription.SubscriptionTierId = deleted.SubscriptionTierId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Service.SubscriptionTier because Service.Subscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Tech.Resolution  Service.SubscriptionTier on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Tech", PARENT_TABLE="Resolution"
    CHILD_OWNER="Service", CHILD_TABLE="SubscriptionTier"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Resolution_SubscriptionTier", FK_COLUMNS="HighestResolution" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(HighestResolution)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Tech.Resolution
        WHERE
          /* %JoinFKPK(inserted,Tech.Resolution) */
          inserted.HighestResolution = Tech.Resolution.ResolutionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.HighestResolution IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Service.SubscriptionTier because Tech.Resolution does not exist.'
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
