/* senior most employee */ 

select * from dbo.employee$
order by levels desc


/* country with most invoices - can visualize*/
select TOP 1 count(*) as c, billing_country
from dbo.invoice$
group by billing_country
order by c desc

/* city with best customers */
select TOP 1 SUM(total) as invoice_total, billing_city from dbo.invoice$
group by billing_city
order by invoice_total desc 

/* best customer */
select TOP 1 dbo.customer$.customer_id, SUM(dbo.invoice$.total) AS total, dbo.customer$.first_name, dbo.customer$.last_name
from dbo.customer$
JOIN dbo.invoice$ on dbo.customer$.customer_id = dbo.invoice$.customer_id
GROUP BY dbo.customer$.customer_id, dbo.customer$.first_name, dbo.customer$.last_name
ORDER BY total DESC

SELECT
    c.Country,
    YEAR(i.invoice_date) AS Year,
    SUM(il.Quantity) AS TotalSales
FROM
    dbo.invoice$ i
    INNER JOIN dbo.customer$ c ON i.customer_id = c.customer_id
    INNER JOIN dbo.invoice_line$ il ON i.invoice_id = il.invoice_id
GROUP BY
    c.Country,
    YEAR(i.invoice_date)
ORDER BY
    c.Country,
    YEAR(i.invoice_date);

/* TOP GENRE */
SELECT TOP 1 g.Name AS Genre, SUM(il.Quantity) AS TotalSales
FROM dbo.genre$ g
JOIN dbo.track$ t ON g.genre_id = t.genre_id
JOIN dbo.invoice_line$ il ON t.track_id = il.track_id
GROUP BY g.genre_id, g.name
ORDER BY TotalSales DESC

/* TOP ARTIST */
SELECT top 1 ar.Name AS Artist, SUM(ii.Quantity) AS TotalSales
FROM dbo.artist$ AS ar
JOIN dbo.album$ AS al ON ar.artist_id = al.artist_id
JOIN dbo.track$ AS t ON al.album_id = t.album_id
JOIN dbo.invoice_line$ AS ii ON t.track_id = ii.track_id
GROUP BY ar.artist_id, ar.name
ORDER BY TotalSales DESC

SELECT TOP 5 g.Name AS Genre, SUM(il.Quantity) AS TotalSales
FROM dbo.genre$ g
JOIN dbo.track$ t ON g.genre_id = t.genre_id
JOIN dbo.invoice_line$ il ON t.track_id = il.track_id
GROUP BY g.genre_id, g.name
ORDER BY TotalSales DESC

SELECT TOP 5 g.Name AS Genre, SUM(il.Quantity) AS TotalSales
FROM dbo.genre$ g
JOIN dbo.track$ t ON g.genre_id = t.genre_id
JOIN dbo.invoice_line$ il ON t.track_id = il.track_id
GROUP BY g.genre_id, g.name
ORDER BY TotalSales DESC
