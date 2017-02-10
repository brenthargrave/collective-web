Time.zone = "Eastern Time (US & Canada)"

configure :development do
  set :debug_assets, true
  activate :livereload
end

set :markdown_engine, :redcarpet
set :markdown,
  footnotes: true,
  fenced_code_blocks: true

activate :blog do |blog|
  "posts".tap do |blog_scope|
    blog.prefix = blog_scope
    blog.layout = blog_scope
  end
  # NOTE: engine bakes date into permalink by default; prefer title only
  ':title'.tap do |format|
    blog.sources = format
    blog.permalink = format
  end
end

activate :directory_indexes
set :relative_links, true

activate :sprockets
activate :inliner

helpers do
  def without_year date
    date.strftime('%b %e')
  end
  def with_year date
    date.strftime('%b %e %Y')
  end
  def dynamic_year date
    if Time.now.year == date.year
      without_year date
    else
      with_year date
    end
  end
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # NOTE: sane defaults
  # deploy.remote   = # 'origin'
  # deploy.branch   = # 'gh-pages'
  # deploy.strategy = # :force_push
end

