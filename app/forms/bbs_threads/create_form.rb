class BbsThreads::CreateForm < ApplicationForm
  attribute :title, :string, default: "(no title)"
  
  def url
    api_bbs_threads_path
  end
  
  private
  
  def save_logic
    BbsThread.new(bbs_thread_attributes)
    .save!
  end
  
  def bbs_thread_attributes
    {
      title: title,
    }
  end
end
