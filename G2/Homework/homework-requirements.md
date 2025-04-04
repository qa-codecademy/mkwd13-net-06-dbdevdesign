# 📚 SEDC_ACADEMY_HOMEWORK - Academy Management Database

## 🎯 Purpose
This database is designed to manage students, teachers, courses, grades, and achievements in an educational institution.

---

## 🗃️ Database Name
**SEDC_ACADEMY_HOMEWORK**

---

## 🧩 Tables Structure

### 1. 🧑‍🎓 Student
- `ID` INT IDENTITY(1,1) PRIMARY KEY
- `FirstName` NVARCHAR(100) NULL
- `LastName` NVARCHAR(100) NULL
- `DateOfBirth` DATE NULL
- `EnrolledDate` DATE NULL
- `Gender` NCHAR NULL
- `NationalIdNumber` BIGINT NULL
- `StudentCardNumber` NVARCHAR(100) NULL

---

### 2. 👩‍🏫 Teacher
- `ID` INT IDENTITY(1,1) PRIMARY KEY
- `FirstName` NVARCHAR(100) NULL
- `LastName` NVARCHAR(100) NULL
- `DateOfBirth` DATE NULL
- `AcademicRank` NVARCHAR(100) NULL
- `HireDate` DATE NULL

---

### 3. 📘 Course
- `ID` INT IDENTITY(1,1) PRIMARY KEY
- `Name` NVARCHAR(MAX) NULL
- `Credit` TINYINT NULL
- `AcademicYear` TINYINT NULL
- `Semester` TINYINT NULL

---

### 4. 📊 Grade
- `ID` INT IDENTITY(1,1) PRIMARY KEY
- `StudentID` INT NULL
- `CourseID` INT NULL
- `TeacherID` INT NULL
- `Grade` TINYINT NULL
- `Comment` NVARCHAR(MAX) NULL
- `CreatedDate` DATETIME NULL

**🔗 Foreign Keys:**
- `StudentID` → `Student(ID)`
- `CourseID` → `Course(ID)`
- `TeacherID` → `Teacher(ID)`

---

### 5. 🏅 AchievementType
- `ID` INT IDENTITY(1,1) PRIMARY KEY
- `Name` NVARCHAR(150) NULL
- `Description` NVARCHAR(MAX) NULL
- `ParticipationRate` INT NULL

---

### 6. 📝 GradeDetails
- `ID` INT IDENTITY(1,1) PRIMARY KEY
- `GradeID` INT NULL
- `AchievementTypeID` INT NULL
- `AchievementPoints` SMALLINT NULL
- `AchievementMaxPoints` SMALLINT NULL
- `AchievementDate` DATE NULL

**🔗 Foreign Keys:**
- `GradeID` → `Grade(ID)`
- `AchievementTypeID` → `AchievementType(ID)`

---

## 🔗 Relationships Summary

- A **Student** can have many **Grades**
- A **Teacher** can give many **Grades**
- A **Course** can be linked to many **Grades**
- A **Grade** can have multiple **GradeDetails**
- An **AchievementType** can appear in multiple **GradeDetails**

---

## ✅ Notes for Students
- All column names in this README match exactly with the database schema.
- When writing `INSERT` statements, use the same column names as listed here.
- Be mindful of nullable fields – `NULL` is allowed where specified.

