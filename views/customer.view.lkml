view: customer {
  sql_table_name: retail.customer ;;
  drill_fields: [customer_id]
  label: "Customer 👥"

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  # just like customer_id but get rid of underscore to work around url problem which I can't remember how to fix
  dimension: custid {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
    group_label: "Address Info"
    case_sensitive: no
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Address Info"
    case_sensitive: no
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
    group_label: "Address Info"
  }

  dimension_group: date_of_birth {
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
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    case_sensitive: no
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    case_sensitive: no
  }

  dimension_group: last_order {
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
    sql: ${TABLE}.last_order ;;
  }


  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    hidden:  yes
  }

  dimension: loyalty_card_number {
    type: number
    sql: ${TABLE}.loyalty_card_number ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension_group: member_since {
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
    sql: ${TABLE}.member_since ;;
  }

  dimension: middle_initial {
    type: string
    sql: ${TABLE}.middle_initial ;;
    case_sensitive: no
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    group_label: "Address Info"
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
    group_label: "Address Info"
    case_sensitive: no
  }

  dimension: zipcode_drill {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
    group_label: "Address Info"
    label: "Zip Code"
    # don't need no longer have separate dashboard, using crossfiltering.
    #link: {
    #  url: "/dashboards/61?Zipcode={{ customer.zipcode_drill._value | encode_uri}}"
    #  label: "See Customers in This Zipcode"
    #}
  }


  ##### CUSTOM DIMENSIONS #####

  dimension: location {
    type: location
    group_label: "Address Info"
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
    link: {
      #url: "/dashboards/59?Address=%22{{ customers.address._value | encode_uri}}"
      #url: "https://actianavalanchepartner.cloud.looker.com/dashboards/63?Address=%22{{ customer.address._value | encode_uri}}%22&Location={{customer.location._value | encode_uri}}"
      url: "https://actianavalanchepartner.cloud.looker.com/dashboards/63?Address=%22{{ customer.address._value | encode_uri}}%22&Location={{customer.location._value | encode_uri}}&Custid={{customer.custid._value | encode_uri}}"
      #url: "https://actianavalanchepartner.cloud.looker.com/dashboards/63?Address=%22{{ customer.address._value | encode_uri}}%22"
      label: "Customer Detail"
      icon_url: "https://img.icons8.com/cotton/2x/worldwide-location.png"
    }
  }

  dimension: address_street_view {
    type: string
    group_label: "Address Info"
    sql: ${address} ;;
    html: <img src="https://maps.googleapis.com/maps/api/streetview?size=700x400&location={{value | encode_uri}}&fov=120&key=@{GOOGLE_MAPS_API_KEY}" ;;
    case_sensitive: no
  }

  dimension: age {
    type: number
    sql:  timestampdiff(days,${date_of_birth_date},current_date)/365;;
  }

  # can use to eliminate sorting in dashboards because once in, sorting cannot be removed.
  dimension: no_orderby {
    type: number
    sql: null ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct_per_address{
    type:  count_distinct
    sql: ${customer.address};;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      customer_id,
      first_name,
      last_name,
      cust_orig.count,
      customer_base.count,
      customer_texas.count,
      lineitem.count,
      lineitem_base.count,
      lineitem_texas.count,
      orders.count,
      orders_base.count,
      orders_texas.count
    ]
  }

  filter: customer_select {
    suggest_dimension: customer_id
  }

  dimension: customer_comparitor {
    type: string
    sql:

    CASE
      WHEN {% condition customer_select %} ${customer.customer_id} {% endcondition %}
      THEN ${customer.customer_id}
      ELSE 'Rest of Population'
    END ;;
    }

}
