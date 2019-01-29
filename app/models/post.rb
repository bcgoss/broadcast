class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, foreign_key: 'parent_id', optional: true
end
