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
  
  def destroy
    bbs_post = BbsPost.find(params[:id])
    bbs_post.destroy!
    return render(
      status: 200,
      json: {
        messages: [
          "success",
        ]
      }
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
