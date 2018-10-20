class ApplicationView  
  def initialize(**opts)
    post_initialize(opts)
  end
  
  def post_initialize(**opts)
    # 固有の追加処理あればオーバーライド
  end
  
  def to_partial_path
    self.class.name.underscore
  end

end