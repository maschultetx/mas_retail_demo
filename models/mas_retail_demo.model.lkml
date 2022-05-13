#connection: "retail_demo_mas"
#connection: "retail_demo_mas_1audev"
connection: "retail_demo_mas"
label: "Actian Retail Demo"

# include all the views
include: "/views/**/*.view"

datagroup: mas_retail_demo_default_datagroup {
  #sql_trigger: SELECT CURRENT_DATE() ;;
  max_cache_age: "0 seconds"
}

persist_with: mas_retail_demo_default_datagroup

# Value formats:
named_value_format: currency_k {
  value_format: "\"@{MAIN_CURRENCY_SYMBOL}\"#,##0.0,\" K\""
}
named_value_format: currency {
  value_format: "\"@{MAIN_CURRENCY_SYMBOL}\"#,##0.00"
}
named_value_format: currency_0 {
  value_format: "\"@{MAIN_CURRENCY_SYMBOL}\"#,##0"
}
named_value_format: unit_k {
  value_format: "#,##0.0,\" K\""
}

explore: affinity {
    join: store {
    type: left_outer
    sql_on: ${affinity.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: prod_family {
    type: left_outer
    sql_on: ${affinity.family1} = ${prod_family.family} ;;
    relationship: many_to_one
  }
}

explore: marketbasket {
   join: prod_family {
    type: left_outer
    sql_on: ${marketbasket.family1} = ${prod_family.family} ;;
    relationship: many_to_one
  }
}

explore: channels {}

explore: word_cloud {}

explore: city {}

explore: country {
  join: customer {
    type: left_outer
    sql_on: ${country.country_code} = ${customer.country_code} ;;
    relationship: one_to_many
  }
}

explore: dbinfo{}

explore: customer {
  join: country {
    type: left_outer
    sql_on: ${customer.country_code} = ${country.country_code} ;;
    relationship: many_to_one
  }
  join: gender {
    type: left_outer
    sql_on: ${customer.gender} = ${gender.gender} ;;
    relationship: many_to_one
  }
  join: state {
    type: left_outer
    sql_on: ${customer.state} = ${state.state} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${customer.customer_id} = ${orders.customer_id} ;;
    relationship: one_to_many
  }

  join: orders_base {
    type: left_outer
    sql_on: ${customer.customer_id} = ${orders_base.customer_id} ;;
    relationship: one_to_many
  }

  join: distance_to_store {
    type: left_outer
    sql_on: ${customer.customer_id} = ${distance_to_store.customer_id} ;;
    relationship: one_to_one
  }

  join: rolling_year {
    type: left_outer
    sql_on: year(${orders.order_date})=${rolling_year.full_year} ;;
    relationship: many_to_one
  }


  join: lineitem {
    type: left_outer
    sql_on: ${orders.order_id} = ${lineitem.order_id} ;;
    relationship: one_to_many
  }

  join: lineitem_base {
    type: left_outer
    sql_on: ${orders.order_id} = ${lineitem_base.order_id} ;;
    relationship: one_to_many
  }

  join: promotion {
    type: left_outer
    sql_on: ${lineitem.promotion_id} = ${promotion.promotion_id} ;;
    relationship: many_to_one
  }

  join: store {
    type: left_outer
    sql_on: ${orders.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${product.product_id} = ${lineitem.product_id} ;;
    relationship: many_to_one
  }

  join: prod_family {
    type: left_outer
    sql_on: ${product.family} = ${prod_family.family} ;;
    relationship: many_to_one
  }

  join: prod_category {
    type: left_outer
    sql_on: ${product.category} = ${prod_category.category} ;;
    relationship: many_to_one
  }

  join: store_aggregates {
    type: left_outer
    sql_on: ${orders.store_id} = ${store_aggregates.store_id} ;;
    relationship: many_to_one
  }
}

explore: date_dimension {}

explore: gender {
  join: customer {
    type: left_outer
    sql_on: ${gender.gender} = ${customer.gender} ;;
    relationship: one_to_many
  }
}

explore: lineitem {
  join: product {
    type: left_outer
    sql_on: ${product.product_id} = ${lineitem.product_id} ;;
    relationship: many_to_one
  }

  join: prod_family {
    type: left_outer
    sql_on: ${product.family} = ${prod_family.family} ;;
    relationship: many_to_one
  }

  join: prod_category {
    type: left_outer
    sql_on: ${product.category} = ${prod_category.category} ;;
    relationship: many_to_one
  }

  join: rolling_year {
    type: left_outer
    sql_on: year(${lineitem.order_date})=${rolling_year.full_year} ;;
    relationship: many_to_one
  }

  join: store {
    type: left_outer
    sql_on: ${lineitem.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: store_aggregates {
    type: left_outer
    sql_on: ${lineitem.store_id} = ${store_aggregates.store_id} ;;
    relationship: many_to_one
  }
}


explore: orders {
  join: customer {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customer.customer_id} ;;
    relationship: many_to_one
  }

  join: lineitem {
    type: left_outer
    sql_on: ${orders.order_id} = ${lineitem.order_id} ;;
    relationship: one_to_many
  }

  join: promotion {
    type: left_outer
    sql_on: ${lineitem.promotion_id} = ${promotion.promotion_id} ;;
    relationship: many_to_one
  }

  join: store {
    type: full_outer
    sql_on: ${orders.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: product  {
    type: left_outer
    sql_on: ${product.product_id} = ${lineitem.product_id} ;;
    relationship: many_to_one
  }

  join: prod_family {
    type: left_outer
    sql_on: ${product.family} = ${prod_family.family} ;;
    relationship: many_to_one
  }

  join: prod_category {
    type: left_outer
    sql_on: ${product.category} = ${prod_category.category} ;;
    relationship: many_to_one
  }

  join: store_aggregates {
    type: left_outer
    sql_on: ${orders.store_id} = ${store_aggregates.store_id} ;;
    relationship: many_to_one
  }

  join: rolling_year {
    type: left_outer
    sql_on: year(${orders.order_date})=${rolling_year.full_year} ;;
    relationship: many_to_one
  }

}

explore: prod_category {
  join: prod_family {
    type: left_outer
    sql_on:  ${prod_category.family} = ${prod_family.family} ;;
    relationship:  many_to_one
  }
}

explore: prod_family {
  join: prod_category {
    type: left_outer
    sql_on:  ${prod_family.family} = ${prod_category.family} ;;
    relationship:  many_to_one
  }
}

# could add more with this later - too complex for just a demo
explore: prod_subcategory {}

explore: product {
  join: lineitem {
    type: left_outer
    sql_on: ${product.product_id} = ${lineitem.product_id} ;;
    relationship: one_to_many
  }

  join: prod_family {
    type: left_outer
    sql_on: ${product.family} = ${prod_family.family} ;;
    relationship: many_to_one
  }

  join: prod_category {
    type: left_outer
    sql_on: ${product.category} = ${prod_category.category} ;;
    relationship: many_to_one
  }
}

explore: product_in_subcategory {
  join: product {
    type: left_outer
    sql_on: ${product_in_subcategory.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }
}

explore: promo_category {
  join: promo_subcategory {
    type: left_outer
    sql_on: ${promo_category.category} = ${promo_subcategory.category} ;;
    relationship: one_to_many
  }
}

#explore: promo_subcategory {}

#explore: promotion {
#  join: prod_category {
#    type: left_outer
#    sql_on: ${promotion.category} = ${prod_category.category} ;;
#    relationship: one_to_many
#  }
#}

explore: rolling_year {}
explore: region {}

explore: store_aggregates {

  join: rolling_year {
    type: left_outer
    sql_on: ${store_aggregates.order_year}=${rolling_year.full_year} ;;
    relationship: many_to_one
  }

  join: store {
    type: left_outer
    sql_on: ${store_aggregates.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

}

explore: state {
  join: customer {
    type: left_outer
    sql_on: ${state.state} = ${customer.state} ;;
    relationship: one_to_many
  }
}

explore: store {
  join: store_aggregates {
    type: left_outer
    sql_on: ${store.store_id} = ${store_aggregates.store_id} ;;
    relationship: one_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${store.store_id} = ${orders.store_id} ;;
    relationship: one_to_many
  }

  join: rolling_year {
    type: left_outer
    sql_on: year(${orders.order_date})=${rolling_year.full_year} ;;
    relationship: many_to_one
  }

  join: top_store_products {
    type: inner
    sql_on: ${store.store_id} = ${top_store_products.store_id} ;;
    relationship: one_to_many
  }

  join: product {
    type: left_outer
    sql_on: ${product.product_id} = ${top_store_products.product_id} ;;
    relationship: one_to_many
  }
}

explore: store_promotion {
  join: promotion {
    type: inner
    sql_on: ${store_promotion.promotion_id} = ${promotion.promotion_id} ;;
    relationship: many_to_one
  }

  join: product {
    type: inner
    sql_on: ${promotion.category} = ${product.category} and ${promotion.subcategory} = ${product.subcategory} ;;
    relationship: many_to_one
  }

  join: store {
    type: left_outer
    sql_on: ${store_promotion.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${store_promotion.store_id} = ${orders.store_id} ;;
    #sql_where:  ${orders.order_date} between ${promotion.begin_date} and ${promotion.end_date} ;;
    relationship: many_to_one
  }

  join: lineitem {
    type: left_outer
    sql_on: ${orders.order_id} = ${lineitem.order_id} ;;
    relationship: many_to_one
  }


}
