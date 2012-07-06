def git_commit(text)
  text.gsub! /'/, "’"
  text << "\n\n[caboose](https://github.com/JustinCampbell/caboose)"

  git add: "-A ."
  git commit: "-m '#{text}'"
end

def section(name)
  yield

  git_commit name
end

def template(from, to = nil)
  if from.match(/^\./) && !to
    to = from.dup
    from.gsub! /^\./, ""
  end

  to ||= from
  from = "templates/#{from}"

  remove_file to if File.exist? to
  file to, File.read(File.expand_path("../#{from}", __FILE__))
end

section "rails new #{app_name}" do
  git :init
end

section "Remove default Rails assets, clean up .gitignore" do
  remove_file "public/index.html"
  remove_file "app/assets/images/rails.png"
  remove_file "README.rdoc"

  # Remove comments from routes.rb
  gsub_file "config/routes.rb", /^\s*\#.*$/, ""
  gsub_file "config/routes.rb", /\n^\s*\n/, "\n"

  run "echo '# #{app_name}' > Readme.md"

  template ".gitignore"
end

section "RVM 1.9.3" do
  template ".rvmrc"
end

section "Setup Gemfile, initial bundle install" do
  template "Gemfile"

  run "bundle install --binstubs --without production"
end

section "SASS, Bourbon, and normalize.css" do
  remove_file "app/assets/stylesheets/application.css"
  template "app/assets/stylesheets/application.css.sass"
  template "app/assets/stylesheets/normalize.css.sass"
end

section "Slim, page_title helper, Google Analytics partial" do
  remove_file "app/views/layouts/application.html.erb"
  template "app/views/layouts/application.html.slim"
  template "app/helpers/application_helper.rb"
  template "app/views/shared/_ga.html.erb"
end

section "Setup RSpec" do
  git rm: "-rf test/"

  generate "rspec:install"
  template "spec/spec_helper.rb"

  run "guard init rspec"
end

section "Setup Fivemat RSpec formatter" do
  inject_into_file ".rspec", after: "--colour" do
    " --format Fivemat"
  end

  inject_into_file "Guardfile", after: ":version => 2" do
    ", :cli => \"--format Fivemat\""
  end
end

section "Setup Turnip" do
  inject_into_file ".rspec", after: "--colour" do
    " -r turnip/rspec"
  end

  inject_into_file "Guardfile", after: ":version => 2" do
    ", :turnip => true"
  end

  template "lib/tasks/rspec.rake"

  template "spec/acceptance/user.feature"
  gsub_file "spec/acceptance/user.feature",
    "application_name",
    app_name

  template "spec/support/steps/web_steps.rb"
end

section "Prevent Rails generator from creating unneccesary files" do
  inject_into_file "config/application.rb", after: "class Application < Rails::Application\n" do
    <<-RUBY
    config.generators do |generate|
      generate.helper = false
      generate.javascripts = false
      generate.stylesheets = false
      generate.view_specs = false
    end\n
    RUBY
  end
end

section "Configure Dalli store for production" do
  gsub_file "config/environments/production.rb",
    "# config.cache_store = :mem_cache_store",
    "config.cache_store = :dalli_store"
end

section "Configure Travis CI" do
  template ".travis.yml"
end

section "Generate PagesController with index view and root route" do
  generate "controller Pages index"

  route "root to: 'pages#index'"
end

section "Create database" do
  run "rake db:migrate"
end
