clean: rm -rf dist

build: update-npm
	(git checkout build;)
	(cd node_modules/jetson/; $(MAKE) doc;)

deploy: build
	(cp -r node_modules/jetson/doc .)
	(mkdir -p ../tmp/jetson-doc)
	(cp -r doc/* ../tmp/jetson-doc)
	(git checkout master)
	(git rm -rf .)
	(cp -r ../tmp/jetson-doc/* .)
	(git add .)
	(git commit -am "Latest documentation build")
	(git push)

update-npm:
	npm install;
