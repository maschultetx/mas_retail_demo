view: prod_family {
  sql_table_name: retail.prod_family ;;
  label: "Product Family 📦"

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: family {
    primary_key: yes
    type: string
    sql: ${TABLE}.family ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
