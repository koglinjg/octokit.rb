require "helper"

describe Octokit::EnterpriseAdminClient::Ldap do

  before do
    Octokit.reset!
    @admin_client = enterprise_admin_client
  end

  describe ".update_ldap_user", :vcr do
    it "updates user ldap attribute" do
      @admin_client.update_ldap_user("foobar", "CN=Foo Bar,OU=Users,DC=example,DC=com")
      expect(@admin_client.last_response.status).to eq(200)
      assert_requested :patch, github_enterprise_url("admin/ldap/users/foobar/mapping")
    end
  end # .update_ldap_user

  describe ".queue_sync_ldap_user", :vcr do
    it "queues ldap sync for user" do
      @admin_client.queue_sync_ldap_user('foobar')
      expect(@admin_client.last_response.status).to eq(201)
      assert_requested :post, github_enterprise_url("admin/ldap/users/foobar/sync")
    end
  end # .queue_sync_ldap_user

  describe ".update_ldap_team", :vcr do
    it "updates team ldap attribute" do
      @admin_client.update_ldap_team(42, "CN=FooBar,OU=Groups,DC=example,DC=com")
      expect(@admin_client.last_response.status).to eq(200)
      assert_requested :patch, github_enterprise_url("admin/ldap/teams/42/mapping")
    end
  end # .update_ldap_user

  describe ".queue_sync_ldap_user", :vcr do
    it "queues ldap sync for user" do
      @admin_client.queue_sync_ldap_team(42)
      expect(@admin_client.last_response.status).to eq(201)
      assert_requested :post, github_enterprise_url("admin/ldap/teams/42/sync")
    end
  end # .queue_sync_ldap_user
end
