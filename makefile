dump_schema:
	pg_dump testdb --schema-only
	pg_dump testdb --schema-only > schema.sql

get_log:
	cat /var/log/postgresql/postgresql-12-main.log > postgresql-12-main.log