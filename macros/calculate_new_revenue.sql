-- Examples of macros in dbt and how it works, it always starts with word - 
-- "macro" then "macro name" and finally "endmacro"

{% macro calculate_new_revenue(revenue,multiplier) %}
  {{revenue}} * {{multiplier}}  
{% endmacro %}


-- Here, "calculate_new_revenue" is the macro name and "revenue" is the parameter/argument that will receive a value.
-- When we call/invoke the macro function in the dbt model, we pass the actual column name as the argument.


-- another macro — we can write multiple macros in a single .sql file and save it in the /macros directory.

{% macro revenue_category(revenue) %}

    CASE
        WHEN {{ revenue }} <= 400000 THEN 'Low'
        WHEN {{ revenue }} > 400000 AND {{ revenue }} <= 900000 THEN 'Medium'
        ELSE 'High'
    END

{% endmacro %}

