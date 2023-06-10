# Intermediate_SQL

This is the code written as part of my Assignment in the course DBMS.

The CSV files folder contains all the CSV files whose data is used throught.

Coming to the other sql files here :
1) <strong>nba_create_table.sql</strong> file contains the SQL code specifying attributes and their integrity constraints for creating tables to each of the CSV files given.
2) _nba_load_data.sql_ file contains basic SQL code for loading the data that is present in the CSV files into the Tables created.
3) nba_query.sql file contains SQL code to some basic queries, which are specified below :<br>
   i) In the first part of this code ,The count of the number of players in each position is calculated from the table Players.<br>
   ii) In the second part of this code, The top-5 most Productive Years are found. Here Productive Years is determined based on the total number of games played (gp) by all the players, 
   including both regular seasons and playoffs, for each year.<br>
   iii) In the third part of this code, The top-10 most efficient players among the players who have played more than 500 games are found. Here efficiency rating is defined as follows:
         eff = (pts + reb + ast + stl + blk − ((fga − fgm) + (fta − ftm) + turnover))
   iv) In the fourth part of this code, The number of players who have played more regular season games in the year 1990 than regular season games in any other year in their career is found.
   v) In the fifth part of this code, All time-best players from the table player_regular_season_career are found. Here all time-best players refers to the set of players P, so that each 
   player in P is not dominated by any other player in the table player_regular_season_career.
   Also here, For two players p1 and p2, we define that p1 dominates p2 if and only if p1 has a higher gp (games played) and eff (efficiency rating) value than p2.
4) nba_delete_all.sql file contains SQL code to drop all the tables and views created.   
5) Results.pdf is a concatenation of all the results obtained from the above queries used.

In this entire Work only the Intermediate SQL is used!!
