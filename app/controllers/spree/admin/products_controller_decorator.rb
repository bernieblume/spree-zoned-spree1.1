Spree::Admin::ProductsController.class_eval do
  
  def deletefc
    inorout(@product.method :delfrom)
  end
  
  def backtocountry
    inorout(@product.method :backtocountry)
  end

protected

  #
  # Copied from spree_core-1.1.1/app/controllers/spree/admin/products_controller.rb
  #
  # changes are marked using "{ CHANGE" and "CHANGE }"
  #
  def collection
    return @collection if @collection.present?
    #
    # Inserted retrieval of country from session
    # { CHANGE
    country = session[:zoned] && session[:zoned][:prd_country]
    # CHANGE }
    unless request.xhr?
      params[:q] ||= {}
      params[:q][:deleted_at_null] ||= "1"

      #
      # Appended unless clause
      # { CHANGE
      params[:q][:s] ||= "name asc" unless country && country.to_i != 0
      # CHANGE }

      @search = super.search(params[:q])
      #
      # Inserted query when country given
      # { CHANGE
      if country && country.to_i != 0
        @collection = @search.result.
          joins(
              'LEFT OUTER JOIN spree_zoned_products ON spree_zoned_products.spree_product_id = spree_products.id' +
              " AND spree_zoned_products.spree_country_id = #{country}").
          #where('(spree_zoned_products.orderno IS NULL OR spree_zoned_products.orderno >= 0)').
          order('spree_zoned_products.orderno').
          includes([:master, {:variants => [:images, :option_values]}]).
          page(params[:page]).
          per(Spree::Config[:admin_products_per_page])
      else
      # CHANGE }
        @collection = @search.result.
          group_by_products_id.
          includes([:master, {:variants => [:images, :option_values]}]).
          page(params[:page]).
          per(Spree::Config[:admin_products_per_page])
      # Inserted end (for if) + made params[:q][:s].include? nil-resistant
      # { CHANGE
      end
      if params[:q][:s] && params[:q][:s].include?("master_price")
      # CHANGE }
        # By applying the group in the main query we get an undefined method gsub for Arel::Nodes::Descending
        # It seems to only work when the price is actually being sorted in the query
        # To be investigated later.
        @collection = @collection.group("spree_variants.price")
      end
    else
      includes = [{:variants => [:images,  {:option_values => :option_type}]}, {:master => :images}]

      @collection = super.where(["name #{LIKE} ?", "%#{params[:q]}%"])
      @collection = @collection.includes(includes).limit(params[:limit] || 10)

      tmp = super.where(["#{Variant.table_name}.sku #{LIKE} ?", "%#{params[:q]}%"])
      tmp = tmp.includes(:variants_including_master).limit(params[:limit] || 10)
      @collection.concat(tmp)
    end
    @collection
  end

  def inorout(m)
    country = session[:zoned] && session[:zoned][:prd_country]
    m.call(country.to_i) if country
    respond_to do |format|
      format.html { redirect_to collection_url }
      format.js { render nothing: true }
    end
  end

end
