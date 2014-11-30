# Act2

Work in this repository happens in branches.

## Branches

* `spec`

  This branch contains the modules that provide the core of the business
  logic.

  *A strict "no merge-commit" policy is maintained on this branch.*
  (Every individual commit must have only one parent.)

All other branches should merge the `spec` branch to get the latest
approved business logic.

## Projects

Individual projects live in their own branches.

For a branch to be considered for review and deployment, it mush contain
a merge commit of the current head of the `spec` branch.
