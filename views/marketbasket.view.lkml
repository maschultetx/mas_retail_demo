view: marketbasket {
  derived_table: {
    sql: select
    store_id,
    p1.product as product1,
    p1.family as family1,
    p2.product as product2,
    p2.family as family2,
    quantity2
from
  (
    select
      l1.store_id,
      l1.product_id as product_id1,
      l2.product_id as product_id2,
      sum(l2.quantity) as quantity2
    from
      retail.lineitem l1,
      retail.lineitem l2
    where
      l1.order_id = l2.order_id
      and l1.product_id <> l2.product_id
    group by
      1, 2, 3
  ) mb
  join product p1 on mb.product_id1 = p1.product_id
  join product p2 on mb.product_id2 = p2.product_id
  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: product1 {
    type: string
    sql: ${TABLE}.product1 ;;
  }

  dimension: product2 {
    type: string
    sql: ${TABLE}.product2 ;;
  }

  dimension: family1 {
    type: string
    sql: ${TABLE}.family1;;
    case_sensitive: no
  }

  dimension: family2 {
    type: string
    sql: ${TABLE}.family1;;
    case_sensitive: no
  }

  measure: quantity2_in_thousands {
    type: sum
    sql: ${TABLE}.quantity2/1000 ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [product1, product2]
  }
}
