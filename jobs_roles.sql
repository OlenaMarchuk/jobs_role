CREATE OR REPLACE TABLE "jobs_categorization" AS
SELECT 
  "id"
, "name"
, CASE 
    WHEN LOWER("name") REGEXP '.*full[ -]?stack.*' THEN TRUE
    ELSE FALSE
END AS "Fullstack_Developer"
, CASE 
  WHEN 
         (LOWER("name") REGEXP '.*back[ -]?end.*' 
        OR "name" ILIKE '%ruby%' 
        OR "name" ILIKE '%c#%' 
        OR "name" LIKE '%PHP%' 
        OR "name" ILIKE '%.net%' 
        OR "name" LIKE '%C++%' 
        OR ("name" ILIKE '%java%' AND LOWER("name") NOT REGEXP '.*(java|type)[ -]?script.*')
        OR "name" ILIKE '%python%' 
        OR "name" ILIKE '%hardwar%' 
        OR "name" LIKE '%HW%' 
        OR "name" ILIKE '%devops%' )
        OR  (
            (
                "name" ILIKE '%vývoj%' 
                OR "name" ILIKE '%programátor%' 
                OR "name" ILIKE '%developer%' 
                OR "name" ILIKE '%engineer%'
                OR "name" ILIKE '%inžen%'
            ) 
            AND LOWER("name") NOT REGEXP '.*front[ -]?end.*'
            AND LOWER("name") NOT REGEXP '.*full[ -]?stack.*' 
            AND LOWER("name") NOT REGEXP '.*(java|type)[ -]?script.*'
            AND "name" NOT ILIKE '%web dev%' 
            AND LOWER("name") NOT REGEXP '.*client[ -]side.*'
            AND "name" NOT ILIKE '%angular%' 
            AND "name" NOT ILIKE '%react%' 
            AND "name" NOT ILIKE '%vue%'
            AND "name" NOT REGEXP '.*dat[ao].*'
            AND "name" NOT ILIKE '%html%'
         		AND  "name" NOT ILIKE '%security%'
            AND "name" NOT ILIKE '%secure%'
           	AND "name" NOT LIKE '%SOC%'
            AND "name" NOT LIKE '%SIEM%'
            AND "name" NOT ILIKE '%kybernetick%'
            AND "name" NOT ILIKE '%cyber%'
            AND "name" NOT ILIKE '%bezpečnost%' 
         		AND LOWER("name") NOT REGEXP '.*dat[ao].*'
            AND LOWER("name") NOT REGEXP '.*anal[yi]ti.*'
              )
            
    THEN TRUE
  ELSE FALSE
  END AS "Backend_Developer"
, CASE 
    WHEN 
        (
        LOWER("name") REGEXP '.*front[ -]?end.*' 
        OR LOWER("name") REGEXP '.*(java|type)[ -]?script.*' 
        OR "name" ILIKE '%web dev%' 
        OR LOWER("name") REGEXP '.*client[ -]side.*' 
        OR "name" ILIKE '%angular%' 
        OR "name" ILIKE '%react%' 
        OR "name" ILIKE '%vue%' 
        OR "name" ILIKE '%html%'
        )
        OR (
            (
                "name" ILIKE '%vývoj%' 
                OR "name" ILIKE '%programátor%' 
                OR "name" ILIKE '%developer%' 
                OR "name" ILIKE '%engineer%'
                OR "name" ILIKE '%inžen%'
            ) 
                AND LOWER("name") NOT REGEXP '.*back[ -]?end.*' 
                AND LOWER("name") NOT REGEXP '.*full[ -]?stack.*'
                AND "name" NOT ILIKE '%ruby%' 
                AND "name" NOT ILIKE '%c#%' 
                AND "name" NOT LIKE '%PHP%' 
                AND "name" NOT ILIKE '%.net%' 
                AND "name" NOT LIKE '%C++%' 
                AND "name" NOT ILIKE '%java%' 
                AND "name" NOT ILIKE '%python%' 
                AND "name" NOT ILIKE '%hardwar%' 
                AND "name" NOT ILIKE '%HW%' 
                AND "name" NOT ILIKE '%devops%' 
                AND "name" NOT REGEXP '.*dat[ao].*'
          			AND  "name" NOT ILIKE '%security%'
            		AND "name" NOT ILIKE '%secure%'
           			AND "name" NOT LIKE '%SOC%'
            		AND "name" NOT LIKE '%SIEM%'
            		AND "name" NOT ILIKE '%kybernetick%'
            		AND "name" NOT ILIKE '%cyber%'
            		AND "name" NOT ILIKE '%bezpečnost%' 
           			AND LOWER("name") NOT REGEXP '.*dat[ao].*'
            		AND LOWER("name") NOT REGEXP '.*anal[yi]ti.*'
           			AND "name" NOT ILIKE '%qa%'
            		AND LOWER("name") NOT REGEXP '.*[ck]ontrol.*'
            		AND "name" NOT ILIKE '%test%'
            		AND "name" NOT ILIKE '%quality%'
            )
        THEN TRUE
    ELSE FALSE
END AS "Frontend_Developer"
, CASE 
     WHEN (
     (
     "name" LIKE '%UX%'
     OR "name" LIKE '%UI%'
     OR "name" LIKE '%3D%'
     OR "name" ILIKE '%user experience%'
     OR "name" ILIKE '%grafick%'
     OR "name" ILIKE '%graphic%'
     ) 
     AND "name" ILIKE '%design%'
     )
     OR LOWER("name") REGEXP '.*web[ -]?design.*'
     OR "name" ILIKE '%grafik%' THEN TRUE
    ELSE FALSE
END AS "UX_UI_Designer"

, CASE 
    WHEN (
        LOWER("name") REGEXP '.*dat[ao].*'
        OR "name" ILIKE '%excel%'
    ) 
        AND 
    (
        LOWER("name") REGEXP '.*anal[yi]ti.*'
        OR "name" ILIKE '%specialist%'
        OR "name" ILIKE '%analyst%'
    )
        OR LOWER("name") REGEXP '.*business intel(l)?igence.*'
        OR "name" LIKE '%BI%'
    THEN TRUE
    ELSE FALSE
END AS "Data_Analyst"

, CASE 
     WHEN 
        (
            LOWER("name") REGEXP '.*dat[ao].*'
            AND 
        (
            "name" ILIKE '%science%'
            OR "name" ILIKE '%scientist%'
            OR "name" ILIKE '%věd%'
        )
        ) 
            OR "name" ILIKE '%statistik%' THEN TRUE
     ELSE FALSE
END AS "Data_Scientist"

, CASE 
      WHEN 
        (
            LOWER("name") REGEXP '.*dat[ao].*'
            OR LOWER("name") REGEXP '.*anal[yi]ti.*'
        ) 
            AND 
        (
            "name" ILIKE '%inžen%' 
            OR "name" ILIKE '%engineer%'
            OR "name" ILIKE '%architekt%'
        ) THEN TRUE
    ELSE FALSE
END AS "Data_Engineer"

, CASE
      WHEN 
        (
            "name" ILIKE '%it%'
            OR "name" ILIKE '%business%'
            OR "name" ILIKE '%market%' 
            OR "name" ILIKE '%project%'
            OR LOWER("name") REGEXP '.*finan[cs].*'
        ) 
            AND 
        (
            "name" ILIKE '%analyst%'
            OR LOWER("name") REGEXP '.*anal[yi]ti.*'
            OR "name" ILIKE '%konzultant%'
            OR "name" ILIKE '%consult%'
            OR "name" ILIKE '%speciali%'
        ) THEN TRUE
    ELSE FALSE
END AS "IT_Business_Analyst"

, CASE
    WHEN 
            "name" ILIKE '%qa%'
            OR LOWER("name") REGEXP '.*[ck]ontrol.*'
            OR "name" ILIKE '%test%'
            OR "name" ILIKE '%quality%'
            THEN TRUE
    ELSE FALSE
END AS "QA_Specialist_Tester"
, CASE
    WHEN 
        (
            "name" LIKE '% AI %'
            OR "name" LIKE '%ML%'
            OR "name" LIKE '%LLM%'
            OR "name" ILIKE '%artificial intelligence%'
            OR "name" ILIKE '%machine learning%'
            OR "name" ILIKE '%umělé inteligence%'
        ) 
            AND "name" NOT ILIKE '%html%'  THEN TRUE
    ELSE FALSE
END AS "AI_Positions_all"

, CASE
    WHEN 
        (
            "name" REGEXP '(^|[[:space:]:punct:])AI([[:space:]:punct:]|$)'
            OR "name" LIKE '%ML%'
            OR "name" LIKE '%LLM%'
            OR "name" ILIKE '%artificial intelligence%'
            OR "name" ILIKE '%machine learning%'
            OR "name" ILIKE '%umělé inteligence%'
        ) 
            AND "name" NOT ILIKE '%html%'
            AND 
        (
            "name" ILIKE '%developer%'
            OR "name" ILIKE '%inžen%'
            OR "name" ILIKE '%engineer%'
            OR "name" ILIKE '%vývoj%'
            OR "name" ILIKE '%programátor%'
        ) THEN TRUE
    ELSE FALSE
END AS "AI_Engineer"

, CASE
    WHEN 
        (
            LOWER("name") REGEXP '.*proje[ck]t.*'
            OR "name" ILIKE '%team%'
            OR "name" ILIKE '%it%'
        ) 
            AND (LOWER("name") REGEXP '.*mana[gž]er.*'
            OR "name" ILIKE '%lead%'
        ) THEN TRUE
    ELSE FALSE
END AS "Project_Manager"

, CASE
    WHEN 
            LOWER("name") REGEXP '.*produ[ck]t.*'
            AND LOWER("name") REGEXP '.*mana[gž]er.*' THEN TRUE
    ELSE FALSE
END AS "Product_Manager"

, CASE 
        WHEN 
            LOWER("name") REGEXP '.*produ[ck]t.*' 
            AND "name" ILIKE '%owner%'THEN TRUE
    ELSE FALSE
END AS "Product_Owner"

, CASE
        WHEN 
            "name" ILIKE '%security%'
            OR "name" ILIKE '%secure%'
            OR "name" LIKE '%SOC%'
            OR "name" LIKE '%SIEM%'
            OR "name" ILIKE '%kybernetick%'
            OR "name" ILIKE '%cyber%'
            OR "name" ILIKE '%bezpečnost%' THEN TRUE
    ELSE FALSE
END AS "SOC_Specialist"

, CASE
        WHEN 
            "name" ILIKE '%support%' 
            OR "name" ILIKE '%podpor%'
            OR LOWER("name") REGEXP '.*administr[aá]t.*'
            OR LOWER("name") REGEXP '.*servi[sc].*' 
            OR "name" ILIKE '%správce%' 
            OR "name" ILIKE '%help%' 
            OR "name" ILIKE '%konzult%' 
            OR "name" ILIKE '%consult%' 
            OR ("name" ILIKE '%it%' 
            AND "name" ILIKE '%technik%')THEN TRUE
    ELSE FALSE
END AS "IT_Support"  

FROM "jobs_raw_scrape_trimmed";

desc table "jobs_categorization";
