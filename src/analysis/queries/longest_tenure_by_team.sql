WITH player_tenures AS (
SELECT
    a.playerID
    ,p.nameFirst
    ,p.nameLast
    ,t.franchID
    ,t.name as team_name
    ,MIN(a.yearID) as first_year
    ,MAX(a.yearID) as last_year
    ,COUNT(DISTINCT a.yearID) as years
    ,DENSE_RANK() OVER (PARTITION BY t.franchID ORDER BY COUNT(DISTINCT a.yearID) DESC) as rank
FROM appearances a
JOIN people p
    ON a.playerID = p.playerID
JOIN teams t
    ON t.teamID = a.teamID
    AND t.yearID = a.yearID
JOIN teamsfranchises tf
    ON t.franchID = tf.franchID
    AND t.name = tf.franchName
WHERE
    tf.active = 'Y'
GROUP BY
    a.playerID
    ,p.nameFirst
    ,p.nameLast
    ,t.franchID
    ,t.name
)

SELECT
    playerID
    ,nameFirst
    ,nameLast
    ,franchID
    ,team_name
    ,first_year
    ,last_year
    ,years
FROM player_tenures
WHERE
    rank = 1
ORDER BY
    franchID
    ,years DESC
