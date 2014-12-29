rails g scaffold loan     property_id:integer amount:integer
rails g scaffold property street_name:string
rails g scaffold property_owner property_id::integer  user_id::integer 
class Loan < ActiveRecord::Base
  scope :by_user, lambda { |id|
    joins( :property => {:property_owners=>:user} ).merge(User.by_user(id))
  }
end
