version=1.0.0
repository=smtp
user=hatlonely

.PHONY: deploy remove logs

deploy:
	mkdir -p /var/docker/${repository}/conf
	cp exim.conf /var/docker/${repository}/conf
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
