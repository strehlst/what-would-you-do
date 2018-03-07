# frozen_string_literal: true

module MetricsHelper
  def load_metrics
    @dreams_count = Dream.all.count
    @users_count = User.all.count
  end
end
