require 'rake'
require 'rspec/core/rake_task'

require ::File.expand_path('../../../config/application', __FILE__)

require 'active_support/core_ext'

namespace :destroy do
  desc "destroy all models"
  task :model do
    unless ENV.has_key?('NAME')
      raise "Must specify model name"
    end

    model_path = APP_ROOT.join('app', 'models', ENV['NAME'] + '.rb')

    File.delete(model_path)

    puts "Deleting model #{ENV['NAME']}"

  end
end
