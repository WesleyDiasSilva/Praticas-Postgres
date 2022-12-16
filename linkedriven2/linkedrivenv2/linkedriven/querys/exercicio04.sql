SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS "role"
FROM jobs
JOIN roles ON roles.id = jobs."roleId"
WHERE jobs.active = TRUE
GROUP BY roles.id
ORDER BY "maximumSalary" ASC;