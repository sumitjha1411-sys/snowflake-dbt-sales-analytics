-- here test name is : "is_non_negative" and model and column_name are arguments

{% test is_non_negative(model, column_name) %}

    select {{ column_name }}
    from {{ model }}
    where {{ column_name }} < 0

{% endtest %}