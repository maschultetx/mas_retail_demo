view: word_cloud {
  sql_table_name: retail.word_cloud ;;

  dimension: word {
    type: string
    sql: ${TABLE}.word ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
  }

  measure: val {
    type: average
    sql: ${TABLE}.val ;;
    drill_fields: []
  }
}
