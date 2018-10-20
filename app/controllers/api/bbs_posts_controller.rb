class Api::BbsPostsController < ApplicationController
  def create
    @form = BbsPosts::CreateForm.new(
      BbsThread.find(params[:bbs_thread_id]),
      form_params
    )
    @form.save
    return render(
      status: @form.http_status,
      json: @form.result,
    )
  end
  
  private
  
  def form_params
    params.require(:bbs_posts_create_form).
    permit(
      :body,
      :poster_name,
    )
  end
end
