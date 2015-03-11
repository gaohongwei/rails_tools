##################### Drop table
ActiveRecord::Migration.drop_table(:menus)

# Truncate and reset ID to 1
ActiveRecord::Base.connection.execute("TRUNCATE table_name")
ActiveRecord::Base.connection.execute("TRUNCATE comments;TRUNCATE comments")
ActiveRecord::Base.connection.reset_pk_sequence!('comments') # only pg needs this

rake db:migrate:redo VERSION=20150221001521
