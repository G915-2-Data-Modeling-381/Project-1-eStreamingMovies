
CREATE SCHEMA [CustomerInformation]

Execution Successful


CREATE SCHEMA [PaymentHistory]

Execution Successful


CREATE SCHEMA [MovieInformation]

Execution Successful


CREATE SCHEMA [Rental]

Execution Successful


CREATE SCHEMA [EmployeeInformation]

Execution Successful


CREATE TYPE [FirstName]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [LastName]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [Address]
	FROM VARCHAR(50) NOT NULL

Execution Successful


CREATE TYPE [City]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [State]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [ZipCode]
	FROM INTEGER NOT NULL

Execution Successful


CREATE TYPE [PhoneNumber]
	FROM INTEGER NOT NULL

Execution Successful


CREATE TYPE [Address2]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [StandardString]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [StandardInteger]
	FROM INTEGER NOT NULL

Execution Successful


CREATE TYPE [CheckNumberChar]
	FROM VARCHAR(20) NOT NULL

Execution Successful


CREATE TYPE [CheckBankNumberChar]
	FROM CHAR(9) NOT NULL

Execution Successful


CREATE TYPE [CreditCardNumber]
	FROM INTEGER NOT NULL

Execution Successful


CREATE TYPE [SurrogateKeyInt]
	FROM INTEGER NOT NULL

Execution Successful


CREATE TYPE [TypeOfObject]
	FROM CHAR(10) NOT NULL

Execution Successful


CREATE TYPE [Email]
	FROM VARCHAR(50) NOT NULL

Execution Successful


CREATE TYPE [Description]
	FROM VARCHAR(256) NOT NULL

Execution Successful


CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')

Execution Successful


CREATE TABLE [CustomerInformation].[CreditCardType]
( 
	[CreditCardType]     [TypeOfObject] 
)

Execution Successful


CREATE TABLE [CustomerInformation].[Customer]
( 
	[CustomerAddress]    [Address]  NOT NULL ,
	[CustomerCity]       [City]  NOT NULL ,
	[CustomerFirstName]  [FirstName]  NOT NULL ,
	[CustomerLastName]   [LastName]  NOT NULL ,
	[CustomerState]      [State]  NOT NULL ,
	[CustomerZipCode]    [ZipCode]  NOT NULL ,
	[CustomerEmail]      [Email]  NOT NULL ,
	[CustomerId]         integer  NOT NULL 
)

Execution Successful


CREATE TABLE [CustomerInformation].[CustomerCheck]
( 
	[CustomerCheckId]    [SurrogateKeyInt] ,
	[CheckNumber]        [CheckNumberChar]  MASKED WITH (FUNCTION = ''default()'') NOT NULL ,
	[CheckBankNumber]    [CheckBankNumberChar]  MASKED WITH (FUNCTION = ''default()'') NOT NULL ,
	[CustomerPaymentMethodId] [SurrogateKeyInt]  NOT NULL 
)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Incorrect syntax near the keyword 'default'.
[Microsoft][SQL Server Native Client 11.0][SQL Server]Incorrect syntax near the keyword 'with'. If this statement is a common table expression, an xmlnamespaces clause or a change tracking context clause, the previous statement must be terminated with a semicolon.
Execution Failed!


CREATE TABLE [CustomerInformation].[CustomerCredit]
( 
	[CreditCardNumber]   [CreditCardNumber]  MASKED WITH (FUNCTION = ' 'default()'') NOT NULL ,
	[CreditCardExp]      date  NOT NULL ,
	[CreditStatusCode]   varchar(20)  NOT NULL ,
	[CustomerCreditId]   [SurrogateKeyInt] ,
	[CustomerPaymentMethodId] [SurrogateKeyInt]  NOT NULL ,
	[CreditCardType]     [TypeOfObject]  NOT NULL 
)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Incorrect syntax near the keyword 'default'.
Execution Failed!


CREATE TABLE [CustomerInformation].[CustomerEPay]
( 
	[CustomerEPayId]     [SurrogateKeyInt] ,
	[EPayVendorNumber]   [TypeOfObject]  MASKED WITH (FUNCTION = ''default()'') NOT NULL ,
	[EPayAccountNumber]  char(15)  MASKED WITH (FUNCTION = ''default()'') NOT NULL ,
	[CustomerPaymentMethodId] [SurrogateKeyInt]  NOT NULL 
)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Incorrect syntax near the keyword 'default'.
[Microsoft][SQL Server Native Client 11.0][SQL Server]Incorrect syntax near the keyword 'with'. If this statement is a common table expression, an xmlnamespaces clause or a change tracking context clause, the previous statement must be terminated with a semicolon.
Execution Failed!


CREATE TABLE [CustomerInformation].[CustomerPaymentMethod]
( 
	[PaymentType]        [TypeOfObject]  NOT NULL ,
	[CustomerPaymentMethodId] [SurrogateKeyInt] ,
	[CustomerId]         [SurrogateKeyInt]  NOT NULL 
)

Execution Successful


CREATE TABLE [EmployeeInformation].[Employee]
( 
	[EmployeeFirstName]  [FirstName]  NOT NULL ,
	[EmployeeAddress]    [Address]  NOT NULL ,
	[EmployeePhone]      [PhoneNumber]  NOT NULL ,
	[EmployeeEmail]      varchar(20)  NOT NULL ,
	[EmployeeSocialSecurity] integer  MASKED WITH (FUNCTION = ''default()'') NOT NULL ,
	[EmployeeId]         varchar(20)  NOT NULL ,
	[EmployeeLastName]   [LastName]  NOT NULL 
)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Incorrect syntax near the keyword 'default'.
Execution Failed!


CREATE TABLE [EmployeeInformation].[EmployeeDetail]
( 
	[EmployeeId]         varchar(20)  NOT NULL ,
	[EmployeeDetailId]   char(18)  NOT NULL ,
	[EmployeePositionType] [TypeOfObject]  NOT NULL ,
	[StoreId]            integer  NOT NULL ,
	[EmployeeHireDate]   datetime  NOT NULL ,
	[EmployeeSalary]     money  NOT NULL 
)

Execution Successful


CREATE TABLE [EmployeeInformation].[EmployeePosition]
( 
	[EmployeePositionType] [TypeOfObject] 
)

Execution Successful


CREATE TABLE [MovieInformation].[Movie]
( 
	[MovieTitle]         [StandardString]  NOT NULL ,
	[MovieDirector]      [StandardString]  NOT NULL ,
	[MovieDescription]   [Description]  NOT NULL ,
	[MovieStarOneName]   [FirstName]  NOT NULL ,
	[MovieStarTwoName]   [FirstName]  NOT NULL ,
	[MovieId]            [SurrogateKeyInt] ,
	[MovieStarGenre]     [TypeOfObject]  NOT NULL ,
	[MovieUrl]           [Description]  NOT NULL ,
	[MovieClip]          varbinary  NOT NULL ,
	[MovieRating]        [TypeOfObject]  NOT NULL 
)

Execution Successful


CREATE TABLE [MovieInformation].[MovieCondition]
( 
	[MovieConditionType] [TypeOfObject] 
)

Execution Successful


CREATE TABLE [MovieInformation].[MovieCopy]
( 
	[MovieCopyId]        integer  NOT NULL ,
	[MovieId]            [SurrogateKeyInt] ,
	[MovieConditionType] [TypeOfObject]  NOT NULL ,
	[MovieFormatType]    [TypeOfObject]  NOT NULL 
)

Execution Successful


CREATE TABLE [MovieInformation].[MovieFormat]
( 
	[MovieFormatType]    [TypeOfObject] 
)

Execution Successful


CREATE TABLE [Rental].[MovieRentalDetail]
( 
	[MovieRentalRecordId] [SurrogateKeyInt]  NOT NULL ,
	[MovieRentalDetailId] [SurrogateKeyInt] ,
	[MovieRentalDate]    datetime  NOT NULL ,
	[MovieDueDate]       datetime  NOT NULL ,
	[MovieOverDueCharge] money  NOT NULL ,
	[MovieRentalRate]    int  NOT NULL ,
	[StatusType]         [TypeOfObject]  NOT NULL 
)

Execution Successful


CREATE TABLE [Rental].[MovieRentalRecord]
( 
	[PaymentTransactionId] [SurrogateKeyInt]  NOT NULL ,
	[MovieCopyId]        [SurrogateKeyInt] ,
	[MovieRentalRecordId] char(18)  NOT NULL ,
	[EmployeeId]         [SurrogateKeyInt]  NOT NULL 
)

Execution Successful


CREATE TABLE [MovieInformation].[MovieStore]
( 
	[StoreId]            [SurrogateKeyInt] ,
	[MovieStoreId]       char(18)  NOT NULL ,
	[MovieId]            [SurrogateKeyInt]  NOT NULL 
)

Execution Successful


CREATE TABLE [PaymentHistory].[Payment]
( 
	[PaymentTransactionId] [SurrogateKeyInt] ,
	[EmployeeId]         [SurrogateKeyInt]  NOT NULL ,
	[CustomerPaymentMethodId] [SurrogateKeyInt]  NOT NULL 
)

Execution Successful


CREATE TABLE [PaymentHistory].[PaymentDetail]
( 
	[PaymentTransactionId] [SurrogateKeyInt]  NOT NULL ,
	[PaymentDetailId]    [SurrogateKeyInt] ,
	[PaymentDate]        datetime  NOT NULL ,
	[PaymentStatus]      [TypeOfObject]  NOT NULL ,
	[PaymentAmount]      money  NOT NULL 
)

Execution Successful


CREATE TABLE [PaymentHistory].[PaymentType]
( 
	[PaymentType]        [TypeOfObject] 
)

Execution Successful


CREATE TABLE [Rental].[Status]
( 
	[StatusType]         [TypeOfObject] 
)

Execution Successful


CREATE TABLE [EmployeeInformation].[Store]
( 
	[StoreAddress]       [Address]  NOT NULL ,
	[StorePhone]         [PhoneNumber]  NOT NULL ,
	[StoreCity]          [City]  NOT NULL ,
	[StoreState]         [State]  NOT NULL ,
	[StoreZipCode]       [ZipCode]  NOT NULL ,
	[StoreId]            integer  NOT NULL 
)

Execution Successful


ALTER TABLE [CustomerInformation].[CreditCardType]
	ADD CONSTRAINT [XPKCreditCardType] PRIMARY KEY  CLUSTERED ([CreditCardType] ASC)

Execution Successful


ALTER TABLE [CustomerInformation].[Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC)

Execution Successful


ALTER TABLE [CustomerInformation].[Customer]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([CustomerAddress]  ASC)

Execution Successful


CREATE NONCLUSTERED INDEX [XIE1Customer] ON [CustomerInformation].[Customer]
( 
	[CustomerLastName]    ASC
)

Execution Successful


ALTER TABLE [CustomerInformation].[CustomerCheck]
	ADD CONSTRAINT [XPKCustomerCheck] PRIMARY KEY  CLUSTERED ([CustomerCheckId] ASC)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerCheck" because it does not exist or you do not have permissions.
Execution Failed!


ALTER TABLE [CustomerInformation].[CustomerCredit]
	ADD CONSTRAINT [XPKCustomerCredit] PRIMARY KEY  CLUSTERED ([CustomerCreditId] ASC)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerCredit" because it does not exist or you do not have permissions.
Execution Failed!


ALTER TABLE [CustomerInformation].[CustomerEPay]
	ADD CONSTRAINT [XPKCustomerEPay] PRIMARY KEY  CLUSTERED ([CustomerEPayId] ASC)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerEPay" because it does not exist or you do not have permissions.
Execution Failed!


ALTER TABLE [CustomerInformation].[CustomerPaymentMethod]
	ADD CONSTRAINT [XPKCustomerPaymentMethod] PRIMARY KEY  CLUSTERED ([CustomerPaymentMethodId] ASC)

Execution Successful


ALTER TABLE [EmployeeInformation].[Employee]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "EmployeeInformation.Employee" because it does not exist or you do not have permissions.
Execution Failed!


ALTER TABLE [EmployeeInformation].[Employee]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([EmployeeSocialSecurity]  ASC,[EmployeePhone]  ASC)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "EmployeeInformation.Employee" because it does not exist or you do not have permissions.
Execution Failed!


CREATE NONCLUSTERED INDEX [XIE1Employee] ON [EmployeeInformation].[Employee]
( 
	[EmployeeFirstName]   ASC
)

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "EmployeeInformation.Employee" because it does not exist or you do not have permissions.
Execution Failed!


ALTER TABLE [EmployeeInformation].[EmployeeDetail]
	ADD CONSTRAINT [XPKEmployeeDetail] PRIMARY KEY  CLUSTERED ([EmployeeDetailId] ASC)

Execution Successful


ALTER TABLE [EmployeeInformation].[EmployeePosition]
	ADD CONSTRAINT [XPKEmployeePosition] PRIMARY KEY  CLUSTERED ([EmployeePositionType] ASC)

Execution Successful


ALTER TABLE [MovieInformation].[Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieId] ASC)

Execution Successful


ALTER TABLE [MovieInformation].[Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)

Execution Successful


ALTER TABLE [MovieInformation].[MovieCondition]
	ADD CONSTRAINT [XPKMovieCondition] PRIMARY KEY  CLUSTERED ([MovieConditionType] ASC)

Execution Successful


ALTER TABLE [MovieInformation].[MovieCopy]
	ADD CONSTRAINT [XPKMovieCopy] PRIMARY KEY  CLUSTERED ([MovieCopyId] ASC)

Execution Successful


ALTER TABLE [MovieInformation].[MovieFormat]
	ADD CONSTRAINT [XPKMovieFormat] PRIMARY KEY  CLUSTERED ([MovieFormatType] ASC)

Execution Successful


ALTER TABLE [Rental].[MovieRentalDetail]
	ADD CONSTRAINT [XPKMovieRentalDetail] PRIMARY KEY  CLUSTERED ([MovieRentalDetailId] ASC)

Execution Successful


ALTER TABLE [Rental].[MovieRentalRecord]
	ADD CONSTRAINT [XPKMovieRentalRecord] PRIMARY KEY  CLUSTERED ([MovieRentalRecordId] ASC)

Execution Successful


ALTER TABLE [MovieInformation].[MovieStore]
	ADD CONSTRAINT [XPKMovieStore] PRIMARY KEY  CLUSTERED ([MovieStoreId] ASC)

Execution Successful


ALTER TABLE [PaymentHistory].[Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionId] ASC)

Execution Successful


ALTER TABLE [PaymentHistory].[PaymentDetail]
	ADD CONSTRAINT [XPKPaymentDetail] PRIMARY KEY  CLUSTERED ([PaymentDetailId] ASC)

Execution Successful


ALTER TABLE [PaymentHistory].[PaymentType]
	ADD CONSTRAINT [XPKPaymentType] PRIMARY KEY  CLUSTERED ([PaymentType] ASC)

Execution Successful


ALTER TABLE [Rental].[Status]
	ADD CONSTRAINT [XPKStatus] PRIMARY KEY  CLUSTERED ([StatusType] ASC)

Execution Successful


ALTER TABLE [EmployeeInformation].[Store]
	ADD CONSTRAINT [XPKStore] PRIMARY KEY  CLUSTERED ([StoreId] ASC)

Execution Successful


CREATE VIEW [vw_CustomerInvoice]([PaymentTransactionId],[EmployeeId],[CustomerPaymentMethodId],[PaymentType],[CustomerId],[MovieTitle],[MovieFormatType],[MovieRentalDate],[MovieDueDate],[MovieOverDueCharge],[StatusType])
AS
SELECT DISTINCT [PaymentHistory].[Payment].[PaymentTransactionId],[PaymentHistory].[Payment].[EmployeeId],[PaymentHistory].[Payment].[CustomerPaymentMethodId],[CustomerInformation].[CustomerPaymentMethod].[PaymentType],[CustomerInformation].[CustomerPaymentMethod].[CustomerId],[MovieInformation].[Movie].[MovieTitle],[MovieInformation].[MovieCopy].[MovieFormatType],[Rental].[MovieRentalDetail].[MovieRentalDate],[Rental].[MovieRentalDetail].[MovieDueDate],[Rental].[MovieRentalDetail].[MovieOverDueCharge],[Rental].[MovieRentalDetail].[StatusType]
	FROM [PaymentHistory].[Payment],[CustomerInformation].[CustomerPaymentMethod],[Rental].[MovieRentalRecord],[Rental].[MovieRentalDetail],[MovieInformation].[MovieCopy],[MovieInformation].[Movie]
		WHERE Payment.CustomerPaymentMethodId = CustomerPaymentMethod.CustomerPaymentMethodId

Execution Successful


CREATE VIEW [vw_OverdueNotice]([CustomerId],[MovieTitle],[MovieDueDate],[MovieOverDueCharge],[StatusType])
AS
SELECT [vw_CustomerInvoice].CustomerId,[vw_CustomerInvoice].MovieTitle,[vw_CustomerInvoice].MovieDueDate,[vw_CustomerInvoice].MovieOverDueCharge,[vw_CustomerInvoice].StatusType
	FROM [vw_CustomerInvoice]

Execution Successful



ALTER TABLE [CustomerInformation].[CustomerCheck]
	ADD CONSTRAINT [FK_CustomerPaymentMethod_CustomerCheck] FOREIGN KEY ([CustomerPaymentMethodId]) REFERENCES [CustomerInformation].[CustomerPaymentMethod]([CustomerPaymentMethodId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerCheck" because it does not exist or you do not have permissions.
Execution Failed!



ALTER TABLE [CustomerInformation].[CustomerCredit]
	ADD CONSTRAINT [FK_CustomerPaymentMethod_CustomerCredit] FOREIGN KEY ([CustomerPaymentMethodId]) REFERENCES [CustomerInformation].[CustomerPaymentMethod]([CustomerPaymentMethodId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerCredit" because it does not exist or you do not have permissions.
Execution Failed!


ALTER TABLE [CustomerInformation].[CustomerCredit]
	ADD CONSTRAINT [FK_CreditCardType_CustomerCredit] FOREIGN KEY ([CreditCardType]) REFERENCES [CustomerInformation].[CreditCardType]([CreditCardType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerCredit" because it does not exist or you do not have permissions.
Execution Failed!



ALTER TABLE [CustomerInformation].[CustomerEPay]
	ADD CONSTRAINT [FK_CustomerPaymentMethod_CustomerEPay] FOREIGN KEY ([CustomerPaymentMethodId]) REFERENCES [CustomerInformation].[CustomerPaymentMethod]([CustomerPaymentMethodId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Cannot find the object "CustomerInformation.CustomerEPay" because it does not exist or you do not have permissions.
Execution Failed!



ALTER TABLE [CustomerInformation].[CustomerPaymentMethod]
	ADD CONSTRAINT [FK_PaymentType_CustomerPaymentMethod] FOREIGN KEY ([PaymentType]) REFERENCES [PaymentHistory].[PaymentType]([PaymentType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [CustomerInformation].[CustomerPaymentMethod]
	ADD CONSTRAINT [FK_Customer_CustomerPaymentMethod] FOREIGN KEY ([CustomerId]) REFERENCES [CustomerInformation].[Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



ALTER TABLE [EmployeeInformation].[EmployeeDetail]
	ADD CONSTRAINT [FK_Employee_EmployeeDetail] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeInformation].[Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Foreign key 'FK_Employee_EmployeeDetail' references invalid table 'EmployeeInformation.Employee'.
[Microsoft][SQL Server Native Client 11.0][SQL Server]Could not create constraint or index. See previous errors.
Execution Failed!


ALTER TABLE [EmployeeInformation].[EmployeeDetail]
	ADD CONSTRAINT [FK_EmployeePosition_EmployeeDetail] FOREIGN KEY ([EmployeePositionType]) REFERENCES [EmployeeInformation].[EmployeePosition]([EmployeePositionType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [EmployeeInformation].[EmployeeDetail]
	ADD CONSTRAINT [FK_Store_EmployeeDetail] FOREIGN KEY ([StoreId]) REFERENCES [EmployeeInformation].[Store]([StoreId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



ALTER TABLE [MovieInformation].[MovieCopy]
	ADD CONSTRAINT [FK_Movie_MovieCopy] FOREIGN KEY ([MovieId]) REFERENCES [MovieInformation].[Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [MovieInformation].[MovieCopy]
	ADD CONSTRAINT [FK_MovieCondition_MovieCopy] FOREIGN KEY ([MovieConditionType]) REFERENCES [MovieInformation].[MovieCondition]([MovieConditionType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [MovieInformation].[MovieCopy]
	ADD CONSTRAINT [FK_MovieFormat_MovieCopy] FOREIGN KEY ([MovieFormatType]) REFERENCES [MovieInformation].[MovieFormat]([MovieFormatType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



ALTER TABLE [Rental].[MovieRentalDetail]
	ADD CONSTRAINT [FK_MovieRentalRecord_MovieRentalDetail] FOREIGN KEY ([MovieRentalRecordId]) REFERENCES [Rental].[MovieRentalRecord]([MovieRentalRecordId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Column 'Rental.MovieRentalRecord.MovieRentalRecordId' is not the same data type as referencing column 'MovieRentalDetail.MovieRentalRecordId' in foreign key 'FK_MovieRentalRecord_MovieRentalDetail'.
[Microsoft][SQL Server Native Client 11.0][SQL Server]Could not create constraint or index. See previous errors.
Execution Failed!


ALTER TABLE [Rental].[MovieRentalDetail]
	ADD CONSTRAINT [FK_Status_MovieRentalDetail] FOREIGN KEY ([StatusType]) REFERENCES [Rental].[Status]([StatusType])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



ALTER TABLE [Rental].[MovieRentalRecord]
	ADD CONSTRAINT [FK_MovieCopy_MovieRentalRecord] FOREIGN KEY ([MovieCopyId]) REFERENCES [MovieInformation].[MovieCopy]([MovieCopyId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [Rental].[MovieRentalRecord]
	ADD CONSTRAINT [FK_Payment_MovieRentalRecord] FOREIGN KEY ([PaymentTransactionId]) REFERENCES [PaymentHistory].[Payment]([PaymentTransactionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [Rental].[MovieRentalRecord]
	ADD CONSTRAINT [FK_Employee_MovieRentalRecord] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeInformation].[Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Foreign key 'FK_Employee_MovieRentalRecord' references invalid table 'EmployeeInformation.Employee'.
[Microsoft][SQL Server Native Client 11.0][SQL Server]Could not create constraint or index. See previous errors.
Execution Failed!



ALTER TABLE [MovieInformation].[MovieStore]
	ADD CONSTRAINT [FK_Store_MovieStore] FOREIGN KEY ([StoreId]) REFERENCES [EmployeeInformation].[Store]([StoreId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful


ALTER TABLE [MovieInformation].[MovieStore]
	ADD CONSTRAINT [FK_Movie_MovieStore] FOREIGN KEY ([MovieId]) REFERENCES [MovieInformation].[Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



ALTER TABLE [PaymentHistory].[Payment]
	ADD CONSTRAINT [FK_Employee_Payment] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeInformation].[Employee]([EmployeeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

[Microsoft][SQL Server Native Client 11.0][SQL Server]Foreign key 'FK_Employee_Payment' references invalid table 'EmployeeInformation.Employee'.
[Microsoft][SQL Server Native Client 11.0][SQL Server]Could not create constraint or index. See previous errors.
Execution Failed!


ALTER TABLE [PaymentHistory].[Payment]
	ADD CONSTRAINT [FK_CustomerPaymentMethod_Payment] FOREIGN KEY ([CustomerPaymentMethodId]) REFERENCES [CustomerInformation].[CustomerPaymentMethod]([CustomerPaymentMethodId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



ALTER TABLE [PaymentHistory].[PaymentDetail]
	ADD CONSTRAINT [FK_PaymentDetail_Payment] FOREIGN KEY ([PaymentTransactionId]) REFERENCES [PaymentHistory].[Payment]([PaymentTransactionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

Execution Successful



CREATE TRIGGER CustomerInformation.tD_CreditCardType ON CustomerInformation.CreditCardType FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CreditCardType */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerInformation.CreditCardType Has a CustomerInformation.CustomerCredit on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000185d4", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_CreditCardType_CustomerCredit", FK_COLUMNS="CreditCardType" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerCredit
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerCredit,deleted," = "," AND") */
        CustomerInformation.CustomerCredit.CreditCardType = deleted.CreditCardType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerInformation.CreditCardType because CustomerInformation.CustomerCredit exists.'
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


Execution Successful



CREATE TRIGGER CustomerInformation.tU_CreditCardType ON CustomerInformation.CreditCardType FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CreditCardType */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCreditCardType TypeOfObject,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerInformation.CreditCardType Has a CustomerInformation.CustomerCredit on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001ab21", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_CreditCardType_CustomerCredit", FK_COLUMNS="CreditCardType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CreditCardType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerCredit
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerCredit,deleted," = "," AND") */
        CustomerInformation.CustomerCredit.CreditCardType = deleted.CreditCardType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerInformation.CreditCardType because CustomerInformation.CustomerCredit exists.'
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


Execution Successful





CREATE TRIGGER CustomerInformation.tD_Customer ON CustomerInformation.Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerInformation.Customer Makes a CustomerInformation.CustomerPaymentMethod on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001918b", PARENT_OWNER="CustomerInformation", PARENT_TABLE="Customer"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Makes a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_Customer_CustomerPaymentMethod", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerPaymentMethod,deleted," = "," AND") */
        CustomerInformation.CustomerPaymentMethod.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerInformation.Customer because CustomerInformation.CustomerPaymentMethod exists.'
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


Execution Successful



CREATE TRIGGER CustomerInformation.tU_Customer ON CustomerInformation.Customer FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerInformation.Customer Makes a CustomerInformation.CustomerPaymentMethod on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001a76f", PARENT_OWNER="CustomerInformation", PARENT_TABLE="Customer"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Makes a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_Customer_CustomerPaymentMethod", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerPaymentMethod,deleted," = "," AND") */
        CustomerInformation.CustomerPaymentMethod.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerInformation.Customer because CustomerInformation.CustomerPaymentMethod exists.'
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


Execution Successful





CREATE TRIGGER CustomerInformation.tD_CustomerCheck ON CustomerInformation.CustomerCheck FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerCheck */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCheck on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002403e", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCheck"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCheck", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /* %JoinFKPK(deleted,CustomerInformation.CustomerPaymentMethod," = "," AND") */
        deleted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId AND
        NOT EXISTS (
          SELECT * FROM CustomerInformation.CustomerCheck
          WHERE
            /* %JoinFKPK(CustomerInformation.CustomerCheck,CustomerInformation.CustomerPaymentMethod," = "," AND") */
            CustomerInformation.CustomerCheck.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerInformation.CustomerCheck because CustomerInformation.CustomerPaymentMethod exists.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'CustomerInformation.CustomerCheck' does not exist or is invalid for this operation.
Execution Failed!



CREATE TRIGGER CustomerInformation.tU_CustomerCheck ON CustomerInformation.CustomerCheck FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerCheck */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerCheckId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCheck on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00024210", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCheck"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCheck", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerInformation.CustomerPaymentMethod
        WHERE
          /* %JoinFKPK(inserted,CustomerInformation.CustomerPaymentMethod) */
          inserted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerPaymentMethodId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerInformation.CustomerCheck because CustomerInformation.CustomerPaymentMethod does not exist.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'CustomerInformation.CustomerCheck' does not exist or is invalid for this operation.
Execution Failed!





CREATE TRIGGER CustomerInformation.tD_CustomerCredit ON CustomerInformation.CustomerCredit FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerCredit */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCredit on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00044b36", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCredit", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /* %JoinFKPK(deleted,CustomerInformation.CustomerPaymentMethod," = "," AND") */
        deleted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId AND
        NOT EXISTS (
          SELECT * FROM CustomerInformation.CustomerCredit
          WHERE
            /* %JoinFKPK(CustomerInformation.CustomerCredit,CustomerInformation.CustomerPaymentMethod," = "," AND") */
            CustomerInformation.CustomerCredit.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerInformation.CustomerCredit because CustomerInformation.CustomerPaymentMethod exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerInformation.CreditCardType Has a CustomerInformation.CustomerCredit on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_CreditCardType_CustomerCredit", FK_COLUMNS="CreditCardType" */
    IF EXISTS (SELECT * FROM deleted,CustomerInformation.CreditCardType
      WHERE
        /* %JoinFKPK(deleted,CustomerInformation.CreditCardType," = "," AND") */
        deleted.CreditCardType = CustomerInformation.CreditCardType.CreditCardType AND
        NOT EXISTS (
          SELECT * FROM CustomerInformation.CustomerCredit
          WHERE
            /* %JoinFKPK(CustomerInformation.CustomerCredit,CustomerInformation.CreditCardType," = "," AND") */
            CustomerInformation.CustomerCredit.CreditCardType = CustomerInformation.CreditCardType.CreditCardType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerInformation.CustomerCredit because CustomerInformation.CreditCardType exists.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'CustomerInformation.CustomerCredit' does not exist or is invalid for this operation.
Execution Failed!



CREATE TRIGGER CustomerInformation.tU_CustomerCredit ON CustomerInformation.CustomerCredit FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerCredit */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerCreditId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCredit on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00043b1c", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCredit", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerInformation.CustomerPaymentMethod
        WHERE
          /* %JoinFKPK(inserted,CustomerInformation.CustomerPaymentMethod) */
          inserted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerPaymentMethodId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerInformation.CustomerCredit because CustomerInformation.CustomerPaymentMethod does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerInformation.CreditCardType Has a CustomerInformation.CustomerCredit on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_CreditCardType_CustomerCredit", FK_COLUMNS="CreditCardType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CreditCardType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerInformation.CreditCardType
        WHERE
          /* %JoinFKPK(inserted,CustomerInformation.CreditCardType) */
          inserted.CreditCardType = CustomerInformation.CreditCardType.CreditCardType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CreditCardType IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerInformation.CustomerCredit because CustomerInformation.CreditCardType does not exist.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'CustomerInformation.CustomerCredit' does not exist or is invalid for this operation.
Execution Failed!





CREATE TRIGGER CustomerInformation.tD_CustomerEPay ON CustomerInformation.CustomerEPay FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerEPay */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerEPay on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000237a8", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerEPay"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerEPay", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /* %JoinFKPK(deleted,CustomerInformation.CustomerPaymentMethod," = "," AND") */
        deleted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId AND
        NOT EXISTS (
          SELECT * FROM CustomerInformation.CustomerEPay
          WHERE
            /* %JoinFKPK(CustomerInformation.CustomerEPay,CustomerInformation.CustomerPaymentMethod," = "," AND") */
            CustomerInformation.CustomerEPay.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerInformation.CustomerEPay because CustomerInformation.CustomerPaymentMethod exists.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'CustomerInformation.CustomerEPay' does not exist or is invalid for this operation.
Execution Failed!



CREATE TRIGGER CustomerInformation.tU_CustomerEPay ON CustomerInformation.CustomerEPay FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerEPay */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerEPayId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerEPay on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00023486", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerEPay"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerEPay", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerInformation.CustomerPaymentMethod
        WHERE
          /* %JoinFKPK(inserted,CustomerInformation.CustomerPaymentMethod) */
          inserted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerPaymentMethodId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerInformation.CustomerEPay because CustomerInformation.CustomerPaymentMethod does not exist.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'CustomerInformation.CustomerEPay' does not exist or is invalid for this operation.
Execution Failed!





CREATE TRIGGER CustomerInformation.tD_CustomerPaymentMethod ON CustomerInformation.CustomerPaymentMethod FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerPaymentMethod */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerEPay on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000a4c23", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerEPay"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerEPay", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerEPay
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerEPay,deleted," = "," AND") */
        CustomerInformation.CustomerEPay.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerInformation.CustomerPaymentMethod because CustomerInformation.CustomerEPay exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCheck on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCheck"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCheck", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerCheck
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerCheck,deleted," = "," AND") */
        CustomerInformation.CustomerCheck.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerInformation.CustomerPaymentMethod because CustomerInformation.CustomerCheck exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCredit on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCredit", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerCredit
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerCredit,deleted," = "," AND") */
        CustomerInformation.CustomerCredit.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerInformation.CustomerPaymentMethod because CustomerInformation.CustomerCredit exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Is used as a PaymentHistory.Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="Is used as a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_Payment", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (
      SELECT * FROM deleted,PaymentHistory.Payment
      WHERE
        /*  %JoinFKPK(PaymentHistory.Payment,deleted," = "," AND") */
        PaymentHistory.Payment.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerInformation.CustomerPaymentMethod because PaymentHistory.Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerInformation.Customer Makes a CustomerInformation.CustomerPaymentMethod on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="Customer"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Makes a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_Customer_CustomerPaymentMethod", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,CustomerInformation.Customer
      WHERE
        /* %JoinFKPK(deleted,CustomerInformation.Customer," = "," AND") */
        deleted.CustomerId = CustomerInformation.Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM CustomerInformation.CustomerPaymentMethod
          WHERE
            /* %JoinFKPK(CustomerInformation.CustomerPaymentMethod,CustomerInformation.Customer," = "," AND") */
            CustomerInformation.CustomerPaymentMethod.CustomerId = CustomerInformation.Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerInformation.CustomerPaymentMethod because CustomerInformation.Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PaymentHistory.PaymentType Is a method of payment CustomerInformation.CustomerPaymentMethod on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="PaymentHistory", PARENT_TABLE="PaymentType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Is a method of payment", C2P_VERB_PHRASE="Uses this method of payment", 
    FK_CONSTRAINT="FK_PaymentType_CustomerPaymentMethod", FK_COLUMNS="PaymentType" */
    IF EXISTS (SELECT * FROM deleted,PaymentHistory.PaymentType
      WHERE
        /* %JoinFKPK(deleted,PaymentHistory.PaymentType," = "," AND") */
        deleted.PaymentType = PaymentHistory.PaymentType.PaymentType AND
        NOT EXISTS (
          SELECT * FROM CustomerInformation.CustomerPaymentMethod
          WHERE
            /* %JoinFKPK(CustomerInformation.CustomerPaymentMethod,PaymentHistory.PaymentType," = "," AND") */
            CustomerInformation.CustomerPaymentMethod.PaymentType = PaymentHistory.PaymentType.PaymentType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerInformation.CustomerPaymentMethod because PaymentHistory.PaymentType exists.'
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


Execution Successful



CREATE TRIGGER CustomerInformation.tU_CustomerPaymentMethod ON CustomerInformation.CustomerPaymentMethod FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerPaymentMethod */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerPaymentMethodId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerEPay on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000a9d8b", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerEPay"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerEPay", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerEPay
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerEPay,deleted," = "," AND") */
        CustomerInformation.CustomerEPay.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerInformation.CustomerPaymentMethod because CustomerInformation.CustomerEPay exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCheck on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCheck"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCheck", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerCheck
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerCheck,deleted," = "," AND") */
        CustomerInformation.CustomerCheck.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerInformation.CustomerPaymentMethod because CustomerInformation.CustomerCheck exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Requires a CustomerInformation.CustomerCredit on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerCredit"
    P2C_VERB_PHRASE="Requires a", C2P_VERB_PHRASE="Links", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_CustomerCredit", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerCredit
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerCredit,deleted," = "," AND") */
        CustomerInformation.CustomerCredit.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerInformation.CustomerPaymentMethod because CustomerInformation.CustomerCredit exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Is used as a PaymentHistory.Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="Is used as a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_Payment", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PaymentHistory.Payment
      WHERE
        /*  %JoinFKPK(PaymentHistory.Payment,deleted," = "," AND") */
        PaymentHistory.Payment.CustomerPaymentMethodId = deleted.CustomerPaymentMethodId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerInformation.CustomerPaymentMethod because PaymentHistory.Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerInformation.Customer Makes a CustomerInformation.CustomerPaymentMethod on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="Customer"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Makes a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_Customer_CustomerPaymentMethod", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerInformation.Customer
        WHERE
          /* %JoinFKPK(inserted,CustomerInformation.Customer) */
          inserted.CustomerId = CustomerInformation.Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerInformation.CustomerPaymentMethod because CustomerInformation.Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PaymentHistory.PaymentType Is a method of payment CustomerInformation.CustomerPaymentMethod on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="PaymentHistory", PARENT_TABLE="PaymentType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Is a method of payment", C2P_VERB_PHRASE="Uses this method of payment", 
    FK_CONSTRAINT="FK_PaymentType_CustomerPaymentMethod", FK_COLUMNS="PaymentType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PaymentHistory.PaymentType
        WHERE
          /* %JoinFKPK(inserted,PaymentHistory.PaymentType) */
          inserted.PaymentType = PaymentHistory.PaymentType.PaymentType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentType IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerInformation.CustomerPaymentMethod because PaymentHistory.PaymentType does not exist.'
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


Execution Successful





CREATE TRIGGER EmployeeInformation.tD_Employee ON EmployeeInformation.Employee FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Employee */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EmployeeInformation.Employee Creates a Rental.MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000400d2", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="Creates a", C2P_VERB_PHRASE="Is created by", 
    FK_CONSTRAINT="FK_Employee_MovieRentalRecord", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalRecord,deleted," = "," AND") */
        Rental.MovieRentalRecord.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeeInformation.Employee because Rental.MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Employee Has a EmployeeInformation.EmployeeDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Detail of", 
    FK_CONSTRAINT="FK_Employee_EmployeeDetail", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,EmployeeInformation.EmployeeDetail
      WHERE
        /*  %JoinFKPK(EmployeeInformation.EmployeeDetail,deleted," = "," AND") */
        EmployeeInformation.EmployeeDetail.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeeInformation.Employee because EmployeeInformation.EmployeeDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Employee receives PaymentHistory.Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Employee_Payment", FK_COLUMNS="EmployeeId" */
    IF EXISTS (
      SELECT * FROM deleted,PaymentHistory.Payment
      WHERE
        /*  %JoinFKPK(PaymentHistory.Payment,deleted," = "," AND") */
        PaymentHistory.Payment.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeeInformation.Employee because PaymentHistory.Payment exists.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'EmployeeInformation.Employee' does not exist or is invalid for this operation.
Execution Failed!



CREATE TRIGGER EmployeeInformation.tU_Employee ON EmployeeInformation.Employee FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Employee */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeId varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EmployeeInformation.Employee Creates a Rental.MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00045475", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="Creates a", C2P_VERB_PHRASE="Is created by", 
    FK_CONSTRAINT="FK_Employee_MovieRentalRecord", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalRecord,deleted," = "," AND") */
        Rental.MovieRentalRecord.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeeInformation.Employee because Rental.MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Employee Has a EmployeeInformation.EmployeeDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Detail of", 
    FK_CONSTRAINT="FK_Employee_EmployeeDetail", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EmployeeInformation.EmployeeDetail
      WHERE
        /*  %JoinFKPK(EmployeeInformation.EmployeeDetail,deleted," = "," AND") */
        EmployeeInformation.EmployeeDetail.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeeInformation.Employee because EmployeeInformation.EmployeeDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Employee receives PaymentHistory.Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Employee_Payment", FK_COLUMNS="EmployeeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PaymentHistory.Payment
      WHERE
        /*  %JoinFKPK(PaymentHistory.Payment,deleted," = "," AND") */
        PaymentHistory.Payment.EmployeeId = deleted.EmployeeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeeInformation.Employee because PaymentHistory.Payment exists.'
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


[Microsoft][SQL Server Native Client 11.0][SQL Server]The object 'EmployeeInformation.Employee' does not exist or is invalid for this operation.
Execution Failed!





CREATE TRIGGER EmployeeInformation.tD_EmployeeDetail ON EmployeeInformation.EmployeeDetail FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EmployeeDetail */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EmployeeInformation.Store Employs a EmployeeInformation.EmployeeDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005c03b", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Employs a", C2P_VERB_PHRASE="Works at", 
    FK_CONSTRAINT="FK_Store_EmployeeDetail", FK_COLUMNS="StoreId" */
    IF EXISTS (SELECT * FROM deleted,EmployeeInformation.Store
      WHERE
        /* %JoinFKPK(deleted,EmployeeInformation.Store," = "," AND") */
        deleted.StoreId = EmployeeInformation.Store.StoreId AND
        NOT EXISTS (
          SELECT * FROM EmployeeInformation.EmployeeDetail
          WHERE
            /* %JoinFKPK(EmployeeInformation.EmployeeDetail,EmployeeInformation.Store," = "," AND") */
            EmployeeInformation.EmployeeDetail.StoreId = EmployeeInformation.Store.StoreId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EmployeeInformation.EmployeeDetail because EmployeeInformation.Store exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.EmployeePosition The position of EmployeeInformation.EmployeeDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="The position of", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_EmployeePosition_EmployeeDetail", FK_COLUMNS="EmployeePositionType" */
    IF EXISTS (SELECT * FROM deleted,EmployeeInformation.EmployeePosition
      WHERE
        /* %JoinFKPK(deleted,EmployeeInformation.EmployeePosition," = "," AND") */
        deleted.EmployeePositionType = EmployeeInformation.EmployeePosition.EmployeePositionType AND
        NOT EXISTS (
          SELECT * FROM EmployeeInformation.EmployeeDetail
          WHERE
            /* %JoinFKPK(EmployeeInformation.EmployeeDetail,EmployeeInformation.EmployeePosition," = "," AND") */
            EmployeeInformation.EmployeeDetail.EmployeePositionType = EmployeeInformation.EmployeePosition.EmployeePositionType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EmployeeInformation.EmployeeDetail because EmployeeInformation.EmployeePosition exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Employee Has a EmployeeInformation.EmployeeDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Detail of", 
    FK_CONSTRAINT="FK_Employee_EmployeeDetail", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,EmployeeInformation.Employee
      WHERE
        /* %JoinFKPK(deleted,EmployeeInformation.Employee," = "," AND") */
        deleted.EmployeeId = EmployeeInformation.Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM EmployeeInformation.EmployeeDetail
          WHERE
            /* %JoinFKPK(EmployeeInformation.EmployeeDetail,EmployeeInformation.Employee," = "," AND") */
            EmployeeInformation.EmployeeDetail.EmployeeId = EmployeeInformation.Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EmployeeInformation.EmployeeDetail because EmployeeInformation.Employee exists.'
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


Execution Successful



CREATE TRIGGER EmployeeInformation.tU_EmployeeDetail ON EmployeeInformation.EmployeeDetail FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EmployeeDetail */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeDetailId char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EmployeeInformation.Store Employs a EmployeeInformation.EmployeeDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0005ceb5", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Employs a", C2P_VERB_PHRASE="Works at", 
    FK_CONSTRAINT="FK_Store_EmployeeDetail", FK_COLUMNS="StoreId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeeInformation.Store
        WHERE
          /* %JoinFKPK(inserted,EmployeeInformation.Store) */
          inserted.StoreId = EmployeeInformation.Store.StoreId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StoreId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EmployeeInformation.EmployeeDetail because EmployeeInformation.Store does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.EmployeePosition The position of EmployeeInformation.EmployeeDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="The position of", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_EmployeePosition_EmployeeDetail", FK_COLUMNS="EmployeePositionType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeePositionType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeeInformation.EmployeePosition
        WHERE
          /* %JoinFKPK(inserted,EmployeeInformation.EmployeePosition) */
          inserted.EmployeePositionType = EmployeeInformation.EmployeePosition.EmployeePositionType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeePositionType IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EmployeeInformation.EmployeeDetail because EmployeeInformation.EmployeePosition does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Employee Has a EmployeeInformation.EmployeeDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Detail of", 
    FK_CONSTRAINT="FK_Employee_EmployeeDetail", FK_COLUMNS="EmployeeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeeInformation.Employee
        WHERE
          /* %JoinFKPK(inserted,EmployeeInformation.Employee) */
          inserted.EmployeeId = EmployeeInformation.Employee.EmployeeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EmployeeInformation.EmployeeDetail because EmployeeInformation.Employee does not exist.'
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


Execution Successful





CREATE TRIGGER EmployeeInformation.tD_EmployeePosition ON EmployeeInformation.EmployeePosition FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EmployeePosition */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EmployeeInformation.EmployeePosition The position of EmployeeInformation.EmployeeDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000189c9", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="The position of", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_EmployeePosition_EmployeeDetail", FK_COLUMNS="EmployeePositionType" */
    IF EXISTS (
      SELECT * FROM deleted,EmployeeInformation.EmployeeDetail
      WHERE
        /*  %JoinFKPK(EmployeeInformation.EmployeeDetail,deleted," = "," AND") */
        EmployeeInformation.EmployeeDetail.EmployeePositionType = deleted.EmployeePositionType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeeInformation.EmployeePosition because EmployeeInformation.EmployeeDetail exists.'
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


Execution Successful



CREATE TRIGGER EmployeeInformation.tU_EmployeePosition ON EmployeeInformation.EmployeePosition FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EmployeePosition */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeePositionType TypeOfObject,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EmployeeInformation.EmployeePosition The position of EmployeeInformation.EmployeeDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001aec6", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="EmployeePosition"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="The position of", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_EmployeePosition_EmployeeDetail", FK_COLUMNS="EmployeePositionType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeePositionType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EmployeeInformation.EmployeeDetail
      WHERE
        /*  %JoinFKPK(EmployeeInformation.EmployeeDetail,deleted," = "," AND") */
        EmployeeInformation.EmployeeDetail.EmployeePositionType = deleted.EmployeePositionType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeeInformation.EmployeePosition because EmployeeInformation.EmployeeDetail exists.'
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


Execution Successful





CREATE TRIGGER MovieInformation.tD_Movie ON MovieInformation.Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieInformation.Movie Is in MovieInformation.MovieStore on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002927b", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Is in", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_Movie_MovieStore", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieStore
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieStore,deleted," = "," AND") */
        MovieInformation.MovieStore.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieInformation.Movie because MovieInformation.MovieStore exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieInformation.Movie is rented as MovieInformation.MovieCopy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_MovieCopy", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieCopy,deleted," = "," AND") */
        MovieInformation.MovieCopy.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieInformation.Movie because MovieInformation.MovieCopy exists.'
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


Execution Successful



CREATE TRIGGER MovieInformation.tU_Movie ON MovieInformation.Movie FOR UPDATE AS
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
  /* MovieInformation.Movie Is in MovieInformation.MovieStore on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d201", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Is in", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_Movie_MovieStore", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieStore
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieStore,deleted," = "," AND") */
        MovieInformation.MovieStore.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieInformation.Movie because MovieInformation.MovieStore exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieInformation.Movie is rented as MovieInformation.MovieCopy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_MovieCopy", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieCopy,deleted," = "," AND") */
        MovieInformation.MovieCopy.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieInformation.Movie because MovieInformation.MovieCopy exists.'
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


Execution Successful





CREATE TRIGGER MovieInformation.tD_MovieCondition ON MovieInformation.MovieCondition FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieCondition */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieInformation.MovieCondition For a MovieInformation.MovieCopy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016282", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCondition"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieCondition_MovieCopy", FK_COLUMNS="MovieConditionType" */
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieCopy,deleted," = "," AND") */
        MovieInformation.MovieCopy.MovieConditionType = deleted.MovieConditionType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieInformation.MovieCondition because MovieInformation.MovieCopy exists.'
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


Execution Successful



CREATE TRIGGER MovieInformation.tU_MovieCondition ON MovieInformation.MovieCondition FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieCondition */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieConditionType TypeOfObject,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieInformation.MovieCondition For a MovieInformation.MovieCopy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000180fa", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCondition"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieCondition_MovieCopy", FK_COLUMNS="MovieConditionType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieConditionType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieCopy,deleted," = "," AND") */
        MovieInformation.MovieCopy.MovieConditionType = deleted.MovieConditionType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieInformation.MovieCondition because MovieInformation.MovieCopy exists.'
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


Execution Successful





CREATE TRIGGER MovieInformation.tD_MovieCopy ON MovieInformation.MovieCopy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieCopy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieInformation.MovieCopy is rented under Rental.MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006cb9f", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MovieCopy_MovieRentalRecord", FK_COLUMNS="MovieCopyId" */
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalRecord,deleted," = "," AND") */
        Rental.MovieRentalRecord.MovieCopyId = deleted.MovieCopyId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieInformation.MovieCopy because Rental.MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieInformation.MovieFormat For a MovieInformation.MovieCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieFormat"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieFormat_MovieCopy", FK_COLUMNS="MovieFormatType" */
    IF EXISTS (SELECT * FROM deleted,MovieInformation.MovieFormat
      WHERE
        /* %JoinFKPK(deleted,MovieInformation.MovieFormat," = "," AND") */
        deleted.MovieFormatType = MovieInformation.MovieFormat.MovieFormatType AND
        NOT EXISTS (
          SELECT * FROM MovieInformation.MovieCopy
          WHERE
            /* %JoinFKPK(MovieInformation.MovieCopy,MovieInformation.MovieFormat," = "," AND") */
            MovieInformation.MovieCopy.MovieFormatType = MovieInformation.MovieFormat.MovieFormatType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieInformation.MovieCopy because MovieInformation.MovieFormat exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieInformation.MovieCondition For a MovieInformation.MovieCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCondition"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieCondition_MovieCopy", FK_COLUMNS="MovieConditionType" */
    IF EXISTS (SELECT * FROM deleted,MovieInformation.MovieCondition
      WHERE
        /* %JoinFKPK(deleted,MovieInformation.MovieCondition," = "," AND") */
        deleted.MovieConditionType = MovieInformation.MovieCondition.MovieConditionType AND
        NOT EXISTS (
          SELECT * FROM MovieInformation.MovieCopy
          WHERE
            /* %JoinFKPK(MovieInformation.MovieCopy,MovieInformation.MovieCondition," = "," AND") */
            MovieInformation.MovieCopy.MovieConditionType = MovieInformation.MovieCondition.MovieConditionType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieInformation.MovieCopy because MovieInformation.MovieCondition exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieInformation.Movie is rented as MovieInformation.MovieCopy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_MovieCopy", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,MovieInformation.Movie
      WHERE
        /* %JoinFKPK(deleted,MovieInformation.Movie," = "," AND") */
        deleted.MovieId = MovieInformation.Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MovieInformation.MovieCopy
          WHERE
            /* %JoinFKPK(MovieInformation.MovieCopy,MovieInformation.Movie," = "," AND") */
            MovieInformation.MovieCopy.MovieId = MovieInformation.Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieInformation.MovieCopy because MovieInformation.Movie exists.'
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


Execution Successful



CREATE TRIGGER MovieInformation.tU_MovieCopy ON MovieInformation.MovieCopy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieCopy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieCopyId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieInformation.MovieCopy is rented under Rental.MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006dcf1", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MovieCopy_MovieRentalRecord", FK_COLUMNS="MovieCopyId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieCopyId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalRecord,deleted," = "," AND") */
        Rental.MovieRentalRecord.MovieCopyId = deleted.MovieCopyId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieInformation.MovieCopy because Rental.MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieInformation.MovieFormat For a MovieInformation.MovieCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieFormat"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieFormat_MovieCopy", FK_COLUMNS="MovieFormatType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieFormatType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieInformation.MovieFormat
        WHERE
          /* %JoinFKPK(inserted,MovieInformation.MovieFormat) */
          inserted.MovieFormatType = MovieInformation.MovieFormat.MovieFormatType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieFormatType IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieInformation.MovieCopy because MovieInformation.MovieFormat does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieInformation.MovieCondition For a MovieInformation.MovieCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCondition"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieCondition_MovieCopy", FK_COLUMNS="MovieConditionType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieConditionType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieInformation.MovieCondition
        WHERE
          /* %JoinFKPK(inserted,MovieInformation.MovieCondition) */
          inserted.MovieConditionType = MovieInformation.MovieCondition.MovieConditionType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieConditionType IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieInformation.MovieCopy because MovieInformation.MovieCondition does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieInformation.Movie is rented as MovieInformation.MovieCopy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_Movie_MovieCopy", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieInformation.Movie
        WHERE
          /* %JoinFKPK(inserted,MovieInformation.Movie) */
          inserted.MovieId = MovieInformation.Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieInformation.MovieCopy because MovieInformation.Movie does not exist.'
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


Execution Successful





CREATE TRIGGER MovieInformation.tD_MovieFormat ON MovieInformation.MovieFormat FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieFormat */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieInformation.MovieFormat For a MovieInformation.MovieCopy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000168e9", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieFormat"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieFormat_MovieCopy", FK_COLUMNS="MovieFormatType" */
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieCopy,deleted," = "," AND") */
        MovieInformation.MovieCopy.MovieFormatType = deleted.MovieFormatType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MovieInformation.MovieFormat because MovieInformation.MovieCopy exists.'
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


Execution Successful



CREATE TRIGGER MovieInformation.tU_MovieFormat ON MovieInformation.MovieFormat FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieFormat */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieFormatType TypeOfObject,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieInformation.MovieFormat For a MovieInformation.MovieCopy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000190a7", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieFormat"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieCopy"
    P2C_VERB_PHRASE="For a", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_MovieFormat_MovieCopy", FK_COLUMNS="MovieFormatType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieFormatType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieCopy,deleted," = "," AND") */
        MovieInformation.MovieCopy.MovieFormatType = deleted.MovieFormatType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MovieInformation.MovieFormat because MovieInformation.MovieCopy exists.'
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


Execution Successful





CREATE TRIGGER Rental.tD_MovieRentalDetail ON Rental.MovieRentalDetail FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieRentalDetail */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rental.Status  Rental.MovieRentalDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00033487", PARENT_OWNER="Rental", PARENT_TABLE="Status"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Status_MovieRentalDetail", FK_COLUMNS="StatusType" */
    IF EXISTS (SELECT * FROM deleted,Rental.Status
      WHERE
        /* %JoinFKPK(deleted,Rental.Status," = "," AND") */
        deleted.StatusType = Rental.Status.StatusType AND
        NOT EXISTS (
          SELECT * FROM Rental.MovieRentalDetail
          WHERE
            /* %JoinFKPK(Rental.MovieRentalDetail,Rental.Status," = "," AND") */
            Rental.MovieRentalDetail.StatusType = Rental.Status.StatusType
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental.MovieRentalDetail because Rental.Status exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Rental.MovieRentalRecord Has a Rental.MovieRentalDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Rental", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieRentalDetail", FK_COLUMNS="MovieRentalRecordId" */
    IF EXISTS (SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /* %JoinFKPK(deleted,Rental.MovieRentalRecord," = "," AND") */
        deleted.MovieRentalRecordId = Rental.MovieRentalRecord.MovieRentalRecordId AND
        NOT EXISTS (
          SELECT * FROM Rental.MovieRentalDetail
          WHERE
            /* %JoinFKPK(Rental.MovieRentalDetail,Rental.MovieRentalRecord," = "," AND") */
            Rental.MovieRentalDetail.MovieRentalRecordId = Rental.MovieRentalRecord.MovieRentalRecordId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental.MovieRentalDetail because Rental.MovieRentalRecord exists.'
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


Execution Successful



CREATE TRIGGER Rental.tU_MovieRentalDetail ON Rental.MovieRentalDetail FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieRentalDetail */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieRentalDetailId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rental.Status  Rental.MovieRentalDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00037ad7", PARENT_OWNER="Rental", PARENT_TABLE="Status"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Status_MovieRentalDetail", FK_COLUMNS="StatusType" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StatusType)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Rental.Status
        WHERE
          /* %JoinFKPK(inserted,Rental.Status) */
          inserted.StatusType = Rental.Status.StatusType
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StatusType IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental.MovieRentalDetail because Rental.Status does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Rental.MovieRentalRecord Has a Rental.MovieRentalDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Rental", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieRentalDetail", FK_COLUMNS="MovieRentalRecordId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieRentalRecordId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Rental.MovieRentalRecord
        WHERE
          /* %JoinFKPK(inserted,Rental.MovieRentalRecord) */
          inserted.MovieRentalRecordId = Rental.MovieRentalRecord.MovieRentalRecordId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieRentalRecordId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental.MovieRentalDetail because Rental.MovieRentalRecord does not exist.'
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


Execution Successful





CREATE TRIGGER Rental.tD_MovieRentalRecord ON Rental.MovieRentalRecord FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieRentalRecord */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rental.MovieRentalRecord Has a Rental.MovieRentalDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006990f", PARENT_OWNER="Rental", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieRentalDetail", FK_COLUMNS="MovieRentalRecordId" */
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalDetail
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalDetail,deleted," = "," AND") */
        Rental.MovieRentalDetail.MovieRentalRecordId = deleted.MovieRentalRecordId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Rental.MovieRentalRecord because Rental.MovieRentalDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Employee Creates a Rental.MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="Creates a", C2P_VERB_PHRASE="Is created by", 
    FK_CONSTRAINT="FK_Employee_MovieRentalRecord", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,EmployeeInformation.Employee
      WHERE
        /* %JoinFKPK(deleted,EmployeeInformation.Employee," = "," AND") */
        deleted.EmployeeId = EmployeeInformation.Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM Rental.MovieRentalRecord
          WHERE
            /* %JoinFKPK(Rental.MovieRentalRecord,EmployeeInformation.Employee," = "," AND") */
            Rental.MovieRentalRecord.EmployeeId = EmployeeInformation.Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental.MovieRentalRecord because EmployeeInformation.Employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PaymentHistory.Payment is made on Rental.MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Payment_MovieRentalRecord", FK_COLUMNS="PaymentTransactionId" */
    IF EXISTS (SELECT * FROM deleted,PaymentHistory.Payment
      WHERE
        /* %JoinFKPK(deleted,PaymentHistory.Payment," = "," AND") */
        deleted.PaymentTransactionId = PaymentHistory.Payment.PaymentTransactionId AND
        NOT EXISTS (
          SELECT * FROM Rental.MovieRentalRecord
          WHERE
            /* %JoinFKPK(Rental.MovieRentalRecord,PaymentHistory.Payment," = "," AND") */
            Rental.MovieRentalRecord.PaymentTransactionId = PaymentHistory.Payment.PaymentTransactionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental.MovieRentalRecord because PaymentHistory.Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MovieInformation.MovieCopy is rented under Rental.MovieRentalRecord on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MovieCopy_MovieRentalRecord", FK_COLUMNS="MovieCopyId" */
    IF EXISTS (SELECT * FROM deleted,MovieInformation.MovieCopy
      WHERE
        /* %JoinFKPK(deleted,MovieInformation.MovieCopy," = "," AND") */
        deleted.MovieCopyId = MovieInformation.MovieCopy.MovieCopyId AND
        NOT EXISTS (
          SELECT * FROM Rental.MovieRentalRecord
          WHERE
            /* %JoinFKPK(Rental.MovieRentalRecord,MovieInformation.MovieCopy," = "," AND") */
            Rental.MovieRentalRecord.MovieCopyId = MovieInformation.MovieCopy.MovieCopyId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental.MovieRentalRecord because MovieInformation.MovieCopy exists.'
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


Execution Successful



CREATE TRIGGER Rental.tU_MovieRentalRecord ON Rental.MovieRentalRecord FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieRentalRecord */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieRentalRecordId char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rental.MovieRentalRecord Has a Rental.MovieRentalDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006df2e", PARENT_OWNER="Rental", PARENT_TABLE="MovieRentalRecord"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MovieRentalRecord_MovieRentalDetail", FK_COLUMNS="MovieRentalRecordId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieRentalRecordId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalDetail
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalDetail,deleted," = "," AND") */
        Rental.MovieRentalDetail.MovieRentalRecordId = deleted.MovieRentalRecordId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Rental.MovieRentalRecord because Rental.MovieRentalDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Employee Creates a Rental.MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="Creates a", C2P_VERB_PHRASE="Is created by", 
    FK_CONSTRAINT="FK_Employee_MovieRentalRecord", FK_COLUMNS="EmployeeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeeInformation.Employee
        WHERE
          /* %JoinFKPK(inserted,EmployeeInformation.Employee) */
          inserted.EmployeeId = EmployeeInformation.Employee.EmployeeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental.MovieRentalRecord because EmployeeInformation.Employee does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PaymentHistory.Payment is made on Rental.MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Payment_MovieRentalRecord", FK_COLUMNS="PaymentTransactionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PaymentHistory.Payment
        WHERE
          /* %JoinFKPK(inserted,PaymentHistory.Payment) */
          inserted.PaymentTransactionId = PaymentHistory.Payment.PaymentTransactionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental.MovieRentalRecord because PaymentHistory.Payment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MovieInformation.MovieCopy is rented under Rental.MovieRentalRecord on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="MovieInformation", PARENT_TABLE="MovieCopy"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MovieCopy_MovieRentalRecord", FK_COLUMNS="MovieCopyId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCopyId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieInformation.MovieCopy
        WHERE
          /* %JoinFKPK(inserted,MovieInformation.MovieCopy) */
          inserted.MovieCopyId = MovieInformation.MovieCopy.MovieCopyId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental.MovieRentalRecord because MovieInformation.MovieCopy does not exist.'
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


Execution Successful





CREATE TRIGGER MovieInformation.tD_MovieStore ON MovieInformation.MovieStore FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStore */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MovieInformation.Movie Is in MovieInformation.MovieStore on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00034df9", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Is in", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_Movie_MovieStore", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,MovieInformation.Movie
      WHERE
        /* %JoinFKPK(deleted,MovieInformation.Movie," = "," AND") */
        deleted.MovieId = MovieInformation.Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MovieInformation.MovieStore
          WHERE
            /* %JoinFKPK(MovieInformation.MovieStore,MovieInformation.Movie," = "," AND") */
            MovieInformation.MovieStore.MovieId = MovieInformation.Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieInformation.MovieStore because MovieInformation.Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Store Has a MovieInformation.MovieStore on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Is in", 
    FK_CONSTRAINT="FK_Store_MovieStore", FK_COLUMNS="StoreId" */
    IF EXISTS (SELECT * FROM deleted,EmployeeInformation.Store
      WHERE
        /* %JoinFKPK(deleted,EmployeeInformation.Store," = "," AND") */
        deleted.StoreId = EmployeeInformation.Store.StoreId AND
        NOT EXISTS (
          SELECT * FROM MovieInformation.MovieStore
          WHERE
            /* %JoinFKPK(MovieInformation.MovieStore,EmployeeInformation.Store," = "," AND") */
            MovieInformation.MovieStore.StoreId = EmployeeInformation.Store.StoreId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieInformation.MovieStore because EmployeeInformation.Store exists.'
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


Execution Successful



CREATE TRIGGER MovieInformation.tU_MovieStore ON MovieInformation.MovieStore FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStore */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieStoreId char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MovieInformation.Movie Is in MovieInformation.MovieStore on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003718d", PARENT_OWNER="MovieInformation", PARENT_TABLE="Movie"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Is in", C2P_VERB_PHRASE="Requires", 
    FK_CONSTRAINT="FK_Movie_MovieStore", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MovieInformation.Movie
        WHERE
          /* %JoinFKPK(inserted,MovieInformation.Movie) */
          inserted.MovieId = MovieInformation.Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieInformation.MovieStore because MovieInformation.Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Store Has a MovieInformation.MovieStore on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Is in", 
    FK_CONSTRAINT="FK_Store_MovieStore", FK_COLUMNS="StoreId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeeInformation.Store
        WHERE
          /* %JoinFKPK(inserted,EmployeeInformation.Store) */
          inserted.StoreId = EmployeeInformation.Store.StoreId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieInformation.MovieStore because EmployeeInformation.Store does not exist.'
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


Execution Successful





CREATE TRIGGER PaymentHistory.tD_Payment ON PaymentHistory.Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PaymentHistory.Payment Requires PaymentHistory.PaymentDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00067bbf", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="PaymentDetail"
    P2C_VERB_PHRASE="Requires", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_PaymentDetail_Payment", FK_COLUMNS="PaymentTransactionId" */
    IF EXISTS (
      SELECT * FROM deleted,PaymentHistory.PaymentDetail
      WHERE
        /*  %JoinFKPK(PaymentHistory.PaymentDetail,deleted," = "," AND") */
        PaymentHistory.PaymentDetail.PaymentTransactionId = deleted.PaymentTransactionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PaymentHistory.Payment because PaymentHistory.PaymentDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PaymentHistory.Payment is made on Rental.MovieRentalRecord on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Payment_MovieRentalRecord", FK_COLUMNS="PaymentTransactionId" */
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalRecord,deleted," = "," AND") */
        Rental.MovieRentalRecord.PaymentTransactionId = deleted.PaymentTransactionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PaymentHistory.Payment because Rental.MovieRentalRecord exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerInformation.CustomerPaymentMethod Is used as a PaymentHistory.Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="Is used as a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_Payment", FK_COLUMNS="CustomerPaymentMethodId" */
    IF EXISTS (SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /* %JoinFKPK(deleted,CustomerInformation.CustomerPaymentMethod," = "," AND") */
        deleted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId AND
        NOT EXISTS (
          SELECT * FROM PaymentHistory.Payment
          WHERE
            /* %JoinFKPK(PaymentHistory.Payment,CustomerInformation.CustomerPaymentMethod," = "," AND") */
            PaymentHistory.Payment.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PaymentHistory.Payment because CustomerInformation.CustomerPaymentMethod exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Employee receives PaymentHistory.Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Employee_Payment", FK_COLUMNS="EmployeeId" */
    IF EXISTS (SELECT * FROM deleted,EmployeeInformation.Employee
      WHERE
        /* %JoinFKPK(deleted,EmployeeInformation.Employee," = "," AND") */
        deleted.EmployeeId = EmployeeInformation.Employee.EmployeeId AND
        NOT EXISTS (
          SELECT * FROM PaymentHistory.Payment
          WHERE
            /* %JoinFKPK(PaymentHistory.Payment,EmployeeInformation.Employee," = "," AND") */
            PaymentHistory.Payment.EmployeeId = EmployeeInformation.Employee.EmployeeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PaymentHistory.Payment because EmployeeInformation.Employee exists.'
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


Execution Successful



CREATE TRIGGER PaymentHistory.tU_Payment ON PaymentHistory.Payment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Payment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PaymentHistory.Payment Requires PaymentHistory.PaymentDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006e4bf", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="PaymentDetail"
    P2C_VERB_PHRASE="Requires", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_PaymentDetail_Payment", FK_COLUMNS="PaymentTransactionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PaymentHistory.PaymentDetail
      WHERE
        /*  %JoinFKPK(PaymentHistory.PaymentDetail,deleted," = "," AND") */
        PaymentHistory.PaymentDetail.PaymentTransactionId = deleted.PaymentTransactionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PaymentHistory.Payment because PaymentHistory.PaymentDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PaymentHistory.Payment is made on Rental.MovieRentalRecord on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalRecord"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_Payment_MovieRentalRecord", FK_COLUMNS="PaymentTransactionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalRecord
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalRecord,deleted," = "," AND") */
        Rental.MovieRentalRecord.PaymentTransactionId = deleted.PaymentTransactionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PaymentHistory.Payment because Rental.MovieRentalRecord exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerInformation.CustomerPaymentMethod Is used as a PaymentHistory.Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="CustomerInformation", PARENT_TABLE="CustomerPaymentMethod"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="Is used as a", C2P_VERB_PHRASE="Requires a", 
    FK_CONSTRAINT="FK_CustomerPaymentMethod_Payment", FK_COLUMNS="CustomerPaymentMethodId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerPaymentMethodId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerInformation.CustomerPaymentMethod
        WHERE
          /* %JoinFKPK(inserted,CustomerInformation.CustomerPaymentMethod) */
          inserted.CustomerPaymentMethodId = CustomerInformation.CustomerPaymentMethod.CustomerPaymentMethodId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerPaymentMethodId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PaymentHistory.Payment because CustomerInformation.CustomerPaymentMethod does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Employee receives PaymentHistory.Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Employee"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Employee_Payment", FK_COLUMNS="EmployeeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EmployeeInformation.Employee
        WHERE
          /* %JoinFKPK(inserted,EmployeeInformation.Employee) */
          inserted.EmployeeId = EmployeeInformation.Employee.EmployeeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PaymentHistory.Payment because EmployeeInformation.Employee does not exist.'
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


Execution Successful





CREATE TRIGGER PaymentHistory.tD_PaymentDetail ON PaymentHistory.PaymentDetail FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PaymentDetail */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PaymentHistory.Payment Requires PaymentHistory.PaymentDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001d5ca", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="PaymentDetail"
    P2C_VERB_PHRASE="Requires", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_PaymentDetail_Payment", FK_COLUMNS="PaymentTransactionId" */
    IF EXISTS (SELECT * FROM deleted,PaymentHistory.Payment
      WHERE
        /* %JoinFKPK(deleted,PaymentHistory.Payment," = "," AND") */
        deleted.PaymentTransactionId = PaymentHistory.Payment.PaymentTransactionId AND
        NOT EXISTS (
          SELECT * FROM PaymentHistory.PaymentDetail
          WHERE
            /* %JoinFKPK(PaymentHistory.PaymentDetail,PaymentHistory.Payment," = "," AND") */
            PaymentHistory.PaymentDetail.PaymentTransactionId = PaymentHistory.Payment.PaymentTransactionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PaymentHistory.PaymentDetail because PaymentHistory.Payment exists.'
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


Execution Successful



CREATE TRIGGER PaymentHistory.tU_PaymentDetail ON PaymentHistory.PaymentDetail FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PaymentDetail */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentDetailId SurrogateKeyInt,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PaymentHistory.Payment Requires PaymentHistory.PaymentDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001e146", PARENT_OWNER="PaymentHistory", PARENT_TABLE="Payment"
    CHILD_OWNER="PaymentHistory", CHILD_TABLE="PaymentDetail"
    P2C_VERB_PHRASE="Requires", C2P_VERB_PHRASE="Has a", 
    FK_CONSTRAINT="FK_PaymentDetail_Payment", FK_COLUMNS="PaymentTransactionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PaymentHistory.Payment
        WHERE
          /* %JoinFKPK(inserted,PaymentHistory.Payment) */
          inserted.PaymentTransactionId = PaymentHistory.Payment.PaymentTransactionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PaymentHistory.PaymentDetail because PaymentHistory.Payment does not exist.'
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


Execution Successful





CREATE TRIGGER PaymentHistory.tD_PaymentType ON PaymentHistory.PaymentType FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PaymentType */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PaymentHistory.PaymentType Is a method of payment CustomerInformation.CustomerPaymentMethod on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00019a5c", PARENT_OWNER="PaymentHistory", PARENT_TABLE="PaymentType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Is a method of payment", C2P_VERB_PHRASE="Uses this method of payment", 
    FK_CONSTRAINT="FK_PaymentType_CustomerPaymentMethod", FK_COLUMNS="PaymentType" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerPaymentMethod,deleted," = "," AND") */
        CustomerInformation.CustomerPaymentMethod.PaymentType = deleted.PaymentType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PaymentHistory.PaymentType because CustomerInformation.CustomerPaymentMethod exists.'
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


Execution Successful



CREATE TRIGGER PaymentHistory.tU_PaymentType ON PaymentHistory.PaymentType FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PaymentType */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentType TypeOfObject,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PaymentHistory.PaymentType Is a method of payment CustomerInformation.CustomerPaymentMethod on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001ba96", PARENT_OWNER="PaymentHistory", PARENT_TABLE="PaymentType"
    CHILD_OWNER="CustomerInformation", CHILD_TABLE="CustomerPaymentMethod"
    P2C_VERB_PHRASE="Is a method of payment", C2P_VERB_PHRASE="Uses this method of payment", 
    FK_CONSTRAINT="FK_PaymentType_CustomerPaymentMethod", FK_COLUMNS="PaymentType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerInformation.CustomerPaymentMethod
      WHERE
        /*  %JoinFKPK(CustomerInformation.CustomerPaymentMethod,deleted," = "," AND") */
        CustomerInformation.CustomerPaymentMethod.PaymentType = deleted.PaymentType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PaymentHistory.PaymentType because CustomerInformation.CustomerPaymentMethod exists.'
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


Execution Successful





CREATE TRIGGER Rental.tD_Status ON Rental.Status FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Status */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rental.Status  Rental.MovieRentalDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00013897", PARENT_OWNER="Rental", PARENT_TABLE="Status"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Status_MovieRentalDetail", FK_COLUMNS="StatusType" */
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalDetail
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalDetail,deleted," = "," AND") */
        Rental.MovieRentalDetail.StatusType = deleted.StatusType
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Rental.Status because Rental.MovieRentalDetail exists.'
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


Execution Successful



CREATE TRIGGER Rental.tU_Status ON Rental.Status FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Status */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStatusType TypeOfObject,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rental.Status  Rental.MovieRentalDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000164b4", PARENT_OWNER="Rental", PARENT_TABLE="Status"
    CHILD_OWNER="Rental", CHILD_TABLE="MovieRentalDetail"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Status_MovieRentalDetail", FK_COLUMNS="StatusType" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StatusType)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental.MovieRentalDetail
      WHERE
        /*  %JoinFKPK(Rental.MovieRentalDetail,deleted," = "," AND") */
        Rental.MovieRentalDetail.StatusType = deleted.StatusType
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Rental.Status because Rental.MovieRentalDetail exists.'
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


Execution Successful





CREATE TRIGGER EmployeeInformation.tD_Store ON EmployeeInformation.Store FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Store */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EmployeeInformation.Store Employs a EmployeeInformation.EmployeeDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a5d2", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Employs a", C2P_VERB_PHRASE="Works at", 
    FK_CONSTRAINT="FK_Store_EmployeeDetail", FK_COLUMNS="StoreId" */
    IF EXISTS (
      SELECT * FROM deleted,EmployeeInformation.EmployeeDetail
      WHERE
        /*  %JoinFKPK(EmployeeInformation.EmployeeDetail,deleted," = "," AND") */
        EmployeeInformation.EmployeeDetail.StoreId = deleted.StoreId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeeInformation.Store because EmployeeInformation.EmployeeDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EmployeeInformation.Store Has a MovieInformation.MovieStore on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Is in", 
    FK_CONSTRAINT="FK_Store_MovieStore", FK_COLUMNS="StoreId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieStore
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieStore,deleted," = "," AND") */
        MovieInformation.MovieStore.StoreId = deleted.StoreId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EmployeeInformation.Store because MovieInformation.MovieStore exists.'
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


Execution Successful



CREATE TRIGGER EmployeeInformation.tU_Store ON EmployeeInformation.Store FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Store */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStoreId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EmployeeInformation.Store Employs a EmployeeInformation.EmployeeDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002cfc7", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="EmployeeInformation", CHILD_TABLE="EmployeeDetail"
    P2C_VERB_PHRASE="Employs a", C2P_VERB_PHRASE="Works at", 
    FK_CONSTRAINT="FK_Store_EmployeeDetail", FK_COLUMNS="StoreId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EmployeeInformation.EmployeeDetail
      WHERE
        /*  %JoinFKPK(EmployeeInformation.EmployeeDetail,deleted," = "," AND") */
        EmployeeInformation.EmployeeDetail.StoreId = deleted.StoreId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeeInformation.Store because EmployeeInformation.EmployeeDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EmployeeInformation.Store Has a MovieInformation.MovieStore on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="EmployeeInformation", PARENT_TABLE="Store"
    CHILD_OWNER="MovieInformation", CHILD_TABLE="MovieStore"
    P2C_VERB_PHRASE="Has a", C2P_VERB_PHRASE="Is in", 
    FK_CONSTRAINT="FK_Store_MovieStore", FK_COLUMNS="StoreId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieInformation.MovieStore
      WHERE
        /*  %JoinFKPK(MovieInformation.MovieStore,deleted," = "," AND") */
        MovieInformation.MovieStore.StoreId = deleted.StoreId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EmployeeInformation.Store because MovieInformation.MovieStore exists.'
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


Execution Successful

Schema Generation Complete
110 queries succeeded.  26 queries failed.  
