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

end
