
Given(/^the details of title number DT160760$/) do
  @register_data = Hash.new()
  @register_data['title_number'] = "DT160760"
  @register_data['DLR'] = "Weymouth Office"
  @register_data['role_code_entry_2'] = "RSLP"
  @register_data['first_UPRNS'] = 26241363
  @register_data['fifth_migration_error'] = "Investigation code: C - No role code assigned to the register entry"
  @register_data['infill_type_entry_one'] = "Address"
  @register_data['district'] = "DORSET : WEYMOUTH AND PORTLAND"
  @register_data['first_item_co_ordinates'] = 368002.61
end

When(/^I view the title number "([^"]*)"$/) do |title_number|
  @returned_register_data = Hash.new()
  @returned_register_data = JSON.parse(get_title_register_json(title_number))
end

Then(/^the correct title number is displayed$/) do
  puts "Returned title no = " + @returned_register_data['title_number'].to_s
  expect(@returned_register_data['title_number']).to eq @register_data['title_number']
end

Then(/^the correct DLR which owns the title is displayed$/) do
  puts "Returned DLR = " + @returned_register_data['dlr'].to_s
  expect(@returned_register_data['dlr']).to eq @register_data['DLR']
end

Then(/^the correct role code of entry #2 is displayed$/) do
  puts "Returned role code entry #2 = " + @returned_register_data['entries'][1]['role_code'].to_s
  expect(@returned_register_data['entries'][1]['role_code']).to eq @register_data['role_code_entry_2']
end

Then(/^the correct value of the first UPRNS entry is displayed$/) do
  puts "Returned 1st UPRNS = " + @returned_register_data['uprns'][0].to_s
  expect(@returned_register_data['uprns'][0]).to eq @register_data['first_UPRNS']
end

Then(/^the correct message related to the 5th migrator error is displayed$/) do
  puts "Returned 5th migr error msg = " + @returned_register_data['migration_errors'][4]['message'].to_s
  expect(@returned_register_data['migration_errors'][4]['message']).to eq @register_data['fifth_migration_error']
end

Then(/^the correct infill type of entry #1 is displayed$/) do
  puts "Returned infill type entry #1 = " + @returned_register_data['entries'][0]['infills'][0]['type'].to_s
  expect(@returned_register_data['entries'][0]['infills'][0]['type']).to eq @register_data['infill_type_entry_one']
end

Then(/^the correct district of the title is displayed$/) do
  puts "Returned district = " + @returned_register_data['districts'][0].to_s
  expect(@returned_register_data['districts'][0]).to eq @register_data['district'] # 1st District (only one)
end

Then(/^the correct first item of co\-ordinates for the geometry entry of the title is displayed$/) do
  puts "Returned 1st item coords = " + @returned_register_data['districts'][0].to_s
  expect(@returned_register_data['geometry']['index']['geometry']['coordinates'][0][0][0]).to eq @register_data['first_item_co_ordinates']
end

#################### scenario 2 ####################

Given(/^the details of title number GR504812$/) do
  @register_data = Hash.new()
  @register_data['title_number'] = "GR504812"
  @register_data['tenure'] = "Freehold"
  @register_data['entry_id_entry_twelve'] = "2006-09-06 11:32:12.828685"
  @register_data['application_ref'] = "E006DWW"
  @register_data['first_migration_error_extractor'] = "Register Check"
  @register_data['sub_register_entry_sixteen'] = "C"
  @register_data['edition_date'] = "2006-09-06"
  @register_data['first_entry_status'] = "Current"
end

Then(/^the correct tenure is displayed$/) do
  puts "Returned tenure = " + @returned_register_data['tenure'].to_s
  expect(@returned_register_data['tenure']).to eq @register_data['tenure']
end

Then(/^the correct entry id of entry \#12 is displayed$/) do
  puts "Returned entry id entry #12 = " + @returned_register_data['entries'][11]['entry_id'].to_s
  expect(@returned_register_data['entries'][11]['entry_id']).to eq @register_data['entry_id_entry_twelve']
end

Then(/^the correct application reference of the title is displayed$/) do
  puts "Returned application ref = " + @returned_register_data['application_reference'].to_s
  expect(@returned_register_data['application_reference']).to eq @register_data['application_ref']
end

Then(/^the correct extractor related to the 1st migrator error is displayed$/) do
  puts "Returned 1st migr error extractor = " + @returned_register_data['migration_errors'][0]['extractor'].to_s
  expect(@returned_register_data['migration_errors'][0]['extractor']).to eq @register_data['first_migration_error_extractor']
end

Then(/^the correct sub register of entry \#16 is displayed$/) do
  puts "Returned entry 16 sub reg = " + @returned_register_data['entries'][15]['sub_register'].to_s
  expect(@returned_register_data['entries'][15]['sub_register']).to eq @register_data['sub_register_entry_sixteen']
end

Then(/^the correct edition date of the title is displayed$/) do
  puts "Returned edition date = " + @returned_register_data['edition_date'].to_s
  expect(@returned_register_data['edition_date']).to eq @register_data['edition_date']
end

Then(/^the correct status of the first entry on the title is displayed$/) do
  puts "Returned 1st entry status = " + @returned_register_data['entries'][0]['status'].to_s
  expect(@returned_register_data['entries'][0]['status']).to eq @register_data['first_entry_status']
end

############### Scenario 3 #################

Given(/^the details of title number MS465614$/) do
  @register_data = Hash.new()
  @register_data['title_number'] = "MS465614"
  @register_data['DLR'] = "Birkenhead Office"
  @register_data['language_entry_5'] = "en_GB"
  @register_data['first_migration_error_msg_no'] = "PE1012"
  @register_data['first_migration_error_msg'] = "Address not deconstructed in Intelligent Register for title"
  @register_data['deed_description_ninth_entry'] = "Conveyance"
  @register_data['role_code_twelth_entry'] = "DCEA"
  @register_data['map_entry_type'] = "FeatureCollection"
end

Then(/^the correct language of entry \#5 is displayed$/) do
  puts "Returned 1st entry status = " + @returned_register_data['entries'][4]['language'].to_s
  expect(@returned_register_data['entries'][4]['language']).to eq @register_data['language_entry_5']
end

Then(/^the correct message number of the 1st migrator error is displayed$/) do
  puts "Returned 1st migr error msg no = " + @returned_register_data['migration_errors'][0]['message_number'].to_s
  expect(@returned_register_data['migration_errors'][0]['message_number']).to eq @register_data['first_migration_error_msg_no']
end

Then(/^the correct message related to the 1st migrator error is displayed$/) do
  puts "Returned 1st migr error msg = " + @returned_register_data['migration_errors'][0]['message'].to_s
  expect(@returned_register_data['migration_errors'][0]['message']).to eq @register_data['first_migration_error_msg']
end

Then(/^the correct description of the deed within the 9th entry is displayed$/) do
  puts "Returned 9th entry deed descr = " + "@returned_register_data['entries'][8]['deeds'][0]['description']".to_s
  expect(@returned_register_data['entries'][8]['deeds'][0]['description']).to eq @register_data['deed_description_ninth_entry']
end

Then(/^the correct role code of the 12th entry is displayed$/) do
  puts "Returned 12th entry role code = " + @returned_register_data['entries'][11]['role_code'].to_s
  expect(@returned_register_data['entries'][11]['role_code']).to eq @register_data['role_code_twelth_entry']
end

Then(/^the correct type of the map entry within the Geometry entry for the title is displayed$/) do
  puts "Returned map entry type = " + "@returned_register_data['geometry']['map']['type']".to_s
  expect(@returned_register_data['geometry']['map']['type']).to eq @register_data['map_entry_type']
end

################# Scenario 4 ##################

Given(/^the details of title number BD161882$/) do
  @register_data = Hash.new()
  @register_data['title_number'] = "BD161882"
  @register_data['class'] = "Absolute"
  @register_data['template_text_entry_two'] = "PROPRIETOR: *RP*"
  @register_data['application_ref'] = "MA2785A"
  @register_data['prop_names_entry_seven'] = "Preferred Mortgages Limited"
  @register_data['sub_register_entry_four'] = "B"
  @register_data['edition_date'] = "2014-08-28"
  @register_data['seventh_entry_status'] = "Current"
end

Then(/^the correct class of title is displayed$/) do
  puts "Returned class = " + @returned_register_data['class'].to_s
  expect(@returned_register_data['class']).to eq @register_data['class']
end

Then(/^the correct template text of entry \#2 is displayed$/) do
  puts "Returned template text entry #2 = " + @returned_register_data['entries'][1]['template_text'].to_s
  expect(@returned_register_data['entries'][1]['template_text']).to eq @register_data['template_text_entry_two']
end

Then(/^the correct names of proprietors contained within entry \#7 are displayed$/) do
  # Note there are two names within the two proprietors for this entry but both are identical
  puts "Returned prop names 1 entry #7 = " +
      @returned_register_data['entries'][6]['infills'][0]['proprietors'][0]['name']['non_private_individual_name'].to_s
  puts "Returned prop names 1 entry #7 = " +
      @returned_register_data['entries'][6]['infills'][0]['proprietors'][1]['name']['non_private_individual_name'].to_s
  expect(@returned_register_data['entries'][6]['infills'][0]['proprietors'][0]['name']['non_private_individual_name']).
      to eq @register_data['prop_names_entry_seven']
  expect(@returned_register_data['entries'][6]['infills'][0]['proprietors'][1]['name']['non_private_individual_name']).
      to eq @register_data['prop_names_entry_seven']
end

Then(/^the correct sub register of entry \#4 is displayed$/) do
  puts "Returned sub register entry #4 = " + @returned_register_data['entries'][3]['sub_register'].to_s
  expect(@returned_register_data['entries'][3]['sub_register']).to eq @register_data['sub_register_entry_four']
end

Then(/^the correct status of the 7th entry on the title is displayed$/) do
  puts "Returned status entry #7 = " + @returned_register_data['entries'][6]['status'].to_s
  expect(@returned_register_data['entries'][6]['status']).to eq @register_data['seventh_entry_status']
end

############## Scenario 5 ################

Given(/^the details of title number BD161870$/) do
  @register_data = Hash.new()
  @register_data['title_number'] = "BD161870"
  @register_data['DLR'] = "Peterborough Office"
  @register_data['role_code_entry_one'] = "RDES"
  @register_data['full_text_entry_two'] = "PROPRIETOR: %SCOTT OAKES% of 17 Kenilworth Road, *Luton* LU1 1DQ."
  @register_data['text_infill_one_entry_three'] = "01/05/2014"
  @register_data['postcode_entry_one'] = "LU1 1DQ"
  @register_data['district'] = "LUTON"
  @register_data['geometry_index_properties'] = "urn:ogc:def:crs:EPSG::27700"
end

Then(/^the correct role code of entry \#1 is displayed$/) do
  puts "Returned 1st entry role code = " + @returned_register_data['entries'][0]['role_code'].to_s
  expect(@returned_register_data['entries'][0]['role_code']).to eq @register_data['role_code_entry_one']
end

Then(/^the correct full text of entry \#2 is displayed$/) do
  puts "Returned full text entry #2 = " + @returned_register_data['entries'][1]['full_text'].to_s
  expect(@returned_register_data['entries'][1]['full_text']).to eq @register_data['full_text_entry_two']
end

Then(/^the correct text within the first infill of entry \#3 is displayed$/) do
  puts "Returned first infill text entry #3 = " +
      @returned_register_data['entries'][2]['infills'][0]['text'].to_s
  expect(@returned_register_data['entries'][2]['infills'][0]['text']).
      to eq @register_data['text_infill_one_entry_three']
end

Then(/^the correct postcode of the address contained within the infill for entry \#1 is displayed$/) do
  puts "Returned infill postcode entry #1 = " +
      @returned_register_data['entries'][0]['infills'][0]['address']['postcode'].to_s
  expect(@returned_register_data['entries'][0]['infills'][0]['address']['postcode']).
      to eq @register_data['postcode_entry_one']
end

Then(/^the correct properties within the index\/crs entry of the Geometry of the title is displayed$/) do
  puts "Returned geometry index properties = " +
      @returned_register_data['geometry']['index']['crs']['properties']['name'].to_s
  expect(@returned_register_data['geometry']['index']['crs']['properties']['name']).
      to eq @register_data['geometry_index_properties']
end
