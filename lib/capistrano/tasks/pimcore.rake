include Capistrano::Pimcore::Helpers

namespace :pimcore do # rubocop:disable Metrics/BlockLength
  desc 'Reset Pimcore user password'
  task :'reset-password' do
    on release_roles :all do
      within release_path do
        raise 'Pleas set user name or id' unless ENV['user']
        raise 'Pleas set password' unless ENV['pass']

        user = ENV['user']
        pass = ENV['pass']

        execute :pimcore, "--environment=#{pimcore_environment}", 'reset-password', "-u#{user}", "-p#{pass}"
      end
    end
  end

  desc 'Generate class maps to improve performance'
  task :'classmap-generator' do
    on release_roles :all do
      within release_path do
        execute :pimcore, "--environment=#{pimcore_environment}", 'classmap-generator'
      end
    end
  end

  desc 'Optimize and warmup mysql database'
  task :'mysql-tools' do
    on release_roles :all do
      within release_path do
        execute :pimcore, "--environment=#{pimcore_environment}", 'mysql-tools'
      end
    end
  end

  desc 'Update pimcore to the desired version/build'
  task :update do
    on release_roles :all do
      within release_path do
        execute :pimcore, "--environment=#{pimcore_environment}", 'update'
      end
    end
  end

  desc 'Re-indexes the backend search of pimcore'
  task :'search-backend-reindex' do
    on release_roles :all do
      within release_path do
        execute :pimcore, "--environment=#{pimcore_environment}", 'search-backend-reindex'
      end
    end
  end

  namespace :cache do
    desc 'Flush Pimcore cache storage'
    task :clear do
      on release_roles :all do
        within release_path do
          execute :pimcore, "--environment=#{pimcore_environment}", 'cache:clear'
        end
      end
    end

    task :warming do
      desc 'Warmup Pimcore cache storage'
      on release_roles :all do
        within release_path do
          execute :pimcore, "--environment=#{pimcore_environment}", 'cache:warming'
        end
      end
    end
  end

  namespace :deployment do
    desc 'Rebuild Pimcore classes'
    task :'classes-rebuild' do
      on release_roles :all do
        within release_path do
          execute :pimcore, "--environment=#{pimcore_environment}", 'deployment:classes-rebuild --create-classes'
        end
      end
    end
  end

  namespace :thumbnails do
    desc 'Generate Pimcore image thumbnails'
    task :image do
      on release_roles :all do
        within release_path do
          execute :pimcore, "--environment=#{pimcore_environment}", 'thumbnails:image'
        end
      end
    end

    desc 'Optimize Pimcore filesize of all images'
    task :'optimize-images' do
      on release_roles :all do
        within release_path do
          execute :pimcore, "--environment=#{pimcore_environment}", 'thumbnails:optimize-images'
        end
      end
    end

    desc 'Generate Pimcore video thumbnails'
    task :video do
      on release_roles :all do
        within release_path do
          execute :pimcore, "--environment=#{pimcore_environment}", 'thumbnails:video'
        end
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  namespace :definition do
    namespace :import do
      desc 'Import Class definition from a JSON export'
      task :class do
        on release_roles :all do
          within release_path do
            execute :pimcore, "--environment=#{pimcore_environment}", 'definition:import:class'
          end
        end
      end

      desc 'Import FieldCollection definition from a JSON export'
      task :fieldcollection do
        on release_roles :all do
          within release_path do
            execute :pimcore, "--environment=#{pimcore_environment}", 'definition:import:fieldcollection'
          end
        end
      end

      desc 'Import ObjectBrick definition from a JSON export'
      task :objectbrick do
        on release_roles :all do
          within release_path do
            execute :pimcore, "--environment=#{pimcore_environment}", 'definition:import:objectbrick'
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
