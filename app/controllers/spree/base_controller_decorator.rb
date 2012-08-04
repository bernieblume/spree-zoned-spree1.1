Spree::BaseController.class_eval do
  before_filter :set_locale  #, :if => proc { !session[:locale] }

  protected

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = (session[:zoned] && session[:zoned][:current_language]) || I18n.default_locale
    #I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
    parsed_locale ? parsed_locale.to_sym : nil
  end

end