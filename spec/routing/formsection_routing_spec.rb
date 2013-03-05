require 'spec_helper'

describe 'Form Section routing' do

  it 'routes /formsections/foo/fields correctly' do
    {:get => '/formsections/foo/fields'}.should route_to(
      :controller => 'fields', :action => 'index', :formsection_id => 'foo' )
  end

  it 'has route to post a new field' do
    {:post => '/formsections/foo/fields' }.should route_to(:controller => 'fields', :action => 'create', :formsection_id => 'foo' )
    formsection_fields_path('some_formsection').should == '/formsections/some_formsection/fields'
  end

  it 'has route to move a field up' do
    {:post => '/formsections/foo/fields/move_up'}.should route_to(:controller => 'fields', :action=>'move_up', :formsection_id=>'foo')
    move_up_formsection_fields_path('some_formsection').should == '/formsections/some_formsection/fields/move_up'
  end

  it 'has route to move a field down' do
    {:post => '/formsections/foo/fields/move_down'}.should route_to(:controller => 'fields', :action=>'move_down', :formsection_id=>'foo')
    move_down_formsection_fields_path('some_formsection').should == '/formsections/some_formsection/fields/move_down'
  end
  
  it 'has route for form sections index page' do
    {:get => '/formsections'}.should route_to(:controller => 'form_section', :action=>'index')
    formsections_path.should == '/formsections'
  end

  it 'has route for form sections new page' do
    {:get => '/formsections/new'}.should route_to(:controller => 'form_section', :action=>'new')
    new_formsection_path.should == '/formsections/new'
  end
end