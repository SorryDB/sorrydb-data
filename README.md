# SorryDB dataset

This repository hosts the main dataset of the
[SorryDB](https://github.com/SorryDB/SorryDB) project.

## Contents

The main products are:

- `sorry_database.json`: the principal database file containing a cumulative
  list of scraped sorries (and some data used by the crawler).
- `deduplicated_sorries.json`: a list containing the most recent instance of a
  sorry with a given pretty printed goal string for every such goal occurring in
  the database.

These are updated nightly using the crawler developed in the
[SorryDB](https://github.com/SorryDB/docs/CRAWLER.md) project. See the
[DATABASE.md](https://github.com/SorryDB/SorryDB/blob/master/doc/DATABASE.md)
file for information on the format of these files.

## Repositories

This repo is updated with new sorries from repos in the `active_repos.json` repo
list. This was generated from Lean
[Reservoir](https://reservoir.lean-lang.org/packages) using the [scrape_resevoir.py](https://github.com/LennyTaelman/SorryDB/blob/master/sorrydb/cli/scrape_reservoir.py) script.
