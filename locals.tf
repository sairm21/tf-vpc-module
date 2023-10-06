locals {
  private_rt_ids = [ module.subnets["web"].route_table_id, module.subnets["app"].route_table_id, module.subnets["db"].route_table_id ]

  all_rt_ids = [ module.subnets["Public"].route_table_id, module.subnets["web"].route_table_id, module.subnets["app"].route_table_id, module.subnets["db"].route_table_id ]
}