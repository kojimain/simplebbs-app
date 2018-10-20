class TopController < ApplicationController
  def show
    @view = Top::ShowView.new()
  end
end
