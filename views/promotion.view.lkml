view: promotion {
  sql_table_name: retail.promotion ;;
  drill_fields: [promotion_id]

  dimension: promotion_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.promotion_id ;;
  }

  dimension_group: begin {
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
    sql: ${TABLE}.begin_date ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: promotion {
    type: string
    sql: ${TABLE}.promotion ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      promotion_id,
      lineitem.count,
      store_promotion.count
    ]
  }
}
