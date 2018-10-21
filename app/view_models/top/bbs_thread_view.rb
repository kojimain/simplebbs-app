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
  
  def title_link
    bbs_thread_path(bbs_thread)
  end

  def delete_bbs_thread_button_id
    "delete_bbs_thread_#{bbs_thread.id}_button"
  end

  def delete_bbs_thread_path
    api_bbs_thread_path(bbs_thread)
  end

end
