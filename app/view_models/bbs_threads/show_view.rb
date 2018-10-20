class BbsThreads::ShowView < ApplicationView
  attr_accessor *[
    :bbs_thread,
  ]
  def post_initialize(bbs_thread:, **opts)
    @bbs_thread = bbs_thread
  end
  
  def h1
    bbs_thread.title
  end
  
  def bbs_posts_create_view
    BbsThreads::BbsPosts::CreateView.new(
      bbs_thread: bbs_thread,
    )
  end
  
  def bbs_post_views
    bbs_posts.
    map{|bbs_post|
      BbsThreads::BbsPostView.new(
        bbs_post: bbs_post,
      )
    }
  end
  
  private
  
  def bbs_posts
    @bbs_posts ||=
    BbsPost.all.
    order(created_at: :desc)
  end
  
end
