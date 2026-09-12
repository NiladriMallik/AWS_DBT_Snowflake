{% set flag = 0 %}

select * from {{ ref('bronze_bookings') }}
{% if flag == 1 %}
    WHERE NIGHTS_BOOKED > 1
{% else %}
    WHERE NIGHTS_BOOKED = 1
{% endif %}