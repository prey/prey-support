desc "Start the jekyll server"
task default: [:server]

desc "Start the jekyll server"
task :server do
  sh "jekyll serve"
end

desc "Set up the environment"
task :setup do
  system("cp ./.ruby-gemset.example ./.ruby-gemset")
  system("cp ./.ruby-version.example ./.ruby-version")
  system("cd $(pwd)")
end

task :install_rvm do
  system("\\curl -sSL https://get.rvm.io | bash -s stable")
end

task :install_gems do
  system("gem install bundler")
  system("bundle")
end


desc "Build out the JSON versions of blueprint docs"
task :build_json do
  require 'find'

  exec = "snowcrash"
  format = "json"
  options = ["-f", "#{format}"]
  blueprints = Dir["_posts/**/*.apibp"]
  site_dir = "_site"
  blueprints.each do |bp|
    name = File.basename(bp, ".apibp").gsub!(/\d{4}-\d{2}-\d{2}-/, '')
    paths = Array.new
    Find.find(site_dir) do |path|
      if File.basename(path) == name
        paths << path
        Find.prune
      end
    end

    paths.each do |p|
      `#{exec} #{options.join(' ')} -o #{p}.#{format} #{bp}`
    end
  end

end
