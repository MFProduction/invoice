describe 'Routing',:type => :routing  do
  it do
    should route(:get, '/organizations').
      to(controller: :organizations, action: :index)
  end

end
