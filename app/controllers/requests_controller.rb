class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :import, :dashboard, :search]
  before_action :set_request, only: [:show, :edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    @q = Request.search(params[:q])
    @requests = @q.result(distinct: true).order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv { render text: @requests.to_csv }
    end
  end

  def show
    @response = Response.new
    @comment = Comment.new
    @request_user = User.first
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.new(request_params)
    @users = params[:request][:user_ids].reject{|e| e == ""}
    @request.users << User.find(@users)
    if @request.save
      redirect_to requests_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    @request.users.clear
    @users = params[:request][:user_ids].reject{|e| e == ""}
    @request.users << User.find(@users)
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_path, notice: 'RFI was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_path, notice: 'RFI was successfully deleted.' }
    end
  end

  def import
    Request.import(params[:file])
    redirect_to root_path, notice: 'Data was successfully imported.'
  end

  def void
    @request = Request.find(params[:request_id])
    @request.update(status: "Void")
    respond_to do |format|
      format.html { redirect_to requests_path, notice: 'RFI was successfully voided.' }
    end
  end

  def dashboard
    @requests = Request.all
    @open = Request.where("status = ? OR status = ?", "Open", "Re-Opened")
    @overdue = @open.where("DATE(due) < ?", Date.today)
    @high_priority = @open.where("priority = ?", "High")
    @tags = Request.tag_counts_on(:tags)
  end

  def search
    index
    render :index
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:subject, :body, :to, :due, :status, :priority, :cost_impact, :trade, :opened, :filepicker_url, :from, :user_ids, :tag_list, responses_attributes: [:body, :opened], comments_attributes: [:body])
    end

    def sort_column
      Request.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
