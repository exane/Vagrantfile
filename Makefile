build: .server.pid
	docker build -t dev --rm .
	$(MAKE) -s shutdown

.server.pid:
	{ ruby -run -ehttpd ~ -p8080 -b192.168.99.1 & echo $$! > $@; }

shutdown: .server.pid
	kill `cat $<` && rm $<