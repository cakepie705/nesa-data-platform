INSERT INTO warehouse.fact_exam_results (
    student_id,
    teacher_id,
    school_id,
    subject,
    score,
    exam_date
)
SELECT
    student_id,
    teacher_id,
    school_id,
    subject,
    score,
    exam_date
FROM raw.exam_results;