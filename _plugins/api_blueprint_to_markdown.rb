module Jekyll
  # class APIBlueprintToMarkdown < Generator
  #   class JSONPost < Post
  #     def generate_excerpt?
  #       false
  #     end
  #   end

  #   def generate(site)
  #     converter = APIBlueprintToJson.new
  #     blueprints = Array(site.posts.keep_if{|p| File.extname(p.name) == ".apibp"})
  #     new_pages = Array.new
  #     blueprints.each do |b|
  #       puts "---------"
  #       puts "site: #{b.site}"
  #       puts "base: #{b.instance_variable_get(:@base)}"
  #       puts "dir: #{b.dir}"
  #       puts "name: #{File.basename(b.name)}"

  #       new_name = File.basename(b.name, ".apibp")
  #       new_page = JSONPost.new(b.site, b.instance_variable_get(:@base), b.dir, "#{new_name}.md")
  #       new_page.instance_variable_set(:@converter, converter)
  #       new_page.data["layout"] = "post"
  #       new_pages.push new_page
  #     end
  #     site.posts += new_pages
  #     puts site.posts.map(&:converter)
  #   end
  # end
end
