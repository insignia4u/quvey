require 'spec_helper'

module UserSpecHelper
  def oauth_hash
    auth = Hashie::Mash.new
    auth.provider    = "facebook"
    auth.uid         = "123123123"
    auth.info        = { name: "John Doe" }
    auth.credentials = { token: "0909090909", expires_at: 1346878866 }

    auth
  end
end

describe User do
  include UserSpecHelper

  before(:each) do
    @auth = oauth_hash
  end

  describe "#from_omniauth" do
    context "for unexisting users" do
      it "creates a new user with the information obtained from oauth" do
        User.count.should == 0
        expect{ User.from_omniauth(@auth) }.to change{ User.count }.by(1)
      end

      context "data population" do
        before(:each) do
          @user = User.from_omniauth(@auth)
        end

        it "populates provider" do
          expect(@user.provider).to eql @auth.provider
        end

        it "populates uid" do
          expect(@user.uid).to eql @auth.uid
        end

        it "populates name" do
          expect(@user.name).to eql @auth.info.name
        end

        it "populates oauth_token" do
          expect(@user.oauth_token).to eql @auth.credentials.token
        end

        it "populates oauth_expires_at" do
          expect(@user.oauth_expires_at).to eql Time.at(@auth.credentials.expires_at)
        end
      end
    end

    context "for existing users" do
      before(:each) do
        @user = User.from_omniauth(@auth)
      end

      it "doesn't create the same user twice" do
        User.count.should == 1
        expect{ User.from_omniauth(@auth) }.not_to change{ User.count}.by(1)
      end
    end
  end
end
