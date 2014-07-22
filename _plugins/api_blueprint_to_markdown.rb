module Jekyll
  class ApiBlueprintToMarkdown < Jekyll::Generator
    def generate(site)
      converter = site.converters.find { |c| c.matches(".md") }
      blueprints = Array(site.pages.detect{|p| File.extname(p.name) == ".apibp"})
      blueprints.each do |b|
        name = File.basename b.name, ".apibp"
        new_page = b.clone
        new_page.name = "#{name}.md"
        new_page.instance_variable_set(:@converter, converter)
        new_page.data["layout"] = "post"
        site.pages << new_page
      end
    end
  end
end
