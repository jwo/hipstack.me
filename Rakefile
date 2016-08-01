require 'bundler/setup'
Bundler.require

sprockets = Sprockets::Environment.new
Opal.paths.each { |path| sprockets.append_path path }
sprockets.append_path 'src'
sprockets.append_path 'styles'

desc 'Build Ruby assets'
task build_ruby: 'dist/app.js'

desc 'Build stylesheets'
task build_css: 'dist/style.css'

desc 'Build images'
task build_images: 'dist/images/library.jpg'

desc 'Build all assets'
task build: [:build_ruby, :build_css, :build_images]

file 'dist/app.js' => 'src/main.rb' do
  File.write 'dist/app.js', sprockets['main.rb'].to_s
end

rule 'dist/style.css' => Rake::FileList['styles/*.scss'] do
  File.write 'dist/style.css', sprockets['style.css'].to_s
end

rule 'dist/images/library.jpg' => 'images/library.jpg' do
  FileUtils.cp 'images/library.jpg', 'dist/images'
end
