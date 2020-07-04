class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :updated_at, :event, :user
end
