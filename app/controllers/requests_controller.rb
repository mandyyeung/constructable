class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_request, except: [:index, :new, :create]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end
end
