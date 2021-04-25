class Admin::BaseController < ActionController::Base
    protect_from_forgery with: :exception
    layout "application"
    respond_to :html

    before_action :authenticate_employee!

    around_action :benchmark_filter

    def benchmark_filter
     start_time1 = Time.now.to_datetime.strftime('%Q').to_i
     yield # 这里让出来执行Action动作
     start_time_bt = (Time.now.to_datetime.strftime('%Q').to_i - start_time1)
     Rails.logger.tagged("服务端接口请求取值耗时") { Rails.logger.info("#{controller_name}-#{action_name}:#{start_time_bt}ms") }
     Rails.logger.tagged("服务端接口请求取值耗时超时") { Rails.logger.info("#{controller_name}-#{action_name}:#{start_time_bt}ms") } if start_time_bt > 1000
    end

end
