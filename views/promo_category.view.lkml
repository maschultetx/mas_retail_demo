view: promo_category {
  sql_table_name: retail.promo_category ;;

  dimension: category {
    primary_key:  yes
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
