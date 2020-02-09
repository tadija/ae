TOOL=ae
ORIGIN=https://github.com/tadija/ae.git

edit:
	xed .

build:
	swift build -c release

deploy:
	cp -f .build/release/${TOOL} /usr/local/bin/${TOOL}

reload:
	@make build >/dev/null
	@make deploy >/dev/null
	@echo ${TOOL}
	@${TOOL}

install: build deploy boilerplate
	$(info ${TOOL} installed)

uninstall:
	@rm -rf ~/.${TOOL}
	@rm /usr/local/bin/${TOOL}
	$(info ${TOOL} uninstalled)

update:
	@git remote add ${TOOL} ${ORIGIN}
	@git fetch ${TOOL}
	-git merge ${TOOL}/master --allow-unrelated-histories
	@git remote remove ${TOOL}

quickstart:
	@git remote remove origin
	@make install

boilerplate:
	@echo "$$Factory" > Sources/My/Factory.swift

define Factory
import AEShell
import AECli
import AETool

extension Factory {
    public func makeCommands() -> [Command] {
        [
            // add commands here
        ]
    }
}
endef
export Factory
