view: product_in_subcategory {
  sql_table_name: retail.product_in_subcategory ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  dimension: in_cat {
    type: number
    sql: ${TABLE}.in_cat ;;
  }

  dimension: item_retail_price {
    type: number
    sql: ${TABLE}.item_retail_price ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  measure: count {
    type: count
    drill_fields: [product.product_id]
  }
}
