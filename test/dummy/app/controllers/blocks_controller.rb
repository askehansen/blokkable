class BlocksController < ApplicationController
  include Blokkade::Controller

  private

  def redirect_path
    block_path(@object)
  end
  
end
