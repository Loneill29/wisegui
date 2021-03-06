require 'rails_helper'

RSpec.describe User, type: :model do

describe "after create" do
    it "sends a confirmation email" do
        user = FactoryGirl.build :user
        expect { user.save }.to change(
            Devise.mailer.deliveries, :count
        ).by(1)
   end

describe "attributes" do
    it "responds to role" do
    expect(user).to respond_to(:role)

    it "responds to admin?" do
    expect(user).to respond_to(:admin?)
    end

    it "responds to standard?" do
    expect(user).to respond_to(:standard?)
    end
 end

describe "roles" do

    it "is standard by default" do
    expect(user.role).to eql("standard")
    end

 context "member user" do
    it "returns true for #member?" do
    expect(user.member?).to be_truthy
    end

    it "returns false for #admin?" do
    expect(user.admin?).to be_falsey
    end
  end

 context "admin user" do
   before do
     user.admin!
   end

    it "returns false for #member?" do
    expect(user.member?).to be_falsey
    end

    it "returns true for #admin?" do
    expect(user.admin?).to be_truthy
    end
  end
 end
end
