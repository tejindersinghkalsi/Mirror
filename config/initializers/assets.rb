  # Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( targets.scss )
Rails.application.config.assets.precompile += %w( home.scss )
Rails.application.config.assets.precompile += %w( years.scss )
Rails.application.config.assets.precompile += %w( communities.scss )
Rails.application.config.assets.precompile += %w( stories.scss )
Rails.application.config.assets.precompile += %w( welcomes.scss )
Rails.application.config.assets.precompile += %w( docipedias.scss )
Rails.application.config.assets.precompile += %w( conversations.scss )
Rails.application.config.assets.precompile += %w( feedbacks.scss )
Rails.application.config.assets.precompile += %w( researches.scss )
Rails.application.config.assets.precompile += %w( estimates.css )
Rails.application.config.assets.precompile += %w( quizzes.css )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
