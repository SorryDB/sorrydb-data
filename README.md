# SorryDB dataset

This repository hosts the main dataset of the
[SorryDB](https://github.com/SorryDB/SorryDB) project.

## Contents

This repository contains various `json` files indeding sorries in public Lean 4
repositories. They are generated using the crawler developed in the
[SorryDB project](https://github.com/SorryDB/SorryDB/). See the
[DATABASE.md](https://github.com/SorryDB/SorryDB/blob/master/doc/DATABASE.md)
file for information on the format of these files.

### Nightly updates

Every night, we update the following lists of sorries:

- `sorry_database.json`: the principal database file containing a cumulative
  list of scraped sorries (and some data used by the crawler).
- `deduplicated_sorries.json`: a list containing the most recent instance of a
  sorry with a given pretty printed goal string for every such goal occurring in
  the database.

### Static lists

We intend to also provide some static lists of sorries that can be used for
development, testing, and benchmarking. For now this includes:

- `static_100_varied_recent_deduplicated_sorries.json`: a static list of 100 varied and recent deduplicated sorries for development and testing purposes.

### Repositories

This repo is updated with new sorries from repos in the `active_repos.json` repo
list. This was generated from Lean
[Reservoir](https://reservoir.lean-lang.org/packages) using the [scrape_resevoir.py](https://github.com/LennyTaelman/SorryDB/blob/master/sorrydb/cli/scrape_reservoir.py) script.

## Information for repository owners and contributors

We intend to track all sorries in Lean 4 repositories listed by
[Reservoir](https://reservoir.lean-lang.org/packages). If you want your
repository to be indexed, make sure it satisfies the [inclusion
criteria](https://reservoir.lean-lang.org/inclusion-criteria). In particular, it
must have an open source
license.

Even if your repository is listed on Reservoir, you can opt out from having it
indexed. We can also exclude sorries based on authorship (determined via [git
blame](https://git-scm.com/docs/git-blame)). In both cases, please contact
[Lenny Taelman](https://lennytaelman.github.io/).

## Guidelines for automated theorem proving researchers

See [ABOUT.md](https://github.com/SorryDB/SorryDB/blob/master/doc/ABOUT.md) for
more information on the motivation and goals of this project.

Some important guidelines:

- this is work in progress, and still in an experimental phase; in particular
  the format of the dataset may change without notice
- if you are using or intend to use this dataset, let us know!
- if you prove some of these sorries, do *not* submit automated pull requests
  without prior consent from the repository owners.

