class TodoPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
        scope.where(user: user)
    end
  end

	def index?
		user.present?
	end
end