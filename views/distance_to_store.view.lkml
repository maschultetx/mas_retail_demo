view: distance_to_store {
  sql_table_name: retail.distance_to_store ;;

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: dts {
    type: number
    sql: ${TABLE}.dts ;;
  }
}
