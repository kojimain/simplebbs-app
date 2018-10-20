class BbsThreads::BbsPosts::CreateView < ApplicationView
  
  attr_reader *[
    :bbs_thread,
  ]
  def post_initialize(**opts)
    @bbs_thread = opts[:bbs_thread]
  end
  
  def form
    @form ||= ::BbsPosts::CreateForm.new(bbs_thread)
  end
  
end
