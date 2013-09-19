ActiveAdmin.register Blog::Post do
  menu parent: "Blog", label: "Posts"

  index do
    column :title
    column :author_name
    column :visible
    column :published_at
    default_actions
  end

  filter :title
  filter :abstract
  filter :body

  form do |f|
    f.inputs "Post details" do
      f.input :category
      f.input :author
      f.input :title, as: :title
      f.input :abstract, as: :wysihtml5, commands: :barebone, height: :small, blocks: :barebone
      f.input :body, as: :wysihtml5, height: :huge
      f.input :comma_separated_tags, as: :terms, terms: Blog::Tag.all.map(&:name)
      f.input :related_posts, as: :chosen, create_option: false
      f.input :visible
      f.input :published_at, as: :datepicker
    end

    f.inputs "Featured image" do
      f.has_image :featured_image
    end

    f.inputs "SEO" do
      f.input :seo_slug
      f.input :seo_title
      f.input :seo_description
    end

    f.actions
  end
end

