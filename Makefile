.PHONY: run
run:
	ansible-playbook -i inventory main.yaml

.PHONY: check
check:
	ansible-playbook -i inventory --check --diff main.yaml

.PHONY: push
push:
	git commit -am "Commit by $(whoami) @ $(date)."
	git push
