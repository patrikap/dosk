.PHONY: start stop restart shell mongo logs rebuild init

start:
		@bash scripts/start.sh

stop:
		@bash scripts/stop.sh

restart:
		@bash	scripts/stop.sh
		@bash	scripts/start.sh

shell:
		@bash scripts/shell.sh

mongo:
		@bash scripts/mongo.sh

logs:
		@bash scripts/logs.sh

rebuild:
		@bash scripts/rebuild.sh

perm:
		@bash scripts/perm.sh