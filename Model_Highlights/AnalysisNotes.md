## Analysis of Team Models

To be updated during 9.30.2022 meeting

---

### Highlights
- Have a subscription / license service for eStreamingMovies
- Proper payment method allocation and seperation
- Good organization of personal details, maybe add customer service
- Data Masking and Schema creation, better UDT creation and possible constraint addition for SSMS
- Normalization of attributes and tables carefully to maximize use

---

### Oliver

CDM:
- Good descriptions
- - Did not remove previous structure 
- Old model retained s.t (physical copy) customers can rent physical movies even with streaming service
- MovieStreamingService platform for customer services associated with it 
- CustomerService is incoporated into the model if you come across payment issues, perhaps links to employees that are a part of this service?
- Digital Copy vs Physical Copy to retain some of the existing model

LDM:
- Movie modifications astreamableVersion
- Streaming service tables are very neat, idea for customer cards to have a maximum well done
- Views retained for invoices and over-due notice

---

### Adrian

CDM:
- Franchise (disney > marvel > .. etc), Inventory, License, Website, MovieStream (Customer account can stream in multiple places with one license per customer)
- To improve the website was added for streaming services, s.t people can also buy in store physical goods
- Short descriptions, follows similarly to old structure

LDM:
- LicensePayment, Website Customer, the idea of licensing to be allowed in streaming is really good
- Films were focused on a lot for the structure of the model

PDM:
-  vision for schema ownership and attributes

---

### Wade 

CDM:
- Movie store was removed, one to many connection to store instead to keep track of every instance

PDM:
- Payment table modifications, different subcategory
- MovieRental modifications

---

### Jas

CDM:
- Very nice person-address hierarchy
- streaming service subscription layout, need to discuss licensing options and fine-tune in future
- Electronic payments

PDM:
- CustomerStreamingServiceSubscription, Electronic Payment types (Bitcoin), Creditcard and GiftCard
- Electronic Payment, eMovie transaction type was modified to be a bit smoother and organized. All the detail of the details are condenssed into different types of tables.
- Person table, s.t you don't need Employee and Customer details to be in different areas. Used for employee, customer, star


