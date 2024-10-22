SELECT * FROM article;
SELECT * FROM article WHERE prix >2;
SELECT * FROM article WHERE prix > 2 and prix <6.25;
SELECT * FROM article WHERE prix NOT BETWEEN 2 AND 6.25 and ID_FOU = 1 ORDER BY prix DESC;
SELECT * FROM article WHERE ID_FOU = 1 OR ID_FOU = 2 ORDER BY prix DESC;
SELECT * FROM article WHERE ID_FOU IN ( 1,2 );
SELECT * FROM article WHERE ID_FOU NOT IN ( 1,2 );
SELECT * FROM bon WHERE date_cmde BETWEEN '2019-02-01' AND '2019-04-30';