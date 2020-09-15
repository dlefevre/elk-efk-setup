.PHONY: run
run:
	ansible-playbook -f 10 -i inventory main.yaml

.PHONY: check
check:
	ansible-playbook -f 10 -i inventory --check --diff main.yaml

.PHONY: push
push:
	git commit -am "Commit by $(whoami) @ $(date)."
	git push
