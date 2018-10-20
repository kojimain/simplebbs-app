class Top::BbsThreads::CreateView < ApplicationView
  
  def form
    @form ||= ::BbsThreads::CreateForm.new()
  end
  
end
