class BlokksController < Blokkade::BaseController

  private

  def redirect_path
    blokk_path(@blokk)
  end
  
end
