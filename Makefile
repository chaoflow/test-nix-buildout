BUILDOUT_CFG := development.cfg
RUN := nix-shell -I . --pure --command

all: buildout


bootstrap:
	${RUN} "which python"
	${RUN} "python bootstrap.py -c ${BUILDOUT_CFG} --download-base ~/.buildout/eggs/"
	make syspath

buildout:
	${RUN} "./bin/buildout -vvvv -c ${BUILDOUT_CFG}"


syspath:
	${RUN} "set | grep ^PYTHONPATH"
	${RUN} "python -c 'import sys,pprint;pprint.pprint(sys.path)'"

test-import:
	${RUN} "python -c 'import Crypto;print(Crypto.__file__)'"

