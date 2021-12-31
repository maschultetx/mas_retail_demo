view: date_dimension {
  sql_table_name: retail.date_dimension ;;

  dimension: day_num_absolute {
    type: number
    sql: ${TABLE}.day_num_absolute ;;
  }

  dimension: day_num_of_month {
    type: number
    sql: ${TABLE}.day_num_of_month ;;
  }

  dimension: day_num_of_quarter {
    type: number
    sql: ${TABLE}.day_num_of_quarter ;;
  }

  dimension: day_num_of_week {
    type: number
    sql: ${TABLE}.day_num_of_week ;;
  }

  dimension: day_num_of_year {
    type: number
    sql: ${TABLE}.day_num_of_year ;;
  }

  dimension: day_of_week_abbreviation {
    type: string
    sql: ${TABLE}.day_of_week_abbreviation ;;
  }

  dimension: day_of_week_name {
    type: string
    sql: ${TABLE}.day_of_week_name ;;
  }

  dimension: ddmonyy {
    type: string
    sql: ${TABLE}.ddmonyy ;;
  }

  dimension: ddmonyyyy {
    type: string
    sql: ${TABLE}.ddmonyyyy ;;
  }

  dimension_group: full {
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
    sql: ${TABLE}.full_date ;;
  }

  dimension: is_last_day_of_month {
    type: string
    sql: ${TABLE}.is_last_day_of_month ;;
  }

  dimension: is_last_day_of_quarter {
    type: string
    sql: ${TABLE}.is_last_day_of_quarter ;;
  }

  dimension: is_last_day_of_week {
    type: string
    sql: ${TABLE}.is_last_day_of_week ;;
  }

  dimension: is_last_day_of_year {
    type: string
    sql: ${TABLE}.is_last_day_of_year ;;
  }

  dimension: is_weekday {
    type: string
    sql: ${TABLE}.is_weekday ;;
  }

  dimension: julian_day_num_absolute {
    type: number
    sql: ${TABLE}.julian_day_num_absolute ;;
  }

  dimension: julian_day_num_of_year {
    type: number
    sql: ${TABLE}.julian_day_num_of_year ;;
  }

  dimension_group: month_begin {
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
    sql: ${TABLE}.month_begin_date ;;
  }

  dimension_group: month_end {
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
    sql: ${TABLE}.month_end_date ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_name_abbreviation {
    type: string
    sql: ${TABLE}.month_name_abbreviation ;;
  }

  dimension: month_num_of_year {
    type: number
    sql: ${TABLE}.month_num_of_year ;;
  }

  dimension: month_num_overall {
    type: number
    sql: ${TABLE}.month_num_overall ;;
  }

  dimension_group: prev_day {
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
    sql: ${TABLE}.prev_day_date ;;
  }

  dimension_group: quarter_begin {
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
    sql: ${TABLE}.quarter_begin_date ;;
  }

  dimension_group: quarter_end {
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
    sql: ${TABLE}.quarter_end_date ;;
  }

  dimension: quarter_num_of_year {
    type: number
    sql: ${TABLE}.quarter_num_of_year ;;
  }

  dimension: quarter_num_overall {
    type: number
    sql: ${TABLE}.quarter_num_overall ;;
  }

  dimension_group: same_weekday_year_ago {
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
    sql: ${TABLE}.same_weekday_year_ago_date ;;
  }

  dimension: week_num_of_month {
    type: number
    sql: ${TABLE}.week_num_of_month ;;
  }

  dimension: week_num_of_quarter {
    type: number
    sql: ${TABLE}.week_num_of_quarter ;;
  }

  dimension: week_num_of_year {
    type: number
    sql: ${TABLE}.week_num_of_year ;;
  }

  dimension: week_num_overall {
    type: number
    sql: ${TABLE}.week_num_overall ;;
  }

  dimension_group: week_of_month_begin {
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
    sql: ${TABLE}.week_of_month_begin_date ;;
  }

  dimension_group: week_of_month_end {
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
    sql: ${TABLE}.week_of_month_end_date ;;
  }

  dimension_group: week_of_quarter_begin {
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
    sql: ${TABLE}.week_of_quarter_begin_date ;;
  }

  dimension_group: week_of_quarter_end {
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
    sql: ${TABLE}.week_of_quarter_end_date ;;
  }

  dimension_group: week_of_year_begin {
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
    sql: ${TABLE}.week_of_year_begin_date ;;
  }

  dimension_group: week_of_year_end {
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
    sql: ${TABLE}.week_of_year_end_date ;;
  }

  dimension_group: year_begin {
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
    sql: ${TABLE}.year_begin_date ;;
  }

  dimension_group: year_end {
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
    sql: ${TABLE}.year_end_date ;;
  }

  dimension: year_num {
    type: number
    sql: ${TABLE}.year_num ;;
  }

  dimension: yyyymm {
    type: number
    sql: ${TABLE}.yyyymm ;;
  }

  dimension: yyyymmdd {
    type: number
    sql: ${TABLE}.yyyymmdd ;;
  }

  measure: count {
    type: count
    drill_fields: [day_of_week_name, month_name]
  }
}
