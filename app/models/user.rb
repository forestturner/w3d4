class User < ActiveRecord::Base
  has_many :responses

  has_many :polls,
   primary_key: :id,
   foreign_key: :author_id,
   class_name: :Poll


end
