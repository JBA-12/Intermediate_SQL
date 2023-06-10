--EXERCISE  -  4

-- 1)Using table players to find the count of the number of players in each position.
select count (ilkid), position from players group by position;


--2)Finding the top-5 most productive years.
create view tot_gp_prs as
   select sum (gp) as tot_gp1, year
   from player_regular_season
   group by year;


create view tot_gp_pp as
    select sum (gp) as tot_gp2, year
    from player_playoffs
    group by year;

select tot_gp_prs.year
from tot_gp_prs, tot_gp_pp
where tot_gp_prs.year = tot_gp_pp.year
order by (tot_gp1 + tot_gp2) desc
LIMIT 5;


-- 3)Finding the top-10 most efficient players.
alter table player_regular_season_career add eff INT;
update player_regular_season_career set eff = (pts + reb + asts + stl + blk − ((fga − fgm) + (fta − ftm) + turnover));
select ilkid from player_regular_season_career group by ilkid having sum (gp) > 500 order by sum (eff) desc limit 10;



--4)Finding the number of players who have played more regular season games in the year 1990 than regular season games in any other year in their career. 
create view A as
   select ilkid, year, sum(gp) as a_gp
   from player_regular_season
   where year = '1990'
   group by ilkid,year;

create view B as 
   select ilkid, year, sum(gp) as b_gp
   from player_regular_season
   where year <> '1990'
   group by ilkid,year;

create view max_gp as 
    select MAX(b_gp) as m, ilkid
    from B 
    group by ilkid;

select count (distinct T.ilkid)
from A as T, max_gp as S
where T.ilkid = S.ilkid AND T.a_gp > S.m;



--5) for the set p if no other player from player_regular_season_career to not dominate either sum(gp) should be max or sum(eff)
create view tot_gp as
  select sum(gp) as X
  from player_regular_season_career
  group by ilkid;

create view tot_eff as 
  select sum(eff) as Y
  from player_regular_season_career
  group by ilkid;

with max_gp (value) as
    (select MAX(X)
     from tot_gp),
max_eff (value) as
    (select MAX(Y)
     from tot_eff)

select distinct T.ilkid, T.firstname, T.lastname, sum(T.gp), sum(T.eff)
from player_regular_season_career as T, max_gp, max_eff
group by ilkid
having sum (T.gp) = max_gp.value OR sum (T.eff) = max_eff.value
order by ilkid;

