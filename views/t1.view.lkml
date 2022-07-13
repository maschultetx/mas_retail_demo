view: t1 {
  sql_table_name: retail.t1 ;;

  dimension: c1 {
    type: number
    sql: ${TABLE}.c1 ;;
  }

  dimension_group: c2 {
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
    sql: ${TABLE}.c2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
