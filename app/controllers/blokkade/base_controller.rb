class Blokkade::BaseController < ApplicationController
  before_action :set_blokk, only: [:edit, :update, :destroy]

  def new
    @blokk = Blokk[kind].new
  end

  def edit
  end

  def create    
    if @blokk = Blokk[kind].create(blokk_params)
      redirect_to "/"
    else
      render "new"
    end
  end

  def update
    if @blokk.update blokk_params
      redirect_to "/"
    else
      render "edit"
    end
  end

  private

  def set_blokk
    @blokk = Blokk.find(params[:id]).to_kind
  end

  def blokk_params
    params[kind].permit!
  end

  def kind
    params[:kind]
  end

end