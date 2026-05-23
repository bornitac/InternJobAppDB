# 💼 Internship & Job Application Tracking Database

A relational database designed to track and manage internship and job applications in an organized way to improve efficiency in the job search process. Built using MariaDB and designed following Third Normal Form (3NF).

---

## 📋 Mission Statement

The purpose of this internship and job application database is to help track and manage applications in an organized way to improve efficiency in the job search process — storing details about companies, positions, skills, platforms, and referrals in one centralized system.

---

## 🔍 What It Does

- Tracks complete details on job and internship applications including company, position, platform, and status
- Identifies repeated applications to the same company or position to avoid duplicates
- Records submission dates and deadlines to manage application timelines
- Links required skills to positions and applications
- Stores referral and recruiting manager contact information

---

## 🗂️ Database Structure

### Data Tables
- **Application** – Core table storing each job/internship application with status, dates, and documents
- **Company** – Company name, industry, and location
- **Position** – Position title, job type, environment, salary, and required skills
- **Recruiting_Manager** – Recruiter contact information
- **Referral** – Referral contact information

### Lookup Tables
- **Skill** – Individual skills (e.g. Python, SQL, Excel)
- **Platform** – Application platforms (e.g. LinkedIn, Handshake)
- **Industry** – Industry categories
- **Environment** – Work environment (e.g. In-Person, Remote, Hybrid)
- **Job_Type** – Job type (e.g. Internship, Full-Time)
- **Benefit** – Benefit details including salary range

### Linking Tables
- **App_Skills_Link** – Resolves many-to-many relationship between Application and Skill
- **Required_Skill** – Resolves many-to-many relationship between Position and Skill

---

## 🛠️ Built With

- **MariaDB** – Relational database management system
- **SQL** – Table creation, queries, views, and stored procedures
- **ER Modeling** – Crow's Foot diagram for database design
- **3NF Normalization** – Ensures no redundancy or transitive dependencies

---

## 🚀 Getting Started

### Prerequisites
- MariaDB or MySQL installed locally (or via XAMPP)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/bornitac/InternJobAppDB
   ```
2. Import the database:
   ```bash
   mysql -u root -p < InternJobApp_Database.sql
   ```
3. Connect and explore:
   ```sql
   USE bc824proj;
   SHOW TABLES;
   ```

---

## 🔎 Sample Queries

**What skills are required for a specific position?**
```sql
SELECT Required_Skills FROM Position WHERE Position_Title = 'Cybersecurity Intern';
```

**How many applications have been submitted?**
```sql
SELECT COUNT(*) AS Total_Applications FROM Application;
```

**Which applications involved a referral?**
```sql
SELECT Application.Application_ID, Referral.Referral_FName, Referral.Referral_LName
FROM Application
JOIN Referral ON Application.Application_ID = Referral.Referral_ID;
```

---

## 📈 Future Directions

- Add interview tracking with round numbers and feedback fields
- Build a dashboard to visualize application status and trends over time
- Add automated deadline reminders via triggers
- Expand skill matching to compare application skills vs. position requirements

---

## 📂 Data Note

All data in this database is sample/anonymized data used for demonstration purposes.
