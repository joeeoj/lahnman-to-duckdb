# Lahnman to DuckDB

This repo is a wrapper around the Lahnman database to convert the data into a DuckDB database format for fast, local, offline analytics.

## what

### Lahnman

The [Lahnman Baseball Database](https://www.seanlahman.com/baseball-archive/statistics/) was created by Sean Lahnman and is maintained by the Chadwick Baseball Bureau as the [baseballdatabank](https://github.com/chadwickbureau/baseballdatabank) project on GitHub. It contains baseball data.

### DuckDB

https://duckdb.org/

> DuckDB is an in-process SQL OLAP database management system

OLAP = Online analytical processing

## why

The Lahnman database is currently distributed in three formats: MS Access database, SQLite database, and CSV. SQLite is a good simple database solution but DuckDB is specifically optimized for analytics while maintaining the same single file database format as SQLite.

In other words, even though it is still under development, DuckDB is a good drop-in replacement for SQLite for this use case.

## usage

Run `$ python main.py` to regenerate the `lahnman.duckdb` database file

----------

## notes

The lahnman folder is a the baseballdatabank repo as a submodule. None of the data in this module has been touched.

The sql folder contains create queries pulled from the Lahnman SQLite distribution. These have been modified at times to align with the data in the lahnman folder (a few tables contained extraneous columns).
