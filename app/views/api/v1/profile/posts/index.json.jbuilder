# frozen_string_literal: true

json.partial! 'api/posts/list', posts: @posts, liked_posts: @liked_posts
