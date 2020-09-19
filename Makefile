whoami = $(shell whoami)
date = $(shell date)

.PHONY: run
run: pull
	ansible-playbook -f 10 -i inventory main.yaml $(ARGS)

.PHONY: check
check: pull
	ansible-playbook -f 10 -i inventory --check --diff main.yaml $(ARGS)

.PHONY: pull
pull:
	git pull

.PHONY: push
push:
	git commit -am "Commit by $(whoami) @ $(date)."
	git push

.PHONY: test
test:
	curl -s http://coord-1:9200/_cluster/health | python -m json.tool
