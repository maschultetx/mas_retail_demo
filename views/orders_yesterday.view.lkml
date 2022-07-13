# this database view moves data forward into the future

view: orders_yesterday {
  sql_table_name: retail.orders_texas_yesterdayview ;;

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  # just like customer_id but get rid of underscore to work around url problem which I can't remember how to fix
  dimension: custid {
    type: number
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

  dimension_group: otimestamp {
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
    sql: ${TABLE}.otimestamp ;;
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

  dimension: gross_margin {
    type: number
    sql: ${invoice_total} - ${order_cost} ;;
  }

  measure: profit_percent {
    type: number
    sql: ${total_gross_margin} * 100 / ${total_sales} ;;
  }

  measure: total_sales {
    type: sum
    sql: ${invoice_total} ;;
    #value_format_name: currency_k
    #value_format_name:  currency
    value_format: "$#,##0"
    drill_fields: [transactions.drill_detail*]
  }

  measure: total_gross_margin {
    type: sum
    sql: ${gross_margin} ;;
    value_format_name: currency_k
    drill_fields: [transactions.drill_detail*]
  }

  measure: order_number_growth {
    type:  percent_of_previous
    sql: ${count} ;;
  }

  measure: count {
    type: count
    label: "Number of Orders"
    drill_fields: [customer.customer_id, customer.first_name, customer.last_name, store.store_id, store.name]
  }

  measure: average_basket_size {
    type: number
    #sql: ${total_sales}/NULLIF(${orders.number_of_transactions},0) ;;
    sql: ${total_sales}/NULLIF(${count},0) ;;
    #value_format_name: currency
    value_format: "$#,##0"
    drill_fields: [transactions.drill_detail*]
  }


  measure: sales_growth {
    type:  percent_of_previous
    sql: ${total_sales} ;;
    value_format: "#,##0%"
  }

  measure: basket_growth {
    type:  percent_of_previous
    sql: ${average_basket_size} ;;
    value_format: "#,##0%"
  }

}
