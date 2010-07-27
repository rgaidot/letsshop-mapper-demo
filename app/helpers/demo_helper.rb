module DemoHelper
  def tree_for(str, categories = nil)
    ret = "<ul>"
    categories.children.each do |node|
      ret += "<li id=#{node.id} >"
      ret += link_to "#{node.name}", navigate_path(:c => "#{str}-#{node.name}_#{node.id.split('-')[1]}") 
      ret += tree_for(str, node) { |n| yield n } unless node.children.empty?
      ret += "</li>"
    end
    ret += "</ul>"
  end
  def sort_link(text, target)
    url = request.request_uri.gsub(/\?.+/, "")
    link_to text, "#{url}?sort=#{target}"
  end
  def product_link_text(title, id)
    link_to title, product_path(:id => "#{title}_#{id}.html")
  end
  def product_link_img(img, title, id)
    link_to (image_tag img, :alt => title), product_path(:id => "#{title}_#{id}.html")
  end
end
