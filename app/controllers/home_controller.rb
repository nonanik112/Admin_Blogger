class HomeController < ApplicationController
  def index
    # code
  end
  private
  def home_params
    params.require(:home).permit(:image)
  end
end
