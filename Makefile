build:
	rm -f *.gem && gem build crypto_tracker.gemspec

install:
	gem install crypto_tracker-0.1.0.gem

uninstall:
	gem uninstall crypto_tracker
