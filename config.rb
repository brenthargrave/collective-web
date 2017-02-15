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
    blog.sources = "/sources/#{format}"
    blog.permalink = format
  end
end
page "posts/feed.xml", layout: false

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
  def collective_name
    "Singular Collective"
  end
  def site_domain
    "singularcollective.co"
  end
  def site_url
    "https://#{site_domain}"
  end
end

%w{ join hire }.each do |p|
  proxy "#{p}.html", "generic_page", locals: { partial_name: p }, ignore: true
end


activate :deploy do |deploy|
  deploy.deploy_method = :git
  # NOTE: sane defaults
  # deploy.remote   = # 'origin'
  # deploy.branch   = # 'gh-pages'
  # deploy.strategy = # :force_push
end

