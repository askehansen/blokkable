class BlocksController < ApplicationController
  include Blokkable::Controller

  private

  def redirect_path
    block_path(@object)
  end
  
end
