view: product {
  sql_table_name: retail.product ;;
  drill_fields: [product_id]
  label: "Products 📦"

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  dimension: item_retail_price {
    type: number
    sql: ${TABLE}.item_retail_price ;;
  }

  dimension: items_per_unit {
    type: number
    sql: ${TABLE}.items_per_unit ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: units_per_pallet {
    type: number
    sql: ${TABLE}.units_per_pallet ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product_id,
      lineitem.count,
      lineitem_base.count,
      lineitem_texas.count,
      product_in_subcategory.count,
      sav_lineitem_all.count
    ]
  }
}
