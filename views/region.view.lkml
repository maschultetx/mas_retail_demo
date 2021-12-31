view: region {
  sql_table_name: retail.region ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: region {
    type: string
    primary_key:  yes
    sql: ${TABLE}.region ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
