view: rolling_year {
  sql_table_name: retail.rolling_year ;;

  dimension: full_year {
    type: number
    sql: ${TABLE}.full_year ;;
  }

  dimension: year_pos {
    label: "Year #"
    type: number
    sql: ${TABLE}.year_pos ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

 }
