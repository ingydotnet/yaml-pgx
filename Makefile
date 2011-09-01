export PERL5LIB=../pegex-pm/lib

COMPILE_COMMAND = perl -MPegex::Compiler -e \
    'print Pegex::Compiler->compile_raw(shift)->to_

all: yaml.pgx.yaml yaml.pgx.json

yaml.pgx.yaml: yaml.pgx Makefile
	$(COMPILE_COMMAND)yaml' $< > $@

yaml.pgx.json: yaml.pgx Makefile
	$(COMPILE_COMMAND)json' $< > $@

clean:
	rm -f yaml.pgx.*
