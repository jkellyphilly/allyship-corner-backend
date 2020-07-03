class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :event, :user
end
