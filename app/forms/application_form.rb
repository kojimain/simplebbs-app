class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include Rails.application.routes.url_helpers
  
  def url
    raise NotImplementedError
  end
  
  def save
    @saved = save_logic if valid?
  end
  
  def saved?
    @saved
  end
  
  def result
    {
      status: http_status,
      messages: self.errors.full_messages,
    }
  end
  
  def http_status
    saved? ? 200 : 400
  end
  
  private
  
  def save_logic
    raise NotImplementedError
  end
end