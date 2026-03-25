# frozen_string_literal: true

Jekyll::Hooks.register :site, :post_write do |site|
  # This command runs Pagefind on the _site folder after Jekyll finishes writing
  system("npx pagefind --site _site")
end
