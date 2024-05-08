ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span t('dashboard.welcome')
        small link_to(t('dashboard.call_to_action'), 'https://medium.com/jungletronics/rails-active-admin-3-2-0-85d04f40e066')
      end
    end
  end
end
