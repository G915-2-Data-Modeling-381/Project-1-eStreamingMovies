
CREATE TABLE [Address]
( 
	[AddressId]          integer  NOT NULL ,
	[AddressState]       char(2)  NOT NULL ,
	[AddressCity]        varchar(20)  NOT NULL ,
	[AddressZipCode]     char(5)  NOT NULL ,
	[AddressStreet]      varchar(40)  NOT NULL 
)
go

CREATE TABLE [Bitcoin]
( 
	[BitcoinId]          integer  NOT NULL ,
	[BitcoinWallet]      binary  NOT NULL ,
	[ElectronicPaymentTypeId] integer  NOT NULL 
)
go

CREATE TABLE [CreditCard]
( 
	[CreditCardId]       integer  NOT NULL ,
	[ElectronicPaymentCardId] integer  NOT NULL ,
	[ElectronicPaymentTypeId] integer  NOT NULL 
)
go

CREATE TABLE [Customer]
( 
	[CustomerId]         integer  NOT NULL ,
	[PersonId]           integer  NOT NULL 
)
go

CREATE TABLE [CustomerElectronicPayment]
( 
	[ElectronicPaymentId] integer  NOT NULL ,
	[CustomerId]         integer  NOT NULL ,
	[PersonId]           integer  NOT NULL ,
	[CustomerElectronicPaymentId] integer  NOT NULL 
)
go

CREATE TABLE [CustomerStreamingServiceSubscription]
( 
	[CustomerId]         integer  NOT NULL ,
	[PersonId]           integer  NOT NULL ,
	[StreamingServiceSubscriptionId] integer  NOT NULL ,
	[CustomerStreamingServiceSubscriptionId] integer  NOT NULL 
)
go

CREATE TABLE [ElectronicPayment]
( 
	[ElectronicPaymentId] integer  NOT NULL ,
	[ElectronicPaymentAmount] money  NOT NULL ,
	[ElectronicPaymentDate] datetime  NOT NULL ,
	[ElectronicPaymentStatus] bit  NOT NULL ,
	[ElectronicPaymentTypeId] integer  NOT NULL 
)
go

CREATE TABLE [ElectronicPaymentCard]
( 
	[ElectronicPaymentCardId] integer  NOT NULL ,
	[ElectronicPaymentCardNumber] varchar(20)  NOT NULL ,
	[ElectronicPaymentCardExpiration] date  NOT NULL ,
	[ElectronicPaymentCardSecurityCode] varchar(4)  NOT NULL ,
	[ElectronicPaymentTypeId] integer  NOT NULL 
)
go

CREATE TABLE [ElectronicPaymentType]
( 
	[ElectronicPaymentTypeId] integer  NOT NULL ,
	[ElectronicPaymentTypeName] varchar(20)  NOT NULL 
)
go

CREATE TABLE [GiftCard]
( 
	[GiftCardId]         integer  NOT NULL ,
	[GiftCardBalance]    money  NOT NULL ,
	[ElectronicPaymentCardId] integer  NOT NULL ,
	[ElectronicPaymentTypeId] integer  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieId]            integer  NOT NULL ,
	[MovieTitle]         varchar(100)  NOT NULL ,
	[MovieDescription]   varchar(200)  NOT NULL ,
	[MovieGenre]         varchar(100)  NOT NULL ,
	[MovieRating]        integer  NULL 
)
go

CREATE TABLE [MovieCustomerStreamingServiceSubscription]
( 
	[CustomerStreamingServiceSubscriptionId] integer  NOT NULL ,
	[MovieId]            integer  NOT NULL ,
	[MovieCustomerStreamingServiceSubscriptionId] integer  NOT NULL 
)
go

CREATE TABLE [MovieStar]
( 
	[StarId]             integer  NOT NULL ,
	[PersonId]           integer  NOT NULL ,
	[MovieId]            integer  NOT NULL ,
	[MovieStarId]        integer  NOT NULL 
)
go

CREATE TABLE [Person]
( 
	[PersonId]           integer  NOT NULL ,
	[PersonFirstName]    varchar(40)  NOT NULL ,
	[PersonLastName]     varchar(40)  NOT NULL ,
	[PersonEmail]        varchar(50)  NOT NULL ,
	[PersonPhoneNumber]  varchar(15)  NOT NULL ,
	[AddressId]          integer  NOT NULL 
)
go

CREATE TABLE [Star]
( 
	[StarId]             integer  NOT NULL ,
	[PersonId]           integer  NOT NULL 
)
go

CREATE TABLE [StreamingService]
( 
	[StreamingServiceId] integer  NOT NULL ,
	[StreamingServiceName] varchar(50)  NOT NULL ,
	[StreamingServiceWebsite] varchar(100)  NOT NULL 
)
go

CREATE TABLE [StreamingServiceSubscription]
( 
	[StreamingServiceSubscriptionId] integer  NOT NULL ,
	[StreamingServiceSubscriptionTier] varchar(20)  NOT NULL ,
	[StreamingServiceSubscriptionDeviceLimit] integer  NOT NULL ,
	[StreamingServiceSubscriptionResolution] varchar(20)  NOT NULL ,
	[StreamingServiceId] integer  NOT NULL 
)
go

ALTER TABLE [Address]
	ADD CONSTRAINT [XPKAddress] PRIMARY KEY  CLUSTERED ([AddressId] ASC)
go

ALTER TABLE [Address]
	ADD CONSTRAINT [XAK1Address] UNIQUE ([AddressCity]  ASC,[AddressState]  ASC,[AddressStreet]  ASC,[AddressZipCode]  ASC)
go

ALTER TABLE [Bitcoin]
	ADD CONSTRAINT [XPKBitcoin] PRIMARY KEY  CLUSTERED ([BitcoinId] ASC,[ElectronicPaymentTypeId] ASC)
go

ALTER TABLE [CreditCard]
	ADD CONSTRAINT [XPKCreditCard] PRIMARY KEY  CLUSTERED ([CreditCardId] ASC,[ElectronicPaymentCardId] ASC,[ElectronicPaymentTypeId] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC,[PersonId] ASC)
go

ALTER TABLE [CustomerElectronicPayment]
	ADD CONSTRAINT [XPKCustomerElectronicPayment] PRIMARY KEY  CLUSTERED ([CustomerElectronicPaymentId] ASC)
go

ALTER TABLE [CustomerElectronicPayment]
	ADD CONSTRAINT [XAK1CustomerElectronicPayment] UNIQUE ([CustomerId]  ASC,[ElectronicPaymentId]  ASC)
go

ALTER TABLE [CustomerStreamingServiceSubscription]
	ADD CONSTRAINT [XPKCustomerStreamingServiceSubscription] PRIMARY KEY  CLUSTERED ([CustomerStreamingServiceSubscriptionId] ASC)
go

ALTER TABLE [CustomerStreamingServiceSubscription]
	ADD CONSTRAINT [XAK1CustomerStreamingServiceSubscription] UNIQUE ([StreamingServiceSubscriptionId]  ASC,[CustomerId]  ASC)
go

ALTER TABLE [ElectronicPayment]
	ADD CONSTRAINT [XPKElectronicPayment] PRIMARY KEY  CLUSTERED ([ElectronicPaymentId] ASC)
go

ALTER TABLE [ElectronicPaymentCard]
	ADD CONSTRAINT [XPKElectronicPaymentCard] PRIMARY KEY  CLUSTERED ([ElectronicPaymentCardId] ASC,[ElectronicPaymentTypeId] ASC)
go

ALTER TABLE [ElectronicPaymentCard]
	ADD CONSTRAINT [XAK1ElectronicPaymentCard] UNIQUE ([ElectronicPaymentCardExpiration]  ASC,[ElectronicPaymentCardNumber]  ASC,[ElectronicPaymentCardSecurityCode]  ASC)
go

ALTER TABLE [ElectronicPaymentType]
	ADD CONSTRAINT [XPKElectronicPaymentType] PRIMARY KEY  CLUSTERED ([ElectronicPaymentTypeId] ASC)
go

ALTER TABLE [GiftCard]
	ADD CONSTRAINT [XPKGiftCard] PRIMARY KEY  CLUSTERED ([GiftCardId] ASC,[ElectronicPaymentCardId] ASC,[ElectronicPaymentTypeId] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieId] ASC)
go

ALTER TABLE [MovieCustomerStreamingServiceSubscription]
	ADD CONSTRAINT [XPKMovieCustomerStreamingServiceSubscription] PRIMARY KEY  CLUSTERED ([MovieCustomerStreamingServiceSubscriptionId] ASC)
go

ALTER TABLE [MovieCustomerStreamingServiceSubscription]
	ADD CONSTRAINT [XAK1MovieCustomerStreamingServiceSubscription] UNIQUE ([CustomerStreamingServiceSubscriptionId]  ASC,[MovieId]  ASC)
go

ALTER TABLE [MovieStar]
	ADD CONSTRAINT [XPKMovieStar] PRIMARY KEY  CLUSTERED ([MovieStarId] ASC)
go

ALTER TABLE [MovieStar]
	ADD CONSTRAINT [XAK1MovieStar] UNIQUE ([StarId]  ASC,[MovieId]  ASC)
go

ALTER TABLE [Person]
	ADD CONSTRAINT [XPKPerson] PRIMARY KEY  CLUSTERED ([PersonId] ASC)
go

ALTER TABLE [Star]
	ADD CONSTRAINT [XPKStar] PRIMARY KEY  CLUSTERED ([StarId] ASC,[PersonId] ASC)
go

ALTER TABLE [StreamingService]
	ADD CONSTRAINT [XPKStreamingService] PRIMARY KEY  CLUSTERED ([StreamingServiceId] ASC)
go

ALTER TABLE [StreamingServiceSubscription]
	ADD CONSTRAINT [XPKStreamingServiceSubscription] PRIMARY KEY  CLUSTERED ([StreamingServiceSubscriptionId] ASC)
go


ALTER TABLE [Bitcoin]
	ADD CONSTRAINT [FK_Bitcoin_ElectronicPaymentType] FOREIGN KEY ([ElectronicPaymentTypeId]) REFERENCES [ElectronicPaymentType]([ElectronicPaymentTypeId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [CreditCard]
	ADD CONSTRAINT [FK_CreditCard_ElectronicPaymentCard] FOREIGN KEY ([ElectronicPaymentCardId],[ElectronicPaymentTypeId]) REFERENCES [ElectronicPaymentCard]([ElectronicPaymentCardId],[ElectronicPaymentTypeId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Customer]
	ADD CONSTRAINT [FK_Customer_Person] FOREIGN KEY ([PersonId]) REFERENCES [Person]([PersonId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [CustomerElectronicPayment]
	ADD CONSTRAINT [FK_CustomerElectronicPayment_ElectronicPayment] FOREIGN KEY ([ElectronicPaymentId]) REFERENCES [ElectronicPayment]([ElectronicPaymentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerElectronicPayment]
	ADD CONSTRAINT [FK_CustomerElectronicPayment_Customer] FOREIGN KEY ([CustomerId],[PersonId]) REFERENCES [Customer]([CustomerId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CustomerStreamingServiceSubscription]
	ADD CONSTRAINT [FK_CustomerStreamingServiceSubscription_Customer] FOREIGN KEY ([CustomerId],[PersonId]) REFERENCES [Customer]([CustomerId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CustomerStreamingServiceSubscription]
	ADD CONSTRAINT [FK_CustomerStreamingServiceSubscription_StreamingServiceSubscription] FOREIGN KEY ([StreamingServiceSubscriptionId]) REFERENCES [StreamingServiceSubscription]([StreamingServiceSubscriptionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ElectronicPayment]
	ADD CONSTRAINT [FK_ElectronicPayment_ElectronicPaymentType] FOREIGN KEY ([ElectronicPaymentTypeId]) REFERENCES [ElectronicPaymentType]([ElectronicPaymentTypeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ElectronicPaymentCard]
	ADD CONSTRAINT [FK_ElectronicPaymentCard_ElectronicPaymentType] FOREIGN KEY ([ElectronicPaymentTypeId]) REFERENCES [ElectronicPaymentType]([ElectronicPaymentTypeId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [GiftCard]
	ADD CONSTRAINT [FK_GiftCard_ElectronicPaymentCard] FOREIGN KEY ([ElectronicPaymentCardId],[ElectronicPaymentTypeId]) REFERENCES [ElectronicPaymentCard]([ElectronicPaymentCardId],[ElectronicPaymentTypeId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [MovieCustomerStreamingServiceSubscription]
	ADD CONSTRAINT [FK_MovieCustomerStreamingServiceSubscription_CustomerStreamingServiceSubscription] FOREIGN KEY ([CustomerStreamingServiceSubscriptionId]) REFERENCES [CustomerStreamingServiceSubscription]([CustomerStreamingServiceSubscriptionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieCustomerStreamingServiceSubscription]
	ADD CONSTRAINT [FK_MovieCustomerStreamingServiceSubscription_Movie] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MovieStar]
	ADD CONSTRAINT [FK_MovieStar_Star] FOREIGN KEY ([StarId],[PersonId]) REFERENCES [Star]([StarId],[PersonId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MovieStar]
	ADD CONSTRAINT [FK_MovieStar_Movie] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Person]
	ADD CONSTRAINT [FK_Person_Address] FOREIGN KEY ([AddressId]) REFERENCES [Address]([AddressId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Star]
	ADD CONSTRAINT [FK_Star_Person] FOREIGN KEY ([PersonId]) REFERENCES [Person]([PersonId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [StreamingServiceSubscription]
	ADD CONSTRAINT [FK_StreamingServiceSubscription_StreamingService] FOREIGN KEY ([StreamingServiceId]) REFERENCES [StreamingService]([StreamingServiceId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

CREATE TRIGGER tD_Address ON Address FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Address */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Address belongs to a Person on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001156a", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Person_Address", FK_COLUMNS="AddressId" */
    IF EXISTS (
      SELECT * FROM deleted,Person
      WHERE
        /*  %JoinFKPK(Person,deleted," = "," AND") */
        Person.AddressId = deleted.AddressId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Address because Person exists.'
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




CREATE TRIGGER tU_Address ON Address FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Address */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAddressId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Address belongs to a Person on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013888", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Person_Address", FK_COLUMNS="AddressId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AddressId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Person
      WHERE
        /*  %JoinFKPK(Person,deleted," = "," AND") */
        Person.AddressId = deleted.AddressId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Address because Person exists.'
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




CREATE TRIGGER tD_Electronic_Payment ON ElectronicPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ElectronicPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ElectronicPayment can be a CustomerElectronicPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00031555", PARENT_OWNER="", PARENT_TABLE="ElectronicPayment"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_ElectronicPayment", FK_COLUMNS="ElectronicPaymentId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerElectronicPayment
      WHERE
        /*  %JoinFKPK(CustomerElectronicPayment,deleted," = "," AND") */
        CustomerElectronicPayment.ElectronicPaymentId = deleted.ElectronicPaymentId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete ElectronicPayment because CustomerElectronicPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ElectronicPaymentType has an ElectronicPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPayment"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_ElectronicPayment_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
    IF EXISTS (SELECT * FROM deleted,ElectronicPaymentType
      WHERE
        /* %JoinFKPK(deleted,ElectronicPaymentType," = "," AND") */
        deleted.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId AND
        NOT EXISTS (
          SELECT * FROM ElectronicPayment
          WHERE
            /* %JoinFKPK(ElectronicPayment,ElectronicPaymentType," = "," AND") */
            ElectronicPayment.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last ElectronicPayment because ElectronicPaymentType exists.'
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




CREATE TRIGGER tU_Electronic_Payment ON ElectronicPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ElectronicPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insElectronicPaymentId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ElectronicPayment can be a CustomerElectronicPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000340c8", PARENT_OWNER="", PARENT_TABLE="ElectronicPayment"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_ElectronicPayment", FK_COLUMNS="ElectronicPaymentId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerElectronicPayment
      WHERE
        /*  %JoinFKPK(CustomerElectronicPayment,deleted," = "," AND") */
        CustomerElectronicPayment.ElectronicPaymentId = deleted.ElectronicPaymentId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update ElectronicPayment because CustomerElectronicPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ElectronicPaymentType has an ElectronicPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPayment"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_ElectronicPayment_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ElectronicPaymentType
        WHERE
          /* %JoinFKPK(inserted,ElectronicPaymentType) */
          inserted.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ElectronicPayment because ElectronicPaymentType does not exist.'
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
    /* Customer makes a CustomerElectronicPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002f905", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_Customer", FK_COLUMNS="CustomerId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerElectronicPayment
      WHERE
        /*  %JoinFKPK(CustomerElectronicPayment,deleted," = "," AND") */
        CustomerElectronicPayment.CustomerId = deleted.CustomerId AND
        CustomerElectronicPayment.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CustomerElectronicPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer has a CustomerStreamingServiceSubscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_Customer", FK_COLUMNS="CustomerId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(CustomerStreamingServiceSubscription,deleted," = "," AND") */
        CustomerStreamingServiceSubscription.CustomerId = deleted.CustomerId AND
        CustomerStreamingServiceSubscription.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because CustomerStreamingServiceSubscription exists.'
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
           @insCustomerId integer, 
           @insPersonId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer makes a CustomerElectronicPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00034b73", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_Customer", FK_COLUMNS="CustomerId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerElectronicPayment
      WHERE
        /*  %JoinFKPK(CustomerElectronicPayment,deleted," = "," AND") */
        CustomerElectronicPayment.CustomerId = deleted.CustomerId AND
        CustomerElectronicPayment.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CustomerElectronicPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer has a CustomerStreamingServiceSubscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_Customer", FK_COLUMNS="CustomerId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(CustomerStreamingServiceSubscription,deleted," = "," AND") */
        CustomerStreamingServiceSubscription.CustomerId = deleted.CustomerId AND
        CustomerStreamingServiceSubscription.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because CustomerStreamingServiceSubscription exists.'
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
    /* Movie can be a MovieCustomerStreamingServiceSubscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026708", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_Movie", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieCustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(MovieCustomerStreamingServiceSubscription,deleted," = "," AND") */
        MovieCustomerStreamingServiceSubscription.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MovieCustomerStreamingServiceSubscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie has a MovieStar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="stars in a", 
    FK_CONSTRAINT="FK_MovieStar_Movie", FK_COLUMNS="MovieId" */
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
           @insMovieId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie can be a MovieCustomerStreamingServiceSubscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00029de4", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_Movie", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieCustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(MovieCustomerStreamingServiceSubscription,deleted," = "," AND") */
        MovieCustomerStreamingServiceSubscription.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MovieCustomerStreamingServiceSubscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie has a MovieStar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="stars in a", 
    FK_CONSTRAINT="FK_MovieStar_Movie", FK_COLUMNS="MovieId" */
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
    /* Star can be a MovieStar on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012a7e", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieStar_Star", FK_COLUMNS="StarId""PersonId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieStar
      WHERE
        /*  %JoinFKPK(MovieStar,deleted," = "," AND") */
        MovieStar.StarId = deleted.StarId AND
        MovieStar.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Star because MovieStar exists.'
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
           @insStarId integer, 
           @insPersonId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Star can be a MovieStar on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00014d3a", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieStar_Star", FK_COLUMNS="StarId""PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StarId) OR
    UPDATE(PersonId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieStar
      WHERE
        /*  %JoinFKPK(MovieStar,deleted," = "," AND") */
        MovieStar.StarId = deleted.StarId AND
        MovieStar.PersonId = deleted.PersonId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Star because MovieStar exists.'
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




CREATE TRIGGER tD_Streaming_Service ON StreamingService FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamingService */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* StreamingService makes a StreamingServiceSubscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001691c", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceSubscription"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_StreamingServiceSubscription_StreamingService", FK_COLUMNS="StreamingServiceId" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(StreamingServiceSubscription,deleted," = "," AND") */
        StreamingServiceSubscription.StreamingServiceId = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingService because StreamingServiceSubscription exists.'
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




CREATE TRIGGER tU_Streaming_Service ON StreamingService FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamingService */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamingServiceId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* StreamingService makes a StreamingServiceSubscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00018e68", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceSubscription"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_StreamingServiceSubscription_StreamingService", FK_COLUMNS="StreamingServiceId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(StreamingServiceSubscription,deleted," = "," AND") */
        StreamingServiceSubscription.StreamingServiceId = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingService because StreamingServiceSubscription exists.'
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




CREATE TRIGGER tD_Streaming_Service_Subscription ON StreamingServiceSubscription FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamingServiceSubscription */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* StreamingServiceSubscription can be a CustomerStreamingServiceSubscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003337c", PARENT_OWNER="", PARENT_TABLE="StreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_StreamingServiceSubscription", FK_COLUMNS="StreamingServiceSubscriptionId" */
    IF EXISTS (
      SELECT * FROM deleted,CustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(CustomerStreamingServiceSubscription,deleted," = "," AND") */
        CustomerStreamingServiceSubscription.StreamingServiceSubscriptionId = deleted.StreamingServiceSubscriptionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingServiceSubscription because CustomerStreamingServiceSubscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingService makes a StreamingServiceSubscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceSubscription"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_StreamingServiceSubscription_StreamingService", FK_COLUMNS="StreamingServiceId" */
    IF EXISTS (SELECT * FROM deleted,StreamingService
      WHERE
        /* %JoinFKPK(deleted,StreamingService," = "," AND") */
        deleted.StreamingServiceId = StreamingService.StreamingServiceId AND
        NOT EXISTS (
          SELECT * FROM StreamingServiceSubscription
          WHERE
            /* %JoinFKPK(StreamingServiceSubscription,StreamingService," = "," AND") */
            StreamingServiceSubscription.StreamingServiceId = StreamingService.StreamingServiceId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingServiceSubscription because StreamingService exists.'
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




CREATE TRIGGER tU_Streaming_Service_Subscription ON StreamingServiceSubscription FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamingServiceSubscription */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamingServiceSubscriptionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* StreamingServiceSubscription can be a CustomerStreamingServiceSubscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00039820", PARENT_OWNER="", PARENT_TABLE="StreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_StreamingServiceSubscription", FK_COLUMNS="StreamingServiceSubscriptionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingServiceSubscriptionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(CustomerStreamingServiceSubscription,deleted," = "," AND") */
        CustomerStreamingServiceSubscription.StreamingServiceSubscriptionId = deleted.StreamingServiceSubscriptionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingServiceSubscription because CustomerStreamingServiceSubscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingService makes a StreamingServiceSubscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceSubscription"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_StreamingServiceSubscription_StreamingService", FK_COLUMNS="StreamingServiceId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingService
        WHERE
          /* %JoinFKPK(inserted,StreamingService) */
          inserted.StreamingServiceId = StreamingService.StreamingServiceId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StreamingServiceId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingServiceSubscription because StreamingService does not exist.'
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




CREATE TRIGGER tD_Electronic_Payment_Type ON ElectronicPaymentType FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ElectronicPaymentType */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ElectronicPaymentType has an ElectronicPayment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00036dc6", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPayment"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_ElectronicPayment_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
    IF EXISTS (
      SELECT * FROM deleted,ElectronicPayment
      WHERE
        /*  %JoinFKPK(ElectronicPayment,deleted," = "," AND") */
        ElectronicPayment.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete ElectronicPaymentType because ElectronicPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ElectronicPaymentType can be a ElectronicPaymentCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPaymentCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_ElectronicPaymentCard_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
    DELETE ElectronicPaymentCard
      FROM ElectronicPaymentCard,deleted
      WHERE
        /*  %JoinFKPK(ElectronicPaymentCard,deleted," = "," AND") */
        ElectronicPaymentCard.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId

    /* erwin Builtin Trigger */
    /* ElectronicPaymentType can be Bitcoin on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="Bitcoin"
    P2C_VERB_PHRASE="can be", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_Bitcoin_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
    DELETE Bitcoin
      FROM Bitcoin,deleted
      WHERE
        /*  %JoinFKPK(Bitcoin,deleted," = "," AND") */
        Bitcoin.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Electronic_Payment_Type ON ElectronicPaymentType FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ElectronicPaymentType */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insElectronicPaymentTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ElectronicPaymentType has an ElectronicPayment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00054b5e", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPayment"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_ElectronicPayment_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,ElectronicPayment
      WHERE
        /*  %JoinFKPK(ElectronicPayment,deleted," = "," AND") */
        ElectronicPayment.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update ElectronicPaymentType because ElectronicPayment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ElectronicPaymentType can be a ElectronicPaymentCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPaymentCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_ElectronicPaymentCard_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insElectronicPaymentTypeId = inserted.ElectronicPaymentTypeId
        FROM inserted
      UPDATE ElectronicPaymentCard
      SET
        /*  %JoinFKPK(ElectronicPaymentCard,@ins," = ",",") */
        ElectronicPaymentCard.ElectronicPaymentTypeId = @insElectronicPaymentTypeId
      FROM ElectronicPaymentCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(ElectronicPaymentCard,deleted," = "," AND") */
        ElectronicPaymentCard.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ElectronicPaymentType update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ElectronicPaymentType can be Bitcoin on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="Bitcoin"
    P2C_VERB_PHRASE="can be", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_Bitcoin_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insElectronicPaymentTypeId = inserted.ElectronicPaymentTypeId
        FROM inserted
      UPDATE Bitcoin
      SET
        /*  %JoinFKPK(Bitcoin,@ins," = ",",") */
        Bitcoin.ElectronicPaymentTypeId = @insElectronicPaymentTypeId
      FROM Bitcoin,inserted,deleted
      WHERE
        /*  %JoinFKPK(Bitcoin,deleted," = "," AND") */
        Bitcoin.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ElectronicPaymentType update because more than one row has been affected.'
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




CREATE TRIGGER tD_Person ON Person FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Person */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Person can be a Customer on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0002cdcb", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_Customer_Person", FK_COLUMNS="PersonId" */
    DELETE Customer
      FROM Customer,deleted
      WHERE
        /*  %JoinFKPK(Customer,deleted," = "," AND") */
        Customer.PersonId = deleted.PersonId

    /* erwin Builtin Trigger */
    /* Person can be a Star on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_Star_Person", FK_COLUMNS="PersonId" */
    DELETE Star
      FROM Star,deleted
      WHERE
        /*  %JoinFKPK(Star,deleted," = "," AND") */
        Star.PersonId = deleted.PersonId

    /* erwin Builtin Trigger */
    /* Address belongs to a Person on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Person_Address", FK_COLUMNS="AddressId" */
    IF EXISTS (SELECT * FROM deleted,Address
      WHERE
        /* %JoinFKPK(deleted,Address," = "," AND") */
        deleted.AddressId = Address.AddressId AND
        NOT EXISTS (
          SELECT * FROM Person
          WHERE
            /* %JoinFKPK(Person,Address," = "," AND") */
            Person.AddressId = Address.AddressId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Person because Address exists.'
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




CREATE TRIGGER tU_Person ON Person FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Person */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPersonId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Person can be a Customer on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0004288b", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_Customer_Person", FK_COLUMNS="PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPersonId = inserted.PersonId
        FROM inserted
      UPDATE Customer
      SET
        /*  %JoinFKPK(Customer,@ins," = ",",") */
        Customer.PersonId = @insPersonId
      FROM Customer,inserted,deleted
      WHERE
        /*  %JoinFKPK(Customer,deleted," = "," AND") */
        Customer.PersonId = deleted.PersonId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Person update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Person can be a Star on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Person"
    CHILD_OWNER="", CHILD_TABLE="Star"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_Star_Person", FK_COLUMNS="PersonId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PersonId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPersonId = inserted.PersonId
        FROM inserted
      UPDATE Star
      SET
        /*  %JoinFKPK(Star,@ins," = ",",") */
        Star.PersonId = @insPersonId
      FROM Star,inserted,deleted
      WHERE
        /*  %JoinFKPK(Star,deleted," = "," AND") */
        Star.PersonId = deleted.PersonId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Person update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Address belongs to a Person on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Person"
    P2C_VERB_PHRASE="belongs to a", C2P_VERB_PHRASE="has an", 
    FK_CONSTRAINT="FK_Person_Address", FK_COLUMNS="AddressId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AddressId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Address
        WHERE
          /* %JoinFKPK(inserted,Address) */
          inserted.AddressId = Address.AddressId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Person because Address does not exist.'
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




CREATE TRIGGER tD_Movie_Star ON MovieStar FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieStar */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie has a MovieStar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00028bcf", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="stars in a", 
    FK_CONSTRAINT="FK_MovieStar_Movie", FK_COLUMNS="MovieId" */
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
    /* Star can be a MovieStar on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieStar_Star", FK_COLUMNS="StarId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,Star
      WHERE
        /* %JoinFKPK(deleted,Star," = "," AND") */
        deleted.StarId = Star.StarId AND
        deleted.PersonId = Star.PersonId AND
        NOT EXISTS (
          SELECT * FROM MovieStar
          WHERE
            /* %JoinFKPK(MovieStar,Star," = "," AND") */
            MovieStar.StarId = Star.StarId AND
            MovieStar.PersonId = Star.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieStar because Star exists.'
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




CREATE TRIGGER tU_Movie_Star ON MovieStar FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieStar */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieStarId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie has a MovieStar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00030c20", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="stars in a", 
    FK_CONSTRAINT="FK_MovieStar_Movie", FK_COLUMNS="MovieId" */
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
    select @nullcnt = count(*) from inserted where
      inserted.MovieId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStar because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Star can be a MovieStar on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Star"
    CHILD_OWNER="", CHILD_TABLE="MovieStar"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieStar_Star", FK_COLUMNS="StarId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StarId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Star
        WHERE
          /* %JoinFKPK(inserted,Star) */
          inserted.StarId = Star.StarId and
          inserted.PersonId = Star.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StarId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieStar because Star does not exist.'
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




CREATE TRIGGER tD_Customer_Streaming_Service_Subscription ON CustomerStreamingServiceSubscription FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerStreamingServiceSubscription */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CustomerStreamingServiceSubscription can have a MovieCustomerStreamingServiceSubscription on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005de9c", PARENT_OWNER="", PARENT_TABLE="CustomerStreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can have a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_CustomerStreamingServiceSubscription", FK_COLUMNS="CustomerStreamingServiceSubscriptionId" */
    IF EXISTS (
      SELECT * FROM deleted,MovieCustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(MovieCustomerStreamingServiceSubscription,deleted," = "," AND") */
        MovieCustomerStreamingServiceSubscription.CustomerStreamingServiceSubscriptionId = deleted.CustomerStreamingServiceSubscriptionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CustomerStreamingServiceSubscription because MovieCustomerStreamingServiceSubscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingServiceSubscription can be a CustomerStreamingServiceSubscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_StreamingServiceSubscription", FK_COLUMNS="StreamingServiceSubscriptionId" */
    IF EXISTS (SELECT * FROM deleted,StreamingServiceSubscription
      WHERE
        /* %JoinFKPK(deleted,StreamingServiceSubscription," = "," AND") */
        deleted.StreamingServiceSubscriptionId = StreamingServiceSubscription.StreamingServiceSubscriptionId AND
        NOT EXISTS (
          SELECT * FROM CustomerStreamingServiceSubscription
          WHERE
            /* %JoinFKPK(CustomerStreamingServiceSubscription,StreamingServiceSubscription," = "," AND") */
            CustomerStreamingServiceSubscription.StreamingServiceSubscriptionId = StreamingServiceSubscription.StreamingServiceSubscriptionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerStreamingServiceSubscription because StreamingServiceSubscription exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer has a CustomerStreamingServiceSubscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_Customer", FK_COLUMNS="CustomerId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        deleted.PersonId = Customer.PersonId AND
        NOT EXISTS (
          SELECT * FROM CustomerStreamingServiceSubscription
          WHERE
            /* %JoinFKPK(CustomerStreamingServiceSubscription,Customer," = "," AND") */
            CustomerStreamingServiceSubscription.CustomerId = Customer.CustomerId AND
            CustomerStreamingServiceSubscription.PersonId = Customer.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerStreamingServiceSubscription because Customer exists.'
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




CREATE TRIGGER tU_Customer_Streaming_Service_Subscription ON CustomerStreamingServiceSubscription FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerStreamingServiceSubscription */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerStreamingServiceSubscriptionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CustomerStreamingServiceSubscription can have a MovieCustomerStreamingServiceSubscription on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00061178", PARENT_OWNER="", PARENT_TABLE="CustomerStreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can have a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_CustomerStreamingServiceSubscription", FK_COLUMNS="CustomerStreamingServiceSubscriptionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerStreamingServiceSubscriptionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MovieCustomerStreamingServiceSubscription
      WHERE
        /*  %JoinFKPK(MovieCustomerStreamingServiceSubscription,deleted," = "," AND") */
        MovieCustomerStreamingServiceSubscription.CustomerStreamingServiceSubscriptionId = deleted.CustomerStreamingServiceSubscriptionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CustomerStreamingServiceSubscription because MovieCustomerStreamingServiceSubscription exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingServiceSubscription can be a CustomerStreamingServiceSubscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_StreamingServiceSubscription", FK_COLUMNS="StreamingServiceSubscriptionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingServiceSubscriptionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingServiceSubscription
        WHERE
          /* %JoinFKPK(inserted,StreamingServiceSubscription) */
          inserted.StreamingServiceSubscriptionId = StreamingServiceSubscription.StreamingServiceSubscriptionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StreamingServiceSubscriptionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerStreamingServiceSubscription because StreamingServiceSubscription does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer has a CustomerStreamingServiceSubscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_CustomerStreamingServiceSubscription_Customer", FK_COLUMNS="CustomerId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId and
          inserted.PersonId = Customer.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerStreamingServiceSubscription because Customer does not exist.'
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




CREATE TRIGGER tD_Customer_Electronic_Payment ON CustomerElectronicPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CustomerElectronicPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer makes a CustomerElectronicPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00037471", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_Customer", FK_COLUMNS="CustomerId""PersonId" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustomerId = Customer.CustomerId AND
        deleted.PersonId = Customer.PersonId AND
        NOT EXISTS (
          SELECT * FROM CustomerElectronicPayment
          WHERE
            /* %JoinFKPK(CustomerElectronicPayment,Customer," = "," AND") */
            CustomerElectronicPayment.CustomerId = Customer.CustomerId AND
            CustomerElectronicPayment.PersonId = Customer.PersonId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerElectronicPayment because Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* ElectronicPayment can be a CustomerElectronicPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPayment"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_ElectronicPayment", FK_COLUMNS="ElectronicPaymentId" */
    IF EXISTS (SELECT * FROM deleted,ElectronicPayment
      WHERE
        /* %JoinFKPK(deleted,ElectronicPayment," = "," AND") */
        deleted.ElectronicPaymentId = ElectronicPayment.ElectronicPaymentId AND
        NOT EXISTS (
          SELECT * FROM CustomerElectronicPayment
          WHERE
            /* %JoinFKPK(CustomerElectronicPayment,ElectronicPayment," = "," AND") */
            CustomerElectronicPayment.ElectronicPaymentId = ElectronicPayment.ElectronicPaymentId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CustomerElectronicPayment because ElectronicPayment exists.'
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




CREATE TRIGGER tU_Customer_Electronic_Payment ON CustomerElectronicPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CustomerElectronicPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerElectronicPaymentId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Customer makes a CustomerElectronicPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003b164", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is made by a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_Customer", FK_COLUMNS="CustomerId""PersonId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId) OR
    UPDATE(PersonId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustomerId = Customer.CustomerId and
          inserted.PersonId = Customer.PersonId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL AND
      inserted.PersonId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerElectronicPayment because Customer does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ElectronicPayment can be a CustomerElectronicPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPayment"
    CHILD_OWNER="", CHILD_TABLE="CustomerElectronicPayment"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CustomerElectronicPayment_ElectronicPayment", FK_COLUMNS="ElectronicPaymentId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ElectronicPayment
        WHERE
          /* %JoinFKPK(inserted,ElectronicPayment) */
          inserted.ElectronicPaymentId = ElectronicPayment.ElectronicPaymentId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.ElectronicPaymentId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CustomerElectronicPayment because ElectronicPayment does not exist.'
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




CREATE TRIGGER Trigger_1044 ON MovieCustomerStreamingServiceSubscription FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MovieCustomerStreamingServiceSubscription */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie can be a MovieCustomerStreamingServiceSubscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042bd6", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_Movie", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MovieCustomerStreamingServiceSubscription
          WHERE
            /* %JoinFKPK(MovieCustomerStreamingServiceSubscription,Movie," = "," AND") */
            MovieCustomerStreamingServiceSubscription.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieCustomerStreamingServiceSubscription because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CustomerStreamingServiceSubscription can have a MovieCustomerStreamingServiceSubscription on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerStreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can have a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_CustomerStreamingServiceSubscription", FK_COLUMNS="CustomerStreamingServiceSubscriptionId" */
    IF EXISTS (SELECT * FROM deleted,CustomerStreamingServiceSubscription
      WHERE
        /* %JoinFKPK(deleted,CustomerStreamingServiceSubscription," = "," AND") */
        deleted.CustomerStreamingServiceSubscriptionId = CustomerStreamingServiceSubscription.CustomerStreamingServiceSubscriptionId AND
        NOT EXISTS (
          SELECT * FROM MovieCustomerStreamingServiceSubscription
          WHERE
            /* %JoinFKPK(MovieCustomerStreamingServiceSubscription,CustomerStreamingServiceSubscription," = "," AND") */
            MovieCustomerStreamingServiceSubscription.CustomerStreamingServiceSubscriptionId = CustomerStreamingServiceSubscription.CustomerStreamingServiceSubscriptionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MovieCustomerStreamingServiceSubscription because CustomerStreamingServiceSubscription exists.'
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




CREATE TRIGGER Trigger_1045 ON MovieCustomerStreamingServiceSubscription FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MovieCustomerStreamingServiceSubscription */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieCustomerStreamingServiceSubscriptionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie can be a MovieCustomerStreamingServiceSubscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00043a3f", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_Movie", FK_COLUMNS="MovieId" */
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
    select @nullcnt = count(*) from inserted where
      inserted.MovieId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieCustomerStreamingServiceSubscription because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CustomerStreamingServiceSubscription can have a MovieCustomerStreamingServiceSubscription on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CustomerStreamingServiceSubscription"
    CHILD_OWNER="", CHILD_TABLE="MovieCustomerStreamingServiceSubscription"
    P2C_VERB_PHRASE="can have a", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="FK_MovieCustomerStreamingServiceSubscription_CustomerStreamingServiceSubscription", FK_COLUMNS="CustomerStreamingServiceSubscriptionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerStreamingServiceSubscriptionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CustomerStreamingServiceSubscription
        WHERE
          /* %JoinFKPK(inserted,CustomerStreamingServiceSubscription) */
          inserted.CustomerStreamingServiceSubscriptionId = CustomerStreamingServiceSubscription.CustomerStreamingServiceSubscriptionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerStreamingServiceSubscriptionId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MovieCustomerStreamingServiceSubscription because CustomerStreamingServiceSubscription does not exist.'
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





CREATE TRIGGER tD_Bitcoin ON Bitcoin FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Bitcoin */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ElectronicPaymentType can be Bitcoin on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001b1b7", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="Bitcoin"
    P2C_VERB_PHRASE="can be", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_Bitcoin_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
    IF EXISTS (SELECT * FROM deleted,ElectronicPaymentType
      WHERE
        /* %JoinFKPK(deleted,ElectronicPaymentType," = "," AND") */
        deleted.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId AND
        NOT EXISTS (
          SELECT * FROM Bitcoin
          WHERE
            /* %JoinFKPK(Bitcoin,ElectronicPaymentType," = "," AND") */
            Bitcoin.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bitcoin because ElectronicPaymentType exists.'
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


CREATE TRIGGER tU_Bitcoin ON Bitcoin FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Bitcoin */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBitcoinId integer, 
           @insElectronicPaymentTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ElectronicPaymentType can be Bitcoin on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001ad5e", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="Bitcoin"
    P2C_VERB_PHRASE="can be", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_Bitcoin_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ElectronicPaymentType
        WHERE
          /* %JoinFKPK(inserted,ElectronicPaymentType) */
          inserted.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bitcoin because ElectronicPaymentType does not exist.'
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
    /* ElectronicPaymentCard can be a CreditCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020702", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CreditCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
    IF EXISTS (SELECT * FROM deleted,ElectronicPaymentCard
      WHERE
        /* %JoinFKPK(deleted,ElectronicPaymentCard," = "," AND") */
        deleted.ElectronicPaymentCardId = ElectronicPaymentCard.ElectronicPaymentCardId AND
        deleted.ElectronicPaymentTypeId = ElectronicPaymentCard.ElectronicPaymentTypeId AND
        NOT EXISTS (
          SELECT * FROM CreditCard
          WHERE
            /* %JoinFKPK(CreditCard,ElectronicPaymentCard," = "," AND") */
            CreditCard.ElectronicPaymentCardId = ElectronicPaymentCard.ElectronicPaymentCardId AND
            CreditCard.ElectronicPaymentTypeId = ElectronicPaymentCard.ElectronicPaymentTypeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CreditCard because ElectronicPaymentCard exists.'
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
           @insCreditCardId integer, 
           @insElectronicPaymentCardId integer, 
           @insElectronicPaymentTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ElectronicPaymentCard can be a CreditCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001efb9", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CreditCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentCardId) OR
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ElectronicPaymentCard
        WHERE
          /* %JoinFKPK(inserted,ElectronicPaymentCard) */
          inserted.ElectronicPaymentCardId = ElectronicPaymentCard.ElectronicPaymentCardId and
          inserted.ElectronicPaymentTypeId = ElectronicPaymentCard.ElectronicPaymentTypeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CreditCard because ElectronicPaymentCard does not exist.'
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




CREATE TRIGGER tD_ElectronicPaymentCard ON ElectronicPaymentCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ElectronicPaymentCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ElectronicPaymentCard can be a CreditCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00042895", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CreditCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
    DELETE CreditCard
      FROM CreditCard,deleted
      WHERE
        /*  %JoinFKPK(CreditCard,deleted," = "," AND") */
        CreditCard.ElectronicPaymentCardId = deleted.ElectronicPaymentCardId AND
        CreditCard.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId

    /* erwin Builtin Trigger */
    /* ElectronicPaymentCard can be a GiftCard on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_GiftCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
    DELETE GiftCard
      FROM GiftCard,deleted
      WHERE
        /*  %JoinFKPK(GiftCard,deleted," = "," AND") */
        GiftCard.ElectronicPaymentCardId = deleted.ElectronicPaymentCardId AND
        GiftCard.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId

    /* erwin Builtin Trigger */
    /* ElectronicPaymentType can be a ElectronicPaymentCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPaymentCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_ElectronicPaymentCard_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
    IF EXISTS (SELECT * FROM deleted,ElectronicPaymentType
      WHERE
        /* %JoinFKPK(deleted,ElectronicPaymentType," = "," AND") */
        deleted.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId AND
        NOT EXISTS (
          SELECT * FROM ElectronicPaymentCard
          WHERE
            /* %JoinFKPK(ElectronicPaymentCard,ElectronicPaymentType," = "," AND") */
            ElectronicPaymentCard.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last ElectronicPaymentCard because ElectronicPaymentType exists.'
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


CREATE TRIGGER tU_ElectronicPaymentCard ON ElectronicPaymentCard FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ElectronicPaymentCard */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insElectronicPaymentCardId integer, 
           @insElectronicPaymentTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ElectronicPaymentCard can be a CreditCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00063a37", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="CreditCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_CreditCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentCardId) OR
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insElectronicPaymentCardId = inserted.ElectronicPaymentCardId, 
             @insElectronicPaymentTypeId = inserted.ElectronicPaymentTypeId
        FROM inserted
      UPDATE CreditCard
      SET
        /*  %JoinFKPK(CreditCard,@ins," = ",",") */
        CreditCard.ElectronicPaymentCardId = @insElectronicPaymentCardId,
        CreditCard.ElectronicPaymentTypeId = @insElectronicPaymentTypeId
      FROM CreditCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(CreditCard,deleted," = "," AND") */
        CreditCard.ElectronicPaymentCardId = deleted.ElectronicPaymentCardId AND
        CreditCard.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ElectronicPaymentCard update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ElectronicPaymentCard can be a GiftCard on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_GiftCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentCardId) OR
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insElectronicPaymentCardId = inserted.ElectronicPaymentCardId, 
             @insElectronicPaymentTypeId = inserted.ElectronicPaymentTypeId
        FROM inserted
      UPDATE GiftCard
      SET
        /*  %JoinFKPK(GiftCard,@ins," = ",",") */
        GiftCard.ElectronicPaymentCardId = @insElectronicPaymentCardId,
        GiftCard.ElectronicPaymentTypeId = @insElectronicPaymentTypeId
      FROM GiftCard,inserted,deleted
      WHERE
        /*  %JoinFKPK(GiftCard,deleted," = "," AND") */
        GiftCard.ElectronicPaymentCardId = deleted.ElectronicPaymentCardId AND
        GiftCard.ElectronicPaymentTypeId = deleted.ElectronicPaymentTypeId
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ElectronicPaymentCard update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ElectronicPaymentType can be a ElectronicPaymentCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentType"
    CHILD_OWNER="", CHILD_TABLE="ElectronicPaymentCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is an", 
    FK_CONSTRAINT="FK_ElectronicPaymentCard_ElectronicPaymentType", FK_COLUMNS="ElectronicPaymentTypeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ElectronicPaymentType
        WHERE
          /* %JoinFKPK(inserted,ElectronicPaymentType) */
          inserted.ElectronicPaymentTypeId = ElectronicPaymentType.ElectronicPaymentTypeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ElectronicPaymentCard because ElectronicPaymentType does not exist.'
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
    /* ElectronicPaymentCard can be a GiftCard on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020b57", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_GiftCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
    IF EXISTS (SELECT * FROM deleted,ElectronicPaymentCard
      WHERE
        /* %JoinFKPK(deleted,ElectronicPaymentCard," = "," AND") */
        deleted.ElectronicPaymentCardId = ElectronicPaymentCard.ElectronicPaymentCardId AND
        deleted.ElectronicPaymentTypeId = ElectronicPaymentCard.ElectronicPaymentTypeId AND
        NOT EXISTS (
          SELECT * FROM GiftCard
          WHERE
            /* %JoinFKPK(GiftCard,ElectronicPaymentCard," = "," AND") */
            GiftCard.ElectronicPaymentCardId = ElectronicPaymentCard.ElectronicPaymentCardId AND
            GiftCard.ElectronicPaymentTypeId = ElectronicPaymentCard.ElectronicPaymentTypeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GiftCard because ElectronicPaymentCard exists.'
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
           @insGiftCardId integer, 
           @insElectronicPaymentCardId integer, 
           @insElectronicPaymentTypeId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ElectronicPaymentCard can be a GiftCard on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001fee8", PARENT_OWNER="", PARENT_TABLE="ElectronicPaymentCard"
    CHILD_OWNER="", CHILD_TABLE="GiftCard"
    P2C_VERB_PHRASE="can be a", C2P_VERB_PHRASE="is a", 
    FK_CONSTRAINT="FK_GiftCard_ElectronicPaymentCard", FK_COLUMNS="ElectronicPaymentCardId""ElectronicPaymentTypeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ElectronicPaymentCardId) OR
    UPDATE(ElectronicPaymentTypeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ElectronicPaymentCard
        WHERE
          /* %JoinFKPK(inserted,ElectronicPaymentCard) */
          inserted.ElectronicPaymentCardId = ElectronicPaymentCard.ElectronicPaymentCardId and
          inserted.ElectronicPaymentTypeId = ElectronicPaymentCard.ElectronicPaymentTypeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GiftCard because ElectronicPaymentCard does not exist.'
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