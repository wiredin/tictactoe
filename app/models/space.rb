class Space < ApplicationRecord
   
  scope :belonging_to, ~> (session_user_id) { where(session_user_id: session_user_id)  }
end
