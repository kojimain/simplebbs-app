class BbsThreads::CreateForm < ApplicationForm
  attribute :title, :string, default: ""
  
  validates :title,
    presence: true
  
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
