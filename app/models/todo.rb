class Todo < ActiveRecord::Base
	belongs_to :user

	default_scope { order('created_at DESC') }

	validates :user, presence: true
end
