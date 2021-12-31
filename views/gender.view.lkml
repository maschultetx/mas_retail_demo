view: gender {
  sql_table_name: retail.gender ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: gender {
    primary_key:  yes
    type: string
    sql: ${TABLE}.gender ;;
  }

}
