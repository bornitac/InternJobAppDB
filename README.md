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
- Links required skills to positions and applications via linking tables
- Stores referral and recruiting manager contact information
- Includes views to simplify complex multi-table queries

---

## 🗂️ Database Structure

### Data Tables
- **Application** – Core table storing each job/internship application with status, dates, resume, cover letter, and portfolio
- **Company** – Company name, industry, and location
- **Position** – Position title, job type, environment, salary, and required skills
- **Recruiting_Manager** – Recruiter first name, last name, and email
- **Referral** – Referral contact first name, last name, and email
- **Matched_Skills** – Tracks whether skills on an application matched the position requirements

### Lookup Tables
- **Skill** – Individual skills (e.g. Python, SQL, Excel, Linux)
- **Platform** – Application platforms (e.g. LinkedIn, Handshake, Company Website)
- **Industry** – Industry categories (e.g. Data Analytics, Medicine, Marketing)
- **Environment** – Work environment (e.g. In-Person, Hybrid, Virtual)
- **Job_Type** – Job type (e.g. Internship, Externship)
- **Benefit** – Benefit details including max and min salary range

### Linking Tables
- **App_Skills_Link** – Resolves many-to-many relationship between Application and Skill
- **Required_Skill** – Resolves many-to-many relationship between Position and Skill
- **Position_Benefit** – Resolves many-to-many relationship between Position and Benefit

### Views
- **Application_Skills_View** – Displays each application alongside its associated skill names
- **LinkedIn_Python_Applications** – Filters applications submitted via LinkedIn that require Python

---

## 🛠️ Built With

- **MariaDB** – Relational database management system
- **SQL** – Table creation, queries, views, foreign keys, and indexing
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

**Which applications were submitted via LinkedIn and require Python?**
```sql
SELECT * FROM LinkedIn_Python_Applications;
```

**What skills were used in each application?**
```sql
SELECT * FROM Application_Skills_View;
```

---

## 📈 Future Directions

- Add interview tracking with round numbers and feedback fields
- Build a dashboard to visualize application status and trends over time
- Add automated deadline reminder triggers
- Expand skill matching to compare application skills vs. position requirements more granularly

---

## 📂 Data Note

All personal data in this database is sample/anonymized data used for demonstration purposes.
