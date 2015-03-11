##################### Drop table
ActiveRecord::Migration.drop_table(:menus)
ActiveRecord::Base.connection.execute("TRUNCATE table_name")
ActiveRecord::Base.connection.execute("TRUNCATE comments;TRUNCATE comments")
rake db:migrate:redo VERSION=20150221001521
