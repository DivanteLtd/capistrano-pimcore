set :env, 'development'

set :linked_files, fetch(:linked_files, []).push

set :linked_dirs, fetch(:linked_dirs, []).push(
  'vendor',
  'website/var/areas',
  'website/var/assets',
  'website/var/backup',
  'website/var/classes',
  'website/var/config',
  'website/var/log',
  'website/var/plugins',
  'website/var/recyclebin',
  'website/var/system',
  'website/var/versions',
  'website/var/webdav'
)
