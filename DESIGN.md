# THE DESIGN OF ACT

All of the conference management business logic is handled by objects.

The objects that perform the business logic are called *entities*,
and live under the `Act::Entity::` namespace.

Entities are provided via an instance of the `Act` class.
The `Act` object encapsulates all the needed context.


## Hard constraints

The following are the only constraints imposed when writing code for Act2:

* any business logic MUST be performed by and through entities
* you are not allowed to change the database schema
  (this rule will actually be enforced until the old Act instance running
  on mod\_perl has been shut down)

