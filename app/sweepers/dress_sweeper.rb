class DressSweeper <ActionController::Caching::Sweeper
  observe :Dress

  def after_create(dress)
    expire_cache_for(dress)
  end

  def after_update(dress)
   expire_cache_for(dress)
  end

  # If our sweeper detects that a dress was deleted call this
  def after_destroy(dress)
    expire_cache_for(dress)
  end

  private
  def expire_cache_for(dress)
    # Expire the index page now that we added a new dress
    expire_page(:controller => 'dresses', :action => 'index')

  # Expire a fragmen
    # expire_fragment('all_available_products')
  end
end
