view: orders {
  sql_table_name: retail.orders ;;

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivery_date ;;
  }

  dimension: invoice_total {
    type: number
    sql: ${TABLE}.invoice_total ;;
  }

  dimension: order_cost {
    type: number
    sql: ${TABLE}.order_cost ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    primary_key:  yes
  }

  dimension: web_order {
    type: string
    sql: ${TABLE}.web_order ;;
  }


  measure: order_growth {
    type:  percent_of_previous
    sql: ${count} ;;
  }

  measure: count {
    type: count
    label: "Number of Orders"
    drill_fields: [customer.customer_id, customer.first_name, customer.last_name, store.store_id, store.name]
  }
}
