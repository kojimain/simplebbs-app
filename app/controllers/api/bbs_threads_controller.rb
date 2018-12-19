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
    bbs_threads =
    BbsThread.select(*index_select_columns).all.
    page(params[:page]).
    per(10)
    
    return render(
      status: 200,
      json: bbs_threads.map{|bbs_thread|
        {
          id: bbs_thread.id,
          title: bbs_thread.title,
          created_at: bbs_thread.created_at,
          url:
            Rails.application.routes.url_helpers.
            bbs_thread_url(bbs_thread, host: request.host, protocol: request.scheme),
        }
      }
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
