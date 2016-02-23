Select date(th.event_timestamp) as event_date,Count(action),action, UPPER(RIGHT(acc.locale,2)) as Country_Code
From th.thdm_fact_be_theme th Join public.edw_dim_account acc On th.account_id = acc.account_id
Where acc.test_account_flag <> 'Y' and date(th.event_timestamp)<= date(current_date-1)
Group by event_date, action, Country_Code
order by event_date, Country_Code