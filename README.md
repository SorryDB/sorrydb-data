# sorry-db-data
Data for [SorryDB](https://github.com/LennyTaelman/SorryDB). See the [DATABASE.md](https://github.com/LennyTaelman/SorryDB/blob/master/doc/DATABASE.md) file for information on the format.

This repo is updated with new sorries from repos in the `active_repos.json` repo list.

`active_repos.json` was generated using the [scrape_resevoir.py](https://github.com/LennyTaelman/SorryDB/blob/master/data/repo_lists/scripts/scrape_reservoir.py) script: 

```sh
python3 scrape_reservoir.py --updated-since 2025-01-01 --minimum-stars 30 --output active_repos.json`
```
See the [repo_lists](https://github.com/LennyTaelman/SorryDB/tree/master/data/repo_lists) directory in SorryDB for information about repo lists.
