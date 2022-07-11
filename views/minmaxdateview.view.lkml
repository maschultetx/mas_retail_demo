view: minmaxdateview {
  sql_table_name: retail.minmaxdateview ;;

  dimension_group: maxdate {
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
    sql: ${TABLE}.maxdate ;;
  }

  dimension_group: mindate {
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
    sql: ${TABLE}.mindate ;;
  }

  measure: date_range {
    type: string
    sql: to_char(${mindate_date}) + '  to  ' + to_char(${maxdate_date}) ;;
    label: "Data Date Range"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
