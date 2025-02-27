dropdb --cluster 11/main gna_net_bank
createdb --cluster 11/main gna_net_bank
psql --cluster 11/main  gna_net_bank < $1
