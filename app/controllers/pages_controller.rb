class PagesController < ApplicationController
  skip_before_action :authenticate_student!, only:[:index]
  def index
  end
end
