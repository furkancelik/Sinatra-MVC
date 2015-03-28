module MainHelpers
  def css_to(href,params=nil)
    _params = " "
    if params.is_a?(Hash)
      params.each do |k,v|
        _params << "#{k}=\"#{v}\" "
      end
      _params << "type=\"text/css\" " unless params.has_key?("type") || params.has_key?(:type)
      _params << "rel=\"stylesheet\" " unless params.has_key?("rel") || params.has_key?(:rel)
      _params << "media=\"all\" " unless params.has_key?("media") || params.has_key?(:media)

    else
      raise "ERROR: css_to 2. parameter Hash or should be nil!!" unless params.nil?
      _params << "type=\"text/css\" rel=\"stylesheet\" media=\"all\" "
    end
    "<link href=\"assets/#{href}\"#{_params}/>"
  end
end
