class Public::InquliesController < ApplicationController
  before_action :inqulies_params, only: [:confirm, :create]
  def new
    @inqulies = Inquly.new
  end
  def back
    @inqulies = Inquly.new(inqulies_params)
    render 'new'
  end

  def confirm
    @inqulies = Inquly.new(inqulies_params)
    return if @inqulies.valid?
    render 'new'
  end

  def create
    @inqulies = Inquly.new(inqulies_params)
    @inqulies.save
    InquliesMailer.inqulies_mail(@inqulies).deliver
    redirect_to thanks_inqulies_path
  end

  def thanks
  end

  private
    def inqulies_params
      params.require(:inquly).permit(:name, :body, :email)
    end
end
