module ManageIQ::Providers::Nuage::Inventory::Persister::Definitions::NetworkCollections
  extend ActiveSupport::Concern

  def initialize_network_inventory_collections
    %i(cloud_tenants
       cloud_subnets
       security_groups
       cloud_networks
       floating_ips
       network_routers).each do |name|

      add_collection(network, name) do |builder|
        builder.add_properties(:parent => manager) # including targeted
      end
    end
  end
end
