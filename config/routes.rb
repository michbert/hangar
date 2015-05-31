Rails.application.routes.draw do
  #TODO: make configurable
  
  constraints Hangar::RouteConstraint.new do
    FactoryGirl.factories.map(&:name).map(&:to_s).map(&:pluralize).map(&:to_sym).each do |factory|
      scope(:path => '/api') do
        resources factory, only: [:new, :create], controller: 'hangar/resources'
      end
    end
    delete '/api/', to: 'hangar/records#delete'
  end

end
