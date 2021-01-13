# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :contribute_user?, only: %i[edit update destroy]

  # GET /reports
  def index
    @reports = Report.all.order(:id).page(params[:page])
  end

  # GET /reports/1
  def show
    #  @comment=@report.comments.build(user_id: current_user.id)
    @comment = Comment.new
    #  @comments=@report.comments.all
    @comments = @report.comments.includes(:user).order(:id).page(params[:page])
  end

  # GET /reports/new
  def new
    @report = Report.new
    @current_user = current_user
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports
  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: 'Report was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :description, :user_id)
  end

  def contribute_user?
    return true if current_user == @report.user

    redirect_to reports_path
    flash[:notice] = '投稿者以外編集、削除はできません。'
  end
end
