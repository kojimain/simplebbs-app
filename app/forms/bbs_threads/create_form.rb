class BbsThreads::CreateForm < ApplicationForm
  attribute :title, :string, default: "(no title)"
  
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
