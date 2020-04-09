-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT * 
FROM invoice i
JOIN invoice_line il 
ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;


-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c 
ON i.customer_id = c.customer_id;


-- Get the customer first_name and last_name and the support rep's first_name and last_name from all customers.
SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e 
ON c.support_rep_id = e.employee_id;



-- Get the album title and the artist name from all albums.
SELECT al.title, a.name
FROM album al
JOIN artist a 
ON al.artist_id = a.artist_id;


-- Get all playlist_track track_ids where the playlist name is Music.
SELECT t.track_id
FROM playlist_track t
JOIN playlist p 
ON p.playlist_id = t.playlist_id
WHERE p.name = 'Music';


-- Get all track names for playlist_id 5.
SELECT t.name
FROM track t
JOIN playlist_track pt 
ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;


-- Get all track names and the playlist name that they're on ( 2 joins ).
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt 
ON t.track_id = pt.track_id
JOIN playlist p 
ON pt.playlist_id = p.playlist_id;


-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT t.name, a.title
FROM track t
JOIN album a 
ON t.album_id = a.album_id
JOIN genre g 
ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';