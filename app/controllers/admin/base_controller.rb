module Admin
  class BaseController < ApplicationController
    before_filter :verify_admin

    def current_ability
      @current_ability ||= AdminAbility.new(current_user)
    end

    private
    def verify_admin
      if current_user?
        redirect_to root_url unless current_user.admin?
      end
    end

  end
end

