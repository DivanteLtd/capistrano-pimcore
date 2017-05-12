include Capistrano::Magento2::Helpers

namespace :deploy do
  task :updated do
    invoke 'pimcore:deployment:classes-rebuild'
  end
end
