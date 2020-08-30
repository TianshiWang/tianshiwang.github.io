DOCS=index research teaching publications talks

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix ./, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(PHDOCS)
	@echo -ne 'Copying to server...\n'
	@scp -r *.html jemdoc.css figures publications talks login.eecs.berkeley.edu:/home/eecs/tianshi/public_html/
	@echo ' done.'

%.html : %.jemdoc MENU
	jemdoc -c mysite.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f *.html

