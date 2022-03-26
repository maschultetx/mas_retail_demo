view: dbinfo {
  sql_table_name: retail.dbinfo ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: txt {
    type: string
    sql: ${TABLE}.txt ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
