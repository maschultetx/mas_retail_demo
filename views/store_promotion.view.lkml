view: store_promotion {
  sql_table_name: retail.store_promotion ;;
  label: "Store Promotion 🏪"

  dimension: promotion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.promotion_id, ${TABLE}.store_id) ;;
  }

  measure: count {
    type: count
    drill_fields: [promotion.promotion_id, store.store_id, store.name]
  }
}
