dropdb --cluster 9.3/main sisne_to
createdb --cluster 9.3/main sisne_to
psql --cluster 9.3/main sisne_to < $1
