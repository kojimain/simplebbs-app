class Top::BbsThreadView < ApplicationView
  
  attr_accessor *[
    :bbs_thread,
  ]
  def post_initialize(bbs_thread:, **opts)
    @bbs_thread = bbs_thread
  end
  
  def title
    bbs_thread.title
  end

end
