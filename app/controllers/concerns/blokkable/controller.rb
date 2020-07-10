module Blokkable::Controller
  extend ActiveSupport::Concern

  included do
    before_action :set_object, only: [:show, :edit, :update, :destroy]
    helper_method :render_fields_for
  end

  def show
  end

  def new
    @object = klass[kind].new
  end

  def edit
  end

  def create
    if @object = klass[kind].create(object_params)
      redirect_to redirect_path
    else
      render "new"
    end
  end

  def update
    if @object.update object_params
      redirect_to redirect_path
    else
      render "edit"
    end
  end

  private

  def redirect_path
    "/"
  end

  def klass
    controller_name.singularize.titleize.constantize
  end

  def render_fields_for(object, form)
    object.class.fields.map do |key, type|
      render_to_string partial: "#{klass.to_s.downcase.pluralize}/fields/#{type}", locals: { key: key, form: form, kind: object.kind }
    end.join("\n").html_safe
  end

  def set_object
    @object = klass.find(params[:id]).to_kind
  end

  def object_params
    params[kind].permit!
  end

  def kind
    params[:kind]
  end

end