whoami = $(shell whoami)
date = $(shell date)

.PHONY: run
run: pull
	ansible-playbook -f 10 -i inventory main.yaml

.PHONY: common
common: pull
	ansible-playbook -f 10 -i inventory main.yaml --tags common

.PHONY: elasticsearch
elasticsearch: pull
	ansible-playbook -f 10 -i inventory main.yaml --tags elasticsearch

.PHONY: logstash
logstash: pull
	ansible-playbook -f 10 -i inventory main.yaml --tags logstash

.PHONY: monitoring
monitoring: pull
	ansible-playbook -f 10 -i inventory main.yaml --tags monitoring

.PHONY: check
check: pull
	ansible-playbook -f 10 -i inventory --check --diff main.yaml

.PHONY: pull
pull:
	git pull
	ansible-galaxy role install -r roles/requirements.yml

.PHONY: push
push:
	git commit -am "Commit by $(whoami) @ $(date)."
	git push

.PHONY: test
test:
	curl -s http://coord-1:9200/_cluster/health | python -m json.tool
