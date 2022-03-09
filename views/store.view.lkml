view: store {
  sql_table_name: retail.store ;;
  label: "Stores 🏪"
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension: address {
    group_label: "Address Info"
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    group_label: "Address Info"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Address Info"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_code {
    group_label: "Address Info"
    type: string
    sql: ${TABLE}.country_code ;;
  }

  # field to put US store first
  dimension: sort_assist {
    type: number
    sql: if(${TABLE}.country_code='US',0,1) ;;
  }

  dimension_group: date_opened {
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
    sql: ${TABLE}.date_opened ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    label: "Store Name"
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Store Deep-Dive"
      url: "https://actianavalanchepartner.cloud.looker.com/dashboards/64?Store%20Name=%22{{ store.name._value | encode_uri}}%22&Store%20Comparison%20Filter=%22{{store.name._value | encode_uri}}%22"
      icon_url: "/favicon.ico"
    }
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: state {
    group_label: "Address Info"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: store_manager {
    type: string
    sql: ${TABLE}.store_manager ;;
  }

  dimension: store_manager_email {
    type: string
    sql: ${TABLE}.store_manager_email ;;
  }

  dimension: store_manager_mobile {
    type: string
    sql: ${TABLE}.store_manager_mobile ;;
  }

  dimension: zipcode {
    group_label: "Address Info"
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  # can use to eliminate sorting in dashboards because once in, sorting cannot be removed.
  dimension: no_orderby {
    type: number
    sql: null ;;
  }

  filter: store_comparison_filter {
    type: string
    #group_label: "Store Comparison"
    suggest_dimension: store.name
  }

  dimension: store_comparison {
    type: string
    #group_label: "Store Comparison"
    sql: CASE
      WHEN {% condition store_comparison_filter %} ${name} {% endcondition %} THEN ${name}
      ELSE 'Other Stores'
    END;;
    #sql: CASE
    #  WHEN {{ _filters['store.name'] }} THEN ${name}
    #  ELSE 'Other Stores'
    #END;;
    #sql: IF({% condition store_comparison_filter %} ${name} {% endcondition %}, ${name}, "Other Stores" );;

  }


##### DERIVED DIMENSIONS #####

  dimension: location {
    type: location
    group_label: "Store Info"
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      store_id,
      name,
      orders.count,
      store_promotion.count
    ]
  }
}
