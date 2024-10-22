SELECT * FROM article 
ORDER BY DESIGNATION ASC;

SELECT * FROM article 
ORDER BY PRIX DESC;

SELECT * FROM article
WHERE DESIGNATION LIKE '%boulon%'
ORDER BY PRIX ASC;

SELECT * FROM article
WHERE DESIGNATION LIKE '%sachet%';

SELECT * FROM article
WHERE LOWER(DESIGNATION) LIKE '%sachet%';

SELECT article.*, fournisseur.NOM 
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
ORDER BY fournisseur.NOM ASC, article.PRIX DESC;

SELECT article.*
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE fournisseur.NOM = 'Dubois & Fils';

SELECT AVG(article.PRIX) AS moyenne_prix
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE fournisseur.NOM = 'Dubois & Fils';

SELECT fournisseur.NOM, AVG(article.PRIX) AS moyenne_prix
FROM article
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
GROUP BY fournisseur.NOM;

SELECT * 
FROM bon
WHERE DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

SELECT DISTINCT bon.*
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
WHERE article.DESIGNATION LIKE '%boulon%';

SELECT DISTINCT bon.*, fournisseur.NOM AS fournisseur_nom
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE article.DESIGNATION LIKE '%boulon%';


SELECT bon.ID, SUM(article.PRIX * compo.QTE) AS total_prix
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID;


SELECT bon.ID, COUNT(compo.ID_ART) AS nombre_articles
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
GROUP BY bon.ID;

SELECT bon.ID, COUNT(compo.ID_ART) AS nombre_articles
FROM bon
JOIN compo ON bon.ID = compo.ID_BON
GROUP BY bon.ID
HAVING nombre_articles > 25;
