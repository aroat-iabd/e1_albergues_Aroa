CREATE TABLE albergues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    concello VARCHAR(100) NOT NULL,
    camino VARCHAR(100) NOT NULL,
    prazas INT NOT NULL,
    prezo_noite DECIMAL(5,2) NOT NULL
);