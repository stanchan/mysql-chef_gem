class Chef
  class Provider
    class MysqlChefGem < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :install do
        converge_by 'install mysql chef_gem and dependencies' do
          recipe_eval do
            run_context.include_recipe 'build-essential::default'
          end

          recipe_eval do
            run_context.include_recipe 'mysql::client'
          end

          chef_gem 'mysql' do
            if !new_resource.source.nil?
              source new_resource.source
            end
            action :install
          end
        end
      end

      action :remove do
        chef_gem 'mysql' do
          action :remove
        end
      end
    end
  end
end
