
#select some columns
  Widget.select("name,id").all

#define scope
  scope :by_controller, lambda {|controller|
    where(:controller=>controller)
  }
  scope :bycontroller, ->(controller) {
    where(:controller=>controller)
  } 
