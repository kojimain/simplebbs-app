class Api::BbsThreadsController < ApplicationController
  def create
    @form = BbsThreads::CreateForm.new(form_params)
    @form.save
    return render(
      status: @form.http_status,
      json: @form.result,
    )
  end
  
  def destroy
    bbs_thread = BbsThread.find(params[:id])
    bbs_thread.destroy!
    return render(
      status: 200,
      json: {
        messages: [
          "success",
        ]
      }
    )
  end
  
  def index
    bbs_threads = BbsThread.select(*index_select_columns).all
    return render(
      status: 200,
      json: bbs_threads.to_json
    )
  end
  
  private
  
  def form_params
    params.require(:bbs_threads_create_form).
    permit(
      :title,
    )
  end
  
  def index_select_columns
    [
      :id,
      :title,
      :created_at,
    ]
  end
end
