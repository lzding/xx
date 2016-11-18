class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_admin!
end
