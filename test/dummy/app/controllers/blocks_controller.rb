class BlocksController < Blokkade::BaseController

  private

  def redirect_path
    block_path(@object)
  end
  
end
