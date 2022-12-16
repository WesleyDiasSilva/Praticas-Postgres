SELECT users.name AS writer, COUNT(testimonials.message) AS "testimonialCount"
FROM users 
JOIN testimonials ON testimonials."writerId" = users.id
WHERE users.id = 435
GROUP BY users.name;