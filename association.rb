
:foreign_key, foreign_key, exist in child table
has_many/has_one/belongs_to
By convention, Rails assumes that the column used to hold the foreign key on the other model is the name of this model with the suffix _id added. The :foreign_key option lets you set the name of the foreign key directly:

:primary_key
By convention, Rails assumes that the column used to hold the primary key of the association is id. You can override this and explicitly specify the primary key with the :primary_key option.



:source
has_many/has_one
The :source option specifies the source association name for a 
has_many/has_one :through association. 
You only need to use this option if the name of the source association cannot be 
automatically inferred from the association name.

:class_name
has_many/has_one/belongs_to
If the name of the other model cannot be derived from the association name, you can 
use the :class_name option to supply the model name.

---------------------
:source and :class_name are conceptually the same, just need to be different for different uses.

:source is used (optionally) to define the associated model name when you're using has_many  through; 
:class_name is used (optionally) in a simple has many relationship. 

Both are needed only if Rails cannot figure out the class name on its own. 



Self Joins
class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
 
  belongs_to :manager, class_name: "Employee"
end


http://guides.rubyonrails.org/association_basics.html
