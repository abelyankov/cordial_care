module Erp
  class ProfileController < BaseController
    def index
      @profile = Member.find_by(id: current_user.id)
    end
  end
end