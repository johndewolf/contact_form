class InquiriesController < ApplicationController
  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to @inquiry, notice: 'Inquiry was successfully saved'
    else
      render action: 'new'
    end
  end

  def new
    @inquiry = Inquiry.new
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
      redirect_to @inquiry, notice: 'Inquiry was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to inquiries_url
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:first_name, :last_name, :email, :subject, :description)
    end
end
