##### Update table definition


### Add column
rails g migration AddCommentableIdToComment      commentable_id:integer
rails g migration AddTypeToUser type:string

### Remove columns
rails g migration RemoveCommantableIdFromComment commantable_id:integer
