
CREATE TYPE [standard_string]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standard_number]
	FROM INTEGER NULL
go

CREATE TYPE [first_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [last_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [city]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [state]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [zip_code]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address_2]
	FROM VARCHAR(20) NULL
go

CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [Customer]
( 
	[CustomerAddress]    [address] ,
	[CustomerCity]       [city] ,
	[CustomerFirstName]  [first_name] ,
	[CustomerLastName]   [last_name] ,
	[CustomerState]      [state] ,
	[CustomerZipCode]    [zip_code] ,
	[Email]              varchar  NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [CustomerCredit]
( 
	[CreditCard]         integer  NULL ,
	[CreditCardExp]      integer  NULL ,
	[StatusCode]         varchar(20)  NULL ,
	[CardId]             integer  NOT NULL 
)
go

CREATE TABLE [CustomerService]
( 
	[ServiceRequestNumber] integer  NOT NULL ,
	[AccountNumber]      integer  NOT NULL ,
	[EmployeeNumber]     varchar(20)  NOT NULL 
)
go

CREATE TABLE [Employee]
( 
	[EmployeeFirstName]  [first_name] ,
	[EmployeeAddress]    [address] ,
	[EmployeePhone]      [phone] ,
	[StoreNumber]        integer  NULL ,
	[EmployeeAddress_2]  [address_2] ,
	[Email]              varchar(20)  NULL ,
	[Salary]             integer  NULL ,
	[HireDate]           datetime  NULL ,
	[EmployeeNumber]     varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieTitle]         [title] ,
	[MovieDirector]      [director] ,
	[Description]        varchar(20)  NULL ,
	[Star_1Name]         [first_name] ,
	[Rating]             varchar  NULL ,
	[Star_2Name]         [first_name] ,
	[MovieNumber]        integer  NOT NULL ,
	[Genre]              varchar(2)  NULL ,
	[RentalRate]         numeric  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL ,
	[IsStreamableVersion] char(3)  NULL 
)
go

CREATE TABLE [MovieDigitalCopy]
( 
	[AudioFormats]       varchar(20)  NULL ,
	[MovieFormat]        varchar(20)  NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[Subtitles]          varchar(20)  NULL ,
	[IsLatest]           bit  NULL ,
	[VideoFile]          varbinary  NULL 
)
go

CREATE TABLE [MoviePhysicalCopy]
( 
	[GeneralCondition]   varchar(20)  NULL ,
	[MovieFormat]        varchar(20)  NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MovieRentalRecord]
( 
	[RentalDate]         datetime  NULL ,
	[DueDate]            datetime  NULL ,
	[RentalStatus]       varchar(20)  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[OverdueCharge]      integer  NULL ,
	[RentalRate]         integer  NULL ,
	[EmployeeNumber]     [phone]  NOT NULL ,
	[RentalRecordDate]   datetime  NOT NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[CardId]             integer  NOT NULL 
)
go

CREATE TABLE [MovieStoreLocation]
( 
	[MovieNumber]        integer  NOT NULL ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MovieStreamingRecord]
( 
	[ViewDateTime]       datetime  NULL ,
	[ResumeTime]         TIME  NULL ,
	[AccessDate]         datetime  NOT NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[Report]             text  NULL ,
	[Blocked]            bit  NULL ,
	[WatchLater]         bit  NULL ,
	[AccountNumber]      integer  NOT NULL 
)
go

CREATE TABLE [MovieStreamingService]
( 
	[AccountNumber]      integer  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[PaymentTransactionNumber] integer  NOT NULL ,
	[AgeRestriction]     bit  NULL ,
	[AccountType]        char(18)  NULL ,
	[MonthlySubscriptionFee] float  NULL ,
	[CardId]             integer  NOT NULL ,
	[AccountValidity]    char(18)  NULL 
)
go

CREATE TABLE [Payment]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentAmount]      numeric  NULL ,
	[PaymentDate]        datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[EmployeeNumber]     varchar(20)  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL ,
	[CardId]             integer  NULL ,
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL ,
	[EpayVendorNumber]   integer  NULL ,
	[EpayAccountNumber]  integer  NULL ,
	[CreditCardNumber]   char(18)  NULL ,
	[CreditCardExp]      datetime  NULL ,
	[CreditCardType]     char(18)  NULL 
)
go

CREATE TABLE [Store]
( 
	[StoreManager]       [manager] ,
	[StoreAddress]       [address] ,
	[StoreAddress_2]     [address_2] ,
	[StorePhone]         [phone] ,
	[StoreCity]          [city] ,
	[StoreState]         [state] ,
	[StoreZipCode]       [zip_code] ,
	[StoreNumber]        integer  NOT NULL 
)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerNumber] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([CustomerAddress]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [Customer]
( 
	[CustomerLastName]    ASC
)
go

ALTER TABLE [CustomerCredit]
	ADD CONSTRAINT [XPKCustomerCredit] PRIMARY KEY  CLUSTERED ([CardId] ASC)
go

ALTER TABLE [CustomerService]
	ADD CONSTRAINT [XPKCustomerService] PRIMARY KEY  CLUSTERED ([ServiceRequestNumber] ASC,[AccountNumber] ASC,[EmployeeNumber] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeNumber] ASC)
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([EmployeePhone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Employee] ON [Employee]
( 
	[EmployeeFirstName]   ASC
)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [MovieDigitalCopy]
	ADD CONSTRAINT [XPKMovieDigitalCopy] PRIMARY KEY  CLUSTERED ([MovieCopyNumber] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MoviePhysicalCopy]
	ADD CONSTRAINT [XPKMoviePhysicalCopy] PRIMARY KEY  CLUSTERED ([MovieCopyNumber] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [XPKMovieRentalRecord] PRIMARY KEY  CLUSTERED ([RentalRecordDate] ASC,[MovieCopyNumber] ASC,[MovieNumber] ASC,[EmployeeNumber] ASC,[CardId] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [MovieStoreLocation]
	ADD CONSTRAINT [XPKMovieStoreLocation] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[StoreNumber] ASC)
go

ALTER TABLE [MovieStreamingRecord]
	ADD CONSTRAINT [XPKMovieStreamingRecord] PRIMARY KEY  CLUSTERED ([AccessDate] ASC,[MovieCopyNumber] ASC,[MovieNumber] ASC,[AccountNumber] ASC)
go

ALTER TABLE [MovieStreamingService]
	ADD CONSTRAINT [XPKMovieStreamingService] PRIMARY KEY  CLUSTERED ([AccountNumber] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [Store]
	ADD CONSTRAINT [XPKStore] PRIMARY KEY  CLUSTERED ([StoreNumber] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Store] ON [Store]
( 
	[StoreManager]        ASC
)
go

CREATE VIEW [CUSTOMER_INVOICE]([CreditCard],[CreditCardExp],[StatusCode],[CustomerNumber],[CustomerAddress],[Email],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[RentalRecordDate],[MovieCopyNumber],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate],[MovieTitle],[MonthlySubscriptionFee],[Overdue_Charge_Rate])
AS
SELECT ALL [CustomerCredit].[CreditCard],[CustomerCredit].[CreditCardExp],[CustomerCredit].[StatusCode],[Customer].[CustomerNumber],[Customer].[CustomerAddress],[Customer].[Email],[Customer].[CustomerCity],[Customer].[CustomerFirstName],[Customer].[CustomerLastName],[Customer].[CustomerState],[Customer].[CustomerZipCode],[MovieRentalRecord].[RentalRecordDate],[MovieRentalRecord].[MovieCopyNumber],[MovieRentalRecord].[MovieNumber],[MovieRentalRecord].[RentalDate],[MovieRentalRecord].[DueDate],[MovieRentalRecord].[RentalStatus],[MovieRentalRecord].[OverdueCharge],[MovieRentalRecord].[RentalRate],[Movie].[MovieTitle],[MovieStreamingService].[MonthlySubscriptionFee],rental_rate * 1.5
	FROM [CustomerCredit],[Customer],[MovieRentalRecord],[Movie],[MovieStreamingService]
go

CREATE VIEW [OVERDUE_NOTICE]([CreditCard],[CreditCardExp],[StatusCode],[Overdue_Charge_Rate],[CustomerNumber],[CustomerAddress],[Email],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[RentalRecordDate],[MovieCopyNumber],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate],[MonthlySubscriptionFee],[AccountType],[AccountValidity])
AS
SELECT ALL [CustomerCredit].[CreditCard],[CustomerCredit].[CreditCardExp],[CustomerCredit].[StatusCode],rental_rate * 1.5,[Customer].[CustomerNumber],[Customer].[CustomerAddress],[Customer].[Email],[Customer].[CustomerCity],[Customer].[CustomerFirstName],[Customer].[CustomerLastName],[Customer].[CustomerState],[Customer].[CustomerZipCode],[MovieRentalRecord].[RentalRecordDate],[MovieRentalRecord].[MovieCopyNumber],[MovieRentalRecord].[MovieNumber],[MovieRentalRecord].[RentalDate],[MovieRentalRecord].[DueDate],[MovieRentalRecord].[RentalStatus],[MovieRentalRecord].[OverdueCharge],[MovieRentalRecord].[RentalRate],[MovieStreamingService].[MonthlySubscriptionFee],[MovieStreamingService].[AccountType],[MovieStreamingService].[AccountValidity]
	FROM [CustomerCredit],[Customer],[MovieRentalRecord],[MovieStreamingService]
go


ALTER TABLE [CustomerService]
	ADD CONSTRAINT [R_33] FOREIGN KEY ([AccountNumber]) REFERENCES [MovieStreamingService]([AccountNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerService]
	ADD CONSTRAINT [R_34] FOREIGN KEY ([EmployeeNumber]) REFERENCES [Employee]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Employee]
	ADD CONSTRAINT [employs_is] FOREIGN KEY ([StoreNumber]) REFERENCES [Store]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Employee]
	ADD CONSTRAINT [reports_to] FOREIGN KEY ([Supervisor]) REFERENCES [Employee]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Movie_genre]', '[Movie].[Genre]'
go


ALTER TABLE [MovieDigitalCopy]
	ADD CONSTRAINT [R_23] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MoviePhysicalCopy]
	ADD CONSTRAINT [is_rented_as] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [completes] FOREIGN KEY ([EmployeeNumber]) REFERENCES [Employee]([EmployeePhone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [is_rented_under] FOREIGN KEY ([MovieCopyNumber],[MovieNumber]) REFERENCES [MoviePhysicalCopy]([MovieCopyNumber],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [R_8_1] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [R_8_2] FOREIGN KEY ([CardId]) REFERENCES [CustomerCredit]([CardId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieRentalRecord]
	ADD CONSTRAINT [is_made_on] FOREIGN KEY ([PaymentTransactionNumber],[CustomerNumber]) REFERENCES [Payment]([PaymentTransactionNumber],[CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStoreLocation]
	ADD CONSTRAINT [rents] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStoreLocation]
	ADD CONSTRAINT [is_in] FOREIGN KEY ([StoreNumber]) REFERENCES [Store]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStreamingRecord]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([MovieNumber]) REFERENCES [Movie]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStreamingRecord]
	ADD CONSTRAINT [R_24] FOREIGN KEY ([MovieCopyNumber],[MovieNumber]) REFERENCES [MovieDigitalCopy]([MovieCopyNumber],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStreamingRecord]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([AccountNumber]) REFERENCES [MovieStreamingService]([AccountNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStreamingService]
	ADD CONSTRAINT [R_30] FOREIGN KEY ([PaymentTransactionNumber],[CustomerNumber]) REFERENCES [Payment]([PaymentTransactionNumber],[CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStreamingService]
	ADD CONSTRAINT [R_31] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStreamingService]
	ADD CONSTRAINT [R_32] FOREIGN KEY ([CardId]) REFERENCES [CustomerCredit]([CardId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [receives] FOREIGN KEY ([EmployeeNumber]) REFERENCES [Employee]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R_7_2] FOREIGN KEY ([CardId]) REFERENCES [CustomerCredit]([CardId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R_29] FOREIGN KEY ([CustomerNumber]) REFERENCES [Customer]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
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
    /* Customer  MovieStreamingService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00034c60", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingService
      WHERE
        /*  %JoinFKPK(MovieStreamingService,deleted," = "," AND") */
        MovieStreamingService.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because MovieStreamingService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because MovieRentalRecord exists.'
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
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer  MovieStreamingService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00039bbd", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingService
      WHERE
        /*  %JoinFKPK(MovieStreamingService,deleted," = "," AND") */
        MovieStreamingService.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because MovieStreamingService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because MovieRentalRecord exists.'
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




CREATE TRIGGER tD_CustomerCredit ON CustomerCredit FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerCredit */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerCredit  MovieStreamingService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00033f25", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="CardId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingService
      WHERE
        /*  %JoinFKPK(MovieStreamingService,deleted," = "," AND") */
        MovieStreamingService.CardId = deleted.CardId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerCredit because MovieStreamingService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit makes Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CardId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CardId = deleted.CardId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerCredit because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit rents under MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CardId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.CardId = deleted.CardId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerCredit because MovieRentalRecord exists.'
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


CREATE TRIGGER tU_CustomerCredit ON CustomerCredit FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerCredit */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCardId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerCredit  MovieStreamingService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000373fb", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="CardId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CardId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingService
      WHERE
        /*  %JoinFKPK(MovieStreamingService,deleted," = "," AND") */
        MovieStreamingService.CardId = deleted.CardId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerCredit because MovieStreamingService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit makes Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CardId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CardId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.CardId = deleted.CardId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerCredit because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit rents under MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CardId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CardId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.CardId = deleted.CardId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerCredit because MovieRentalRecord exists.'
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
    /* Employee  CustomerService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e62a", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeNumber = Employee.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM CustomerService
          WHERE
            /* %JoinFKPK(CustomerService,Employee," = "," AND") */
            CustomerService.EmployeeNumber = Employee.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerService because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieStreamingService  CustomerService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="AccountNumber" */
    IF EXISTS (SELECT * FROM deleted,MovieStreamingService
      WHERE
        /* %JoinFKPK(deleted,MovieStreamingService," = "," AND") */
        deleted.AccountNumber = MovieStreamingService.AccountNumber AND
        NOT EXISTS (
          SELECT * FROM CustomerService
          WHERE
            /* %JoinFKPK(CustomerService,MovieStreamingService," = "," AND") */
            CustomerService.AccountNumber = MovieStreamingService.AccountNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerService because MovieStreamingService exists.'
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
           @insServiceRequestNumber integer, 
           @insAccountNumber integer, 
           @insEmployeeNumber varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  CustomerService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000305e8", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeNumber = Employee.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerService because Employee does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieStreamingService  CustomerService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="AccountNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieStreamingService
        WHERE
          /* %JoinFKPK(inserted,MovieStreamingService) */
          inserted.AccountNumber = MovieStreamingService.AccountNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerService because MovieStreamingService does not exist.'
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
    /* Employee  CustomerService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00069dc3", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee receives Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee reports to Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.Supervisor = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee completes MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.EmployeeNumber = deleted.EmployeePhone
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Employee because MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee reports to Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.Supervisor = Employee.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Employee," = "," AND") */
            Employee.Supervisor = Employee.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Store employs is Employee on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,Store
      WHERE
        /* %JoinFKPK(deleted,Store," = "," AND") */
        deleted.StoreNumber = Store.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM Employee
          WHERE
            /* %JoinFKPK(Employee,Store," = "," AND") */
            Employee.StoreNumber = Store.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Employee because Store exists.'
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
           @insEmployeeNumber varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Employee  CustomerService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000787e1", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because CustomerService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee receives Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee reports to Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.Supervisor = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because Employee exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee completes MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.EmployeeNumber = deleted.EmployeePhone
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Employee because MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee reports to Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="Supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.Supervisor = Employee.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Supervisor IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because Employee does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Store employs is Employee on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Store
        WHERE
          /* %JoinFKPK(inserted,Store) */
          inserted.StoreNumber = Store.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StoreNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Employee because Store does not exist.'
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
    /* Movie  MovieDigitalCopy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000442ee", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieDigitalCopy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieDigitalCopy
      WHERE
        /*  %JoinFKPK(MovieDigitalCopy,deleted," = "," AND") */
        MovieDigitalCopy.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieDigitalCopy exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MovieStreamingRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingRecord
      WHERE
        /*  %JoinFKPK(MovieStreamingRecord,deleted," = "," AND") */
        MovieStreamingRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieStreamingRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MovieStoreLocation on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStoreLocation
      WHERE
        /*  %JoinFKPK(MovieStoreLocation,deleted," = "," AND") */
        MovieStoreLocation.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieStoreLocation exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MoviePhysicalCopy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MoviePhysicalCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MoviePhysicalCopy
      WHERE
        /*  %JoinFKPK(MoviePhysicalCopy,deleted," = "," AND") */
        MoviePhysicalCopy.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MoviePhysicalCopy exists.'
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
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MovieDigitalCopy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a97f", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieDigitalCopy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieDigitalCopy
      WHERE
        /*  %JoinFKPK(MovieDigitalCopy,deleted," = "," AND") */
        MovieDigitalCopy.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieDigitalCopy exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MovieStreamingRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingRecord
      WHERE
        /*  %JoinFKPK(MovieStreamingRecord,deleted," = "," AND") */
        MovieStreamingRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieStreamingRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MovieStoreLocation on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStoreLocation
      WHERE
        /*  %JoinFKPK(MovieStoreLocation,deleted," = "," AND") */
        MovieStoreLocation.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieStoreLocation exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MoviePhysicalCopy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MoviePhysicalCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MoviePhysicalCopy
      WHERE
        /*  %JoinFKPK(MoviePhysicalCopy,deleted," = "," AND") */
        MoviePhysicalCopy.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MoviePhysicalCopy exists.'
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




CREATE TRIGGER tD_MovieDigitalCopy ON MovieDigitalCopy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieDigitalCopy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieDigitalCopy  MovieStreamingRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00028f6c", PARENT_OWNER="", PARENT_TABLE="MovieDigitalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingRecord
      WHERE
        /*  %JoinFKPK(MovieStreamingRecord,deleted," = "," AND") */
        MovieStreamingRecord.MovieCopyNumber = deleted.MovieCopyNumber AND
        MovieStreamingRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieDigitalCopy because MovieStreamingRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MovieDigitalCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieDigitalCopy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieDigitalCopy
          WHERE
            /* %JoinFKPK(MovieDigitalCopy,Movie," = "," AND") */
            MovieDigitalCopy.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieDigitalCopy because Movie exists.'
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


CREATE TRIGGER tU_MovieDigitalCopy ON MovieDigitalCopy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieDigitalCopy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieCopyNumber integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieDigitalCopy  MovieStreamingRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002ccfa", PARENT_OWNER="", PARENT_TABLE="MovieDigitalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingRecord
      WHERE
        /*  %JoinFKPK(MovieStreamingRecord,deleted," = "," AND") */
        MovieStreamingRecord.MovieCopyNumber = deleted.MovieCopyNumber AND
        MovieStreamingRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieDigitalCopy because MovieStreamingRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MovieDigitalCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieDigitalCopy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieDigitalCopy because Movie does not exist.'
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




CREATE TRIGGER tD_MoviePhysicalCopy ON MoviePhysicalCopy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MoviePhysicalCopy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MoviePhysicalCopy is rented under MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002be1a", PARENT_OWNER="", PARENT_TABLE="MoviePhysicalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.MovieCopyNumber = deleted.MovieCopyNumber AND
        MovieRentalRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MoviePhysicalCopy because MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MoviePhysicalCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MoviePhysicalCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MoviePhysicalCopy
          WHERE
            /* %JoinFKPK(MoviePhysicalCopy,Movie," = "," AND") */
            MoviePhysicalCopy.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MoviePhysicalCopy because Movie exists.'
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


CREATE TRIGGER tU_MoviePhysicalCopy ON MoviePhysicalCopy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MoviePhysicalCopy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieCopyNumber integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MoviePhysicalCopy is rented under MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002fc74", PARENT_OWNER="", PARENT_TABLE="MoviePhysicalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.MovieCopyNumber = deleted.MovieCopyNumber AND
        MovieRentalRecord.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MoviePhysicalCopy because MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MoviePhysicalCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MoviePhysicalCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MoviePhysicalCopy because Movie does not exist.'
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




CREATE TRIGGER tD_MovieRentalRecord ON MovieRentalRecord FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieRentalRecord */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Payment is made on MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00079889", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
        deleted.CustomerNumber = Payment.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,Payment," = "," AND") */
            MovieRentalRecord.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
            MovieRentalRecord.CustomerNumber = Payment.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit rents under MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CardId" */
    IF EXISTS (SELECT * FROM deleted,CustomerCredit
      WHERE
        /* %JoinFKPK(deleted,CustomerCredit," = "," AND") */
        deleted.CardId = CustomerCredit.CardId AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,CustomerCredit," = "," AND") */
            MovieRentalRecord.CardId = CustomerCredit.CardId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because CustomerCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer rents under MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,Customer," = "," AND") */
            MovieRentalRecord.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MoviePhysicalCopy is rented under MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MoviePhysicalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MoviePhysicalCopy
      WHERE
        /* %JoinFKPK(deleted,MoviePhysicalCopy," = "," AND") */
        deleted.MovieCopyNumber = MoviePhysicalCopy.MovieCopyNumber AND
        deleted.MovieNumber = MoviePhysicalCopy.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,MoviePhysicalCopy," = "," AND") */
            MovieRentalRecord.MovieCopyNumber = MoviePhysicalCopy.MovieCopyNumber AND
            MovieRentalRecord.MovieNumber = MoviePhysicalCopy.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because MoviePhysicalCopy exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee completes MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeNumber = Employee.EmployeePhone AND
        NOT EXISTS (
          SELECT * FROM MovieRentalRecord
          WHERE
            /* %JoinFKPK(MovieRentalRecord,Employee," = "," AND") */
            MovieRentalRecord.EmployeeNumber = Employee.EmployeePhone
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieRentalRecord because Employee exists.'
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


CREATE TRIGGER tU_MovieRentalRecord ON MovieRentalRecord FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieRentalRecord */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeNumber phone, 
           @insRentalRecordDate datetime, 
           @insMovieCopyNumber integer, 
           @insMovieNumber integer, 
           @insCustomerNumber integer, 
           @insCardId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment is made on MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0007eeee", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber) OR
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.PaymentTransactionNumber and
          inserted.CustomerNumber = Payment.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionNumber IS NULL AND
      inserted.CustomerNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit rents under MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CardId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CardId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerCredit
        WHERE
          /* %JoinFKPK(inserted,CustomerCredit) */
          inserted.CardId = CustomerCredit.CardId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because CustomerCredit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer rents under MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerNumber = Customer.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MoviePhysicalCopy is rented under MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MoviePhysicalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MoviePhysicalCopy
        WHERE
          /* %JoinFKPK(inserted,MoviePhysicalCopy) */
          inserted.MovieCopyNumber = MoviePhysicalCopy.MovieCopyNumber and
          inserted.MovieNumber = MoviePhysicalCopy.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because MoviePhysicalCopy does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee completes MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeNumber = Employee.EmployeePhone
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieRentalRecord because Employee does not exist.'
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




CREATE TRIGGER tD_MovieStoreLocation ON MovieStoreLocation FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStoreLocation */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Store is in MovieStoreLocation on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a427", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,Store
      WHERE
        /* %JoinFKPK(deleted,Store," = "," AND") */
        deleted.StoreNumber = Store.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStoreLocation
          WHERE
            /* %JoinFKPK(MovieStoreLocation,Store," = "," AND") */
            MovieStoreLocation.StoreNumber = Store.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStoreLocation because Store exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MovieStoreLocation on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStoreLocation
          WHERE
            /* %JoinFKPK(MovieStoreLocation,Movie," = "," AND") */
            MovieStoreLocation.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStoreLocation because Movie exists.'
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


CREATE TRIGGER tU_MovieStoreLocation ON MovieStoreLocation FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStoreLocation */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer, 
           @insStoreNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Store is in MovieStoreLocation on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d0e8", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Store
        WHERE
          /* %JoinFKPK(inserted,Store) */
          inserted.StoreNumber = Store.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStoreLocation because Store does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MovieStoreLocation on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStoreLocation because Movie does not exist.'
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




CREATE TRIGGER tD_MovieStreamingRecord ON MovieStreamingRecord FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStreamingRecord */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieStreamingService  MovieStreamingRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00049f83", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="AccountNumber" */
    IF EXISTS (SELECT * FROM deleted,MovieStreamingService
      WHERE
        /* %JoinFKPK(deleted,MovieStreamingService," = "," AND") */
        deleted.AccountNumber = MovieStreamingService.AccountNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreamingRecord
          WHERE
            /* %JoinFKPK(MovieStreamingRecord,MovieStreamingService," = "," AND") */
            MovieStreamingRecord.AccountNumber = MovieStreamingService.AccountNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreamingRecord because MovieStreamingService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieDigitalCopy  MovieStreamingRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieDigitalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MovieDigitalCopy
      WHERE
        /* %JoinFKPK(deleted,MovieDigitalCopy," = "," AND") */
        deleted.MovieCopyNumber = MovieDigitalCopy.MovieCopyNumber AND
        deleted.MovieNumber = MovieDigitalCopy.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreamingRecord
          WHERE
            /* %JoinFKPK(MovieStreamingRecord,MovieDigitalCopy," = "," AND") */
            MovieStreamingRecord.MovieCopyNumber = MovieDigitalCopy.MovieCopyNumber AND
            MovieStreamingRecord.MovieNumber = MovieDigitalCopy.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreamingRecord because MovieDigitalCopy exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MovieStreamingRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieNumber = Movie.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreamingRecord
          WHERE
            /* %JoinFKPK(MovieStreamingRecord,Movie," = "," AND") */
            MovieStreamingRecord.MovieNumber = Movie.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreamingRecord because Movie exists.'
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


CREATE TRIGGER tU_MovieStreamingRecord ON MovieStreamingRecord FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStreamingRecord */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAccessDate datetime, 
           @insMovieCopyNumber integer, 
           @insMovieNumber integer, 
           @insAccountNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieStreamingService  MovieStreamingRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a51e", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="AccountNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieStreamingService
        WHERE
          /* %JoinFKPK(inserted,MovieStreamingService) */
          inserted.AccountNumber = MovieStreamingService.AccountNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreamingRecord because MovieStreamingService does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieDigitalCopy  MovieStreamingRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieDigitalCopy"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieDigitalCopy
        WHERE
          /* %JoinFKPK(inserted,MovieDigitalCopy) */
          inserted.MovieCopyNumber = MovieDigitalCopy.MovieCopyNumber and
          inserted.MovieNumber = MovieDigitalCopy.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreamingRecord because MovieDigitalCopy does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MovieStreamingRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieNumber = Movie.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreamingRecord because Movie does not exist.'
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




CREATE TRIGGER tD_MovieStreamingService ON MovieStreamingService FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStreamingService */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieStreamingService  CustomerService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006ba41", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="AccountNumber" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.AccountNumber = deleted.AccountNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieStreamingService because CustomerService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieStreamingService  MovieStreamingRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="AccountNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingRecord
      WHERE
        /*  %JoinFKPK(MovieStreamingRecord,deleted," = "," AND") */
        MovieStreamingRecord.AccountNumber = deleted.AccountNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieStreamingService because MovieStreamingRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit  MovieStreamingService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="CardId" */
    IF EXISTS (SELECT * FROM deleted,CustomerCredit
      WHERE
        /* %JoinFKPK(deleted,CustomerCredit," = "," AND") */
        deleted.CardId = CustomerCredit.CardId AND
        NOT EXISTS (
          SELECT * FROM MovieStreamingService
          WHERE
            /* %JoinFKPK(MovieStreamingService,CustomerCredit," = "," AND") */
            MovieStreamingService.CardId = CustomerCredit.CardId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreamingService because CustomerCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  MovieStreamingService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreamingService
          WHERE
            /* %JoinFKPK(MovieStreamingService,Customer," = "," AND") */
            MovieStreamingService.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreamingService because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  MovieStreamingService on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
        deleted.CustomerNumber = Payment.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM MovieStreamingService
          WHERE
            /* %JoinFKPK(MovieStreamingService,Payment," = "," AND") */
            MovieStreamingService.PaymentTransactionNumber = Payment.PaymentTransactionNumber AND
            MovieStreamingService.CustomerNumber = Payment.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStreamingService because Payment exists.'
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


CREATE TRIGGER tU_MovieStreamingService ON MovieStreamingService FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStreamingService */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAccountNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieStreamingService  CustomerService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006f73c", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="CustomerService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="AccountNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerService
      WHERE
        /*  %JoinFKPK(CustomerService,deleted," = "," AND") */
        CustomerService.AccountNumber = deleted.AccountNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieStreamingService because CustomerService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieStreamingService  MovieStreamingRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MovieStreamingService"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingRecord"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="AccountNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingRecord
      WHERE
        /*  %JoinFKPK(MovieStreamingRecord,deleted," = "," AND") */
        MovieStreamingRecord.AccountNumber = deleted.AccountNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieStreamingService because MovieStreamingRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit  MovieStreamingService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="CardId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CardId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerCredit
        WHERE
          /* %JoinFKPK(inserted,CustomerCredit) */
          inserted.CardId = CustomerCredit.CardId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreamingService because CustomerCredit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  MovieStreamingService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerNumber = Customer.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreamingService because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  MovieStreamingService on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber) OR
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.PaymentTransactionNumber = Payment.PaymentTransactionNumber and
          inserted.CustomerNumber = Payment.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStreamingService because Payment does not exist.'
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
    /* Payment  MovieStreamingService on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00063a6a", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingService
      WHERE
        /*  %JoinFKPK(MovieStreamingService,deleted," = "," AND") */
        MovieStreamingService.PaymentTransactionNumber = deleted.PaymentTransactionNumber AND
        MovieStreamingService.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because MovieStreamingService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment is made on MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.PaymentTransactionNumber = deleted.PaymentTransactionNumber AND
        MovieRentalRecord.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerNumber = Customer.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Customer," = "," AND") */
            Payment.CustomerNumber = Customer.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerCredit makes Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CardId" */
    IF EXISTS (SELECT * FROM deleted,CustomerCredit
      WHERE
        /* %JoinFKPK(deleted,CustomerCredit," = "," AND") */
        deleted.CardId = CustomerCredit.CardId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,CustomerCredit," = "," AND") */
            Payment.CardId = CustomerCredit.CardId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because CustomerCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Employee receives Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (SELECT * FROM deleted,Employee
      WHERE
        /* %JoinFKPK(deleted,Employee," = "," AND") */
        deleted.EmployeeNumber = Employee.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Employee," = "," AND") */
            Payment.EmployeeNumber = Employee.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Employee exists.'
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
           @insPaymentTransactionNumber integer, 
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  MovieStreamingService on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00074b28", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieStreamingService"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber) OR
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStreamingService
      WHERE
        /*  %JoinFKPK(MovieStreamingService,deleted," = "," AND") */
        MovieStreamingService.PaymentTransactionNumber = deleted.PaymentTransactionNumber AND
        MovieStreamingService.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because MovieStreamingService exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment is made on MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PaymentTransactionNumber""CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber) OR
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieRentalRecord
      WHERE
        /*  %JoinFKPK(MovieRentalRecord,deleted," = "," AND") */
        MovieRentalRecord.PaymentTransactionNumber = deleted.PaymentTransactionNumber AND
        MovieRentalRecord.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerNumber = Customer.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerCredit makes Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerCredit"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CardId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CardId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerCredit
        WHERE
          /* %JoinFKPK(inserted,CustomerCredit) */
          inserted.CardId = CustomerCredit.CardId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CardId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because CustomerCredit does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Employee receives Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Employee
        WHERE
          /* %JoinFKPK(inserted,Employee) */
          inserted.EmployeeNumber = Employee.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Employee does not exist.'
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




CREATE TRIGGER tD_Store ON Store FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Store */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Store is in MovieStoreLocation on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021307", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStoreLocation
      WHERE
        /*  %JoinFKPK(MovieStoreLocation,deleted," = "," AND") */
        MovieStoreLocation.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Store because MovieStoreLocation exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Store employs is Employee on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Store because Employee exists.'
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


CREATE TRIGGER tU_Store ON Store FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Store */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStoreNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Store is in MovieStoreLocation on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00024e61", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="MovieStoreLocation"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStoreLocation
      WHERE
        /*  %JoinFKPK(MovieStoreLocation,deleted," = "," AND") */
        MovieStoreLocation.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Store because MovieStoreLocation exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Store employs is Employee on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Store"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Employee
      WHERE
        /*  %JoinFKPK(Employee,deleted," = "," AND") */
        Employee.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Store because Employee exists.'
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


