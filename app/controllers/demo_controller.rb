class DemoController < ApplicationController
  def index
    @feed_select = LSHOP.find({:nhits => 12, 
      :f => "refine:'gender:bebe',discount:[50.0 TO 99.0]",
      :sort => "created_at desc"})
    @feed_new = LSHOP.find({:nhits => 12, 
      :f => "refine:'gender:bebe'",
      :order => "created_at", :sort => "created_at desc"})
  end
  def search
    p = params[:page].to_i <= 0 ? 1 : params[:page].to_i
    s = params[:page].to_i <= 0 ? 0 : params[:page].to_i * ITEMPSPERPAGE
    q = params[:q].nil? ? nil : params[:q]
    f = params[:f].nil? ? nil : "refine:'#{params[:f].split('/')[0]}:#{params[:f].split('/')[1]}'"
    c = params[:c].nil? ? nil : "1-#{params[:c].split('_').last}-1"
    sort = params[:sort].nil? ? nil : params[:sort]
    @feed = LSHOP.find({:q => q, :start => s, :nhits => ITEMPSPERPAGE, 
      :f => "refine:'gender:bebe',#{f}", :c => c, :sort => sort})
    @categories = @feed.get_facets_by("category")
    @brands = @feed.get_facets_by("brand")
    @colors = @feed.get_facets_by("color")
    set_metas_html("Results", "Results")
    render :layout => "search"
  end
  def product
    @product = LSHOP.find({:products => "#{params[:id].split("_").last}"}).entries.first
    @tags = @product.get_facets_by("category")
    set_metas_html("#{params[:id].split("_").first}", "#{params[:id].split("_").first}")
    render :layout => "product"
  end
end
