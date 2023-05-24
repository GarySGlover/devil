checks: test check-sentence-ends

check-sentence-ends:
	errors=$$(grep -n '[^0-9]\. [^ lsx."(]' MANUAL.org); echo "$$errors"; [ -z "$$errors" ]
	errors=$$(grep -n '\. [^ a]' README.org CHANGES.org LICENSE.org); echo "$$errors"; [ -z "$$errors" ]
	errors=$$(grep -n '\. [^ ]' *.el); echo "$$errors"; [ -z "$$errors" ]

test:
	emacs --batch -l devil.el -l devil-tests.el -f ert-run-tests-batch-and-exit
