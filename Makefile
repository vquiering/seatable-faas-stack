include .env
-include .local.env

VERSION ?=

NAME ?=

REPO ?=

.DEFAULT_GOAL = help	# if you type 'make' without arguments, this is the default: show the help
.PHONY        : # Not needed here, but you can put your all your targets to be sure
                # there is no name conflict between your files and your targets.

version:
	sed -i 's/<VERSION>/$(VERSION)/g' ./$(NAME)/Chart.yaml

lint: version
	helm lint ./$(NAME)

package: version
	helm package ./$(NAME)

repo:
	helm repo add $(NAME) --username $(REPO_USERNAME) --password $(REPO_PASSWORD) $(REPO)

push:
	helm cm-push ./$(NAME)-$(VERSION).tgz $(NAME)

release: package repo push

cr-package: version
	cr package ./$(NAME)

cr-release: cr-package
	cr upload --git-repo helm-charts --owner $(OWNER) --token $(GITHUB_TOKEN)

index:
	cr index --git-repo helm-charts --owner $(OWNER) --pages-branch master --token $(GITHUB_TOKEN) --push

## get this help page
.PHONY: help
help:
	@awk '{ \
			if ($$0 ~ /^.PHONY: [a-zA-Z\-\_\.0-9]+$$/) { \
				helpCommand = substr($$0, index($$0, ":") + 2); \
				if (helpMessage) { \
					printf "\033[36m%-40s\033[0m \t%s\n", \
						helpCommand, helpMessage; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^[a-zA-Z\-\_0-9.]+:/) { \
				helpCommand = substr($$0, 0, index($$0, ":")); \
				if (helpMessage) { \
					printf "\033[36m%-40s\033[0m %s\n", \
						helpCommand, helpMessage; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^##/) { \
				if (helpMessage) { \
					helpMessage = helpMessage"\n                                                  "substr($$0, 3); \
				} else { \
					helpMessage = substr($$0, 3); \
				} \
			} else { \
				if (helpMessage) { \
					printf "\n\033[33m%-80s\033[0m\n", \
          	helpMessage; \
				} \
				helpMessage = ""; \
			} \
		}' \
		$(MAKEFILE_LIST)