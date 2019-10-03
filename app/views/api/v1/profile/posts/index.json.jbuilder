# frozen_string_literal: true

json.partial! 'api/v1/posts/list', posts: @posts, liked_posts: @liked_posts
