-- Load Students Dimension
INSERT INTO warehouse.dim_students (
    student_id,
    first_name,
    last_name,
    age,
    school_id
)
SELECT
    student_id,
    first_name,
    last_name,
    age,
    school_id
FROM raw.students
ON CONFLICT (student_id) DO NOTHING;

-- Load Teachers Dimension
INSERT INTO warehouse.dim_teachers (
    teacher_id,
    first_name,
    last_name,
    subject
)
SELECT
    teacher_id,
    first_name,
    last_name,
    subject
FROM raw.teachers
ON CONFLICT (teacher_id) DO NOTHING;

-- Load Schools Dimension
INSERT INTO warehouse.dim_schools (
    school_id,
    school_name,
    city
)
SELECT
    school_id,
    school_name,
    city
FROM raw.schools
ON CONFLICT (school_id) DO NOTHING;