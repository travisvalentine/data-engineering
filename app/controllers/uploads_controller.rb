class UploadsController < ApplicationController
  before_filter :authenticate

  def new
  end

  def create
    data = DataUpload.new(params[:file])
    if data.valid? && data.process!
      flash[:alert] = t(:"upload.gross_revenue", number: data.gross_revenue)
      redirect_to new_upload_path
    else
      flash[:alert] = data.errors.full_messages.join(",")
      redirect_to new_upload_path
    end
  end
end
