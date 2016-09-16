module Octokit
  class EnterpriseAdminClient

    # Methods for the Enterprise LDAP API
    #
    # @see https://developer.github.com/v3/enterprise/ldap/
    module Ldap
      # Update LDAP mapping for a user.
      #
      # @param username [String] The user's username.
      # @param ldap_dn [String] The user's new LDAP distinguishedName.
      # @see https://developer.github.com/v3/enterprise/ldap/#update-ldap-mapping-for-a-user
      # @example
      #   @admin_client.update_ldap_user('foobar', 'CN=Foo Bar,OU=Users,DC=example,DC=com')
      def update_ldap_user(username, ldap_dn, options = {})
        options[:ldap_dn] = ldap_dn
        patch "admin/ldap/users/#{username}/mapping", options
      end

      # Queue Syncing LDAP mapping for a user.
      #
      # @param username [String] Username of the user to queue LDAP sync for.
      # @return [Boolean] True if queuing LDAP sync was successful, false otherwise.
      # @see https://developer.github.com/v3/enterprise/ldap/#sync-ldap-mapping-for-a-user
      # @example
      #   @admin_client.queue_sync_ldap_user('holman')
      def queue_sync_ldap_user(username, options = {})
        boolean_from_response :post, "admin/ldap/users/#{username}/sync", options
      end

      # Update LDAP mapping for a team.
      #
      # @param team_id [Integer] The team's ID.
      # @param ldap_dn [String] The team's new LDAP distinguishedName.
      # @see https://developer.github.com/v3/enterprise/ldap/#update-ldap-mapping-for-a-team
      # @example
      #   @admin_client.update_ldap_team(42, 'CN=FooBar,OU=Groups,DC=example,DC=com')
      def update_ldap_team(team_id, ldap_dn, options = {})
        options[:ldap_dn] = ldap_dn
        patch "admin/ldap/teams/#{team_id}/mapping", options
      end

      # Queue Syncing LDAP mapping for a team.
      #
      # @param team_id [Integer] ID of the team to queue LDAP sync for.
      # @return [Boolean] True if queuing LDAP sync was successful, false otherwise.
      # @see https://developer.github.com/v3/enterprise/ldap/#sync-ldap-mapping-for-a-team
      # @example
      #   @admin_client.queue_sync_ldap_team(42)
      def queue_sync_ldap_team(team_id, options = {})
        boolean_from_response :post, "admin/ldap/teams/#{team_id}/sync", options
      end
    end
  end
end
