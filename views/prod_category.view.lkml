view: prod_category {
  sql_table_name: retail.prod_category ;;
  label: "Product Category 📦"

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
