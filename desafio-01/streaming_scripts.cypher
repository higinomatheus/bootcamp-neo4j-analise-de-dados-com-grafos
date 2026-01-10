// SCRIPT CYPHER COMPLETO

// 1. Constraints

// Users
CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

// Movies
CREATE CONSTRAINT movie_id IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

// Series
CREATE CONSTRAINT series_id IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

// Genres
CREATE CONSTRAINT genre_id IF NOT EXISTS
FOR (g:Genre) REQUIRE g.id IS UNIQUE;

// Actors
CREATE CONSTRAINT actor_id IF NOT EXISTS
FOR (a:Actor) REQUIRE a.id IS UNIQUE;

// Directors
CREATE CONSTRAINT director_id IF NOT EXISTS
FOR (d:Director) REQUIRE d.id IS UNIQUE;

// 2. Criando usuários

CREATE (u1:User {id: 1, name: "Matheus"})
CREATE (u2:User {id: 2, name: "Ana"})
CREATE (u3:User {id: 3, name: "Bruno"})
CREATE (u4:User {id: 4, name: "Carla"})
CREATE (u5:User {id: 5, name: "Diego"})
CREATE (u6:User {id: 6, name: "Elisa"})
CREATE (u7:User {id: 7, name: "Fábio"})
CREATE (u8:User {id: 8, name: "Giovana"})
CREATE (u9:User {id: 9, name: "Henrique"})
CREATE (u10:User {id: 10, name: "Isabela"});

// 3. Criando gêneros

CREATE (g1:Genre {id: 1, name: "Ação"})
CREATE (g2:Genre {id: 2, name: "Drama"})
CREATE (g3:Genre {id: 3, name: "Comédia"})
CREATE (g4:Genre {id: 4, name: "Ficção Científica"})
CREATE (g5:Genre {id: 5, name: "Suspense"});

// 4. Criando atores

CREATE (a1:Actor {id: 1, name: "Keanu Reeves"})
CREATE (a2:Actor {id: 2, name: "Scarlett Johansson"})
CREATE (a3:Actor {id: 3, name: "Tom Hanks"})
CREATE (a4:Actor {id: 4, name: "Zendaya"})
CREATE (a5:Actor {id: 5, name: "Robert Downey Jr."});

// 5. Criando diretores

CREATE (d1:Director {id: 1, name: "Steven Spielberg"})
CREATE (d2:Director {id: 2, name: "Christopher Nolan"})
CREATE (d3:Director {id: 3, name: "Quentin Tarantino"})
CREATE (d4:Director {id: 4, name: "Patty Jenkins"})
CREATE (d5:Director {id: 5, name: "James Cameron"});

// 6. Criando filmes

CREATE (m1:Movie {id: 1, title: "Matrix", year: 1999})
CREATE (m2:Movie {id: 2, title: "Titanic", year: 1997})
CREATE (m3:Movie {id: 3, title: "Vingadores", year: 2012})
CREATE (m4:Movie {id: 4, title: "A Origem", year: 2010})
CREATE (m5:Movie {id: 5, title: "Interestelar", year: 2014});

// 7. Criando séries

CREATE (s1:Series {id: 1, title: "Stranger Things", seasons: 4})
CREATE (s2:Series {id: 2, title: "Breaking Bad", seasons: 5})
CREATE (s3:Series {id: 3, title: "The Office", seasons: 9})
CREATE (s4:Series {id: 4, title: "Dark", seasons: 3})
CREATE (s5:Series {id: 5, title: "Loki", seasons: 2});

// 8. Relacionando filmes/séries com gêneros

MATCH (m1:Movie {id:1}), (g4) CREATE (m1)-[:IN_GENRE]->(g4);
MATCH (m2:Movie {id:2}), (g2) CREATE (m2)-[:IN_GENRE]->(g2);
MATCH (m3:Movie {id:3}), (g1) CREATE (m3)-[:IN_GENRE]->(g1);
MATCH (m4:Movie {id:4}), (g5) CREATE (m4)-[:IN_GENRE]->(g5);
MATCH (m5:Movie {id:5}), (g4) CREATE (m5)-[:IN_GENRE]->(g4);

MATCH (s1:Series {id:1}), (g4) CREATE (s1)-[:IN_GENRE]->(g4);
MATCH (s2:Series {id:2}), (g2) CREATE (s2)-[:IN_GENRE]->(g2);
MATCH (s3:Series {id:3}), (g3) CREATE (s3)-[:IN_GENRE]->(g3);
MATCH (s4:Series {id:4}), (g5) CREATE (s4)-[:IN_GENRE]->(g5);
MATCH (s5:Series {id:5}), (g4) CREATE (s5)-[:IN_GENRE]->(g4);

9. Relacionando atores e diretores

// Atores → Filmes/Séries
MATCH (a1),(m1) CREATE (a1)-[:ACTED_IN]->(m1);
MATCH (a2),(m3) CREATE (a2)-[:ACTED_IN]->(m3);
MATCH (a3),(m2) CREATE (a3)-[:ACTED_IN]->(m2);
MATCH (a4),(s1) CREATE (a4)-[:ACTED_IN]->(s1);
MATCH (a5),(m3) CREATE (a5)-[:ACTED_IN]->(m3);

// Diretores → Filmes/Séries
MATCH (d2),(m4) CREATE (d2)-[:DIRECTED]->(m4);
MATCH (d5),(m5) CREATE (d5)-[:DIRECTED]->(m5);
MATCH (d1),(m2) CREATE (d1)-[:DIRECTED]->(m2);
MATCH (d3),(s2) CREATE (d3)-[:DIRECTED]->(s2);
MATCH (d4),(s5) CREATE (d4)-[:DIRECTED]->(s5);

// 10. Criando WATCHED com ratings

MATCH (u1),(m1) CREATE (u1)-[:WATCHED {rating: 5}]->(m1);
MATCH (u1),(s1) CREATE (u1)-[:WATCHED {rating: 4}]->(s1);

MATCH (u2),(m2) CREATE (u2)-[:WATCHED {rating: 5}]->(m2);
MATCH (u3),(m3) CREATE (u3)-[:WATCHED {rating: 4}]->(m3);

MATCH (u4),(m4) CREATE (u4)-[:WATCHED {rating: 5}]->(m4);
MATCH (u5),(m5) CREATE (u5)-[:WATCHED {rating: 5}]->(m5);

MATCH (u6),(s2) CREATE (u6)-[:WATCHED {rating: 5}]->(s2);
MATCH (u7),(s3) CREATE (u7)-[:WATCHED {rating: 4}]->(s3);

MATCH (u8),(s4) CREATE (u8)-[:WATCHED {rating: 5}]->(s4);
MATCH (u9),(s5) CREATE (u9)-[:WATCHED {rating: 3}]->(s5);
MATCH (u10),(m1) CREATE (u10)-[:WATCHED {rating: 4}]->(m1);