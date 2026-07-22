-- =====================================================================
-- DATABASE SCHEMA CREATION SCRIPT
-- Project: Community Education Program Management
-- =====================================================================

-- 1. PROVIDER TABLE
CREATE TABLE PROVIDER (
    prov_ID VARCHAR(20) PRIMARY KEY, 
    prov_name VARCHAR(40), 
    contact_name VARCHAR(40), 
    contact_email VARCHAR(30), 
    contact_phone VARCHAR(20), 
    prov_website VARCHAR(50)
);

-- 2. PROGRAMS TABLE
CREATE TABLE PROGRAMS (
    pr_ID VARCHAR(20) PRIMARY KEY, 
    pr_name VARCHAR(40), 
    description VARCHAR(100), 
    goal VARCHAR(60), 
    prov_ID VARCHAR(20), 
    FOREIGN KEY (prov_ID) REFERENCES PROVIDER(prov_ID)
);

-- 3. CHILD TABLE
CREATE TABLE CHILD (
    Child_id VARCHAR(20) PRIMARY KEY, 
    DOB DATE, 
    C_first_name VARCHAR(20), 
    C_last_name VARCHAR(20), 
    consent_flag VARCHAR(5), 
    notes VARCHAR(100)
);

-- 4. PARENT TABLE
CREATE TABLE PARENT (
    parent_id VARCHAR(20) PRIMARY KEY, 
    P_first_name VARCHAR(20), 
    P_last_name VARCHAR(20), 
    DOB DATE, 
    phone VARCHAR(20), 
    email VARCHAR(30)
);

-- 5. STAFF TABLE
CREATE TABLE STAFF (
    staff_id VARCHAR(20) PRIMARY KEY, 
    S_first_name VARCHAR(20), 
    S_last_name VARCHAR(20), 
    DOB DATE, 
    email VARCHAR(30), 
    phone VARCHAR(20), 
    prov_ID VARCHAR(20), 
    FOREIGN KEY (prov_ID) REFERENCES PROVIDER(prov_ID)
);

-- 6. RELATION TABLE
CREATE TABLE RELATION (
    parent_id VARCHAR(20), 
    Child_id VARCHAR(20), 
    relationship VARCHAR(20), 
    PRIMARY KEY (parent_id, Child_id), 
    FOREIGN KEY (parent_id) REFERENCES PARENT(parent_id), 
    FOREIGN KEY (Child_id) REFERENCES CHILD(Child_id)
);

-- 7. CHILD_ENROLLMENT TABLE
CREATE TABLE CHILD_ENROLLMENT (
    c_er_ID VARCHAR(20) PRIMARY KEY, 
    c_enrolled_date DATE, 
    Child_id VARCHAR(20), 
    pr_ID VARCHAR(20), 
    consentsign_date DATE, 
    FOREIGN KEY (Child_id) REFERENCES CHILD(Child_id), 
    FOREIGN KEY (pr_ID) REFERENCES PROGRAMS(pr_ID)
);

-- 8. PARENT_ENROLLMENT TABLE
CREATE TABLE PARENT_ENROLLMENT (
    p_er_ID VARCHAR(20) PRIMARY KEY, 
    p_enrolled_date DATE, 
    parent_id VARCHAR(20), 
    pr_ID VARCHAR(20), 
    FOREIGN KEY (parent_id) REFERENCES PARENT(parent_id), 
    FOREIGN KEY (pr_ID) REFERENCES PROGRAMS(pr_ID)
);

-- 9. SESSION TABLE
CREATE TABLE SESSION (
    session_date DATE, 
    start_time DATETIME, 
    end_time DATETIME, 
    fidelity_notes VARCHAR(100), 
    staff_id VARCHAR(20), 
    pr_ID VARCHAR(20), 
    PRIMARY KEY (session_date, start_time, staff_id, pr_ID), 
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id), 
    FOREIGN KEY (pr_ID) REFERENCES PROGRAMS(pr_ID)
);

-- 10. ATTENDANCE TABLE
CREATE TABLE ATTENDANCE (
    participation_level VARCHAR(20), 
    session_notes VARCHAR(100), 
    session_date DATE, 
    start_time DATETIME, 
    Child_id VARCHAR(20), 
    PRIMARY KEY (session_date, start_time, Child_id), 
    FOREIGN KEY (Child_id) REFERENCES CHILD(Child_id)
);

-- 11. ASSESSMENT TABLE
CREATE TABLE ASSESSMENT (
    assessment_id VARCHAR(20) PRIMARY KEY, 
    assessment_date DATE, 
    score INT, 
    school_name VARCHAR(40), 
    assessment_type VARCHAR(20), 
    Child_id VARCHAR(20), 
    pr_id VARCHAR(20), 
    FOREIGN KEY (Child_id) REFERENCES CHILD(Child_id), 
    FOREIGN KEY (pr_id) REFERENCES PROGRAMS(pr_ID)
);
