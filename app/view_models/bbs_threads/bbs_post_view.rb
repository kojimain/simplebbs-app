class BbsThreads::BbsPostView < ApplicationView
  
  attr_accessor *[
    :bbs_post,
  ]
  def post_initialize(bbs_post:, **opts)
    @bbs_post = bbs_post
  end
  
  def body
    bbs_post.body
  end
  
  def poster_name
    bbs_post.poster_name
  end
  
  def delete_bbs_post_button_id
    "delete_bbs_post_#{bbs_post.id}_button"
  end

  def delete_bbs_post_path
    api_bbs_post_path(bbs_post)
  end

end
