class Top::ShowView < ApplicationView
  
  def bbs_thread_views
    bbs_threads.
    map{|bbs_thread|
      Top::BbsThreadView.new(
        bbs_thread: bbs_thread,
      )
    }
  end
  
  private
  
  def bbs_threads
    @bbs_threads ||=
    BbsThread.all.
    order(created_at: :desc)
  end
end
