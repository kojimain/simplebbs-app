class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  def save
    @saved = save_logic if valid?
  end
  
  def saved?
    @saved
  end
  
  def result
    {
      status: (saved? ? 200 : 400),
      messages: self.errors.full_messages,
    }
  end
  
  def http_status
    result[:status]
  end
  
  private
  
  def save_logic
    raise NotImplementedError
  end
end