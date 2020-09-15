.PHONY: run
run: pull
	ansible-playbook -f 10 -i inventory main.yaml

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
