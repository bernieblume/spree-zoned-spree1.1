class ZonedController < Spree::BaseController

  def setcountry
    respond_to do |format|
      format.js { render :nothing => true }
    end
  end

end
