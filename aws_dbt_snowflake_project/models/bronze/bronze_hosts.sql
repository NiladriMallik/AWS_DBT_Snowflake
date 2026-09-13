{% set incremental_flag = 1 %}
{% set incremental_column = 'CREATED_AT' %}

SELECT * FROM {{ source('staging', 'hosts') }}
{% if incremental_flag == 1 %}
    WHERE {{ incremental_column }} > (
        SELECT COALESCE(MAX({{ incremental_column }}), '1900-01-01') FROM {{ this }}
    )
{% endif %}