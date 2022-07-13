# view to support the dual tiles in the customer selector
view: customerorderslineitem {
  derived_table: {


    sql:

      select c.customer_id, c.street, c.city, c.first_name, c.last_name, c.zipcode, c.state, c.gender,
      sum(l.unit_price) as total_sales, count(distinct o.order_id) as order_count, cast((max(o.order_date)) as timestamp) as order_date
      from customer_texas_yesterdayview c
      join orders_texas_yesterdayview o on c.customer_id = o.customer_id
      join lineitem_texas2_yesterdayview l on o.order_id = l.order_id
      where c.city != '0' and c.city != '.'
      group by 1,2,3,4,5,6,7,8
    ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.order_count ;;
  }


  dimension_group: order {
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
    sql: ${TABLE}.order_date ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.total_sales ;;
    value_format: "$#,##0"
  }


  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Address Info"
    case_sensitive: no
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

  dimension: zipcode {
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

  measure: count {
    type: count
  }


}
