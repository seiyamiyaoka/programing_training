class AnalyticsService

  def initialize(date_range)
    @date_range = date_range
    @blog_count = Blog.where(created_at: date_range).count
  end

  def self.execute(date_range)
    # singleton pattern
    @service ||= new(date_range)
  end

  # 指標の取得 NOTECE: ユーザ数, コメント数, お気に入り数を作る
  def evaluation_metrics
    [
      {
        name: 'ブログ数',
        value: @blog_count
      }
    ]
  end

  def evaluate_range
    @date_range.first.to_s + 'から' + @date_range.last.to_s
  end

end