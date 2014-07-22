require "tempfile"
module Jekyll
  class APIBlueprintToJson < Converter
    def matches(ext)
      ext =~ /^\.apibp$/i
    end

    def output_ext(ext)
      ".json"
    end

    def convert(content)
      t = Tempfile.new("blueprint")
      j = Tempfile.new("blueprint-json")
      t.write content
      t.rewind
      system("snowcrash -o #{j.path} -f json #{t.path}")
      content = j.read
      t.unlink
      j.unlink
      content
    end
  end
end
