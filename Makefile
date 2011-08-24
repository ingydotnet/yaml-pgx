export PERL5LIB=../pegex-pm/lib

COMPILE_COMMAND = perl -MPegex::Compiler::Bootstrap -e \
    'my $$p=Pegex::Compiler::Bootstrap->new;$$p->compile_file(shift);print $$p->to_

all: yaml.pgx.yaml yaml.pgx.json

yaml.pgx.yaml: yaml.pgx Makefile
	$(COMPILE_COMMAND)yaml' $< > $@

yaml.pgx.json: yaml.pgx Makefile
	$(COMPILE_COMMAND)json' $< > $@

clean:
	rm -f yaml.pgx.*
