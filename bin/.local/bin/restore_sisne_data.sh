dropdb --cluster 9.3/main sisne
createdb --cluster 9.3/main sisne
psql --cluster 9.3/main  sisne < $1
