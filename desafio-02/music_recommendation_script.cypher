// MÚSICAS
// Usuários
CREATE (:User {id: 1, name: 'Matheus'});
CREATE (:User {id: 2, name: 'Ana'});

// Artistas
CREATE (:Artist {id: 1, name: 'Coldplay'});
CREATE (:Artist {id: 2, name: 'U2'});

// Gêneros
CREATE (:Genre {id: 1, name: 'Rock'});
CREATE (:Genre {id: 2, name: 'Pop'});

// Músicas
CREATE (:Music {id: 1, title: 'Fix You', year: 2005});
CREATE (:Music {id: 2, title: 'Yellow', year: 2000});
CREATE (:Music {id: 3, title: 'With or Without You', year: 1987});

// Playlist
CREATE (:Playlist {id: 1, name: 'Favoritas'});

// RELACIONAMENTOS
// Artistas criaram músicas
MATCH (a:Artist {name: 'Coldplay'}), (m:Music {title: 'Fix You'})
CREATE (a)-[:CREATED]->(m);

MATCH (a:Artist {name: 'Coldplay'}), (m:Music {title: 'Yellow'})
CREATE (a)-[:CREATED]->(m);

MATCH (a:Artist {name: 'U2'}), (m:Music {title: 'With or Without You'})
CREATE (a)-[:CREATED]->(m);

// Músicas pertencem a gêneros
MATCH (m:Music {title: 'Fix You'}), (g:Genre {name: 'Rock'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Music {title: 'Yellow'}), (g:Genre {name: 'Pop'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Music {title: 'With or Without You'}), (g:Genre {name: 'Rock'})
CREATE (m)-[:BELONGS_TO]->(g);

// Usuários escutam músicas
MATCH (u:User {name: 'Matheus'}), (m:Music {title: 'Fix You'})
CREATE (u)-[:LISTENS_TO {times: 15}]->(m);

MATCH (u:User {name: 'Matheus'}), (m:Music {title: 'Yellow'})
CREATE (u)-[:LISTENS_TO {times: 8}]->(m);

MATCH (u:User {name: 'Ana'}), (m:Music {title: 'With or Without You'})
CREATE (u)-[:LISTENS_TO {times: 20}]->(m);

// Usuários curtem músicas
MATCH (u:User {name: 'Matheus'}), (m:Music {title: 'Fix You'})
CREATE (u)-[:LIKES]->(m);

// Usuários seguem artistas
MATCH (u:User {name: 'Matheus'}), (a:Artist {name: 'Coldplay'})
CREATE (u)-[:FOLLOWS]->(a);

// Playlist
MATCH (u:User {name: 'Matheus'}), (p:Playlist {name: 'Favoritas'})
CREATE (u)-[:CREATED]->(p);

MATCH (p:Playlist {name: 'Favoritas'}), (m:Music {title: 'Fix You'})
CREATE (p)-[:CONTAINS]->(m);
