-- ========================================
-- Check 1 - Student Count
-- ========================================

SELECT
    COUNT(*) AS total_students
FROM raw.students;

-- ========================================
-- Check 2 - Duplicate Student IDs
-- ========================================

SELECT
    student_id,
    COUNT(*)
FROM raw.students
GROUP BY student_id
HAVING COUNT(*) > 1;

-- ========================================
-- Check 3 - Missing Student Names
-- ========================================

SELECT *
FROM raw.students
WHERE first_name IS NULL
   OR last_name IS NULL;

-- ========================================
-- Check 4 - Invalid Ages
-- ========================================

SELECT *
FROM raw.students
WHERE age < 5
   OR age > 100;

-- ========================================
-- Check 5 - Missing Schools
-- ========================================

SELECT *
FROM raw.schools
WHERE school_name IS NULL;

-- ========================================
-- Check 6 - Invalid Exam Scores
-- ========================================

SELECT *
FROM raw.exam_results
WHERE score < 0
   OR score > 100;