class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  after_create_commit -> { broadcast_append_to chatroom, partial: "chatrooms/post", locals: { post: self  }, target: "chatroom_"+chatroom.id.to_s }

  def post_date
    created_at
  end
end
  