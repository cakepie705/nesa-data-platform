CREATE TABLE raw.schools (
    school_id SERIAL PRIMARY KEY,
    school_name VARCHAR(200) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(20),
    date_of_birth DATE,
    school_id INTEGER REFERENCES raw.schools(school_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.teachers (
    teacher_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    subject VARCHAR(100),
    school_id INTEGER REFERENCES raw.schools(school_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.exam_results (
    result_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES raw.students(student_id),
    subject VARCHAR(100),
    score NUMERIC(5,2),
    exam_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);