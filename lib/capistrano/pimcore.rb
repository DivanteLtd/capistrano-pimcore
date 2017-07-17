require 'capistrano/composer'

SSHKit.config.command_map[:pimcore] = '/usr/bin/env php -f pimcore/cli/console.php --'

module Capistrano
  module Pimcore
    # Pimcore Helpers
    module Helpers
      def pimcore_environment
        ENV['env'] || fetch(:env)
      end
    end
  end
end

load File.expand_path('../tasks/pimcore.rake', __FILE__)

# Core tasks for deploying pimcore
load File.expand_path('../tasks/deploy.rake', __FILE__)

namespace :load do
  task :defaults do
    load 'capistrano/pimcore/defaults.rb'
  end
end
