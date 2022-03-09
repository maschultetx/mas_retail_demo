view: affinity {
  derived_table: {
    sql: --  how many different customers/day combos they appear on.   How many individual sales.
    SELECT
      p1.product AS product1,
      p1.category AS category1,
      p1.family AS family1,
      p1.item_retail_price AS item_retail_price1,
      p1.subcategory AS subcategory1,
      how_many1,

      p2.product AS product2,
      p2.category AS category2,
      p2.family AS family2,
      p2.item_retail_price AS item_retail_price2,
      p2.subcategory AS subcategory2,
      how_many2


    FROM (

      SELECT
        product_id_1, product_id_2, SUM(quantity1) AS how_many1, SUM(quantity2) AS how_many2
      FROM (

        -- find customer order baskets
        SELECT t1.product_id AS product_id_1, t2.product_id AS product_id_2, t1.order_date, t1.customer_id, t1.quantity as quantity1, t2.quantity as quantity2
        FROM  (
          SELECT distinct product_id, order_date, customer_id, quantity FROM lineitem
        ) AS t1
        JOIN  (
          SELECT distinct product_id, order_date, customer_id, quantity FROM lineitem
        ) AS t2
        ON (
          t1.order_date = t2.order_date AND
          t1.customer_id = t2.customer_id AND
          t1.product_id != t2.product_id
          --t1.product_id < t2.product_id  -- not sure why this is here
        )

      ) t1
      GROUP by t1.product_id_1, t1.product_id_2


    ) t3
    -- go back and get the details
    JOIN product p1 ON t3.product_id_1 = p1.product_id
    JOIN product p2 ON t3.product_id_2 = p2.product_id

    ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product1 {
    type: string
    sql: ${TABLE}.product1 ;;
  }

  dimension: product2 {
    type: string
    sql: ${TABLE}.product2 ;;
  }

  dimension: category1 {
    type: string
    sql: ${TABLE}.category1;;
  }

  dimension: category2 {
    type: string
    sql: ${TABLE}.category2;;
  }

  dimension: family1 {
    type: string
    sql: ${TABLE}.family1;;
  }

  dimension: family2 {
    type: string
    sql: ${TABLE}.family2;;
  }

  dimension: item_retail_price1 {
    type: string
    sql: ${TABLE}.item_retail_price1;;
  }

  dimension: item_retail_price2 {
    type: string
    sql: ${TABLE}.item_retail_price2;;
  }

  dimension: subcategory1 {
    type: string
    sql: ${TABLE}.subcategory1;;
  }

  dimension: subcategory2 {
    type: string
    sql: ${TABLE}.subcategory2;;
  }

  measure: total_sales1 {
    type: sum
    sql: ${TABLE}.how_many1 ;;
    drill_fields: [detail*]
  }

  measure: total_sales2 {
    type: sum
    sql: ${TABLE}.how_many2 ;;
    drill_fields: [detail*]
  }

  measure: total_sales1_in_thousands {
    type: sum
    sql: ${TABLE}.how_many1/1000 ;;
    drill_fields: [detail*]
    link: {
      label: "Cross-Purchase Detail For This Product"
      url: "https://actianavalanchepartner.cloud.looker.com/dashboards/67?Product={{ affinity.product1._value | encode_uri }}"
      icon_url: "/favicon.ico"
    }
  }

  measure: total_sales2_in_thousands {
    type: sum
    sql: ${TABLE}.how_many2/1000 ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [product1, product2]
  }
}
