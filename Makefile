whoami = $(shell whoami)
date = $(shell date)

.PHONY: run
run: pull
	ansible-playbook -f 10 -i inventory main.yaml

.PHONY: elasticsearch
elasticsearch: pull
	ansible-playbook -f 10 -i inventory main.yaml --tags elasticsearch

.PHONY: logstash
logstash: pull
	ansible-playbook -f 10 -i inventory main.yaml --tags logstash

.PHONY: check
check: pull
	ansible-playbook -f 10 -i inventory --check --diff main.yaml

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
