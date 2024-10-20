class AdminController < ApplicationController
  before_action :check_admin_privilege
  def show
  end
end