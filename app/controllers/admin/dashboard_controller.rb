class Admin::DashboardController < AdminController

  def index
    date_range = Date.today.beginning_of_month..Date.today.end_of_month
    @service = AnalyticsService.execute(date_range)
  end
end
