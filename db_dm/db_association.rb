
:foreign_key, foreign_key, exist in child table
has_many/has_one/belongs_to
By convention, Rails assumes that the column used to hold the foreign key on the other model is 
the name of this model with the suffix _id added. 
The :foreign_key option lets you set the name of the foreign key directly:

:primary_key
By convention, Rails assumes that the column used to hold the primary key of the association is id. 
You can override this and explicitly specify the primary key with the :primary_key option.



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

---------------------
class User
  has_many :subscriptions
  has_many :newsletters, :through => :subscriptions
end

class Newsletter
  has_many :subscriptions
  has_many :users, :through => :subscriptions
end

class Subscription
  belongs_to :newsletter
  belongs_to :user
end
With this code, you can do something like 
Newsletter.find(id).users to 
get a list of the newsletter's subscribers. 

But if you want to be clearer and be able to type 
Newsletter.find(id).subscribers instead, 
you must change the Newsletter class to this:

class Newsletter
  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions, :source => :user
end
You are renaming the users association to subscribers. 
If you don't provide the :source, Rails will look for an association 
called subscriber in the Subscription class. 
You have to tell it to use the user association 
in the Subscription class to make the list of subscribers.
