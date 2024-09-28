-- 2020006450
-- A2
SELECT DISTINCT L.estadio
FROM local AS L, partidas AS P
WHERE L.id_partida = P.id_partida AND
      P.ano = 1958;
-- A0
SELECT DISTINCT nome_jogador 
FROM jogadores 
WHERE numero_camisa = 14;
-- A3
SELECT DISTINCT J.nome_treinador
FROM jogadores AS J, partidas AS P
WHERE J.id_partida = P.id_partida AND
      J.id_rodada = P.id_rodada AND
      P.gols_mandante >= 7;
-- A1
SELECT DISTINCT J.nome_jogador
FROM jogadores AS J, partidas AS P
WHERE J.id_partida = P.id_partida AND
      J.id_rodada = P.id_rodada AND
      P.ano = 1994 AND
      J.iniciais_time = 'ITA';
-- A4
SELECT DISTINCT P.time_mandante
FROM copasdomundo as C, partidas as P
WHERE C.ano = P.ano AND
      C.gols_marcados >= 150;
-- B0
SELECT juiz, assistente_um, assistente_dois
FROM arbitragem
WHERE id_partida IN (SELECT id_partida
                     FROM partidas
                     WHERE (fase == "Final" OR 
                     fase == "Semifinal") AND
                     ano == 2014)
GROUP BY juiz;
-- B6
SELECT time_mandante, ano 
FROM partidas
GROUP BY time_mandante
HAVING COUNT(*) = 1
ORDER BY ano;
-- B4
SELECT COUNT(P.fase), C.campeao
FROM copasdomundo AS C, partidas AS P
WHERE C.ano = P.ano AND
      C.publico_total > 300000
GROUP BY C.ano;  
-- B5
SELECT DISTINCT L.cidade, L.estadio, P.publico
FROM partidas AS P, local AS L
WHERE P.id_partida = L.id_partida AND
      P.ano = 2006 AND
      (P.gols_visitante >= 3 OR
      P.gols_mandante >= 3);
-- B1
SELECT DISTINCT iniciais_time, nome_treinador
FROM partidas NATURAL JOIN jogadores
WHERE fase == "Quartas de Final" AND 
      ano == 1970;