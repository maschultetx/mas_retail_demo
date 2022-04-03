view: store_aggregates {
  derived_table: {


  sql:

      select per_store_info.store_id, per_store_info.order_count as order_count, cast((per_store_info.invoice_store_total/per_store_info.order_count) as integer) as average_invoice_per_store, per_store_info.order_year
      from per_store_info
    ;;
  }

  dimension: store_id {
    type: number
    primary_key: yes
    sql:  ${TABLE}.store_id ;;
  }

  dimension: order_year {
    type: number
    sql:  ${TABLE}.store_id ;;
  }

  measure: avg_of_avg {
    label: "Average Sales Per Store"
    type: average
    value_format: "$#,##0"
    sql: ${TABLE}.average_invoice_per_store ;;
  }

  measure: avg_of_count {
    label: "Average Orders Per Store"
    type:  average
    value_format: "#,##0"
    sql: ${TABLE}.order_count ;;
  }
}
