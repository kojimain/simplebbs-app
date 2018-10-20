class BbsPosts::CreateForm < ApplicationForm
  attr_reader *[
    :bbs_thread,
  ]
  def initialize(bbs_thread, attrs={})
    @bbs_thread = bbs_thread
    super(attrs)
  end
  
  attribute :body, :string, default: ""
  validates :body,
    presence: true
  attribute :poster_name, :string, default: ""
  validates :poster_name,
    presence: true
  
  def url
    api_bbs_thread_bbs_posts_path(bbs_thread)
  end
  
  private
  
  def save_logic
    bbs_thread.bbs_posts.build(bbs_post_attributes)
    .save!
  end
  
  def bbs_post_attributes
    {
      body: body,
      poster_name: poster_name,
    }
  end
end
