"""Load data files, create tmp version with incremented ID column, create tables, load tmp files into lahnman.duckdb"""
import csv
from importlib.resources import files
from itertools import chain
from pathlib import PosixPath

import duckdb


SQL = files('src.sql')
CORE = files('src.lahnman.core')
CONTRIB = files('src.lahnman.contrib')
TMP = files('src.tmp')

# these need to be loaded in order to avoid foreign key violation errors
TABLE_ORDER = ['people', 'parks', 'teamsfranchises', 'teams', 'salaries', 'schools', 'allstarfull', 'appearances',
               'awardsmanagers', 'awardsplayers', 'awardssharemanagers', 'awardsshareplayers', 'batting', 'battingpost',
               'collegeplaying', 'fielding', 'fieldingof', 'fieldingofsplit', 'fieldingpost', 'halloffame', 'homegames',
               'managers', 'managershalf', 'pitching', 'pitchingpost', 'seriespost', 'teamshalf']


def open_query(fname: PosixPath) -> str:
    with open(fname) as f:
        query = f.read()
    return query


def parse_query_columns(query_path: PosixPath) -> list[str]:
    """Return a list of columns for a given create table statement"""
    cols = []
    query = open_query(query_path)
    if not query.strip().startswith('CREATE TABLE'):
        return cols

    for row in query.split('\n'):
        if row.strip().startswith('"'):
            cols.append(row.strip().split('"')[1])
    return cols


def create_table_data_mapping() -> dict:
    """Return mapping of all table names -> query_path, file_path, create statement columns"""
    queries = sorted(list(SQL.joinpath('').glob('*.sql')), key=lambda p: p.name)

    core = CORE.joinpath('').glob('*.csv')
    contrib = CONTRIB.joinpath('').glob('*.csv')
    files = sorted(list(chain.from_iterable([core, contrib])), key=lambda p: p.name)

    d = {}
    for fname, query in zip(files, queries):  # excludes final index query bc there is no associated file path
        name = fname.name.replace('.csv', '').lower()

        d[name] = {
            'query_path': query,
            'file_path': fname,
            'cols': parse_query_columns(query),
        }

    return d


def load_all_create_statements(mapping: dict):
    """Join all create statements into a single string"""
    all_queries = ''
    for table in TABLE_ORDER:
        all_queries += open_query(mapping.get(table)['query_path']) + '\n'
    return all_queries


def increment_and_save_csv(fname: PosixPath, fout: PosixPath) -> None:
    """Load csv, add zero-index "ID" column, increment starting at 1, return header and incremented data tuple"""
    results = []

    with open(fout, 'wt') as fo:
        csvwriter = csv.writer(fo)

        with open(fname) as f:
            csvreader = csv.reader(f)
            header = ['ID'] + next(csvreader)
            csvwriter.writerow(header)

            for i, row in enumerate(csvreader, start=1):
                csvwriter.writerow([i] + row)


def main():
    conn = duckdb.connect(database='lahnman.duckdb')
    mapping = create_table_data_mapping()

    create_statements = load_all_create_statements(mapping)
    conn.execute('BEGIN TRANSACTION')
    conn.execute(create_statements)
    conn.execute('COMMIT')
    
    conn.execute('BEGIN TRANSACTION')
    for table in TABLE_ORDER:
        d = mapping.get(table)
        print(table)

        file_path = d['file_path']
        tmp_path = TMP.joinpath(file_path.name)

        # re-write file in tmp/ with ID col and incremented value
        increment_and_save_csv(file_path, tmp_path)

        cols = [c for c in d['cols'] if '_ID' not in c]  # trim foreign keys but leave primary ID

        conn.execute(f"COPY {table}({','.join(cols)}) FROM '{str(tmp_path)}' (DELIMITER ',', HEADER 1);")
    conn.execute('COMMIT')

    # final index query
    conn.execute(open_query(SQL.joinpath('zzz_indicies.sql')))


if __name__ == '__main__':
    main()
