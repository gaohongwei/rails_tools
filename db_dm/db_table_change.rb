##### Update table definition
rails g migration RemoveCommantableIdFromComment commantable_id:integer
rails g migration AddCommentableIdToComment      commentable_id:integer
