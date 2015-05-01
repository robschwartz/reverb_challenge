require_realtive 'spec_helper'

p "Hey! Im in a test!"
before :each do
	@test_person = Person.new(first_name: "Rob", last_name: "Schwartz", gender: "Male", favorite_color: "Orange", date_of_birth: "09/25/1986")
end

describe "#to_s" do
	it "return the test user info" do
		expect(@test_person.to_s).to eq("Rob Schwartz Male Orange 09/25/1986")
	end

	it 'testing the testing' do
		expect(1).to eq(1)
	end

end
