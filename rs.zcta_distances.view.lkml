view: rs_zcta_distances {

  derived_table: {
    sql: SELECT *
        FROM
          public.zcta_distances
        WHERE
          zip1 = {% parameter zcta_distances.zip1 %}
        UNION ALL
          SELECT
            {% parameter zcta_distances.zip1 %} as zip1,
            {% parameter zcta_distances.zip1 %} as zip2,
            0
          ;;
    }

    dimension: mi_to_zcta5 {
      label: "Miles from selected ZIP"
      view_label: "Geography"
      group_label: "ZIP Radii"
      type: number
      sql: ${TABLE}.mi_to_zcta5 ;;
      value_format_name: decimal_2
      hidden: yes
    }

    dimension: zip1 {
      label: "Selected ZIP Code"
      view_label: "Geography"
      group_label: "ZIP Radii"
      type: zipcode
      sql: ${TABLE}.zip1 ;;
      suggestable: no
      hidden: yes
    }

    dimension: zip2 {
      label: "Nearby ZIP"
      view_label: "Geography"
      group_label: "ZIP Radii"
      type: zipcode
      sql: ${TABLE}.zip2 ;;
      hidden: yes
    }
  }
