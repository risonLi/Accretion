.PHONY: initBrainhole initDevEnvironment database
all:
	@cat makefile
initBrainhole:
	./dev-scripts/initBrainhole
initDevEnvironment:
	./dev-scripts/initDevEnvironment
installPackages:
	cd brainhole; bash ../dev-scripts/backend/installPackages
database:
	./dev-scripts/startDatabase
force-restart-database:
	pkill mongod -sigkill; ./dev-scripts/startDatabase
brainhole-watch:
	cd brainhole; npm run watch
brainhole-dev:
	cd brainhole; npm run dev
brainhole-test:
	cd brainhole; npm run test
brainhole-test-inspect:
	cd brainhole; npx nodemon --inspect --watch test-final.js --watch server -- node_modules/ava/profile.js test-final.js --fail-fast
brainhole-test-profile:
	cd brainhole; npm run test-profile
tmux:
	./dev-scripts/backend/opneInTmux
