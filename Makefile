all: build run

build:
	git submodule init
	git submodule update --remote
	latexmk -xelatex -synctex=1 -jobname=diploma main.tex

run:
	evince diploma.pdf

clean:
	rm *.aux \
	*.fdb_latexmk \
	*.fls \
	*.lof \
	*.lot \
	*.log \
	*.out \
	*.synctex.gz \
	*.toc

docker:
	docker build -t docker-latex .
	docker run --rm -ti -v ${PWD}:/bachelor-thesis:Z docker-latex bash -c "make build && make clean"
	# docker run --rm -ti -v ${PWD}:/bachelor-thesis:Z docker-latex bash -c "make -C presentation && make -C presentation clean"

# pres:
# 	make -C presentation run

# pres_it_planet:
# 	make -C presentation_it_planet run
