# ACT REDESIGN ROADMAP

The goal is to redesign Act entirely, based on the experience on running
150+ Perl conferences over a decade.

The main requirements for the redesign are:

* maintain the old URL for the past conferences running the legacy Act
* keep the old conferences running at all times
* use modern Perl libraries and design
* add new and powerful features that were too complex (or impossible)
  to add to the legacy Act
* enable new contributors to join the project


## Timeline

The Act redesign is object-driven, centered around the "conference data",
managed by way of the entity objects (`Act::Entity::`).

The following definitions will be used:

* `mod\_perl`: the Apache application that is running since 2004,
  built on top of `Act::Object`
* `legacy URL`: the URL served by `mod\_perl`, and that are linked from
  many places over the Internet
* `old\_schema`: the database schema used by the `mod\_perl` application
  (using it also implies using the `act.ini` files to get some of the data)
* `Act2`: the newer version of Act running on entities
* `new\_schema`: the improved database schema that might be need to support
   new features in `Act2`

### Stage 0

Only `legacy URL` exist, served by `mod\_perl` on top of `old\_schema`.

### Stage 1

Entity objects are designed, work on `Act2` starts.
The entity objects are fleshened from the data in `old_schema`, and the
data is saved there too.

A "beta" site can be setup, running the `Act2` code. Since it's connected
to the same database schema (`old\_schema`) as the `mod\_perl` application,
old conferences can be seen in the new context, and managed with the parts of
`Act2` that are already available.

A subset of the `Act2` application can be made to support some of the
`legacy URL`, to be able to continue serving the old URL in the future.
This must be done using entity objects, because the `old\_schema` will
go away in the future. However, there is only a need to support the
"read-only" URL, because the "write" operations will be performed by `Act2`.

Note: there can be several versions of `Act2`, living in separate branches
or repositories.

### Stage 2

`Act2` is ready to go out of beta, i.e. it is complete enough to support
a complete conference over its lifetime.
`Act2` also supports serving `legacy URL` using entities.
`Act2` is still using `old\_schema` and `act.ini` files.

`mod\_perl` becomes completely obsolete, and can be shut down.
The `legacy URL` supported by `Act2` are locked down to the list of all
conferences at this point in time (i.e. past conferences only).

### Stage 3

`Act2` is the only application managing conferences. The lockdown of
`old\_schema` is dropped, and work can start on `new\_schema` to better
support the entities and the new features.

