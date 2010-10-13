Given /^the following groups:$/ do |groups|
 table.hashes.each do |hash|
   Factory(:group, hash)
 end
end

When /^I delete the (\d+)(?:st|nd|rd|th) group$/ do |pos|
  visit admin_groups_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following groups:$/ do |expected_groups_table|
  expected_groups_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I am Administrator$/ do
  @admin = Factory(:admin)
  And %Q`I logged in with email "#{@admin.email}" and password "#{@admin.password}"`
  And %Q`I should not see error`
end
