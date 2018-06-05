module ForemanChef
  module Concerns
    module HostActionSubject
      def self.prepended(base)
        base.send :prepend, ForemanTasks::Concerns::ActionSubject
        base.send :prepend, ForemanTasks::Concerns::ActionTriggering
      end

      def update_action
        sync_action!
        ::Actions::ForemanChef::Host::Update
      end

      def destroy_action
        sync_action!
        ::Actions::ForemanChef::Host::Destroy
      end

      def action_input_key
        "host"
      end
    end
  end
end

class ::Host::Managed::Jail < Safemode::Jail
  allow :chef_proxy, :chef_environment, :chef_private_key
end
