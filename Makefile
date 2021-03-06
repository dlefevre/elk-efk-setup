whoami = $(shell whoami)
date = $(shell date)

.PHONY: run
run: pull
	ansible-playbook -f 20 -i inventory main.yaml

.PHONY: common
common: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags common

.PHONY: elasticsearch
elasticsearch: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags elasticsearch

.PHONY: logstash
logstash: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags logstash

.PHONY: fluentd
fluentd: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags fluentd

.PHONY: monitoring
monitoring: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags monitoring

.PHONY: kibana
kibana: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags kibana

.PHONY: workload
workload: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags workload

.PHONY: filebeat
filebeat: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags filebeat

.PHONY: prometheus
prometheus: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags prometheus

.PHONY: grafana
grafana: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags grafana

.PHONY: boards
boards: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags boards

.PHONY: fluentbit
fluentbit: pull
	ansible-playbook -f 20 -i inventory main.yaml --tags fluentbit

.PHONY: check
check: pull
	ansible-playbook -f 20 -i inventory --check --diff main.yaml

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

.PHONY: getpassw
getpassw:
	@sed -n '/ *elastic:/s/.*:  *//p' ../.vars/elasticsearch-users.yaml