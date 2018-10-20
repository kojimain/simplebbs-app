class Api::BbsThreadsController < ApplicationController
  def create
    @form = BbsThreads::CreateForm.new(form_params)
    @form.save
    return render(
      status: @form.http_status,
      json: @form.result,
    )
  end
  
  private
  
  def form_params
    params.require(:bbs_threads_create_form).
    permit(
      :title,
    )
  end
end
