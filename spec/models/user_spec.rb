describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end
  
  describe "associations" do
    it {should have_many(:assets)}
  end
  
  describe "validations" do
    it {should validate_prescence_of :email }
    it {should validate_uniqueness_of :email }
    it {should validate_prescence_of :password }
    it {should have_secure_password :password }
  end

end
