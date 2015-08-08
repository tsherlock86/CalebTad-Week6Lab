module SquawksHelper

  def resource_name
    :squawk
  end

  def resource
    @resource ||= Squawk.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:squawk]
  end

end
