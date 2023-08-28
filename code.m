= Csv.Document(File.Contents("C:\Users\Yash Kumar Pal\Desktop\United Airline\Datasets (1)e7e7eed\Datasets\Survey data_Inflight Satisfaction Score_1.csv"),[Delimiter=",", Columns=31, Encoding=65001, QuoteStyle=QuoteStyle.None])

= Table.PromoteHeaders(Source, [PromoteAllScalars=true])

= Table.TransformColumnTypes(#"Promoted Headers",{{"flight_number", Int64.Type}, {"origin_station_code", type text}, {"destination_station_code", type text}, {"record_locator", type text}, {"scheduled_departure_date", type date},
   {"question_text", type text}, {"score", type text}, {"satisfaction_type", type text}, {"driver_sub_group1", type text}, {"driver_sub_group2", type text}, {"arrival_delay_minutes", Int64.Type}, {"arrival_delay_group", type text},
   {"cabin_code_desc", type text}, {"cabin_name", type text}, {"entity", type text}, {"number_of_legs", Int64.Type}, {"seat_factor_band", type text}, {"loyalty_program_level", type text}, {"generation", type text}, {"fleet_type_description", type text},
   {"fleet_usage", type text}, {"equipment_type_code", type text}, {"ua_uax", type text}, {"actual_flown_miles", Int64.Type}, {"haul_type", type text}, {"departure_gate", type text}, {"arrival_gate", type text}, {"international_domestic_indicator", type text},
   {"response_group", type text}, {"media_provider", type text}, {"hub_spoke", type text}})

= Table.CombineColumns(#"Changed Type",{"cabin_code_desc", "cabin_name"},Combiner.CombineTextByDelimiter(" ", QuoteStyle.None),"cabin_name.1")

= Table.ReplaceValue(#"Merged Columns","Economy Economy","Economy",Replacer.ReplaceValue,{"cabin_name.1"})

= Table.ReplaceValue(#"Replaced Value","Economy Economy Plus","Economy Plus",Replacer.ReplaceValue,{"cabin_name.1"})

= Table.TransformColumnTypes(#"Replaced Value1", {{"scheduled_departure_date", type date}}, "en-US")

= Table.SelectRows(#"Changed Type with Locale", each ([question_text] = "How satisfied were you with the food & beverage served on your flight from [CITY] to [CITY]?"))
