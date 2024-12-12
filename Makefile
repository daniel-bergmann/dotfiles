git:
	@echo "Committing and pushing to git"
	@git add .
	@git commit -m "$(m)"
	@git push origin main
docker:
	@docker-compose down
	@docker-compose build --no-cache
	@docker-compose up -d
