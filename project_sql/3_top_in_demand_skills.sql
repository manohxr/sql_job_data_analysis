/*
Q. What are the most in-demand skills for data analyst roles?
- Identify the top 10 skills required for data analyst jobs. (skills vs job postings)
- Analyze ALL job postings to find the most frequently mentioned skills.
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) as job_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    job_count DESC
LIMIT 10;