A model can belong to multiple models on a single association. 

A picture model can belongs to either an employee model or a product model
class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
end
 
class Employee < ActiveRecord::Base
  has_many :pictures, as: :imageable
end
 
class Product < ActiveRecord::Base
  has_many :pictures, as: :imageable
end

a polymorphic belongs_to declaration sets up an interface for other models. 
@employee.pictures.
@product.pictures.
@picture.imageable

To make this work, you need to declare both a foreign key column and a type column in the polymorphic model.

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string  :name
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps null: false
    end
 
    add_index :pictures, :imageable_id
  end
end

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
http://guides.rubyonrails.org/association_basics.html
