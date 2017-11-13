class Comment < ApplicationRecord
  belongs_to :post

  def self.add_comment
    Comment.create(username: 'chinhdung', body: 'hello crontab', post_id: 7)
  end
end
