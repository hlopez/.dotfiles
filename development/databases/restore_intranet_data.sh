dropdb --cluster 11/main gna_net
createdb --cluster 11/main gna_net
psql --cluster 11/main  gna_net < $1
