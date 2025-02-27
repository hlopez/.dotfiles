dropdb --cluster 11/main gna_net_test
createdb --cluster 11/main gna_net_test
psql --cluster 11/main  gna_net_test < $1
