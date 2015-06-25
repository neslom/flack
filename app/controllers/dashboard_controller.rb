class DashboardController < ApplicationController
  skip_before_filter :must_be_logged_in!

  def index
  end
end
