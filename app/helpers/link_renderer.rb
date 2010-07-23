class LinkRenderer < WillPaginate::LinkRenderer
  def prepare(collection, options, template)
    super
  end

  protected
    def page_link(page, text, attributes = {})
      url = @template.request.request_uri.gsub(/\page=[0-9]+/, "")
      if @template.request.request_uri.match(/\?/).nil?
        @template.link_to text, "#{url}?page=#{page}"
      else
        @template.link_to text, "#{url}&page=#{page}"
      end
    end
end