view: lineitem_base {
  sql_table_name: retail.lineitem ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.order_id, ${TABLE}.linenumber) ;;
  }

  dimension: discount_percentage {
    type: number
    sql: ${TABLE}.discount_percentage ;;
  }

  dimension: line_cost {
    type: number
    sql: ${TABLE}.line_cost ;;
  }

  dimension: line_margin {
    type: number
    sql: ${TABLE}.line_margin ;;
  }

  dimension: line_price {
    type: number
    sql: ${TABLE}.line_price ;;
  }

  dimension: linenumber {
    type: number
    sql: ${TABLE}.linenumber ;;
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
    sql: ${TABLE}.store_id ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_family {
    type: string
    sql: ${TABLE}.product_family ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: promotion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: return_flag {
    type: string
    sql: ${TABLE}.return_flag ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: unit_cost {
    type: number
    sql: ${TABLE}.unit_cost ;;
  }

  dimension: gross_margin {
    type: number
    sql: ${unit_price} - ${unit_cost} ;;
  }

  measure: profit_percent {
    type: number
    sql: ${total_gross_margin} * 100 / ${total_sales} ;;
  }

  measure: count {
    type: count
    drill_fields: [product.product_id, promotion.promotion_id, customer.customer_id, customer.first_name, customer.last_name]
  }

  measure: return_count {
    type: count
    filters: [return_flag: "-N"]
  }

  measure: return_percent {
    type: number
    sql: ${return_count} * 100.00 / ${count} * 1.0 ;;
  }

  measure: distinct_orders {
    type:  count_distinct
    sql: ${order_id} ;;
  }

##### MEASURES #####

  measure: total_sales {
    type: sum
    sql: ${unit_price} ;;
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

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
    value_format_name: unit_k
    drill_fields: [transactions.drill_detail*]
  }

  measure: average_basket_size {
    type: number
    #sql: ${total_sales}/NULLIF(${orders.number_of_transactions},0) ;;
    sql: ${total_sales}/NULLIF(${distinct_orders},0) ;;
    value_format_name: currency
    drill_fields: [transactions.drill_detail*]
  }

  measure: average_item_price {
    type: number
    sql: ${total_sales}/NULLIF(${total_quantity},0) ;;
    value_format_name: currency
    drill_fields: [transactions.drill_detail*]
  }

  measure: sales_growth {
    type:  percent_of_previous
    sql: ${total_sales} ;;
  }

  measure: basket_growth {
    type:  percent_of_previous
    sql: ${average_basket_size} ;;
  }

}
