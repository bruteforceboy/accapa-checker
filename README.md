You may need to modify the `.sh` file and place the checker in the right directory for other templates.

For C++, add the folder "checker" to the directory containing `/build` and `/src`.
Then run:

- `make typecheck` (allow it to build, then interrupt)
- `cd checker & bash run_tests.sh` 

The tests run for all excluding `/ill-typed/extra-tests/` and `/ill-typed/incorrect_arity/`.
