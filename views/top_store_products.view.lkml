view: top_store_products {
  derived_table: {


    sql:
      select store.name as store_name, top_store_products.product_count, product as product_name, top_store_products.product_id, top_store_products.store_id
      --row_number() over (partition by top_store_products.store_id order by product_count) as rownum
      from top_store_products
      join store on top_store_products.store_id = store.store_id
      join product on top_store_products.product_id = product.product_id
    ;;
  }

  dimension: store_name {
    type: string
    sql:  ${TABLE}.store_name ;;
  }

  dimension: product_name {
    type: string
    sql:  ${TABLE}.product_name ;;
  }

  dimension: store_id {
    type: number
    sql:  ${TABLE}.store_id ;;
  }

  dimension: product_id {
    type: number
    sql:  ${TABLE}.product_id ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.store_id, ${TABLE}.product_id) ;;
  }

  measure: avg_store_product_quantity{
    label: "Average Quantity Per Store/Product"
    type: average
    value_format: "#,##0"
    sql: ${TABLE}.product_count ;;
  }


}
