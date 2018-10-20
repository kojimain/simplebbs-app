class BbsThreadsController < ApplicationController
  def show
    bbs_thread = BbsThread.find(params[:id])
    @view = BbsThreads::ShowView.new(bbs_thread: bbs_thread)
  end
end
