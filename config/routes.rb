Rails.application.routes.draw do
  #----------------------------------------------------------------------------
  # Admin
  #----------------------------------------------------------------------------
  devise_for :admin_users,
    path: 'admin',
    controllers: {
      passwords: 'admin/devise_overrides/passwords',
      sessions:  'admin/devise_overrides/sessions'
    }

  namespace :admin do
    get '/' => 'base#index'
    get '/bootstrap.json' => 'base#bootstrap_data'
    mount_tape_subscriptions_crud
    mount_tape_posts_crud
    mount_journal_posts_crud
    mount_journal_pages_crud
    mount_journal_categories_crud
    mount_loft_assets_crud
    mount_ants_settings_crud
    mount_ants_menus_crud
    mount_ants_admin_users_crud
    mount_ants_redirects_crud
  end

  #----------------------------------------------------------------------------
  # Application
  #----------------------------------------------------------------------------
  root 'journal_posts#index'
  mount_journal_categories
  mount_journal_pages
  mount_journal_posts
  mount_ants_redirects
end
