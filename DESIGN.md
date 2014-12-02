# THE DESIGN OF ACT

All of the conference management business logic is handled by objects.

The objects that perform the business logic are called *entities*,
and are supplied via an instance of the `Act` class.

The `Act` object encapsulates all the needed context.


## Hard constraints

The following are the only constraints imposed when writing code for Act2:

* any business logic MUST be performed by and through entities
* you are not allowed to change the database schema
  (this rule will actually be enforced until the old Act instance running
  on `mod_perl` has been shut down)



## Naming conventions and namespaces

### Act::Interface::

All the modules in the `Act::Interface::` namespace are *interfaces*,
i.e. they `requires` a set of methods to exist (using `Moo::Role`).

All `Act::Interface::` modules live in the `spec` branch.

### Act::Role::

All the modules in the `Act::Role::` namespace provide attributes
or actual method implementations (possibly by consuming other roles).

### Act::Entity::

All the modules in the `Act::Entity::` namespace are classes describing
the entities. They implement the business logic of conference management,
and should only operate at the entity level, oblivious of the data layer.

Each *entity* object must have a corresponding *interface* definition
and implement it.
