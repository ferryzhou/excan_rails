import './sequel_import'

db_path = ''
filepath = 'tianya.htm'
method = 'tianya'

DB = Sequel.sqlite(db_path)
table = DB[:posts]
sequel_import_file(table, filepath, method)