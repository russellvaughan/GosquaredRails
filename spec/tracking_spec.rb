describe GoSquared::Tracking do 
	subject(:gs) { described_class.new() }

	GoSquared::Tracking::DIMENSIONS.each do |dimension|
		it { is_expected.to respond_to(dimension) }  
	end

	it 'fetches a request from the GoSquared Trends API'do
	stub_request(:post, "https://api.gosquared.com/tracking/v1/identify?api_key=1F6DLEGZKZ2QUK48&site_token=GSN-086224-W").
	with(:body => "[ {\"person_id\":\"email:test@example.com\",\"properties\":{\"email\":\"test@example.com\"}} ]",
		:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).	
	to_return(:status => 200, :body => "", :headers => {})
	gs.identify({person_id: "email:test@example.com", 
		properties:{email: "test@example.com"}})
	gs.post
end

end