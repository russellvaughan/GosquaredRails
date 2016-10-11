require_relative 'injector'
module GsRails
  class MyRailtie < Rails::Railtie
    initializer "my_initialization" do |app|
      ActionController::Base.send(:include, Injector::Filter)
    end
  end
end
