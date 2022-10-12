## Star and Employee

Individual Work Num. https://github.com/G915-2-Data-Modeling-381/Project-1-eStreamingMovies/issues/34

Modifications added from Individual Work Num. https://github.com/G915-2-Data-Modeling-381/Project-1-eStreamingMovies/issues/31

AC: Complete LDM, PDM, of assigned business objects Star and Employee

---

### Documentation

Completed the attributes and entities that act as bridges for Star and Employee. Foreign key relationships added as a mock up connection to other entities in eStreamingMovies.
Not much else added other than an individual Supervisor and EmployeePosition table to add to the schema HumanResources. Check individual work for screenshots.

### Star
**Defn:** "A Star is a person that is featured in a movie hosted by our organization, they can be in one or many movies."
**Attributes:**
- [ ] StarId (PK)
- [ ] PersonId (FK)

### Employee
**Defn:** "An Employee is a Person that works at our organization in different roles, some working in Customer Service."
**Attributes:**
- [ ] EmployeeId (PK)
- [ ] EmployeeSupervisor (FK)
- [ ] PersonId (FK)
- [ ] EmployeeSalary
- [ ] EmployeeHireDate
- [ ] EmployeePosition

### CDM

![ambercdm](https://user-images.githubusercontent.com/77137171/194436226-7f400e36-9a69-4f0b-9546-d00a08f642e7.png)

### LDM

![amberldm](https://user-images.githubusercontent.com/77137171/194436221-2da0e61a-d4c1-4d64-992f-699e4ed164a5.png)

### PDM

![amberpdm](https://user-images.githubusercontent.com/77137171/194436216-dbd82965-a564-4a7e-ad3c-8765ac4833f2.png)

