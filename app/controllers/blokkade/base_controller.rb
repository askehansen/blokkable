class Blokkade::BaseController < ApplicationController
  before_action :set_blokk, only: [:show, :edit, :update, :destroy]
  helper_method :render_fields_for

  def show
  end

  def new
    @blokk = Blokk[kind].new
  end

  def edit
  end

  def create
    if @blokk = Blokk[kind].create(blokk_params)
      redirect_to redirect_path
    else
      render "new"
    end
  end

  def update
    if @blokk.update blokk_params
      redirect_to redirect_path
    else
      render "edit"
    end
  end

  private

  def redirect_path
    "/"
  end

  def render_fields_for(blokk, form)
    blokk.class.fields.map do |key, type|
      render_to_string partial: "blokks/fields/#{type}", locals: { key: key, form: form, kind: blokk.kind }
    end.join("\n").html_safe
  end

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