module Jekyll
  class ApiBlueprintToMarkdown < Jekyll::Generator

    def generate(site)
      # converter = site.converters.find { |c| c.matches(".md") }
      # blueprints = Array(site.pages.keep_if{|p| File.extname(p.name) == ".apibp"})
      # new_pages = Array.new
      # blueprints.each do |b|
      #   new_page = Page.new(b.site, b.instance_variable_get(:@base), b.dir, b.name)
      #   new_page.instance_variable_set(:@converter, converter)
      #   new_page.data["layout"] = "post"
      #   new_pages.push new_page
      # end
      # site.pages += new_pages
      puts site.categories.inspect
   end
  end
end
