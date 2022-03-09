view: word_cloud {
  sql_table_name: retail.word_cloud ;;

  dimension: word {
    type: string
    sql: ${TABLE}.word ;;
  }

  measure: val {
    type: average
    sql: ${TABLE}.val ;;
    drill_fields: []
  }
}
